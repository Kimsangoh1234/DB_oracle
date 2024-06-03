INSERT INTO EMPLOYEE2(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ent_date,ENT_YN)
VALUES('223','김영수','850101-1234567''KIM_YS@OR.KR','01012345678','DI','J4','S2',350000,0.1,'200',TO_DATE('2015-06-20, YYYY-MM-DD'),NULL,'N');

INSERT INTO department2
VALUES('D10','연구개발부','L6');

/*
오류보고 -
SQL 오류: ORA-12899: value too large for column "SYS"."DEPARTMENT2"."DEPT_ID" (actual: 3, maximum: 2)

컬럼의 최대 크기가 2BYTE로 영어나 숫자로 2글자까지만 가능하지만
3글자를 작성하려 했기 때문에 에러 발생
->DEPARTMENT2 테이블에서 DEPT_ID에 해당하는 컬럼의 크기를
2에서 3으로 늘려주거나
VARCHAR2로 변경해서 255까지 늘려주는 방법이 존재 -> VARCHAR2 알아서 공간크기를 조정
CHAR의 경우 공간 크기를 조정하지 못하기 때문에 처음부터 크기를 잘 선택
12899. 00000 -  "value too large for column %s (actual: %s, maximum: %s)"
*/

--UPDATE 실습
--1.
SELECT*
FROM EMPLOYEE2
WHERE EMP_ID = '200';

UPDATE EMPLOYEE2
SET EMAIL = 'sun_di@updated.or.kr',
    phone = '01012345678'
WHERE EMP_ID = '200';




SELECT*FROM EMPLOYEE2
WHERE DEPT_CODE = 'D1';

UPDATE EMPLOYEE2
SET SALARY = SALARY*1.10,
    BONUS = BONUS+0.05
WHERE DEPT_CODE = 'D1';