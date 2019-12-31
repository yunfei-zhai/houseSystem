package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.House;
import model.User;
import service.HouseService;

@Controller
@RequestMapping("house")
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
	public String findHouse(String find, ModelMap m,String[] condition) {
		String txt=null;
		if (!(find == null)) {
			txt = " where topic like '%" + find + "%'";
		} else {
			txt = null;
		}
		if(condition != null && condition.length !=0) {
			if(condition.length == 1) {
				txt= "where "+condition[0];
			}else {
				txt= "where "+condition[0];
				for(int i=condition.length-1;i>=1;i--) {
					txt= txt + " and "+ condition[i];
				}
			}
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
	
	@RequestMapping("insert")
	public String insert(String files,House h,HttpSession s) {
		System.out.println(h.getPosition());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        h.setCreattime(df.format(new Date()));// new Date()为获取当前系统时间
		h.setImg(files);
		User user= (User) s.getAttribute("user");
		h.setUserid(user.getId());
		service.insert(h);
		return "redirect:/index.html";
	}
	//查看房子详情
	@RequestMapping("detail")
	public String detail(int id,ModelMap m) {
		m.put("house", service.selectById(id));
		return "housedetail";
	}
	//删除
	@RequestMapping("delete")
	public String delete(int houseid,HttpSession session,ModelMap m) {
		int userid = ((User) session.getAttribute("user")).getId();
		service.delete(houseid, userid);
		m.put("house", service.selectByUserid(userid));
		return "postHouseInfo";
	}
	//
	@RequestMapping("selectByUserid")
	public String selectByUserid(HttpSession session,ModelMap m) {
		int id = ((User) session.getAttribute("user")).getId();
		m.put("house", service.selectByUserid(id));
		
		return "postHouseInfo";
	}
	
}
