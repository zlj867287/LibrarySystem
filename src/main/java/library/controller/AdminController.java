package library.controller;


import library.entity.Admin;
import library.server.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/4/3.
 */
@Controller
@RequestMapping(value="/admin")
public class AdminController {


    @Autowired
    AdminService adminService;

    //初始化登录检查页面
    @RequestMapping(value="/check", method = RequestMethod.GET)
    public String login() {
        return "admin/login";
    }

    //对登录信息进行验证并返回页面
    @RequestMapping(value = "/check", method = RequestMethod.POST)
    public ModelAndView getAdmin(Admin admin) throws IOException, SQLException {
        boolean result = adminService.checkAdminIsOk(admin);
        Map<String,String> data = new HashMap<String,String>();
        //两种方法做比较，上面错误,adminid是一个int类型，下面输进去的是string
        //data.put("adminid", "+admin.getAdminid()+");
       data.put("adminid", admin.getAdminid() + "");
        if(result){
            return new ModelAndView("admin/manage", data);
        }else{
            return new ModelAndView("admin/fail", data);
        }
    }

}
