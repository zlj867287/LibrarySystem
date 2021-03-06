package library.controller;

import library.entity.Book;
import library.entity.Reader;
import library.entity.Relation;
import library.mapper.LendBookMapper;
import library.server.BookService;
import library.server.LibraryService;
import library.server.ReaderService;
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
 * @author <a href="mailto:Administrator@gtmap.cn">Administrator</a>
 * @version 1.0, 2017/4/5
 * @description
 */
@Controller
@RequestMapping(value="/service")

public class LendController {

    @Autowired
    ReaderService readerService;

    @Autowired
    BookService bookService;

    @Autowired
    LibraryService libraryService;

    @Autowired
    LendBookMapper lendBookMapper;



    //选取所有book信息
    @RequestMapping(value = "/readservice", method = RequestMethod.POST)
    public ModelAndView getAllBookGET(int readerid, int adminid) throws IOException, SQLException {
        Map<String, Object> showBookData = new HashMap<String, Object>();
        Reader reader=readerService.findReaderById(readerid);
        showBookData.put("reader",reader);

        /*if(reader == null){
            showBookData.put("result","no");
            return new ModelAndView("admin/fail", null);
        }*/
        //多表查询，根据relation中readerid的值取bookid，在根据bookid在book中取得book的所有信息
        List<Book> lendBooks= bookService.findAllBookByRelationId(readerid);
        //List<Relation> relations=lendBookMapper.findAllrelationByRelationId(readerid);
        //showBookData.put("relations", relations);
        showBookData.put("lendBooks", lendBooks);
        showBookData.put("adminid", adminid);
        if(lendBooks.size()>5){
            showBookData.put("result","false");
        }else{
            showBookData.put("result","true");
        }
         return new ModelAndView("lendbook/booklend", showBookData);

    }

    //选取所有book信息
    @RequestMapping(value = "/lendBook", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> lendBook(int bookid, int readerid, int adminid) throws IOException, SQLException {
        Map<String,String> result = new HashMap<String,String>();
        boolean flag = libraryService.lendBook(readerid, bookid, adminid);
        Book book = bookService.findBookById(bookid);
        if(flag){
            result.put("msg", "ok");
            result.put("bookname", book.getBookname());
            result.put("classification", book.getClassification());
            //注意数据类型，我们统一设置为string类型，int如何转化
            result.put("number", book.getNumber()+"");
            result.put("bookid", book.getBookid()+"");
            //根据readerid对relation与book多表查询，把查询结果设置为list<Book>
            List<Book> lendBooks= bookService.findAllBookByRelationId(readerid);
            if(lendBooks.size() >= 5){
                result.put("up", "ok");
            }
        }else{
            result.put("msg", "error");
        }
        return result;
    }

}
