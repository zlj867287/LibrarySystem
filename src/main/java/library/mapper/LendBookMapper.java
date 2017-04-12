package library.mapper;

import library.entity.Book;
import library.entity.Relation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zlj on 2017/3/27.
 */
@Mapper
public interface LendBookMapper {

   String updaterelation(Relation relation);

   List<Relation> selectRelationByReaderid(@Param("readerid") int readerid);

   int insertRelation(Relation relation);

   List<Book>  findAllBookByRelationId(@Param("readerid") int readerid);

   List<Relation>  findAllrelationByRelationId(@Param("readerid") int readerid);
}
