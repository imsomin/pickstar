select user
from dual;
--SCOTT

--(1)�Խ��� ���̺� ����
CREATE TABLE tblBoard(
    b_num NUMBER PRIMARY KEY NOT NULL,
    b_subject VARCHAR2(50),
    b_pwd VARCHAR2(20),
    b_content VARCHAR2(2000),
    b_writer VARCHAR2(20),
    b_date VARCHAR2(20),
    b_readcount NUMBER
);
--Table TBLBOARD��(��) �����Ǿ����ϴ�.

--(2)��ü ���ڵ� �˻�
SELECT * FROM tblBoard ORDER BY b_num DESC;


--(3)�ڵ� ������ ���� 
CREATE SEQUENCE b_num_seq START WITH 1;
--Sequence B_NUM_SEQ��(��) �����Ǿ����ϴ�.


--( b_num �� b_num_seq ���� )
--(�������� �⺻������ 20�� ������ �־�����.)


--������ ���ڵ� ����
INSERT INTO tblBoard VALUES(b_num_seq.nextval, 'subject', 'pwd', 'content', 'writer', sysdate, 0);
INSERT INTO tblBoard VALUES(b_num_seq.nextval, '������', 'pwd', 'content', '������', sysdate, 0);
--1 �� ��(��) ���ԵǾ����ϴ�. * 2

--��ü ���ڵ� ����
DELETE FROM tblBoard;
--2�� �� ��(��) �����Ǿ����ϴ�.

--���̺� ����
DROP TABLE tblBoard;

--�ڵ� ���� �� ����
DROP SEQUENCE b_num_seq;

--Ŀ��
COMMIT;
--Ŀ�� �Ϸ�.


