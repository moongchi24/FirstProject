package com.ch.ch10.controller;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch10.model.Board;
import com.ch.ch10.service.BoardService;
import com.ch.ch10.service.PagingBean;
@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	@RequestMapping("/list")
	public String initList() {
		// redirect 또눈 forward는 jsp로 가지 않고 Controller내에 다른 메서드
		return "redirect:/list/pageNum/1";
	}
	@RequestMapping("/list/pageNum/{pageNum}")
	public String list(@PathVariable String pageNum, Board board,Model model) {
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10; //  한 화면에 게시글 10개
//		int total = bs.getTotal();
		int total = bs.getTotal(board);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
//		List<Board> list = bs.list(startRow, endRow);
		board.setStartRow(startRow);
		board.setEndRow(endRow);
// board에는 startRow, endRow, search, keyword
		List<Board> list = bs.list(board);
		int no = total - startRow + 1; // 1p:150-1 + 1 2p:150-11+1
		PagingBean pb=new PagingBean(currentPage, rowPerPage,total);
		String[] tit = {"작성자","제목","내용","제목+내용"};
		model.addAttribute("tit", tit);
//		model.addAttribute("board", board); 매개변수로 넘어언 데이터는 생략 가능
		model.addAttribute("pb", pb);
		model.addAttribute("no", no);
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		return "list";
	}
	@RequestMapping("/insertForm/num/{num}/pageNum/{pageNum}")
	public String insertForm(@PathVariable int num,
			@PathVariable String pageNum,Model model) {
		int ref = 0, re_level = 0, re_step = 0;
		if (num != 0) { // 답변글
			Board board = bs.select(num);
			ref = board.getRef();
			re_level = board.getRe_level();
			re_step  = board.getRe_step();
		}
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("ref", ref);
		model.addAttribute("re_level", re_level);
		model.addAttribute("re_step", re_step);
		return "insertForm";
	}
	// HttpServletRequest 입력한 ip추적
	@RequestMapping("/insert")
	public String insert(Board board, String pageNum, Model model,
			HttpServletRequest request) {
		board.setIp(request.getRemoteAddr());
		// 답변글인 경우 때문에 sequence사용 안함
		int number = bs.maxNum();
		if (board.getNum() != 0) { // 답변글
			//  글을 읽고  ref가 같고  읽은글보다  re_step가  큰값이 있으면 
			// 그글의 re_step +1
			bs.updateStep(board);
			board.setRe_level(board.getRe_level()+1);
			board.setRe_step(board.getRe_step()  +1);
		} else board.setRef(number);  // 답변글이 아닐 때
		board.setNum(number);
		int result = bs.insert(board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "insert";
	}
	@RequestMapping("/updateForm/num/{num}/pageNum/{pageNum}")
	public String updateForm(@PathVariable int num,
				@PathVariable String pageNum, Model model) {
		Board board = bs.select(num);
		model.addAttribute("board",board);
		model.addAttribute("pageNum", pageNum);
		return "updateForm";
	}
	@RequestMapping("/update")
	public String update(Board board, String pageNum, Model model) {
		int result = bs.update(board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "update";
	}
	@RequestMapping("/deleteForm/num/{num}/pageNum/{pageNum}")
	public String deleteForm(@PathVariable int num,
				@PathVariable String pageNum, Model model) {
		Board board = bs.select(num);
		model.addAttribute("board",board);
		model.addAttribute("pageNum", pageNum);
		return "deleteForm";
	}
	@RequestMapping("/delete")
	public String delete(int num, String pageNum, Model model) {
		int result = bs.delete(num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "delete";
	}
	@RequestMapping("/view/num/{num}/pageNum/{pageNum}")
	public String view(@PathVariable int num, 
			@PathVariable String pageNum, Model model) {
		bs.updateReadCount(num);  // 조회수 1증가 
		Board board = bs.select(num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board", board);
		return "view";
	}
}