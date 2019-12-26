package service.Impl;


import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import model.User;
import service.UserService;
import utils.ReturnInfo;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao dao;
	
	// 查询全部
	public ReturnInfo selectUser(String where, Integer page, Integer count) {
	System.out.println("查询到s层");
		boolean canpage=page!=null;
		ReturnInfo info = new ReturnInfo();
		info.setList(dao.selectUser(where,ReturnInfo.getLimit(page, count)));
		if(canpage)info.setCount(dao.selectUserCount(where));
		return info;
	}

	// 查询一个
	public User selectById(Integer id) {
		return dao.selectById(id);
	}
	
	// 新增
	public void insert(User u) {
		SimpleDateFormat sdf = new SimpleDateFormat();// 格式化时间
		sdf.applyPattern("yyyy-MM-dd HH:mm:ss");// a为am/pm的标记
		Date date = new Date();// 获取当前时间
		String ceratedate = sdf.format(date);
		u.setRegdate(ceratedate);
		dao.insert(u);
	}

	// 修改
	public void update(User u) {
		dao.update(u);
	}

	// 删除
	public void delete(Integer id) {
		dao.delete(id);
	}

	public User login(User u) {
		return dao.login(u);
	}

}
