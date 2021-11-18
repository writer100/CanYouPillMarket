package com.fill.market.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fill.market.admin.model.service.AdminService;
import com.fill.market.admin.model.vo.PAttachment;
import com.fill.market.admin.model.vo.Product;
import com.fill.market.common.Utils;



@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;

	@RequestMapping("/admin/adminMain.do")
	public String adminMain() {

		return "admin/adminMain";
	}

	@RequestMapping("/admin/adminProductList.do")
	public String adminProductList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {

		// 한 페이지당 게시글 수
		int numPerPage = 10;

		// 현재 페이지의 게시글 수
		List<Map<String, String>> list = adminService.selectProductList(cPage, numPerPage);

		// 전체 게시글 수
		int totalContents = adminService.selectProductTotalContents();

		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adminProductList.do");

		// System.out.println("list : " + list);
		// System.out.println("pageBar : " + pageBar);

		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "admin/adminProductList";

	}

	@RequestMapping("/admin/productFrom.do")
	public String productFrom() {
		
		return "admin/adminProductReg";
		
	}
	
	@RequestMapping("/admin/productRegEnd.do")
	public String productInset(Product product, Model model, HttpServletRequest req,
			@RequestParam(value="upFile", required=false)MultipartFile[] upFiles) {
		
		System.out.println(product);
		
		// 1. 파일 저장 경로 및 파일 정보를 담을 객체 생성
		String savePath = req.getServletContext().getRealPath("/resources/productUpload");
		List<PAttachment> attachList = new ArrayList<PAttachment>();
		
		// 2. 파일 업로드
				for(MultipartFile f : upFiles) {
					if(f.isEmpty() == false) {
						
						// 3. 파일 이름 변경
						String originName = f.getOriginalFilename(); // 원본 이름
						String changeName = fileNameChanger(originName); // 서버에서 관리할 이름
						
						// 4. 파일 저장
						try {
							f.transferTo(new File(savePath + "/" + changeName));
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						// 5. attachList에 담기
						PAttachment a = new PAttachment();
						
						a.setOriginalname(originName);
						a.setChangename(changeName);
						
						attachList.add(a);
						
					}
				}
		
				// 6. 게시글 DB에 등록
				int result = adminService.insertProduct(product, attachList);
				
				String loc = "/admin/adminProductList.do";
				String msg = "";
				
				if(result > 0) {
					msg = "게시글 등록 성공!";
				}else {
					msg = "게시글 등록 실패!";
				}
				
				model.addAttribute("loc", loc);
				model.addAttribute("msg", msg);
			
				return "common/msg";
		
	}
	
	
	// 단순 파일 이름 변경 메소드
	public String fileNameChanger(String oldName) {
		
		String ext = oldName.substring(oldName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		int rnd = (int)(Math.random() * 1000);
		
		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
	}
	
	
	@RequestMapping("/admin/adminView.do")
	public String adminView(@RequestParam int pno, Model model) {
		
		
		Product product = adminService.selectOneProduct(pno);
		List<PAttachment> attachList = adminService.selectAttachment(pno);

		
		model.addAttribute("product", product);
		model.addAttribute("attachList", attachList);
		
		return "admin/adminProductView";
		
	}
	
	@RequestMapping("/admin/adminUpdateView.do")
	public String adminUpdateView(@RequestParam int pno, Model model) {
		
		Product product = adminService.selectOneProduct(pno);
		List<PAttachment> attachList = adminService.selectAttachment(pno);

		
		model.addAttribute("product", product);
		model.addAttribute("attachList", attachList);
		System.out.println(attachList);
		return "admin/adminUpdateView";
		
	}
	
	@RequestMapping("/admin/fileDelete.do")
	@ResponseBody
	public boolean fileDelete(@RequestParam int attNo, @RequestParam String rName, HttpServletRequest request) {
		String savePath = request.getServletContext().getRealPath("/resources/productUpload");
		
		int result = adminService.deleteFile(attNo);
		
		if(result == 1) {
			File goodbye = new File(savePath + "/" + rName);
			
			goodbye.delete();
			
			return true;
			
		}else {
			
			return false;
		}
	}
	
	@RequestMapping("/admin/productUpdateEnd.do")
	public String productUpdateEnd(Product product, HttpServletRequest request, Model model, 
			  					   @RequestParam(value="upFile", required=false) MultipartFile[] upFiles) {
		System.out.println(product);
		
		
		int productNo = product.getPno();
		
		
		Product originPro = adminService.selectOneProduct(productNo);
		
		System.out.println(originPro);
		
		originPro.setCno(product.getCno());
		originPro.setPname(product.getPname());
		originPro.setPstock(product.getPstock());
		originPro.setPprice(product.getPprice());
		originPro.setPinfo(product.getPinfo());
		originPro.setFprec(product.getFprec());
		
		// 2. 첨부파일 수정하기
				String savePath = request.getServletContext().getRealPath("/resources/productUpload");
				
				List<PAttachment> attachList = adminService.selectAttachment(productNo);
				if( attachList == null ) attachList = new ArrayList<PAttachment>();
				
				int idx = 0;
				for(MultipartFile f : upFiles) {
					PAttachment temp = null;
					
					if( f.isEmpty() == false ) {
						
						if(attachList.size() > idx) { // 파일이 있다면
							File oldFile = new File(savePath + "/" + attachList.get(idx).getChangename());
							System.out.println("변경 전 파일 삭제 : " + oldFile.delete());
							
							temp = attachList.get(idx);
						} else {
							temp = new PAttachment();
							temp.setPno(productNo);
							
							attachList.add(temp);
						}
						
						// 파일 저장용 이름 바꾸기
						String originName = f.getOriginalFilename();
						String changeName = fileNameChanger(originName);
						
						// 파일 저장
						try {
							f.transferTo(new File(savePath + "/" + changeName));
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
						
						temp.setOriginalname(originName);
						temp.setChangename(changeName);
						
						attachList.set(idx, temp);
					}
					idx++;
				}
				
				int result = adminService.updateProduct(originPro, attachList);  // 서비스 찾아가서 마저 구현해주기
				
				String loc = "/admin/adminProductList.do";
				String msg = "";
				
				if(result > 0 ) msg = "게시글 수정 성공!";
				else msg = "게시글 수정 실패!";
				
				model.addAttribute("loc", loc);
				model.addAttribute("msg", msg);
				
				
				return "common/msg";

		
	}
	
	@RequestMapping("/admin/productDelete.do")
	public String productDelete(@RequestParam int pno,
			  HttpServletRequest request,
			  Model model) {
		
		String savePath = request.getServletContext().getRealPath("/resources/productUpload");
		
		// 첨부파일삭제 명단
		List<PAttachment> delList = adminService.selectAttachment(pno);
		
		// 게시글 삭제
		int result = adminService.deleteProdcut(pno); // 서비스 이동~!
		
		String loc = "/admin/adminProductList.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "삭제 완료!";
			
			for(PAttachment a : delList) {
				new File(savePath + "/" + a.getChangename()).delete();
			}
		} else {
			msg = "삭제 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	
	}
	

	
	
	
	
	
	
	// ------------------- 사용자 관리 ----------------------------------------------------------------- //
	
	// 사용자 리스트 뽑아오기
	@RequestMapping("/admin/adminUserManageList.do")
	public String adminUserManageList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {
		
		// 한 페이지당 게시글 수
		int numPerPage = 10;

		// 현재 페이지의 게시글 수
		List<Map<String, String>> list = adminService.selectUserList(cPage, numPerPage);

		// 전체 게시글 수
		int totalContents = adminService.selectUserTotalContents();

		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adminUserManageList.do");

		// System.out.println("list : " + list);
		// System.out.println("pageBar : " + pageBar);

		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "admin/adminUserManage";

		
	}

}
