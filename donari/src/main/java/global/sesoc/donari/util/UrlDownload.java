package global.sesoc.donari.util;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;

import javax.imageio.ImageIO;

public class UrlDownload {
	public void imgToFile(String urlpath, String path, String fmt){
		Image image = null;
		try {
			URL url = new URL(urlpath);
			BufferedImage img = ImageIO.read(url);
			File file = new File(path);
			ImageIO.write(img, "gif", file);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
