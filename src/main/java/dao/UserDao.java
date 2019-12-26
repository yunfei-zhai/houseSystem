package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import model.User;

@Repository
public interface UserDao {

	// 查询数量
	@Select("select count(1) from hms_user ${where}")
	public Integer selectUserCount(@Param("where") String where);

	@Select("select * from hms_user ${where} ${limit}")
	public List<User> selectUser(@Param("where") String where, @Param("limit") String limit);

	// 插入
	@Insert("insert into hms_user (name,sex,tel,email,address,regdate) values(#{name},#{sex},#{tel},#{email},#{statement},#{regdate})")
	public void insert(User u);

	// 更新
	@Update("update hms_user set name=#{name},sex=#{sex},tel=#{tel},email=#{email},address=#{address} where id=#{id}")
	public void update(User u);

	// 删除
	@Delete("delete from hms_user where id=#{id} ")
	public void delete(Integer id);

	// ͨ根据id查询
	@Select("select * from hms_user where id=#{id}")
	public User selectById(Integer id);

	// 登录
	@Select("select * from hms_user where tel=#{tel} and password=#{password}")
	public User login(User u);

}
