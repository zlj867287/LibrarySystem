package library.mapper;

import library.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by xujiashuai on 2016/6/18.
 */
@Mapper
public interface UserMapper {
    public User selectById(@Param("id") int id);
    public List<User> list();
}
