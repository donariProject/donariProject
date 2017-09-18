package global.sesoc.donari.vo;

import org.springframework.web.multipart.MultipartFile;

public class File_VO
{
	private String title;
	private MultipartFile[] files;
	
	public String getTitle() 
	{
		return title;
	}
	
	public void setTitle(String title) 
	{
		this.title = title;
	}
	
	public MultipartFile[] getFiles() 
	{
		return files;
	}
	
	public void setFiles(MultipartFile[] files) 
	{
		this.files = files;
	}
}