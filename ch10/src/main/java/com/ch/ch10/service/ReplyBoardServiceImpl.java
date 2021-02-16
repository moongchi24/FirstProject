package com.ch.ch10.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.ch10.dao.ReplyBoardDao;
@Service
public class ReplyBoardServiceImpl implements ReplyBoardService {
	@Autowired
	private ReplyBoardDao rbd;
}