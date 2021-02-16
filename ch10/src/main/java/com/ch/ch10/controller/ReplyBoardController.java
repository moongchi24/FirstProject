package com.ch.ch10.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.ch.ch10.service.BoardService;
import com.ch.ch10.service.ReplyBoardService;
@Controller
public class ReplyBoardController {
	@Autowired
	private ReplyBoardService rbs;
	@Autowired
	private BoardService bs;
}