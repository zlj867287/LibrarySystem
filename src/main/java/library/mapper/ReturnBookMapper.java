package library.mapper;

import library.entity.Relation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zlj on 2017/3/28.
 */
@Mapper
public interface ReturnBookMapper {
    Relation selectRelationByBookid(@Param("bookid") int bookid);

    String updateRelation(@Param("bookid") int bookid);

    List<Relation> selectRelationByReaderid(@Param("readerid") int readerid);

    int deleteRelationByBookid(@Param("bookid") int bookid);

    boolean updateRelationFine(@Param("bookid") int bookid);

    boolean updateRelationFine1(@Param("bookid") int bookid);

}
