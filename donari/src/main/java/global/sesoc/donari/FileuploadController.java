package global.sesoc.donari;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		
		
		@RequestMapping(value="/tempImg",method=RequestMethod.POST)
		public String tempImg(File_VO multiFiles,String title, MultipartFile files,Model model,HttpServletRequest request) throws IllegalStateException, IOException
		{
			String saveDir = request.getServletContext().getRealPath("/resources/userimage");
			// 올라온 파일 확인
			ArrayList<String> botari = new ArrayList<String>();
			int i = 0;
			for(MultipartFile file : multiFiles.getFiles())
			{
				
				// 중복 되지 않는 파일 객체를 만든다.
				File serverFile = DuplicateFile.getFile(saveDir, file);
				file.transferTo(new File(saveDir+"/mvimg"+(i)+".jpg"));
				
				//serverFile.renameTo(new File(saveDir+"/mvimg"+(i++)));
				
				String filePath = ""+serverFile;
				String CompleteFilePath = filePath.replaceAll("\\\\", "/");
				
				botari.add("resources/userimage"+"/mvimg"+(i)+".jpg");
				
				i++;
			}//for
			model.addAttribute("botari",botari);
			model.addAttribute("files",files);
			model.addAttribute("saveDir",saveDir);
			System.out.println("파일 이름 : "+files);
			
			return "template/movie";
		}//fileUploadForms()
		
		@ResponseBody
		@RequestMapping(value="/reupload",method=RequestMethod.POST)
		public String reupload(MultipartFile files,String index,HttpServletRequest request) throws IllegalStateException, IOException
		{
			String saveDir = request.getServletContext().getRealPath("/resources/userimage");
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
		
		
		@ResponseBody
		@RequestMapping(value="/subs",method=RequestMethod.POST)
		public String subs(String subtitles,String index, HttpServletRequest request) throws IllegalStateException, IOException
		{
			System.out.println("subtitles : "+subtitles+"/ index : "+ index);
			/*String saveDir = request.getServletContext().getRealPath("/resources/userimage");
			File file = new File(saveDir);
			if(file.exists()){
				file.delete();
			}
			*/
			/*File serverFile = DuplicateFile.getFile(saveDir, files);
			files.transferTo(new File(saveDir+"/"+index+".jpg"));
			
			System.out.println("들어옴"+files.getOriginalFilename());
			System.out.println(index);
			
			String toFile = "resources/userimage/"+index+".jpg";*/
			
			return "success";
		}//fileUploadForms()
		
		
		
		
	}//class