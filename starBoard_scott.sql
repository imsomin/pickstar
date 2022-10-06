select user
from dual;
--SCOTT

--(1)게시판 테이블 생성
CREATE TABLE tblBoard(
    b_num NUMBER PRIMARY KEY NOT NULL,
    b_subject VARCHAR2(50),
    b_pwd VARCHAR2(20),
    b_content VARCHAR2(2000),
    b_writer VARCHAR2(20),
    b_date VARCHAR2(20),
    b_readcount NUMBER
);
--Table TBLBOARD이(가) 생성되었습니다.

--(2)전체 레코드 검색
SELECT * FROM tblBoard ORDER BY b_num DESC;


--(3)자동 증가값 설정 
CREATE SEQUENCE b_num_seq START WITH 1;
--Sequence B_NUM_SEQ이(가) 생성되었습니다.


--임의의 레코드 삽입
INSERT INTO tblBoard VALUES(b_num_seq.nextval, 'subject', 'pwd', 'content', 'writer', sysdate, 0);
INSERT INTO tblBoard VALUES(b_num_seq.nextval, '가나다', 'pwd', 'content', '가나다', sysdate, 0);
--1 행 이(가) 삽입되었습니다. * 2

--전체 레코드 삭제
DELETE FROM tblBoard;
--2개 행 이(가) 삭제되었습니다.

--테이블 삭제
DROP TABLE tblBoard;

--자동 증가 값 삭제
DROP SEQUENCE b_num_seq;

--커밋
COMMIT;
--커밋 완료.


