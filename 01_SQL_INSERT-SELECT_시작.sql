/*
테이블을 만들 때 NULL 값이 들어갈 수 있도록 허용한
컬럼에서만 가능

널이아님에 체크를 해주지 않은 컬럼에서는 가능

널이아님 체크를 해준 컬럼 : 필수로 값을 넣어야하는 공간

예를 들어 
회원가입 
아이디 이름 이메일 번호 주소 -> 널이 아님 체크

기념일 -> 널이 아님 체크 해지

INSERT에서 값을 선택해서 넣을 수 있는 컬럼이라면
선택해서 넣을 수 있는 컬럼명을 지워준 후(작성하지 않은 후)
VALUES 다음에 값을 집어넣는 공간에도 
값을 추가하지 않으면 됨

*/



/* 공백이나 띄어쓰기는 관계없이 원하는 SQL 구문만큼 드래그해서 실행 */
INSERT INTO kh_cafe (c_id,c_name, c_address, c_phone, c_time)
VALUES (2, '빠나쁘레쏘', '서울시 강남구 력삼동',
'02-5555-5555', '영업시간 : 12:00~14:00');

INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time)
VALUES (3, '검포즈커피', '경기도 화남시 화남구',
'031-3232-3333', '영업시간 평일 15:00~18:00');

INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time)
VALUES (4, '휠리스커피', '인천시 남동구 남동동',
'032-8888-8888', '영업시간 평일 10:00~17:00');

INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time)
VALUES (5, '거피빈', '서울특별시 역삼동','',
 '영업시간 평일 10:00~13:00');
 
INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time)
VALUES (6, '스타벅스', '서울시 종로구 관철동','02-1111-2222',
 '영업시간 평일 10:00~13:00');
 
 INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time)
VALUES (7, '탐엔탐스', '서울시 동대문구 장안동','02-5555-6666',
 '영업시간 10:00~20:00');
 
 INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time)
VALUES (8, '이디야커피', '서울시 송파구 잠실동','02-1234-6789',
 '영업시간 9:00~21:00');
 
 
 
 
 
 --저장된 내용 보기
 SELECT * FROM kh_cafe;
 
 /*
 SELECT : 저장된 데이터를 볼 때 사용
 -> 로그인, 게시판 글가져오기, 회원정보, 회사 내 직원정보, 급여내역, 스터디명단블로그 등
 SELECT 어떤칼럼을볼지선택 FROM 어느 테이블에서 가져올 지 테이블명 작성
 
 한 테이블에 있는 모든 컬럼을 보겠다
 SELECT * FROM 테이블이름;
 
 한 테이블에서 특정된 컬럼만 보겠다
 SELECT C_NAME FROM 테이블이름;
 
 한 테이블에서 특정된 컬럼들만 보겠다
 SELECT C_NAME, C_ADDRESS FROM 테이블이름;
 */
 
 SELECT C_NAME FROM kh_cafe;
 
 SELECT C_ADDRESS FROM kh_cafe;
 
  SELECT C_NAME,c_address FROM kh_cafe;
  
  --MEMBER 테이블 모두 보기
  SELECT * FROM kh_cafe;
  --MEMBER 테이블 이름만 보기
  SELECT C_NAME FROM kh_cafe;
  --MEMBER 테이블 이름 나이 보기
  SELECT C_NAME, c_time FROM kh_cafe;
  --MEMBER 테이블 이름 번호 보기
  SELECT M_NAME AS 멤버이름, M_PHONE AS 멤버번호 FROM member;
  
  --AS : ALIAS 별칭 이라는 영어 줄임말
  
  --카페에서 카페이름 카페 번호 보는데 AS 를 사용해서 카페이름 카페번호 표기해서 보여주기
  SELECT C_NAME AS 카페이름, C_PHONE AS 카페번호 FROM kh_cafe;
 
 INSERT INTO menu (MENU_ID, MENU_NAME, MENU_DESC, MENU_PRICE)
 VALUES(1, '아메리카노','신선한 원두로 만든 아메리카노', '3000');
 
 INSERT INTO menu (MENU_ID, MENU_NAME, MENU_DESC, MENU_PRICE)
 VALUES(2, '카페라떼','부드러운 우유가 들어간 라떼', '3500');
 
 INSERT INTO menu (MENU_ID, MENU_NAME, MENU_DESC, MENU_PRICE)
 VALUES(3, '카푸치노','진한 커피와 거품이 어우러진 카푸치노', '3500');
 
 INSERT INTO menu (MENU_ID, MENU_NAME, MENU_DESC, MENU_PRICE)
 VALUES(4, '카라멜 마키아토','달콤한 카라멜 시럽이 들어간 마키아토', '4000');
 
 INSERT INTO menu (MENU_ID, MENU_NAME, MENU_DESC, MENU_PRICE)
 VALUES(5, '에스프레소','강한 맛과 향의 에스프레소', '2500');
 
 SELECT * FROM menu;
 
 SELECT EMP_NAME,HIRE_DATE
 FROM EMPLOYEE
 WHERE HIRE_DATE>TO_DATE
 
 /*
 SELECT(조회)
 
 지정된 테이블에서 원하는 데이터를 선택해서 조회하는 SQL
 
 작성된 구문에 맞는 행, 열 데이터가 조회됨
 ->조회된 결과 행의 집합 == RESULT SET(결과 집합)
 
 */

/*
SELECT 작성법 -1(기초)

SELECT 컬럼명, 컬럼명, ...
FROM 테이블명 :

-> 지정된 테이블 모든 행에서
컬럼명이 일치하는 컬럼값 조회

테이블의 모든 행 모든 컬럼 조회하는 방법
*(asterisk) : 
*/ 

--EMPLOYEE 테이블에서
--모든 행의 사번(EMP_ID), 이름(EMP_NAME), 급여(SALARY)조회
SELECT ENP_ID,EMP_NAME,SALARY
FROM EMPLOYEE;

--EMPLOYEE 테이블에서 모든 행, 모든 컬럼 조회
SELECT*
FROM EMPLOYEE;

/*
컬럼 값 산술 연산

-- 컬럼 값 : 행과 열이 교차되는 테이블 한 칸에 작성된 값

-- SELECT문에 산술 연산을 직접 작성하면
-- 조회결과(RESULT SET)에 연산결과가 반영되어 조회됨
*/
--EMPLOYEE 테이블에서
--모든 차원의 이름, 급여, 급여 + 100만원 조회
SELECT EMP_NAME,SALARY,SALARY +1000000
FROM EMPLOYEE;

--EMPLOYEE 테이블에서
--모든 사원의 이름, 연봉(급여*12)조회
SELECT EMP_NAME,SALARY+12 AS "연봉"
FROM EMPLOYEE;

/*
SYSDATE,SYSTIMESTAMP
--(시스템이 나타내고 있는)현재 시간

--SYSDATE      : 현재시간(년,월,일,시,분,초)조회
--SYSTIMESTAMP : 현재시간(년,월,일,시,분,초 MS+지역(local))조회

회원가입할 때 DB에 들어오는 현재 시간을 기록할 때 생성
컴퓨터에서 체크하는 시간을 기록할 때 사용

*/

/*
날짜 사용하기
DB에 저장된 날짜들 중에서 특수한 일정 기간을 조회하거나 변경하길 원할 때 사용

TO_DATE('문자열','패턴')
예를 들어 2024-05-01 자 이후 회원가입 한 회원 조회
TO_DATE('2024-05-01','YYYY-MM-DD')
*/

/*
컬럼명 별칭 지정

별칭 지정 방법
1)컬럼명 AS "별칭" : 문자O,띄어쓰기O,특수문자O
2)컬럼명 "별칭"    : 문자O,띄어쓰기O,특수문자O
3)컬럼명 별칭      : 문자O, 띄어쓰기X, 특수문자X
4)컬럼명 AS별칭    : 문자O, 띄어쓰기X, 특수문자X
*/

--EMPLOYEE 테이블에서 이름, 이메일 이메일에@포함이라는 별칭
--1)컬럼명 AS "별칭"
SELECT EMP_NAME,EMAIL AS "이메일@포함"
FROM EMPLOYEE;
--2)컬럼명 "별칭"
SELECT EMP_NAME,EMAIL "이메일@포함"
FROM EMPLOYEE;
--3)컬럼명 별칭 띄어쓰기X, 특수문자X
--띄어쓰기와 @사용 불가
SELECT EMP_NAME,EMAIL "이메일@포함"
FROM EMPLOYEE;
--4)컬럼명 AS별칭  
--띄어쓰기와 @ 사용불가
SELECT EMP_NAME,EMAIL AS 이메일포함
FROM EMPLOYEE;

/*
DISTINCT(별개의,전혀다른)
->중복 제거

--조회 결과 집합(RESULT SET)에서 
지정된 컬럼의 값이 중복되는 경우
중복되는 값을 한 번만 표시할 때 사용

사용방법
SELECT DISTINCT 중복제거할컬럼명
FROM 테이블명
*/

--EMPLOYEE 테이블에서 모든 사원의 부서코드 조회
SELECT DEPT_CODE FROM EMPLOYEE;

--EMPLOYEE 테이블에서 사원이 존재하는 부서코드만 조회
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;

--> D3 D4 D7 부서는 사원이 없기 때문에 조회되지 않음

-- EMPLOYEE 테이블에 존재하는 직급 코드의 종류 조회 JOB_CODE
 SELECT DISTINCT JOB_CODE
 FROM EMPLOYEE;
 
 /*
 WHERE 절
--테이블에서 조건을 충족하는 행을 조회할 때 사용
--WHERE절에는 조건식(TRUE/FALSE)만 작성

비교연산자 : >,<,>=,<=(같다),!=,<>(같지않다)
논리연산자 : AND,OR,NOT

작성방법 
SELECT 컬럼명, 컬럼명, ...
FROM 테이블명
WHERE 조건식;
--> 지정된 테이블 모든 행에서 컬럼명이 일치하는 컬럼 값 조회
 */
--EMPLOYEE 테이블에서 급여가 300만원을 초과하는 사원의
--이름 급여 부서코드 조회
SELECT EMP_NAME,SALARY,DEPT_CODE
FROM EMPLOYEE
WHERE SALARY > 3000000;

--EMPLOYEE 테이블에서 D9 부서에 해당하는 사원의 이름 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

--EMPLOYEE 테이블에서 D9 부서에 해당하지 않는 사원의 이름 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE != 'D9';

/*
NULL, NOT NULL

컬럼 값이 존재하지 않는 경우
IS NULL;

컬럼 값이 존재하는 경우
IS NOT NULL;
*/
--EMPLOYEE테이블에서 DEPT_CODE가 없는 사원 조회
SELECT * 
FROM EMPLOYEE 
WHERE DEPT_CODE IS NULL;

--EMPLOYEE테이블에서 DEPT_CODE가 있는 사원 조회
SELECT * 
FROM EMPLOYEE 
WHERE DEPT_CODE IS NOT NULL;
 
 
 
 
 
 