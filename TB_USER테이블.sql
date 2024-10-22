CREATE TABLE TB_USER(
	USER_NO     NUMBER CONSTRAINT TB_USER_PK PRIMARY KEY,
	USER_ID     VARCHAR2(30) NOT NULL,
	USER_PW     VARCHAR2(30) NOT NULL,
	USER_NAME   VARCHAR2(30) NOT NULL,
	ENROLL_DATE DATE DEFAULT SYSDATE
);

COMMENT ON COLUMN TB_USER.USER_NO     IS '사용자 번호';
COMMENT ON COLUMN TB_USER.USER_ID     IS '사용자 아이디';
COMMENT ON COLUMN TB_USER.USER_PW     IS '사용자 비밀번호';
COMMENT ON COLUMN TB_USER.USER_NAME   IS '사용자 이름';
COMMENT ON COLUMN TB_USER.ENROLL_DATE IS '사용자 가입일';


-- USER_NO 컬럼에 삽입될 시퀀스 생성
CREATE SEQUENCE SEQ_USER_NO NOCACHE;

-- 샘플 데이터 INSERT
INSERT INTO TB_USER 
VALUES(SEQ_USER_NO.NEXTVAL, 'user01', 'pass01', '유저일', DEFAULT );
INSERT INTO TB_USER 
VALUES(SEQ_USER_NO.NEXTVAL, 'user02', 'pass02', '유저이', DEFAULT );

SELECT * FROM TB_USER;

COMMIT;

--DROP TABLE TB_USER;




UPDATE TB_USER SET
USER_NAME = '키키'
WHERE USER_ID = 'user22222'
AND USER_PW = 'pass01';

SELECT * FROM EMPLOYEE;

SELECT 
EMP_ID, 
EMP_NAME, 
DECODE( SUBSTR(EMP_NO, 8, 1), '1', 'M', '2', 'F' ) GENDER,
SALARY,
JOB_NAME,
NVL(DEPT_TITLE, '없음') DEPT_TITLE
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
WHERE 
	DECODE( SUBSTR(EMP_NO, 8, 1), '1', 'M', '2', 'F' ) = 'M'
AND 
	SALARY BETWEEN 2000000 AND 5000000
ORDER BY SALARY DESC;