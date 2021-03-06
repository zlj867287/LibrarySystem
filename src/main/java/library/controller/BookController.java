package library.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import library.entity.Book;
import library.server.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/4/3.
 */
@Controller
@RequestMapping(value="/book")
public class BookController {

    @Autowired
    BookService bookService;

    //选取所有book信息
    @RequestMapping(value = "/allbook", method = RequestMethod.GET)
    public ModelAndView getAllBookGET() throws IOException, SQLException {
        //todo: 根据信息查询信息并返回到前端页面
        Map<String,Object> showBookData = new HashMap<String,Object>();
        List<Book> books = bookService.getAllBooks();
        showBookData.put("books", books);
        return new ModelAndView("book/allbook", showBookData);


    }

    @RequestMapping(value = "/pagebook", method = RequestMethod.GET)
    public String getAllBookPage() throws IOException, SQLException {
        System.out.println("haha");
        //todo: 根据信息查询信息并返回到前端页面
        return "book/allbook1";
    }


    @RequestMapping(value = "/booksearch", method= RequestMethod.GET)
    @ResponseBody
    public Map<String,PageInfo> query(Integer page, Integer limit) {
        if(page!= null && limit!= null){
            PageHelper.startPage(page, limit);
        }

        Map<String,PageInfo> pages = new HashMap<String,PageInfo>();

        List<Book> books = bookService.getAllBooks();

        PageInfo pageinfo = new PageInfo(books);

        pages.put("page",pageinfo);

        return pages;
    }


    //增加book信息
    @RequestMapping(value = "/addbook", method = RequestMethod.GET)
    public String addBookGET() throws IOException, SQLException {
        return "book/add";

    }

    //添加书籍信息
    @RequestMapping(value = "/addbook", method = RequestMethod.POST)
    public String addBookPOST(Book book) throws IOException, SQLException {
        boolean result = bookService.addBook(book);
        //下面两种返回方法多比较,redirect重定向作用
        return "redirect:/book/allbook";
        /*if(result){
            return "redirect:/book/allbook";
        }else{
            return "error";
        }*/
    }

    //删除book用户信息，使用了jquery和ajax实现了动态刷新网页的功能减轻后台的数据压力
    @RequestMapping(value = "deletebook", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> deleteBookGET(int bookid) throws IOException, SQLException {
        Map<String,String> result = new HashMap<String,String>();
        if(bookService.deleteBookById(bookid)) {
            //map键值对形式，key values，传递过去成json形式后还是键值对的形式，var obj = JSON.parse(data)
            //if(obj.msg == 'ok')就是理解为map通过key获取values的值
            result.put("msg", "ok");
        }
        return result;
    }


    //删除bookid用户信息,用普通方法
    /*@RequestMapping(value = "/deletebook/{bookid}", method = RequestMethod.GET)
    public String deleteBook(@PathVariable int bookid) throws IOException, SQLException {
        bookService.deleteBookById(bookid);
        return "redirect:/book/allbook";}*/




    //选择bookid 更新book信息，跟下面的方式方法一样，但是GET,POST不一样就可以
    @RequestMapping(value = "/updatebook/{bookid}", method = RequestMethod.GET)
    public ModelAndView updateBookGET(@PathVariable int bookid) throws IOException, SQLException {
        Book book=bookService.findBookById(bookid);
        Map<String,Object> data = new HashMap<String,Object>();
        //如果没有能够获取对应的数据说明数据库有异常
        if(book!=null){
            data.put("book", book);
        }
        return new ModelAndView("book/update", data);
    }

    //根据上面bookid更新book用户信息
    @RequestMapping(value = "updatebook", method = RequestMethod.POST)
    public String updateBookPOST(Book book) throws IOException, SQLException {
        bookService.updateBookInfo(book);
        return "redirect:/book/allbook";
    }

}
