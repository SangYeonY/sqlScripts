-- �߿�1 : ������ ��ǰ���̺��� ��(row)�����͸� ������ CUSTOM_ID ,PCODE �� �ߺ��Ǹ� �ȵ˴ϴ�.
--			�� �⺻Ű �÷��� ���մϴ�.(�ߺ��� ���� NULL�� ����� �ȵ˴ϴ�.)
--			�� �⺻Ű�� ���̺��� ��(row)�� �ĺ��ϴ°��� �����Դϴ�.
--			�� select �� �⺻Ű ������ �˻��� �� ���� 0 �Ǵ� 1���� �� ����� ��ȸ�˴ϴ�.

select * FROM "TBL_CUSTOM#" tc WHERE CUSTOM_ID = 'mina012';
-- �߿�2: �������  PRICE , QUANTITY ���� �÷��� �� �ʼ� �����ͷ� ����Ǿ�� �մϴ�.
--			�� NOT NULL �÷����� �����մϴ�.	(NULL ���� �ȵ˴ϴ�.)		
-- �߿�3: ������ ��ǰ���̺��� ���� CUSTOM_ID,PCODE �÷� ���� ����ϸ� ����Ȯ�� ������
--		�� �ܷ�Ű �÷��� ���մϴ�.(�ٸ����̺����� ���� �����մϴ�.NULL ��뵵 ���մϴ�.)

-- ���� NOT NULL, �⺻Ű , �ܷ�Ű�� ��ǥ���� ��������(CONSTRAINT) �����Դϴ�.
-- ���������� ������ ���̺��� ������ ���ϴ�.
-- ���� ���̺� 
CREATE TABLE tbl_custom# (
	custom_id varchar2(20) PRIMARY KEY ,  
	name nvarchar2(20) NOT NULL ,		 
	email varchar2(20),
	age number(3),
	reg_date timestamp DEFAULT sysdate
);
-- ��ǰ ���̺� : ��ǰ�ڵ�(�������� 20�ڸ�),ī�װ���(�������� 2�ڸ�)
--								A1:������ǰ, B1:��ǰ
CREATE TABLE tbl_product#(
	pcode varchar2(20) CONSTRAINT pk_product PRIMARY KEY ,
	category char(2),
	pname nvarchar2(20) NOT NULL ,
	price number(9) NOT NULL 
);

-- ���� ���̺� : ��� ������ ���� ��ǰ�� �����ϴ°�?
-- ���� ���̺��� �⺻Ű�� ������ �÷��� �߰��մϴ�.

CREATE TABLE tbl_buy#(
	buy_seq number(8) ,		-- �������� �Ϸù�ȣ
	custom_id varchar2(20),
	pcode varchar2(20),
	quantity number(5) NOT NULL ,		--����
	buy_date timestamp ,
	CONSTRAINT pk_buy_seq PRIMARY KEY(buy_seq),
	CONSTRAINT fk_custom_id FOREIGN KEY (custom_id) -- �� ���̺��� �÷���
		REFERENCES tbl_custom#(custom_id),	--�������̺��� �� �÷���
	CONSTRAINT fk_pcode FOREIGN KEY (pcode)
		REFERENCES tbl_product#(pcode)
	-- �ܷ�Ű�� ������ �� �ִ� �÷��� �⺻Ű �Ǵ� unique(������) �� ���ؼ��� �����մϴ�.	
);
SELECT * FROM "TBL_CUSTOM#" tc ;

INSERT INTO IDEV.TBL_CUSTOM#
(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('mina012', '��̳�', 'kimm@gmail.com', 20, sysdate
);
INSERT INTO IDEV.TBL_CUSTOM#
(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('hongGD', 'ȫ�浿', 'gil@korea.com', 32, sysdate
);
INSERT INTO IDEV.TBL_CUSTOM#
(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('twice', '�ڸ��', 'momo@daum.net', 29, sysdate
);
INSERT INTO IDEV.TBL_CUSTOM#
(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '�̳���', 'lee@naver.com', 40, sysdate
);
--�߿� 1: custom ���̺��� ��(row) �����͸� ������ CUSTOM_ID , PCODE �� �ߺ��Ǹ� �ȵ˴ϴ�.
INSERT INTO IDEV.TBL_CUSTOM#
(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '�ָ��', 'choi@naver.com', 33, sysdate
);

SELECT * FROM "TBL_PRODUCT#" tp ;
INSERT INTO IDEV.TBL_PRODUCT#
(PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '�����е�', 880000);

INSERT INTO IDEV.TBL_PRODUCT#
(PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B1', '������ġ������Ʈ', 54000);

INSERT INTO IDEV.TBL_PRODUCT#
(PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '��ǵ���ũ', 234500);
-- �߿�2 : ������� price , quantity ���� �÷��� �� �ʼ� �����ͷ� ����Ǿ�� �մϴ�.
INSERT INTO IDEV.TBL_PRODUCT#
(PCODE, CATEGORY, PNAME)
VALUES('dk_143', 'A2', '�ڵ���ǵ���ũ');
-- ����Ŭ������ �Ϸù�ȣ�� �ڵ����� �����ؼ� ����ϰ� �� �� �ִ� ������ ����� �ֽ��ϴ�.


CREATE SEQUENCE tbl_buy_seq;
-- �ѹ���������� ����ϴ� �������� ���� �ǵ��� �� �����ϴ�.

-- ������ ���� ����� �ʹ�. �����ϰ� �ٽ� ���弼��.
DROP SEQUENCE tbl_buy_seq ;
--		���̺��� �����͵� �����ϼ���. �׸��� �ٽ� ������ ����/������ �߰��ϼ���.

SELECT * FROM "TBL_BUY#" tb ;


INSERT INTO IDEV.TBL_BUY#
(buy_seq,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'mina012', 'IPAD011', 1, '2022-02-06');

INSERT INTO IDEV.TBL_BUY#
(buy_seq,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'hongGD', 'IPAD011', 2, sysdate);

INSERT INTO IDEV.TBL_BUY#
(buy_seq,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'wonder', 'DOWON123a', 3, '2022-02-06');

INSERT INTO IDEV.TBL_BUY#
(buy_seq,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'mina012', 'dk_143', 1, sysdate);

INSERT INTO IDEV.TBL_BUY#
(buy_seq,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'twice', 'DOWON123a', 2, sysdate);
-- �ܷ�Ű�� ������ custom_id�� tbl_custom# ���̺��� �����մϴ�. �������̺���
-- custom_id �÷����� ���°��� ������ �� �����ϴ�.
INSERT INTO IDEV.TBL_BUY#
(buy_seq,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'mina012', 'd_14', 1, sysdate);



--1. custom# ���̺����� age �� 30�� �̻� ��� ���� ��ȸ
SELECT * FROM "TBL_CUSTOM#" tc WHERE age >= '30';

--2. custom# ���̺����� custom_id 'twice' �� email ��ȸ
SELECT EMAIL  FROM "TBL_CUSTOM#" tc  WHERE CUSTOM_ID  = 'twice';
--3. product# ���̺����� category 'A2' �� pname ��ȸ
SELECT PNAME  FROM "TBL_PRODUCT#" tp WHERE CATEGORY  = 'A2';
--4. product# ���̺����� price �� �ְ��� ��ȸ
SELECT MAX(price) FROM "TBL_PRODUCT#" tp ; 
--5. buy# ���̺����� 'IPAD011' �ѱ��� ���� ��ȸ
SELECT sum(QUANTITY) FROM "TBL_BUY#" tb WHERE PCODE = 'IPAD011';
--6. buy# ���̺����� custom_id 'nayeon' �� ��� ���� ��ȸ
SELECT * FROM "TBL_BUY#" tb2 WHERE CUSTOM_ID  ='nayeon';
--7. buy# ���̺����� pcode �� '1'�� ���Ե� �� ��ȸ
SELECT * FROM "TBL_BUY#" tb WHERE PCODE = '1'; -- ������ġ ��ȸ
SELECT * FROM "TBL_BUY#" tb WHERE PCODE LIKE '%1%';-- �κ���ġ ��ȸ.1�� ����
SELECT * FROM "TBL_BUY#" tb WHERE PCODE LIKE '1%'; 	-- �κ���ġ ��ȸ.1�� ����
SELECT * FROM "TBL_BUY#" tb WHERE PCODE LIKE '%1'; 	-- �κ���ġ ��ȸ.1�� ������
--8. buy# ���̺����� pcode �� 'on'�� �����ϴ� �� ��ȸ(��ҹ��� ���о��� ��ȸ)
SELECT * FROM "TBL_BUY#" tb WHERE LOWER() (PCODE) LIKE '%on%'; 