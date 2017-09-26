package global.sesoc.donari;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.donari.template.MovieTemplate;
import global.sesoc.donari.template.Test;

@Controller
public class MakingController {

	@Autowired
    SqlSession sql;
	
	@RequestMapping(value = "movie", method = RequestMethod.GET)
	public String movie() {
		return "template/movie";
	}
	
	@RequestMapping(value = "movieImg", method = RequestMethod.GET)
	public String movieImg() {
		return "template/movieImg";
	}
	
	@RequestMapping(value = "travel", method = RequestMethod.GET)
	public String travel() {
		return "template/travel";
	}
	
	@RequestMapping(value = "vlog", method = RequestMethod.GET)
	public String vlog() {
		return "template/vlog";
	}

	HashMap<String, String> map = new HashMap<>();
	
	@ResponseBody
	@RequestMapping(value="/subs",method=RequestMethod.POST)
	public String subs(String subtitles,String index, HttpServletRequest request) throws IllegalStateException, IOException
	{
		System.out.println("subtitles : "+subtitles+"/ index : "+ index);
		
		if (map.containsKey(index)) {
			map.remove(index);
		}
		map.put(index, subtitles);
		System.out.println("current map : "+map.toString());
		
		return "success";
	}//subs
	
	@RequestMapping(value="video", method = RequestMethod.GET)
	public String ttest(Thread ts, HttpServletRequest request) throws Exception{
		System.out.println("let's begin!!!!!!!!!!!!!!!!!!!");
		
		String imgDir = request.getServletContext().getRealPath("/resources/userimage");
		File dir = new File(imgDir);
		
		MovieTemplate mt = new MovieTemplate();
		File video = mt.rrn();
      
		ts.sleep(3000);
      
		return "completeVideo";
	}

}
	

