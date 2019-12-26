package service;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.User;
import model.User;
import utils.ReturnInfo;

public interface UserService {

	// 查询
	public ReturnInfo selectUser(String where, Integer page ,Integer count);
	//通过id查询
	public User selectById(Integer id);
	// 新增
	public void insert(User u);

	// 修改
	public void update(User u);

	// 删除
	public void delete(Integer id);
	//登录
	public User login(User u);
	
}
