package controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Picture;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class ImgUpController {

	@RequestMapping("imgup")
	public  @ResponseBody String imgUp(@RequestParam("file") CommonsMultipartFile file,HttpServletRequest req )throws Exception {
		String newname=null;
		String oname=file.getOriginalFilename();
		String ex=oname.substring(oname.lastIndexOf("."),oname.length());
		String nname = UUID.randomUUID()+ex;
  
		String path=req.getSession().getServletContext().getRealPath("/");
		path=new File(path).getParentFile().getPath()+"/upload";
		System.out.println(path);
		file.transferTo(new File(path,nname));
		newname="/upload/"+nname;
		return "/upload/"+nname;
	}
	
	}

