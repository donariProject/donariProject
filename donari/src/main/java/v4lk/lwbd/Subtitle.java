package v4lk.lwbd;

public class Subtitle {
	String fontsize;
	String fontcolor;
	String content;
	String starttime;
	String endtime;
	
	public Subtitle() {
		// TODO Auto-generated constructor stub
	}

	public Subtitle(String fontsize, String fontcolor, String content, String starttime, String endtime) {
		super();
		this.fontsize = fontsize;
		this.fontcolor = fontcolor;
		this.content = content;
		this.starttime = starttime;
		this.endtime = endtime;
	}

	public String getFontsize() {
		return fontsize;
	}

	public void setFontsize(String fontsize) {
		this.fontsize = fontsize;
	}

	public String getFontcolor() {
		return fontcolor;
	}

	public void setFontcolor(String fontcolor) {
		this.fontcolor = fontcolor;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	@Override
	public String toString() {
		return "Subtitle [fontsize=" + fontsize + ", fontcolor=" + fontcolor + ", content=" + content + ", starttime="
				+ starttime + ", endtime=" + endtime + "]";
	}
	
}
