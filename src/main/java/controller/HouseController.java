package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.House;
import service.HouseService;
import utils.ReturnInfo;

@Controller
@RequestMapping("/house")
public class HouseController {
	@Autowired
	HouseService service;

	// 查询房子信息
	@RequestMapping("index")
	public @ResponseBody List<House> select(House hs, Integer page, Integer limit) {
		String txt=null;
		if(!(hs.getType()==null)) {
			txt=" where hms_house.type = "+hs.getType();
		}
		return service.select(txt, page, limit);
	}

	// 根据搜索条件查找房子信息
	@RequestMapping("find")
	public String findHouse(String find, ModelMap m) {
		String txt;
		if (!(find == null)) {
			txt = " where topic like '%" + find + "%'";
		} else {
			txt = null;
		}
		m.addAttribute("findSize", service.findHouse(txt).size());
		m.addAttribute("findInfo", service.findHouse(txt));
		return "findHouseInfo";
	}

	// 查询房子条数
	@RequestMapping("count")
	public @ResponseBody int selectHouseCount(House hs) {
		String txt=null;
		if(!(hs.getType()==null)) {
			txt=" where hms_house.type = "+hs.getType();
		}
		return service.selectHouseCount(txt);
	}
}
