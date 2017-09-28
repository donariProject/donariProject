package global.sesoc.donari;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.donari.ffmpeg_handler.MusicReactVideo;
import global.sesoc.donari.template.MakeVideo;
import global.sesoc.donari.template.MovieTemplate;
import global.sesoc.donari.template.TravelTemplate;
import global.sesoc.donari.util.DuplicateFile;
import global.sesoc.donari.vo.File_VO;


@Controller
public class FileuploadController
{
	/*@Autowired
	private String path;*/
	
	private static final String FILE_PATH = "C:/Users/SCITMaster/Documents/workspace-sts-3.8.4.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/donari/sample.mp4";
	
//	파일 다운로드
	@GetMapping("/download")
	public String downloadFile(HttpServletResponse response) throws IOException 
	{
		File file = getFile();
		InputStream is = new FileInputStream(file);
		
		response.setHeader("Content-Disposition","attachment; filename="+file.getName());
//		response.setHeader("Content-Length",String.valueOf(file.length()));
//		FileCopyUtils.copy(is, response.getOutputStream());
		
		OutputStream os = response.getOutputStream();
		
		byte[] buffer = new byte[1024];
		int len=0;
		
		while((len=is.read(buffer)) != -1)
		{
			os.write(buffer, 0, len);
		}
		os.flush();
		os.close();
		is.close();
		
		return "download";
	}
	
	@RequestMapping(value="uploadResult",method=RequestMethod.GET)
	public String uploadResult(Model model,String filename)
	{
		model.addAttribute("filename", filename);
		return "download";
	}
	
	private File getFile() throws FileNotFoundException
	{
		File file = new File(FILE_PATH);
		
		if(!file.exists())
		{
			System.out.println("No File");
			throw new FileNotFoundException("File Not Found with Path : "+FILE_PATH);
		}
		
		return file;
	}
	
	// 다중 파일 업로드 처리
		@RequestMapping(value="/fileUploads",method=RequestMethod.POST)
		public String fileUploads(File_VO multiFiles,String title, MultipartFile files,Model model,HttpServletRequest request) throws IllegalStateException, IOException
		{
			String saveDir = request.getServletContext().getRealPath("/resources/userimage");
			System.out.println("다중 파일 저장 경로 : "+saveDir);
			// 올라온 파일 확인
			ArrayList<String> botari = new ArrayList<String>();
			
			for(MultipartFile file : multiFiles.getFiles())
			{
				System.out.println("다중 파일 원본 파일 명 : "+file.getOriginalFilename());
				 
				File check = new File(file.getOriginalFilename());
				// 중복 되지 않는 파일 객체를 만든다.
				if (check.exists()) {
					break;
				}
				File serverFile = DuplicateFile.getFile(saveDir, file);
				System.out.println("서버 파일 명:"+serverFile.getName());
				//System.out.println("수업때 배운거로 써보는 저장 경로"+path);
				// 실제적으로 저장할 파일로 이동
				file.transferTo(serverFile);
				System.out.println("저장 된 경로 및 파일 이름 ? "+serverFile);
				
				String filePath = ""+serverFile;
				String CompleteFilePath = filePath.replaceAll("\\\\", "/");
				System.out.println(CompleteFilePath+"완전체");
				
				botari.add(file.getOriginalFilename());
				System.out.println(botari+"넌 누구냐!!!!!!!!!!!!!!!!!!!!!!");
			}//for
			model.addAttribute("botari",botari);
			model.addAttribute("title",title);
			model.addAttribute("files",files);
			model.addAttribute("saveDir",saveDir);
			System.out.println("파일 이름 : "+files);
			
			return "makingVideo/basicVideo";
		}//fileUploadForms()
		
		@ResponseBody
	      @RequestMapping(value="/musicUpload",method=RequestMethod.POST)
	      public String musicupload(MultipartFile music, Model model, HttpServletRequest request) throws IllegalStateException, IOException
	      {
	         String saveDir = request.getServletContext().getRealPath("/resources/usermusic");
	         File dir = new File(saveDir);
				if (!dir.exists()) {
					dir.mkdirs();
				}
	        System.out.println("다중 파일 저장 경로 : "+saveDir);
	         
            System.out.println("다중 파일 원본 파일 명 : "+music.getOriginalFilename());
             
            // 중복 되지 않는 파일 객체를 만든다.
            File serverFile = DuplicateFile.getFile(saveDir, music);
            System.out.println("서버 파일 명:"+serverFile.getName());
            // 실제적으로 저장할 파일로 이동
            music.transferTo(serverFile);
            
            String filePath = ""+serverFile;
            String CompleteFilePath = filePath.replaceAll("\\\\", "/");
            System.out.println(CompleteFilePath+"완전체");
            model.addAttribute("saveDir",saveDir);
	         
	         return "sucess";
	      }   
		
		//업로드  된 원본 사진을 파일로 저장 + 이미지 리사이징 하는동안 로딩 페이지를 띄워주기 위해 로딩 페이지로 이동
		@RequestMapping(value="/tempImg",method=RequestMethod.POST)
		public String tempImg(File_VO multiFiles,String title, MultipartFile files,Model model,HttpServletRequest request) throws IllegalStateException, IOException
		{
			String originDir = request.getServletContext().getRealPath("/resources/original_image");
			File opath = new File(originDir);
			MakeVideo mv = new MakeVideo(new MovieTemplate().getFFMPEG_PATH());
			if (opath.exists()) {
				mv.deleteDir(opath.getPath());
			}
			opath.mkdirs();
			
			// 올라온 파일 확인
			int i = 0;
			for(MultipartFile file : multiFiles.getFiles())
			{
				// 중복 되지 않는 파일 객체를 만든다.
				File serverFile = DuplicateFile.getFile(originDir, file);
				file.transferTo(new File(originDir+"/img"+(i)+".jpg"));
				
				i++;
			}//for
			String cmd = "movie";
			String width = "640";
			String height = "320";
			model.addAttribute("cmd", cmd);
			model.addAttribute("width", width);
			model.addAttribute("height", height);
			
			return "template/loading";
		}
		
		@RequestMapping(value="/tarveltempImg",method=RequestMethod.POST)
		public String traveltempImg(File_VO multiFiles,String title, MultipartFile files,Model model,HttpServletRequest request) throws IllegalStateException, IOException
		{
			String originDir = request.getServletContext().getRealPath("/resources/original_image");
			File opath = new File(originDir);
			MakeVideo mv = new MakeVideo(new TravelTemplate().getFFMPEG_PATH());
			if (opath.exists()) {
				mv.deleteDir(opath.getPath());
			}
			opath.mkdirs();
			
			// 올라온 파일 확인
			int i = 0;
			for(MultipartFile file : multiFiles.getFiles())
			{
				// 중복 되지 않는 파일 객체를 만든다.
				File serverFile = DuplicateFile.getFile(originDir, file);
				file.transferTo(new File(originDir+"/timg"+(i)+".jpg"));
				
				i++;
			}//for
			String cmd = "travel";
			String width = "640";
			String height = "320";
			model.addAttribute("cmd", cmd);
			model.addAttribute("width", width);
			model.addAttribute("height", height);
			
			return "template/loading";
		}
		
		@RequestMapping(value="/loaded",method=RequestMethod.GET)
		public String loaded(Model model, HttpServletRequest request, String cmd) throws Exception
		{
			
			MakeVideo mv = new MakeVideo(new MovieTemplate().getFFMPEG_PATH());
			String saveDir = request.getServletContext().getRealPath("/resources/userimage");
			
			// 올라온 파일 확인
			ArrayList<String> botari = new ArrayList<String>();
			File[] list = mv.getFileList(saveDir);
			for (int j = 0; j < list.length; j++) {
				botari.add("resources/userimage"+"/"+cmd+(j)+".jpg");
			}
			
			model.addAttribute("imgCount", botari.size());
			model.addAttribute("botari",botari);
			model.addAttribute("saveDir",saveDir);
			
			return "template/"+cmd;
		}
		
		
		//로딩하는 동안 이미지 리사이징(경로 이동 :  original_image -> userimage)
		@ResponseBody
		@RequestMapping(value="/load",method=RequestMethod.GET)
		public String load(Model model,HttpServletRequest request, String cmd, String width, String height) throws Exception
		{
			//템플릿 확인
			System.out.println("[load cmd : "+cmd+"]");
			
			MakeVideo mv = new MakeVideo(new MovieTemplate().getFFMPEG_PATH());
			
			//원본사진 경로
			String originDir = request.getServletContext().getRealPath("/resources/original_image");
			//저장할 폴더명
			String topath = "/resources/userimage";
			//저장할 경로
			String saveDir = request.getServletContext().getRealPath(topath);
			//저장할 경로 확인, 폴더 초기화 후 생성
			File path = new File(saveDir);
			if (path.exists()) {
				mv.deleteDir(path.getPath());
			}
			path.mkdirs();
			
			//원본 파일 리스트
			File[] list = mv.getFileList(originDir);
			for (int j = 0; j < list.length; j++) {
				mv.reformatImg(originDir+"/img"+(j)+".jpg", saveDir+"/"+cmd+(j)+".jpg", width, height);
			}
			
			//cmd 반환
			return cmd;
		}
		
		@ResponseBody
		@RequestMapping(value="/reupload",method=RequestMethod.POST)
		public String reupload(MultipartFile files,String index,HttpServletRequest request, String cmd) throws IllegalStateException, IOException
		{
			MakeVideo mv = new MakeVideo(new MovieTemplate().getFFMPEG_PATH());
			
			//원본사진 경로
			String originDir = request.getServletContext().getRealPath("/resources/original_image");
			//저장할 폴더명
			String topath = "/resources/userimage";
			//저장할 경로
			String saveDir = request.getServletContext().getRealPath(topath);

			File file = new File(saveDir+"/"+index+".jpg");
			if(file.exists()){
				file.delete();
			}
			
			File serverFile = DuplicateFile.getFile(saveDir, files);
			files.transferTo(new File(saveDir+"/"+index+".jpg"));
			
			System.out.println("들어옴"+files.getOriginalFilename());
			System.out.println(index);
			
			String toFile = "resources/userimage/"+index+".jpg";
			
			return toFile;
		}//fileUploadForms()
		
		@RequestMapping(value = "/faceUploads", method = {RequestMethod.POST, RequestMethod.GET})
		public String facebookWindow(File_VO multiFiles, MultipartFile files, Model model, HttpServletRequest request)
				throws IllegalStateException, IOException {
			
			System.out.println("페이스 업로드 들어왔다아");
			
			String saveDir = request.getServletContext().getRealPath("/resources/facebook");
			MakeVideo makeVideo = new MakeVideo("");
			File savedirFile = new File(saveDir);
			if (!savedirFile.exists()) {
				savedirFile.mkdirs();
			}
			
			MusicReactVideo mrv = new MusicReactVideo();
//			VideoTime vidtime = new VideoTime();
			mrv.makeBasicVid(saveDir + "/", request.getServletContext().getRealPath("/resources/output/outvid.mp4"),
					request.getServletContext().getRealPath("/resources/usermusic/music.mp3"),
					request.getServletContext().getRealPath("/"));
				
//			vidtime.videoTime(request.getServletContext().getRealPath("/resources/output/outvid.mp4"));
			
			Calendar c = Calendar.getInstance(); //객체 생성 및 현재 일시분초...셋팅
			String ntime = new String();
			
			final String[] arrMonth = {"", "January", "February", "March", "April", "May", "June", "July","August","September", "October","November","December"}; 
			
			/*ntime = String.valueOf(c.get(Calendar.MONTH)+1) + "-";*/
			ntime = arrMonth[c.get(Calendar.MONTH)+1] + " ";
			ntime += String.valueOf(c.get(Calendar.DATE)) + ",";
			ntime += String.valueOf(c.get(Calendar.YEAR)) ;
			
			model.addAttribute("today", ntime);

			
			
			return "makingVideo/movieWindow";
		}
		
		
		
	}//class