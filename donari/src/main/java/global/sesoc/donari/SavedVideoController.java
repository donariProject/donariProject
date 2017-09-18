package global.sesoc.donari;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class SavedVideoController {

	@Autowired
	SqlSession sql;
	
	//저장된 비디오
		@RequestMapping(value="savevideo", method=RequestMethod.GET)
		public String saveVideo(){
			
			return "savedVideo/savevideo";
		}

}
