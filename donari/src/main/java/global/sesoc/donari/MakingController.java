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

import global.sesoc.donari.template.MakeVideo;
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
		return "template/completeVideo";
	}
	
	@RequestMapping(value = "vlog", method = RequestMethod.GET)
	public String vlog() {
		return "template/vlog";
	}

	public HashMap<String, String> map = new HashMap<>();
	
	@ResponseBody
	@RequestMapping(value="/subs",method=RequestMethod.POST)
	public String subs(String subtitles, String index, HttpServletRequest request) throws IllegalStateException, IOException
	{
		System.out.println("subtitles : "+subtitles+"/ index : "+ index);
		
		if (map.containsKey(index)) {
			map.remove(index);
		}
		map.put(index, subtitles);
		System.out.println("current map : "+map.toString());
		
		return "success";
	}//subs
	
	@ResponseBody
	@RequestMapping(value="/getsubs",method=RequestMethod.POST)
	public HashMap<String, String> getsubs(Model model, HttpServletRequest request) throws IllegalStateException, IOException
	{
		System.out.println("getsubs : "+map.toString());
//		model.addAttribute("map", map);
		
		return map;
	}//subs
	
	@ResponseBody
	@RequestMapping(value="makingTemplate", method = RequestMethod.GET)
	public String ttest(HttpServletRequest request,Model model) throws Exception{
		System.out.println("let's begin!!!!!!!!!!!!!!!!!!!");
		
		String imgDir = request.getServletContext().getRealPath("/resources/userimage");
		System.out.println("imgDir : "+imgDir);
		String serverpath = request.getServletContext().getRealPath("/resources/template/");
		File mdir = new File(serverpath);
		if (!mdir.exists()) {
			mdir.mkdirs();
			System.out.println("mkdirs");
		}
		String music = "spider.mp3";
		
		File[] ckimgs = new File(imgDir).listFiles();
		
		int[] num = {4, 18, 22, 27, 28, 29};
		
		for (int i = 0; i < num.length; i++) {
			String n = ""+num[i];
			if (!map.containsKey(n)) {
				map.put(n, "default");
			}
		}
		System.out.println("final map check : "+map.toString());
		
		System.out.println("server path : "+serverpath);
		String completeName = making(serverpath, music, map, imgDir);
		System.out.println("comple : "+completeName);
		
		File complete = new File(serverpath+"complete/" + completeName);
		System.out.println("complete : "+complete.toString());
		
		model.addAttribute("videoName", completeName);
		
      
		return completeName;
	}
	
	
	@RequestMapping(value="video", method = RequestMethod.GET)
	public String vid(Model model, String completeName) throws Exception{
		
		model.addAttribute("videoName", completeName);
		
		return "template/completeVideo";
	}
	
	
	public String making(String serverpath, String music, HashMap<String, String>map, String imgDir){
		
		MovieTemplate mt = new MovieTemplate("complete.mp4", serverpath, music, map, serverpath);
		System.out.println("make a movietemplate");
		File[] imgs = mt.mkDir(imgDir);
		System.out.println("make a movietemplate22222");
		mt.firstStep(imgs);
		System.out.println("firststep complete");
		mt.merging();
		
		String completeVideo = mt.getComplete_filename();
		
		return completeVideo;
	}

}
	

