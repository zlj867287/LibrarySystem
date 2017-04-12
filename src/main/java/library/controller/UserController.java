package library.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import library.entity.User;
import library.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xujiashuai on 2016/6/18.
 */
@Controller
public class UserController {

    @Autowired
    UserMapper userMapper;

    @RequestMapping(value = "/queryAll", method= RequestMethod.GET)
    @ResponseBody
    public Map<String,PageInfo> query(Integer page, Integer limit) {
        if(page!= null && limit!= null){
            PageHelper.startPage(page, limit);
        }

        Map<String,PageInfo> pages = new HashMap<String,PageInfo>();
        List<User> users = userMapper.list();

        Map<String,Object> datas= new HashMap<String,Object>();

        PageInfo pageinfo = new PageInfo(users);

        pages.put("page",pageinfo);

        return pages;
    }

    @RequestMapping("/query")
    public String queryDefault() {
        Map<String,Object> datas= new HashMap<String,Object>();
        return "page/index";
    }
}

