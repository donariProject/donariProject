package global.sesoc.donari;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.donari.ffmpeg_handler.MakeVideo;

@Controller

public class FacebookController {

	final String FILE_PATH = "C:/Users/SCITMaster/Desktop/Test/";

	@Autowired
	SqlSession sql;

	// ����� ����
	@RequestMapping(value = "albumList", method = RequestMethod.GET)
	public String albumList(String albumName, Model model, String count) {

		model.addAttribute("albumAdd", albumName);
		model.addAttribute("albumCount", count);

		return "albumList";
	}

	@RequestMapping(value = "img", method = RequestMethod.GET)
	public String reading(List idList, Model model) {
		System.out.println("idList accept");
		ArrayList<String> list = (ArrayList<String>) idList;
		model.addAttribute("list", list);
		return "imglist";
	}

	@ResponseBody
	@RequestMapping(value = "selectImg", method = RequestMethod.POST)
	public String reading(@RequestParam(value = "pushUrls[]") String[] pushUrls, HttpServletRequest request)
			throws Exception {
		Image image = null;
		String saveDir = request.getServletContext().getRealPath("/resources/userimage/");
		MakeVideo makeVideo = new MakeVideo("");
		
		File files[]= new File[pushUrls.length];
		
		for(int i=0; i<pushUrls.length;i++){
			URL url = new URL(pushUrls[i]);
			BufferedImage imgs = ImageIO.read(url);
			String realimg = pushUrls[i].substring(pushUrls[i].length() - 8);
			File file = new File(saveDir + realimg + ".jpg");
			
			if (file.exists()) {
				System.out.println("들어왔니?");
				for (int j = 0; j < files.length; j++) {
					String path = files[j] + "";
					path = path.substring(path.length() - 12, path.length() - 4);
					System.out.println(path);
					if (path.equals(realimg)) {
						files[j].delete();

					}
				}
			} else {

				ImageIO.write(imgs, "jpg", file);

			}
		}

		return "success";
	}

}
