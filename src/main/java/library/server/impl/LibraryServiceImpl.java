package library.server.impl;

import library.entity.Relation;
import library.mapper.BookMapper;
import library.mapper.LendBookMapper;
import library.mapper.ReturnBookMapper;
import library.server.LibraryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author <a href="mailto:Administrator@gtmap.cn">Administrator</a>
 * @version 1.0, 2017/4/6
 * @description
 */
@Service
public class LibraryServiceImpl implements LibraryService {
    @Autowired
    BookMapper bookDao;

    @Autowired
    LendBookMapper lendBookDao;

    @Autowired
    ReturnBookMapper returnBookMapper;


    public boolean lendBook(int readerid, int bookid, int adminid) {

        Relation relation = new Relation(adminid, bookid , readerid,new Date(),new Date(),"0");
        //insert into relation (adminid,bookid,readerid,lendtime) values (#{adminid},#{bookid},#{readerid},#{lendtime})
        int t = lendBookDao.insertRelation(relation);

        int t1 = bookDao.updateBookLendNum(bookid);

        return t > 0 && t1 > 0;
    }

    public boolean returnBook( int bookid){

        Relation relation=returnBookMapper.selectRelationByBookid(bookid);
        //现在时间与借书时间的比较

        System.out.println(relation.getLendtime().getTime()+30);

        System.out.println(new Date().getTime());

        boolean  flag = (int)((relation.getLendtime().getTime() - new Date().getTime())/86400000) > 30;


       if(flag){

           returnBookMapper.updateRelationFine(bookid);
       }else
           {
               returnBookMapper.updateRelationFine1(bookid);
       }
        return returnBookMapper.deleteRelationByBookid(bookid)>0;
    }
}

