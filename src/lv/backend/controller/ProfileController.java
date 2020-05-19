package lv.backend.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import lv.backend.dao.FileDAO;
import lv.backend.dao.ProfileDAO;
import lv.backend.dto.ProfileDTO;


@WebServlet("*.profile")
public class ProfileController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    request.setCharacterEncoding("utf8");
	    response.setCharacterEncoding("utf8");
	    
	    
		String contextPath = request.getContextPath();
		String requestURI = request.getRequestURI();
		String cmd = requestURI.substring(contextPath.length());
		ProfileDAO dao = new ProfileDAO();
		
		String uploadPath = request.getServletContext().getRealPath("upload");
		File uploadPathF = new File(uploadPath);
		if(!uploadPathF.exists()) { //경로가 없다면
			uploadPathF.mkdir();    //만들어라
		}
		
		System.out.println("저장 경로 : "+ uploadPath );
		
		try {
			
			if(cmd.contentEquals("/write.profile")) {
//-------------- 나중에 병합시 lawyerDTO 변호사 회원가입 dto 이름 확인할것!
//				LawyerDTO dto = (LawyerDTO)request.getSession().getAttribute("loginInfo");
				// request getSession으로 꺼낼 수 있나? 꺼낼 이름이 "loginInfo"인가?
				// profileWrite.jsp의 입력값 + Session에 담긴 lawyerDTO
//				String name = dto.getName(); 
//				String title = request.getParameter("title");
//				String phone = dto.getPhone();
//				String specialty = request.getParameter("specialty");
//				String office_name = dto.getOffice_name();
//				String office_phone = dto.getOffice_phone();
//				String test = dto.getTest();
//				String education = request.getParameter("education");
//				String id = dto.getId();
								
				
				MultipartRequest multi = new MultipartRequest(
						request,
						uploadPath,
						1024*1024*10, //사이즈
						"utf8", //인코딩
						new DefaultFileRenamePolicy() // 이름 겹치면 덮어씌워짐 -> 중복 방지 필요 : 처리코드를 직접 쓸수도 있지만, 디폴트값으로
						);
				String sysName = multi.getFilesystemName("file");
				String oriName = multi.getOriginalFileName("file");
				System.out.println("저장된 사진 이름 : "+ sysName);
				System.out.println("원래 사진 이름 : "+ oriName);
				
				
				String name = "이름"; 
				String title = multi.getParameter("title");
				String phone = "번호";
				String specialty = multi.getParameter("specialty");
				String office_name = "사무소명";
				String office_phone = "사무소번호";
				String test = "출신시험";
				String education = multi.getParameter("education");
				String id = "아이디";
				String img = sysName; 
						
				
				System.out.println("title : " + title);
				System.out.println("specialty : " + specialty);
				System.out.println("education : " + education);
				System.out.println("img(저장된 이름) : " + img);
				//여기가 문제
				int result = dao.insertProfile(new ProfileDTO(name,title,phone,specialty,office_name,office_phone,test,education,id,img));
				
				if(result>0) {
					response.sendRedirect("profileList.jsp");
				}else {
					response.sendRedirect("error.jsp");
				}
				
						

		
			}else if(cmd.contentEquals("/toProfileList.profile")) {
	

				
				response.sendRedirect("profileList.jsp");

				
			}else if(cmd.contentEquals("/profileListAjax.profile")){
				
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				try {
					List<ProfileDTO> list = dao.selectByPageNo(cpage);
					//클라이언트는 JSON으로 받는게 좋음 : List<BoardDTO>를 JSON으로
					String respArr = new Gson().toJson(list);
					response.getWriter().append(respArr);
				
					//프로필 수정 / 삭제 기능 미구현
				} catch (Exception e) {
					e.printStackTrace(); //에러나면 어쩌피 fail로 가기 때문에 여기서 따로 에러페이지 보낼 필요없음
					response.sendError(500); //에러메세지를 응답으로 보내겠
				}
				
			}else if(cmd.contentEquals("/toProfile.profile")) {
//				System.out.println("toProfile.profile 컨트롤러 실행 : "+request.getQueryString().substring(4) );
//				System.out.println(request.getParameter("seq"));
				
				int seq = Integer.parseInt(request.getParameter("seq"));
				System.out.println("받아온 시퀀스 확인용 : "+seq); // 받아온 시퀀스 확인용
				ProfileDTO dto = dao.selectBySeq(seq);

				request.setAttribute("dto", dto);

//				List<FileDTO> fileList = dao.selectFileBySeq(seq);
//				request.setAttribute("fileList", fileList);
				
				RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
				rd.forward(request, response);
				
			}else if(cmd.contentEquals("/delete.profile")) {
				
				int seq = Integer.parseInt(request.getParameter("seq"));
				dao.deleteBySeq(seq);
				response.sendRedirect("toProfileList.profile");
				
			}else if(cmd.contentEquals("/toProfileModify.profile")) {
				// 프로필에서 수정하기 버튼을 누르면 
				// 해당 글seq로 프로필dto를 새로 찾아서
				// 수정하기 페이지로 이동
				int seq = Integer.parseInt(request.getParameter("seq"));
				System.out.println("modify할 seq : "+seq); // 받아온 시퀀스 확인용

				ProfileDTO dto = dao.selectBySeq(seq);
				request.setAttribute("dto", dto);
				RequestDispatcher rd = request.getRequestDispatcher("profileModify.jsp");
				rd.forward(request, response);
				
			}else if(cmd.contentEquals("/modify.profile")) {
				
				int seq = Integer.parseInt(request.getParameter("seq"));
				// 변호사 테이블에서 불러오기?
				// 아니면 여기서도 수정? 외래키는?
				MultipartRequest multi = new MultipartRequest(
						request,
						uploadPath,
						1024*1024*10, //사이즈
						"utf8", //인코딩
						new DefaultFileRenamePolicy() // 이름 겹치면 덮어씌워짐 -> 중복 방지 필요 : 처리코드를 직접 쓸수도 있지만, 디폴트값으로
						);
				String sysName = multi.getFilesystemName("file");
				String oriName = multi.getOriginalFileName("file");
				System.out.println("저장된 사진 이름 : "+ sysName);
				System.out.println("원래 사진 이름 : "+ oriName);
				
				String name = "이름"; 
				String title = multi.getParameter("title");
				String phone = "번호";
				String specialty = multi.getParameter("specialty");
				String office_name = "사무소명";
				String office_phone = "사무소번호";
				String test = "출신시험";
				String education = multi.getParameter("education");
				String id = "아이디";
				String img = sysName; 
				
				int result = dao.updateBySeq(new ProfileDTO(seq,name,title,phone,specialty,office_name,office_phone,test,education,id,img));
				response.sendRedirect("toProfile.profile?seq="+seq);
				
			}else if(cmd.contentEquals("/toReservation.profile")) {
				//예약페이지 'reservation.jsp'로 해당 시퀀스의 profileDTO 넘기기 
				int seq = Integer.parseInt(request.getParameter("seq"));
				ProfileDTO pdto = dao.selectBySeq(seq);
				request.setAttribute("profileDto", pdto);
				RequestDispatcher rd = request.getRequestDispatcher("reservation.jsp");
				rd.forward(request, response);
				
//				seq 변호사 프로필 게시판 글번호;
//				name : 변호사 이름; 
//				title : 프로필타이틀(홍보문구);
//				phone : 변호사 번호;
//				specialty : 전문분야 String (썸머노트 나 기타 폼 적용 필요?);
//				office_name : 사무소이름;
//				office_phone : 사무소번호;
//				test : 출신시험;
//				education : 교육사항 String (썸머노트 나 기타 폼 적용 필요?);
//				id : 변호사 회원 아이디;
//				img : 변호사 프로필에 업로드된 사진의 저장된 이름;
				
			}
			
			
			
		}catch(Exception e) {
			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
