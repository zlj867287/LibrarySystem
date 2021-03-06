package library.mapper;


import library.entity.Book;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zlj on 2017/3/27.
 */
@Mapper
public interface BookMapper {

    //findBookByBookId要返回值

    Book findBookById(@Param("bookid") int bookid);

    List<Book> findAllBook();

    int insertBook(Book book);

    int deleteBookById(@Param("bookid") int bookid);

    //update 不要返回值，只有是否更新成功，
    int updateBookInfo(Book book);

    int updateBookLendNum(@Param("bookid") int bookid);

    List<Book> findAllBookByRelationId(int readerid);

    int insertBook(int bookid);

}
