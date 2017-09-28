/*
 * 음식사진 템플릿 (만들다 맘. 참고하지마셈)
 * 
 */

package global.sesoc.donari.ffmpeg_handler;

import java.io.File;
import java.io.FileWriter;

import v4lk.lwbd.BeatDetector;
import v4lk.lwbd.BeatDetector.AudioType;
import v4lk.lwbd.BeatDetector.DetectorSensitivity;
import v4lk.lwbd.util.Beat;


public class MusicReactVideo {
	private final String FFMPEG_PATH = "C:/Users/SCITMaster/Desktop/ffmpeg-20170904-6cadbb1-win64-static/bin/ffmpeg";

	
	public void makeBasicVid(String inputImgsPath, String outputVidPath, String musicPath, String serverPath){
		String COPIED_IMAGES = serverPath+"resources/copied_images/";
		String PROCESSING_VID = serverPath+"resources/processing_vid/";
		String PROCESSED_VIDS = serverPath+"resources/processed_vids/";
		
		File copiedImagesDir = new File(COPIED_IMAGES); // 렌더링 작업중인 임시 파일들을 저장하는 폴더
		
		MakeVideo makeVideo = new MakeVideo(FFMPEG_PATH);
		
		File outputDir = new File(new File(outputVidPath).getParent());
		
		if(outputDir.exists()) {
			makeVideo.deleteDir(outputDir.getPath());
		}
		outputDir.mkdirs();
		
		if(copiedImagesDir.exists()) {
			makeVideo.deleteDir(copiedImagesDir.getPath());
		}
		copiedImagesDir.mkdirs();
		
		File imgs[] = makeVideo.getFileList(inputImgsPath);
		imgs = makeVideo.sortFileList(imgs);

		for (int i = 0; i < imgs.length; i++) {
			makeVideo.reformatImg(imgs[i].getPath(), COPIED_IMAGES+String.format("%03d", i)+".jpg", "1280", "768");
		}
		
		File processedIimgs[] = makeVideo.getFileList(COPIED_IMAGES);
		processedIimgs = makeVideo.sortFileList(processedIimgs);
		
		File audioFile = new File(musicPath);
		
		try {

			Beat[] beats = BeatDetector.detectBeats(audioFile, AudioType.MP3, DetectorSensitivity.HIGH);

			// 파일 객체 생성
			File file = new File(COPIED_IMAGES+"input.txt");

			// true 지정시 파일의 기존 내용에 이어서 작성
			FileWriter fw = new FileWriter(file, false);

			// 파일안에 문자열 쓰기
			String txt = new String();
			txt += "file '";
			txt += processedIimgs[0].getName() + "'";
			txt += "\r\n";
			long time_current = 0;
			long time_previous = 0;
			int imageCount = 1;
			for (int i = 0; i < beats.length; i++) {
				if (imageCount >= processedIimgs.length) {
					txt += "duration 00:00:04.111";
					break;
				}
				if (beats[i].energy > 0.30) {

					time_current = beats[i].timeMs;
					long delta = time_current - time_previous;

					if (delta < 300) {
						System.out.println(time_current);
						continue;
					}

					txt += "duration ";

					long hour = (delta / 3600000l);

					long rem = (delta % 3600000l);

					long min = rem / 60000l;
					rem = rem % 60000l;
					float sec = ((float) rem) / 1000.000f;
					txt += String.format("%02d", hour);
					txt += ":";
					txt += String.format("%02d", min);
					txt += ":";
					txt += String.format("%06.3f", sec);
					txt += "\r\n";

					txt += "file '";
					txt += processedIimgs[imageCount++].getName();
					txt += "'";
					txt += "\r\n";

					time_previous = time_current;
				}
			}
			fw.write(txt);
			fw.flush();

			// 객체 닫기
			fw.close();
			audioFile=null;

			String[] code = new String[] {
					"C:/Users/SCITMaster/Desktop/ffmpeg-20170904-6cadbb1-win64-static/bin/ffmpeg", "-f", "concat",
					"-safe", "0", "-i", COPIED_IMAGES+"input.txt", "-i",
					musicPath, outputVidPath };
			
			makeVideo.executeCmd(code);
		} catch(Exception e){
			e.printStackTrace();
		}
	}
}
