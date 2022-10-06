select user
from dual;
--SCOTT

--(1)회원 테이블 생성
CREATE TABLE tblUser(
u_id          VARCHAR2(50)     NOT NULL
,u_password   VARCHAR2(50)     NOT NULL
,u_name       VARCHAR2(50)     NOT NULL
,CONSTRAINT tblUser_u_id_PK PRIMARY KEY(u_id)
);
--Table TBLUSER이(가) 생성되었습니다.


--(2)모든 회원정보 검색
SELECT *
FROM tblUser;

--(3)테이블 완전히 삭제하는 경우
DROP TABLE tblUser PURGE;
--Table TBLUSER이(가) 삭제되었습니다.

--(4)커밋
COMMIT;
--커밋 완료.


