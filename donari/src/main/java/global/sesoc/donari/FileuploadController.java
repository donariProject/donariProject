package global.sesoc.donari;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.donari.util.DuplicateFile;
import global.sesoc.donari.vo.File_VO;


@Controller
public class FileuploadController
{
	/*@Autowired
	private String path;*/
	
	private static final String FILE_PATH = "C:/Users/SCITMaster/Documents/workspace-sts-3.8.4.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/fileund/sample.mp4";
	
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
	
	// 싱글 파일 업로드폼
	@RequestMapping(value="/fileUpload",method=RequestMethod.GET)
	public String fileUploadForm()
	{
		return "fileUploadForm";
	}//fileUploadForm()
	 
	// 싱글 파일 업로드 처리
	@RequestMapping(value="/fileUpload",method=RequestMethod.POST)
	public String fileUpload(String title, MultipartFile files,Model model,HttpServletRequest request) throws IllegalStateException, IOException
	{
		String fileName = files.getOriginalFilename();
		String saveDir = request.getServletContext().getRealPath("");
		System.out.println("단일 파일 저장 경로 : "+saveDir);
		System.out.println("제목 : "+title);
		System.out.println("단일 파일 명 : "+fileName);
		//System.out.println("수업때 배운거로 써보는 저장 경로"+path);
		// String saveFile = saveDir+"\\"+file1.getOriginalFilename();
		 
		// 중복된 파일인 경우 덮어 쓰기가 되기 때문에 중복 방지 처리를 해 줘야 한다.
		File fileObj
		// = new File(saveFile);
		// = new File(saveDir,file1.getOriginalFilename());
		 
		// 중복된 파일 방지 처리를 한 파일 객체를 사용 한다.
		= DuplicateFile.getFile(saveDir, files);
		 
		files.transferTo(fileObj);
		model.addAttribute("title",title);
		model.addAttribute("files",files);
		model.addAttribute("fileName",fileName);
		model.addAttribute("serverFileName",fileObj.getName());
		return "fileUpload";
	}//fileUploadForm()
	 
	// 다중 파일 업로드폼
	@RequestMapping(value="/fileUploads",method=RequestMethod.GET)
	public String fileUploadForms()
	{
		return "fileUploadForms";
	}//fileUploadForms()
	 
	// 다중 파일 업로드 처리
	@RequestMapping(value="/fileUploads",method=RequestMethod.POST)
	public String fileUploads(File_VO multiFiles,String title, MultipartFile files,Model model,HttpServletRequest request) throws IllegalStateException, IOException
	{
		String saveDir = request.getServletContext().getRealPath("");
		System.out.println("다중 파일 저장 경로 : "+saveDir);
		// 올라온 파일 확인
		for(MultipartFile file : multiFiles.getFiles())
		{
			System.out.println("다중 파일 원본 파일 명 : "+file.getOriginalFilename());
			 
			// 중복 되지 않는 파일 객체를 만든다.
			File serverFile = DuplicateFile.getFile(saveDir, file);
			System.out.println("서버 파일 명:"+serverFile.getName());
			//System.out.println("수업때 배운거로 써보는 저장 경로"+path);
			// 실제적으로 저장할 파일로 이동
			file.transferTo(serverFile);
		}//for
		model.addAttribute("title",title);
		model.addAttribute("files",files);
		return "fileUploads";
	}//fileUploadForms()
}//class