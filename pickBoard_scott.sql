select user
from dual;
--SCOTT

--(1)ȸ�� ���̺� ����
CREATE TABLE tblUser(
u_id          VARCHAR2(50)     NOT NULL
,u_password   VARCHAR2(50)     NOT NULL
,u_name       VARCHAR2(50)     NOT NULL
,CONSTRAINT tblUser_u_id_PK PRIMARY KEY(u_id)
);
--Table TBLUSER��(��) �����Ǿ����ϴ�.


--(2)��� ȸ������ �˻�
SELECT *
FROM tblUser;

--(3)���̺� ������ �����ϴ� ���
DROP TABLE tblUser PURGE;
--Table TBLUSER��(��) �����Ǿ����ϴ�.

--(4)Ŀ��
COMMIT;
--Ŀ�� �Ϸ�.


