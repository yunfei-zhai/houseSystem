package service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.HouseDao;
import model.House;
import service.HouseService;
@Service
public class HouseServiceImpl implements HouseService {
	@Autowired
	HouseDao dao;

	public List<House> select(String txt, Integer page, Integer limit) {
		
		return dao.select(txt,null);
	}

	public House selectById(Integer id) {
		House house=dao.selectById(id);
		house.setUnitPrice((int)(house.getPrice()*10000/house.getArea()));
		return house;
	}

	public Integer selectHouseCount(String txt) {
		return dao.selectHouseCount(txt);
	}

	public List<House> findHouse(String txt) {
		return dao.findHouse(txt);
	}

	public void insert(House h) {
		dao.insert(h);
	}

}
