package lv.backend.controller;
import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.file")
public class fileController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());

		String uploadPath = request.getServletContext().getRealPath("upload");

		File uploadPathF = new File(uploadPath);


		if(!uploadPathF.exists()) { //경로가 없다면
			uploadPathF.mkdir();    //만들어라
		}


		System.out.println("저장 경로 : "+ uploadPath );


		if(cmd.contentEquals("/upload.file")) {
			MultipartRequest multi = new MultipartRequest(
					request,
					uploadPath,
					1024*1024*10, //사이즈
					"utf8", //인코딩
					new DefaultFileRenamePolicy() );
			// 이름 겹치면 덮어씌워짐 -> 중복 방지 필요
			// 처리코드를 직접 쓸수도 있지만, 디폴트값으로 DefaultFileRenamePolicy()

			String sysName = multi.getFilesystemName("file");
			String oriName = multi.getOriginalFileName("file");
			System.out.println("저장된 이름 : "+ sysName);
			System.out.println("원래 이름 : "+ oriName);

		}


	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}