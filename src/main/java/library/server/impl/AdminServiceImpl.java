package library.server.impl;

import library.entity.Admin;
import library.mapper.AdminMapper;
import library.server.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/4/3.
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminDao;

    /**
     * @param admin 需要检查的用户信息
     * @return 检查用户信息是否满足要求
     */
    public boolean checkAdminIsOk(Admin admin){
        Admin adminDB = adminDao.findAdminById(admin.getAdminid());
        //将数据库用户的数据全部遍历验证是否存在和当前用户输入信息一致的用户如果有就返回true 如果检查没有发现对应消息返回false
        if(adminDB != null && admin.getPassword().equals(adminDB.getPassword())) {
            return true;
        }
        return false;
    }

}
