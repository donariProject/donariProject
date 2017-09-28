package global.sesoc.donari;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.donari.template.MovieTemplate;
import global.sesoc.donari.template.TravelTemplate;

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
	@RequestMapping(value = "travelImg", method = RequestMethod.GET)
	public String travelImg() {
		return "template/travelImg";
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
	
	@ResponseBody //ajax로 요청 보내서 로딩 나와 있는 동안 영상 제작
	@RequestMapping(value="makingMovie", method = RequestMethod.GET)
	public String makingMovie(HttpServletRequest request, Model model, String music, HttpSession session) throws Exception{
		System.out.println("[Let's Begin to making Movie video]");
		
		String imgDir = request.getServletContext().getRealPath("/resources/userimage");
		System.out.println("imgDir : "+imgDir);
		String serverpath = request.getServletContext().getRealPath("/resources/template/movie/");
		File mdir = new File(serverpath);
		if (!mdir.exists()) {
			mdir.mkdirs();
		}
		//음악이름
		music = "spider.mp3";
		
		//자막 들어간 사진 번호
		int[] num = {4, 18, 22, 27, 28, 29};
		
		//자막입력이 안된 사진들이 있다면 기본값으로 자막 셋팅
		for (int i = 0; i < num.length; i++) {
			String n = ""+num[i];
			if (!map.containsKey(n)) {
				map.put(n, "default");
			}
		}
		//최종 자막 확인
		System.out.println("final map check : "+map.toString());
		//서버 주소 확인
		System.out.println("server path : "+serverpath);
		
		//영상 만들고 최종 영상 이름 반환
		String[] result = mkMovie(serverpath, music, map, imgDir);
		System.out.println("complete path : "+result[0]);
		
		model.addAttribute("videoName", result[1]);
      
		String ntime = getTime();
	    model.addAttribute("today", ntime);
	    session.setAttribute("today", ntime);
		
		return result[1];
	}
	
	
	@ResponseBody //ajax로 요청 보내서 로딩 나와 있는 동안 영상 제작
	@RequestMapping(value="makingTravel", method = RequestMethod.GET)
	public String makingTravel(HttpServletRequest request, Model model, String music, HttpSession session) throws Exception{
		System.out.println("[Let's Begin to making Travel video]");
		
		String imgDir = request.getServletContext().getRealPath("/resources/userimage");
		
		String serverpath = request.getServletContext().getRealPath("/resources/template/travel/");
		System.out.println("[Travel Template path : "+serverpath+"]");
		
		File mdir = new File(serverpath);
		if (!mdir.exists()) {
			mdir.mkdirs();
		}
		String complete_filename = "travel.mp4";
		//음악이름
		music = "travelmusic.mp3";
		
		//자막 들어간 사진 번호
		int[] num = {2, 8, 9, 10, 11, 12, 13, 19};
		
		//자막입력이 안된 사진들이 있다면 기본값으로 자막 셋팅
		for (int i = 0; i < num.length; i++) {
			String n = ""+num[i];
			if (!map.containsKey(n)) {
				map.put(n, "default");
			}
		}
		//최종 자막 확인
		System.out.println("final map check : "+map.toString());
		//서버 주소 확인
		System.out.println("server path : "+serverpath);
		
		String width = "640";
		String height = "320";
		//영상 만들고 최종 영상 이름 반환
		String[] result = mkTravel(serverpath, complete_filename, music, map, imgDir, width, height);
		System.out.println("complete path : "+result[0]);
		
		model.addAttribute("videoName", result[1]);
		
		 
	    String ntime = getTime();
	    model.addAttribute("today", ntime);
	    session.setAttribute("today", ntime);
	    
		return result[1];
	}
	
	//최종 비디오 재생 페이지
	@RequestMapping(value="video", method = RequestMethod.GET)
	public String vid(Model model, String completeName, String cmd) throws Exception{
		
		model.addAttribute("videoName", completeName);
		model.addAttribute("cmd", cmd);
		
		return "template/completeVideo";
	}
	
	
	public String[] mkMovie(String serverpath, String music, HashMap<String, String>map, String imgDir){
		
		MovieTemplate mt = new MovieTemplate("complete.mp4", serverpath, music, map, serverpath);
		System.out.println("[make a movietemplate]");
		mt.delDir();
		File[] imgs = mt.mkDir(imgDir);
		System.out.println("make a movietemplate22222");
		mt.rendering(imgs);
		System.out.println("firststep complete");
		mt.merging();
		String compath = mt.getCOMPLETE()+mt.getComplete_filename();
		String[] result = {compath, mt.getComplete_filename()};
		return result;
	}
	
	public String[] mkTravel(String serverpath, String complete_filename, String music, HashMap<String, String>map, String imgDir, String width, String height){
		
		TravelTemplate tt = new TravelTemplate(serverpath, complete_filename, music, map, width, height);
		System.out.println("[make a travel template]");
		tt.delDir();
		File[] imgs = tt.mkDir(imgDir);
		tt.rendering(imgs);
		tt.merging();
		String compath = tt.getCOMPLETE()+tt.getComplete_filename();
		String[] result = {compath, tt.getComplete_filename()};
		return result;
	}
	
	public String getTime(){
		Calendar c = Calendar.getInstance(); //객체 생성 및 현재 일시분초...셋팅
	      String ntime = new String();
	      
	      final String[] arrMonth = {"", "January", "February", "March", "April", "May", "June", "July","August","September", "October","November","December"}; 
	      
	      /*ntime = String.valueOf(c.get(Calendar.MONTH)+1) + "-";*/
	      ntime = arrMonth[c.get(Calendar.MONTH)+1] + " ";
	      ntime += String.valueOf(c.get(Calendar.DATE)) + ",";
	      ntime += String.valueOf(c.get(Calendar.YEAR)) ;
	      
	      return ntime;
	}

}
	

