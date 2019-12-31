package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.House;
import utils.ReturnInfo;

public interface HouseService {

	// 查询房子信息
	public List<House> select(String txt, Integer page, Integer count);

	// 根据ID查询
	public House selectById(Integer id);

	// 查询房子条数
	public Integer selectHouseCount(String txt);
	
	//搜索条件查找
	public List<House> findHouse(String txt);
	
	//新增
	public void insert(House h);
	
	public List<House> selectByUserid(int id);
	
	public void delete(int houseid, int userid);
	
}
