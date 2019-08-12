package www.uai.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	//응답 테스트
	@RequestMapping("/requestTest")
	public String requestTest(Model model) {
		
		String str = "성공";
		model.addAttribute("str", str);
		
		
		return "home";
	}
	
	//요청 테스트
	@RequestMapping("/responseTest")
	public void responseTest(String returnObject) {
		
		String robj = returnObject;
				
		if(robj!=null){
			System.out.println("요청 테스트 성공");
			System.out.println(robj);
		}else if(robj==null) {
			System.out.println("요청 테스트 실패");
			System.out.println(robj);
		}
		
	
	}
	

}
