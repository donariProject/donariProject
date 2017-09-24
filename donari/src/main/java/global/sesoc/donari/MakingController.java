package global.sesoc.donari;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MakingController {

	@Autowired
    SqlSession sql;
	
	/*
	@RequestMapping(value="albumList", method=RequestMethod.GET)
	public String albumList(String albumName, String count, Model model){
		System.out.println("albumName : "+albumName);
		System.out.println("count : "+count);
		model.addAttribute("albumAdd", albumName);
		model.addAttribute("albumCount", count);
		return "makingVideo/facebookAlbum";
	}
	*/
	
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
	
	
	
}
	

