package service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.HouseDao;
import model.House;
import service.HouseService;
import utils.ReturnInfo;
@Service
public class HouseServiceImpl implements HouseService {
	@Autowired
	HouseDao dao;

	public List<House> select(String txt, Integer page, Integer limit) {
		
		return dao.select(txt,null);
	}

	public House selectById(Integer id) {
		return dao.selectById(id);
	}

	public Integer selectHouseCount(String txt) {
		return dao.selectHouseCount(txt);
	}

	public List<House> findHouse(String txt) {
		return dao.findHouse(txt);
	}

}
