package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.House;
import model.User;
import service.CollectionService;
import utils.ReturnJson;

@Controller
@RequestMapping("collection")
public class CollectionController {

	@Autowired
	CollectionService service;

	// 查询全部
	@RequestMapping("select")
	public  String select(HttpSession session,ModelMap m) {
		int userid = ((User) session.getAttribute("user")).getId();
		m.put("house", service.select(userid));
		m.put("collectionSize", service.select(userid).size());
		return "collectionHouseInfo";
	}

	// 插入
	@RequestMapping("insert")
	public @ResponseBody ReturnJson insert(int houseid, HttpSession session) {
		int userid = ((User) session.getAttribute("user")).getId();
		service.insert(houseid, userid);
		return new ReturnJson();
	}

	// 删除
	@RequestMapping("delete")
	public String delete(int houseid, HttpSession session,ModelMap m) {
		int userid = ((User) session.getAttribute("user")).getId();
		service.delete(houseid, userid);
		m.put("house", service.select(userid));
		m.put("collectionSize", service.select(userid).size());
		return "collectionHouseInfo";
		
	}

}
