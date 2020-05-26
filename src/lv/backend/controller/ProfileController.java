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

import lv.backend.dao.LawyerDAO;
import lv.backend.dao.ProfileDAO;
import lv.backend.dto.LawyerDTO;
import lv.backend.dto.ProfileDTO;


@WebServlet("*.profile")
public class ProfileController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    request.setCharacterEncoding("utf8");
	    response.setCharacterEncoding("utf8");
	    
		String contextPath = request.getContextPath();
		String requestURI = request.getRequestURI();
		String cmd = requestURI.substring(contextPath.length());
		ProfileDAO pdao = new ProfileDAO();
		LawyerDTO ldto = new LawyerDTO();
		LawyerDAO ldao = new LawyerDAO();
		
		//프로필 사진 저장 파일 생성
		String uploadPath = request.getServletContext().getRealPath("upload");
		File uploadPathF = new File(uploadPath);
		if(!uploadPathF.exists()) { //경로가 없다면
			uploadPathF.mkdir();    //만들어라
		}
		
		System.out.println("저장 경로 : "+ uploadPath );
		
		try {
			
			if(cmd.contentEquals("/write.profile")) {
			
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
				
				// 변호사 로그인시 세션 확인!
				String lawyerid = (String)request.getSession().getAttribute("lawyerInfo");
				ldto = ldao.lSelect(lawyerid);
				
				String name = ldto.getName();
				String title = multi.getParameter("title");
				String phone = ldto.getPhone();
				String[] specialty = multi.getParameterValues("specialty");
				String office_name = ldto.getOffice_name();
				String office_phone = ldto.getOffice_phone();
				String test = ldto.getTest();
				String education = multi.getParameter("education");
				String id = ldto.getId();
				String img = sysName; 
						
				
				System.out.println("title : " + title);
				System.out.println("specialty : " + specialty);
				System.out.println("education : " + education);
				System.out.println("img(저장된 이름) : " + img);
				
				int result = pdao.insertProfile(new ProfileDTO(name,title,phone,specialty,office_name,office_phone,test,education,id,img));

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
					List<ProfileDTO> list = pdao.selectByPageNo(cpage);
					//클라이언트는 JSON으로 받는게 좋음 : List<BoardDTO>를 JSON으로
					String respArr = new Gson().toJson(list);
					response.getWriter().append(respArr);
				
				} catch (Exception e) {
					e.printStackTrace(); //에러나면 어쩌피 fail로 가기 때문에 여기서 따로 에러페이지 보낼 필요없음
					response.sendError(500); //에러메세지를 응답으로 보내겠
				}
				
			}else if(cmd.contentEquals("/toProfile.profile")) {
//				System.out.println("toProfile.profile 컨트롤러 실행 : "+request.getQueryString().substring(4) );
//				System.out.println(request.getParameter("seq"));
				
				int seq = Integer.parseInt(request.getParameter("seq"));
				System.out.println("toProfile.profile이 받아온 시퀀스 : "+seq); // 받아온 시퀀스 확인용
				ProfileDTO pdto = pdao.selectBySeq(seq);

				request.setAttribute("pdto", pdto);

//				List<FileDTO> fileList = dao.selectFileBySeq(seq);
//				request.setAttribute("fileList", fileList);
				
				RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
				rd.forward(request, response);
				
			}else if(cmd.contentEquals("/delete.profile")) {
				
				int seq = Integer.parseInt(request.getParameter("seq"));
				pdao.deleteBySeq(seq);
				response.sendRedirect("toProfileList.profile");
				
			}else if(cmd.contentEquals("/toProfileModify.profile")) {
				// 프로필에서 수정하기 버튼을 누르면 
				// 해당 글seq로 프로필dto를 새로 찾아서
				// 수정하기 페이지로 이동
				int seq = Integer.parseInt(request.getParameter("seq"));
				System.out.println("toProfileModify.profile이 받은 seq : "+seq); // 받아온 시퀀스 확인용

				ProfileDTO pdto = pdao.selectBySeq(seq);
				request.setAttribute("pdto", pdto);
				RequestDispatcher rd = request.getRequestDispatcher("profileModify.jsp");
				rd.forward(request, response);
				
			}else if(cmd.contentEquals("/modify.profile")) {
				
				int seq = Integer.parseInt(request.getParameter("seq"));

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
				
				// 변호사 로그인시 세션의 아이디로 변호사DTO 확인!
				String lawyerid = (String)request.getSession().getAttribute("lawyerInfo");
				ldto = ldao.lSelect(lawyerid);
				
				String name = ldto.getName();
				String title = multi.getParameter("title");
				String phone = ldto.getPhone();
				String[] specialty = multi.getParameterValues("specialty");
				String office_name = ldto.getOffice_name();
				String office_phone = ldto.getOffice_phone();
				String test = ldto.getTest();
				String education = multi.getParameter("education");
				String id = ldto.getId();
				String img = sysName; 
				
				int result = pdao.updateByDTO(new ProfileDTO(seq,name,title,phone,specialty,office_name,office_phone,test,education,id,img));
				System.out.println("수정 결과 : "+ result);
				response.sendRedirect("toProfile.profile?seq="+seq);
				
			}else if(cmd.contentEquals("/toReservation.profile")) {
				//'reservation.reservation'로 해당 시퀀스의 profileDTO 넘기기 
				
				int seq = Integer.parseInt(request.getParameter("seq"));
				ProfileDTO pdto = pdao.selectBySeq(seq);
				request.setAttribute("pdto", pdto);
				RequestDispatcher rd = request.getRequestDispatcher("reservation.reservation");
				rd.forward(request, response);	
				
			}else if(cmd.contentEquals("/toReservDate.profile")) {
				// 변호사가 본인 프로필에서 상담가능 시간으로 이동
				
				int seq = Integer.parseInt(request.getParameter("seq"));
				ProfileDTO pdto = pdao.selectBySeq(seq);
				request.setAttribute("pdto", pdto);
				RequestDispatcher rd = request.getRequestDispatcher("lawyerReservDate.reservation");
				rd.forward(request, response);	
				
			}
			
			
			
		}catch(Exception e) {
			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
