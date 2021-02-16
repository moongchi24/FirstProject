drop table replyBoard;
create table replyBoard (
	rno number primary key, -- 자동 1씩 증가
	bno number not null references board(num), -- 원본 게시글 번호
	replytext varchar2(500) not null, -- 담글
	replyer varchar2(50) not null,    -- 답글 작성자
	regdate date not null,            -- 작성일
	updatedate date not null,         -- 수정일
	del char(1) default 'n'
);
select * from board order by num desc;
insert into replyboard values(1,260,'연휴','나야',sysdate,sysdate,'n');
insert into replyboard values(2,260,'연휴2','고길동',sysdate,sysdate,'n');
