package library.controller;

import library.entity.Book;
import library.server.LibraryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/4/8.
 */
@Controller
@RequestMapping(value = "/return")
public class ReturnController {

    @Autowired
    LibraryService libraryService;

    @RequestMapping(value = "/returnBook", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, String> returnBook(int bookid) throws IOException, SQLException {
        Map<String, String> result = new HashMap<String, String>();
        boolean flag1 = libraryService.returnBook(bookid);
        if (flag1) {
            result.put("msg", "ok");
        } else {
            result.put("msg", "error");
               }
       return result;}

    }
