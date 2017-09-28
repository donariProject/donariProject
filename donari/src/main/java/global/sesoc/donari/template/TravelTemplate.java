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
	private HashMap<String, String> map = new HashMap<>();
	
	public TravelTemplate() {	}
	
	public TravelTemplate(String sERVER_PATH, String complete_filename, String music, HashMap<String, String> map) {
		super();
		SERVER_PATH = sERVER_PATH;
		this.complete_filename = complete_filename;
		this.music = music;
		this.map = map;
		setServerPath(sERVER_PATH);
	}

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
	
	public void rendering(File[] imgs){
		System.out.println("I'm making travel video And map is : "+map.toString());
		MakeVideo mv = new MakeVideo(FFMPEG_PATH);
		for (int i = 0; i < imgs.length; i++) {
			String imgName = String.format("%03d", (i+1));
			mv.reformatImg(imgs[i].getPath(), COPIED_IMAGES+imgName+".png", "640", "360");
			
			//인트로
			if (i == 0) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSING_VID+imgName+".mp4", "5");
				mv.insertFadeIn(PROCESSING_VID+imgName+".mp4", PROCESSED_VIDS+imgName+".mp4", "0", "3");
			}
			
			//인트로 맛보기
			else if (i <= 3) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSED_VIDS+imgName+".mp4", "1");
			}
			
			//타이틀
			else if (i <= 5) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSING_VID+imgName+".mp4", "2.5");
				File tempDir = new File(TEMP);
				if(!tempDir.exists()) {
					tempDir.mkdirs();
				}
				if (i == 4) {
					mv.insertFadeOut(PROCESSING_VID+imgName+".mp4", TEMP+imgName+".mp4", "0", "1");
				}else {
					
					mv.insertFadeIn(PROCESSING_VID+imgName+".mp4", TEMP+imgName+".mp4", "0.5", "1.5");
					File[] tempf = mv.getFileList(TEMP);
					mv.writeVidListFile(tempf, TEMP+"input.txt");
					mv.mergeVids(TEMP+"input.txt", TEMP+"merge.mp4");
					System.out.println("[inserting : "+map.get("4")+" ]");
					mv.insertText(TEMP+"merge.mp4", PROCESSED_VIDS+imgName+".mp4", map.get("4"), "default", "default", "default", "center", "center", "0.8", "3");
					mv.deleteDir(tempDir.toString());
				}
			}
			
			//웅장한 장면들
			else if (i <= 10) {
				File tempDir = new File(TEMP);
				if(!tempDir.exists()) {
					tempDir.mkdirs();
				}
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSING_VID+imgName+".mp4", "1.5");
				mv.insertFadeIn(PROCESSING_VID+imgName+".mp4", TEMP+imgName+".mp4", "0", "0.5");
				mv.insertFadeOut(TEMP+imgName+".mp4", PROCESSED_VIDS+imgName+".mp4", "1", "1.5");
				mv.deleteDir(tempDir.toString());
			}
			
			//빠른 장면들
			else if (i <= 17) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSED_VIDS+imgName+".mp4", "0.5");
			}
			
			//홍보 멘트
			else if (i == 18) {
				File tempDir = new File(TEMP);
				if(!tempDir.exists()) {
					tempDir.mkdirs();
				}
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSING_VID+imgName+".mp4", "2");
				mv.insertText(PROCESSING_VID+imgName+".mp4", PROCESSING_VID+imgName+"a.mp4", map.get(""+i), "default", "default", "default", "center", "center", "0.4", "1.7");
				mv.insertFadeIn(PROCESSING_VID+imgName+"a.mp4", TEMP+imgName+".mp4", "0", "0.5");
				mv.insertFadeOut(TEMP+imgName+".mp4", PROCESSED_VIDS+imgName+".mp4", "1.5", "2");

				mv.deleteDir(tempDir.toString());
			}
			else if (i <= 21) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSED_VIDS+imgName+".mp4", "1");
			}
			else if (i == 22) {
				File tempDir = new File(TEMP);
				if(!tempDir.exists()) {
					tempDir.mkdirs();
				}
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSING_VID+imgName+".mp4", "3");
				mv.insertText(PROCESSING_VID+imgName+".mp4", PROCESSING_VID+imgName+"a.mp4", map.get(""+i), "default", "default", "default", "center", "center", "0.4", "1.7");
				mv.insertFadeIn(PROCESSING_VID+imgName+"a.mp4", TEMP+imgName+".mp4", "0", "0.5");
				mv.insertFadeOut(TEMP+imgName+".mp4", PROCESSED_VIDS+imgName+".mp4", "1.5", "2");
				mv.deleteDir(tempDir.toString());
			}
			else if (i <= 26) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSED_VIDS+imgName+".mp4", "1");
			}
			else if (i == 27) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSING_VID+imgName+".mp4", "3");
				mv.insertText(PROCESSING_VID+imgName+".mp4", PROCESSING_VID+imgName+"a.mp4", map.get(""+i), "default", "default", "default", "center", "center", "1", "2.7");
				mv.insertFadeOut(PROCESSING_VID+imgName+"a.mp4", PROCESSED_VIDS+imgName+".mp4", "2.5", "0.5");
			}
			else if (i == 28) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSING_VID+imgName+".mp4", "3");
				mv.insertText(PROCESSING_VID+imgName+".mp4", PROCESSING_VID+imgName+"a.mp4", map.get(""+i), "default", "default", "default", "center", "center", "1", "2.7");
				mv.insertFadeOut(PROCESSING_VID+imgName+"a.mp4", PROCESSED_VIDS+imgName+".mp4", "2.5", "0.5");
			}
			else if (i == 29) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSING_VID+imgName+".mp4", "3");
				mv.insertText(PROCESSING_VID+imgName+".mp4", PROCESSING_VID+imgName+"a.mp4", map.get(""+i), "default", "default", "default", "center", "center", "1", "2.7");
				mv.insertFadeOut(PROCESSING_VID+imgName+"a.mp4", PROCESSED_VIDS+imgName+".mp4", "2.5", "0.5");
			}
			else if (i <= 32) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSED_VIDS+imgName+".mp4", "0.5");
			}
			else if (i == 33) {
				mv.imgToVid(COPIED_IMAGES+imgName+".png", PROCESSING_VID+imgName+".mp4", "5.5");
				mv.insertFadeIn(PROCESSING_VID+imgName+".mp4", PROCESSING_VID+imgName+"a.mp4", "0", "1.5");
				mv.insertFadeOut(PROCESSING_VID+imgName+"a.mp4", PROCESSED_VIDS+imgName+".mp4", "4", "5.5");
			}
		}
	}
	
	public void merging(){
		MakeVideo mv = new MakeVideo(FFMPEG_PATH);
		File[] files = mv.getFileList(PROCESSED_VIDS);
		System.out.println("files : "+files.toString());
		File completeDir = new File(COMPLETE);
		if (!completeDir.exists()) {
			completeDir.mkdirs();
			System.out.println("mkdir");
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
