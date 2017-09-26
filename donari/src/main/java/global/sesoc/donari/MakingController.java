package global.sesoc.donari;

import java.io.File;

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
	
	@ResponseBody
	@RequestMapping(value="video", method = RequestMethod.POST)
	public String ttest(Thread ts) throws Exception{
		System.out.println("나는 들어왓지롱");
		MovieTemplate mt = new MovieTemplate();
		File video = mt.rrn();
      
		ts.sleep(3000);
      
		return "success";
	}

	@RequestMapping(value = "makeit", method = RequestMethod.GET)
	public String makeit() {
		
		
		return "redirect:video";
	}
	
}
	

