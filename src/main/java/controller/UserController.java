package controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.User;
import service.UserService;
import utils.ImageVerificationCode;
import utils.ReturnInfo;
import utils.ReturnJson;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	UserService service;
	//用户登录
	@RequestMapping("login")
	public  String login(User u, HttpSession s,String code) {
		String num = s.getAttribute("number").toString();
		User user =service.login(u);
		if(num.equalsIgnoreCase(code) && user != null){
			s.setAttribute("user", user);
			s.setMaxInactiveInterval(100000);
			return "redirect:/index.html";
		}else {
			return "redirect:/login.html";
		}
	}
	//退出登陆
	@RequestMapping("outlogin")
	public String login(HttpSession s){
		s.removeAttribute("user");
		return "redirect:/login.html";
	}
	//查询全部
	@RequestMapping("select")
	public @ResponseBody ReturnInfo select(String txt,Integer page,Integer limit) {
		if(txt!=null&&txt.length()>0)txt=" where hms_user.name like '%"+txt+"%' ";
		else txt="";
		return service.selectUser(txt, page, limit);
	}
	//插入
	@RequestMapping("insert")
	public String insert(User u){
		service.insert(u);
		return "redirect:/login.html";
	}
	
	//根据id查询
	@RequestMapping("edit")
	public @ResponseBody User edit(Integer id){
		return service.selectById(id);
	}
	//更新
	@RequestMapping("update")
	public @ResponseBody ReturnJson update(User b){
		service.update(b);
		return new ReturnJson();
	}
	//获取性别
	@RequestMapping("getsexs")
	public @ResponseBody String[] getSexs() {
		return User.sexs;
	}
	//删除
	@RequestMapping("delete")
	public @ResponseBody ReturnJson delete(int id) {
		service.delete(id);
		return new ReturnJson();
	}
	//获取验证码图片
	@RequestMapping("getVerifiCode")
    @ResponseBody
    public void getVerifiCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*
             1.生成验证码
             2.把验证码上的文本存在session中
             3.把验证码图片发送给客户端
             */
        ImageVerificationCode ivc = new ImageVerificationCode();     //用我们的验证码类，生成验证码类对象
        BufferedImage image = ivc.getImage();  //获取验证码
        request.getSession().setAttribute("number", ivc.getText()); //将验证码的文本存在session中
        ivc.output(image, response.getOutputStream());//将验证码图片响应给客户端
    }
}
