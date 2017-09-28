package global.sesoc.donari.template;

import java.io.File;
import java.util.HashMap;

import global.sesoc.donari.template.MakeVideo;

public class TravelTemplate {

	public String SERVER_PATH = "";
	private String FFMPEG_PATH = "C:/ffmpeg/bin/ffmpeg";
	private String COPIED_IMAGES = SERVER_PATH+"copied_images/";
	private String PROCESSING_VID = SERVER_PATH+"processing_vid/";
	private String PROCESSED_VIDS = SERVER_PATH+"processed_vids/";
	private String TEMP = SERVER_PATH+"temp/";
	private String COMPLETE = SERVER_PATH+"complete/";
	private String complete_filename = "complete.mp4";
	private String music_path = "";
	private String music = "";
	private String width = "";
	private String height = "";
	private HashMap<String, String> map = new HashMap<>();
	
	public TravelTemplate() {	}
	
	//객체 생성할 때 부터 서버주소, 완성된 파일 이름, 음악파일 이름, 자막정보 map, 가로, 세로 정보를 받아 놓음
	public TravelTemplate(String sERVER_PATH, String complete_filename, String music, HashMap<String, String> map, String width, String height) {
		super();
		SERVER_PATH = sERVER_PATH;
		this.complete_filename = complete_filename;
		this.music = music;
		this.map = map;
		this.width = width;
		this.height = height;
		//모든 경로에 서버 경로 추가
		setServerPath(sERVER_PATH);
	}

	//모든 경로에 서버 경로 추가
	public void setServerPath(String serverpath){
		SERVER_PATH = serverpath;
		COPIED_IMAGES = SERVER_PATH+"copied_images/";
		PROCESSING_VID = SERVER_PATH+"processing_vid/";
		PROCESSED_VIDS = SERVER_PATH+"processed_vids/";
		TEMP = SERVER_PATH+"temp/";
		COMPLETE = SERVER_PATH+"complete/";
		music_path = SERVER_PATH;
	}

	public String getFFMPEG_PATH() {
		return FFMPEG_PATH;
	}

	public void setFFMPEG_PATH(String fFMPEG_PATH) {
		FFMPEG_PATH = fFMPEG_PATH;
	}

	public String getCOPIED_IMAGES() {
		return COPIED_IMAGES;
	}

	public void setCOPIED_IMAGES(String cOPIED_IMAGES) {
		COPIED_IMAGES = cOPIED_IMAGES;
	}

	public String getPROCESSING_VID() {
		return PROCESSING_VID;
	}

	public void setPROCESSING_VID(String pROCESSING_VID) {
		PROCESSING_VID = pROCESSING_VID;
	}

	public String getPROCESSED_VIDS() {
		return PROCESSED_VIDS;
	}

	public void setPROCESSED_VIDS(String pROCESSED_VIDS) {
		PROCESSED_VIDS = pROCESSED_VIDS;
	}

	public String getTEMP() {
		return TEMP;
	}

	public void setTEMP(String tEMP) {
		TEMP = tEMP;
	}

	public String getCOMPLETE() {
		return COMPLETE;
	}

	public void setCOMPLETE(String cOMPLETE) {
		COMPLETE = cOMPLETE;
	}

	public String getComplete_filename() {
		return complete_filename;
	}

	public void setComplete_filename(String complete_filename) {
		this.complete_filename = complete_filename;
	}

	public String getMusic_path() {
		return music_path;
	}

	public void setMusic_path(String music_path) {
		this.music_path = music_path;
	}

	public String getMusic() {
		return music;
	}

	public void setMusic(String music) {
		this.music = music;
	}

	public HashMap<String, String> getMap() {
		return map;
	}

	public void setMap(HashMap<String, String> map) {
		this.map = map;
	}

	//랜더링 할 때 필요한 폴더 경로 생성
	public File[] mkDir(String inputImgsPath){
		MakeVideo mv = new MakeVideo(FFMPEG_PATH);
		
		File copiedImagesDir = new File(COPIED_IMAGES); // 렌더링 작업중인 임시 파일들을 저장하는 폴더
		File processingVidDir = new File(PROCESSING_VID); // 렌더링 작업중인 임시 파일들을 저장하는 폴더
		File processedVidsDir = new File(PROCESSED_VIDS); // // 렌더링 작업중인 임시 파일들을 저장하는 폴더
		
		if(!copiedImagesDir.exists()) {
			copiedImagesDir.mkdirs();
		}
		if(!processingVidDir.exists()) {
			processingVidDir.mkdirs();
		}
		if(!processedVidsDir.exists()) {
			processedVidsDir.mkdirs();
		}
		
		File imgs[] = mv.getFileList(inputImgsPath+"/"); // 영상으로 만들 이미지 경로
		
		imgs = mv.sortFileList(imgs); // 파일명 순으로 정렬
		
		return imgs;
	}
	
	public void delDir(){
		MakeVideo mv = new MakeVideo(FFMPEG_PATH);
		
		File copiedImagesDir = new File(COPIED_IMAGES); // 렌더링 작업중인 임시 파일들을 저장하는 폴더
		File processingVidDir = new File(PROCESSING_VID); // 렌더링 작업중인 임시 파일들을 저장하는 폴더
		File processedVidsDir = new File(PROCESSED_VIDS); // // 렌더링 작업중인 임시 파일들을 저장하는 폴더
		
		if(copiedImagesDir.exists()) {
			copiedImagesDir.delete();
		}
		if(processingVidDir.exists()) {
			processingVidDir.delete();
		}
		if(processedVidsDir.exists()) {
			processedVidsDir.delete();
		}
		
	}
	
	public void rendering(File[] imgs){
		
		System.out.println("<<I'm making travel video And map is : "+map.toString());
		MakeVideo mv = new MakeVideo(FFMPEG_PATH);
		for (int i = 0; i < imgs.length; i++) {
			String imgName = String.format("%03d", (i+1));
			mv.reformatImg(imgs[i].getPath(), COPIED_IMAGES+imgName+".png", width, height);
			
			//시작
			if (i == 0) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSING_VID+imgName+".mp4", "3");
				mv.insertFadeIn(PROCESSING_VID+imgName+".mp4", PROCESSED_VIDS+imgName+".mp4", "0", "3");
			}
			
			//시작2
			else if (i == 1) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSING_VID+imgName+".mp4", "2");
				mv.insertFadeIn(PROCESSING_VID+imgName+".mp4", PROCESSED_VIDS+imgName+".mp4", "0", "2");
			}
			
			//타이틀자막
			else if (i == 2) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSING_VID+imgName+"a.mp4", "2");
				mv.insertText(PROCESSING_VID+imgName+"a.mp4", PROCESSING_VID+imgName+".mp4", map.get(""+i), "Bungee-Regular.ttf", "white", "50", "center", "center", "0", "2");
				mv.insertFadeIn(PROCESSING_VID+imgName+".mp4", PROCESSED_VIDS+imgName+".mp4", "0", "2");
			}
			//짧은 컷들
			else if (i <= 7) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSED_VIDS+imgName+"a.mp4", "1");
			}
			
			//짧은 전환 씬
			else if (i <= 13) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSING_VID+imgName+".mp4", "1.5");
				File tempDir = new File(TEMP);
				if(!tempDir.exists()) {
					tempDir.mkdirs();
				}
				//자막(2-7번) index : 8 9 10 11 12 13
				mv.insertText(PROCESSING_VID+imgName+".mp4", TEMP+imgName+".mp4", map.get(""+i), "Bungee-Regular.ttf", "white", "50", "center", "center", "0", "1.2");
				mv.insertFadeIn(TEMP+imgName+".mp4", PROCESSED_VIDS+imgName+".mp4", "0", "0.5");
				mv.deleteDir(tempDir.toString());
			}
			
			//컷 나열
			else if (i <= 17) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSED_VIDS+imgName+".mp4", "1");
			}
			
			//마지막 -3
			else if (i == 18) {
				File tempDir = new File(TEMP);
				if(!tempDir.exists()) {
					tempDir.mkdirs();
				}
				mv.imgToVid(COPIED_IMAGES+imgName+".png", TEMP+imgName+".mp4", "2");
				mv.insertFadeIn(TEMP+imgName+".mp4", TEMP+imgName+"a.mp4", "0", "0.5");
				mv.insertFadeOut(TEMP+imgName+"a.mp4", PROCESSED_VIDS+imgName+".mp4", "1.5", "2");
				mv.deleteDir(tempDir.toString());
			}
			
			//마지막 -2
			else if (i == 19) {
				File tempDir = new File(TEMP);
				if(!tempDir.exists()) {
					tempDir.mkdirs();
				}
				mv.imgToVid(COPIED_IMAGES+imgName+".png", TEMP+imgName+"c.mp4", "2");
				mv.insertText(TEMP+imgName+"c.mp4", TEMP+imgName+".mp4", map.get(""+i), "Bungee-Regular.ttf", "white", "50", "center", "center", "0.2", "1.2");
				mv.insertFadeIn(TEMP+imgName+".mp4", TEMP+imgName+"a.mp4", "0", "0.5");
				mv.insertFadeOut(TEMP+imgName+"a.mp4", PROCESSED_VIDS+imgName+".mp4", "1.5", "2");
				mv.deleteDir(tempDir.toString());
			}
			
			//마지막 -3
			else if (i == 20) {
				File tempDir = new File(TEMP);
				if(!tempDir.exists()) {
					tempDir.mkdirs();
				}
				mv.imgToVid(COPIED_IMAGES+imgName+".png", TEMP+imgName+".mp4", "2");
				mv.insertFadeIn(TEMP+imgName+".mp4", TEMP+imgName+"a.mp4", "0", "0.5");
				mv.insertFadeOut(TEMP+imgName+"a.mp4", PROCESSED_VIDS+imgName+".mp4", "1.2", "2");
				mv.deleteDir(tempDir.toString());
			}
			
		}
	}
	
	public void merging(){
		MakeVideo mv = new MakeVideo(FFMPEG_PATH);
		File[] files = mv.getFileList(PROCESSED_VIDS);
		File completeDir = new File(COMPLETE);
		if (!completeDir.exists()) {
			completeDir.mkdirs();
			System.out.println("complete mkdir");
		}
		mv.writeVidListFile(files, PROCESSED_VIDS+"input.txt");
		System.out.println("writeList");
		mv.mergeVids(PROCESSED_VIDS+"input.txt", COMPLETE+complete_filename, music_path+music);
		
		
		File com = new File(COMPLETE+complete_filename);
		if (com.exists()) {
			mv.deleteDir(COPIED_IMAGES);
			mv.deleteDir(PROCESSING_VID);
			mv.deleteDir(PROCESSED_VIDS);
		}
	}
	
	
}
