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

--특정 전화번호 패턴을 가진 사원의 이름과 전화번호 조회
select emp_name,phone
from employee
where phone like '010%';
 
/*

컬럼명 BETWEEN (A) AND (B)
--컬럼의 값이 A이상B이하면 TRUE

컬럼명 NOT BETWEEN (A) AND (B)
--컬럼의 값이 A이상B이하면 FALSE
--컬럼의 값이 A미만 또는 B초과시 TRUE ||
*/
 
--월급이 300이상 500이하

SELECT EMP_NAME,SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3000000 AND 5000000;

--월급이 300미만이거나 500초과일 때
SELECT EMP_NAME,SALARY
FROM EMPLOYEE
WHERE SALARY NOT BETWEEN 3000000 AND 5000000;

/*
WHERE OR 사용해서 값1,값2,값3 ...과 같은 표시를 진행하기도 함

컬럼명 IN(값1, 값2, 값3, ...)
--컬럼의 값이() 내 값과 일치하면 TRUE

컬럼명 NOT IN(값1, 값2, 값3, ...)
--컬럼의 값이() 내 값과 일치하면 FALSE
--컬럼의 값이() 내 값과 일치하지 않으면 TRUE
*/

------------------------
/*** OR 사용 ***/
--EMPLOYEE 테이블에서
--부서코드가 'D5' ,'D6' 'D9'인 사원의
--이름, 부서코드, 급여 조회
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
OR DEPT_CODE ='D6'
OR DEPT_CODE ='D9';
 ------------------------
 /*** IN 사용 ***/
--EMPLOYEE 테이블에서
--부서코드가 'D5' ,'D6' 'D9'인 사원의
--이름, 부서코드, 급여 조회

SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D6','D9');

 /*** IN 사용 ***/
--EMPLOYEE 테이블에서
--부서코드가 'D5' ,'D6' 'D9'아닌 사원의
--이름, 부서코드, 급여 조회
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE NOT IN('D5','D6','D9');

/*
LIKE
비교하려는 값이 특정한 패턴을 만족시키면 조회하는 연산자
WHERE 컬럼명 LIKE '패턴'

%(포함)
-%A : 문자열이 앞은 어떤 문자든 포함되고 마지막은 A
    예 : %를 검색창에 륨으로 끝나는 단어를 검색한 것과 비슷
- A% : 문자열에서 A로 시작하고 끝나는 것은 상관 없음
    예 : 림% 검색창에 림으로 시작하는 단어를 검색한 것과 비슷
    
-%A% : 문자열 시작과 끝문자는 관계 없이 중간에 A가 들어가면 됨
    예 : %로% 검색창에 로가 중간에 들어가는 단어를 검색한 것과 비슷
    
-글자 수

-A_: A뒤에 아무거나 한 글자만 있는 문자열
  예 : AB,A1,AQ,A가
    가_:가로 시작하는 두글자 단어만 검색
    나__:나로 시작하는 세글자 단어만 검색
    
_A : A앞에 아무거나 한 글자만 있는 문자열
 예 : BA,1A,QA,가A
    _가 : 가로 끝나는 두글자 단어만 검색
    __나 : 나로 끝나는 세글자 단어만 검색


*/
--EMPLOYEE에서 성이 전씨인 사원의 사번 이름 조회
SELECT EMP_ID,EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '전%';
--EMPLOYEE에서 이름이 수로 끝나는 사원의 사번, 이름 조회
SELECT EMP_ID,EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%수';
--EMPLOYEE에서 하 가 포함되는 사원의 사번, 이름 조회
SELECT EMP_ID,EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하';
--EMPLOYEE에서 이름이 전으로 시작하고 돈으로 끝나는 사원의 사번, 이름 조회
SELECT EMP_ID,EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '전%돈';

--이메일의 아이디 글자 수가 5글자인 사원의
SELECT EMP_NAME,EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE'_____@%';
--이름 이메일 조회 5글자@
--EMPLOYEE
SELECT EMP_ID,EMP_NAME,EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___%';

SELECT EMP_NAME AS "이름" , SALARY AS "급여 
FROM EMPLOYEE;

SELECT DEPT_CODE AS "부서코드", JOB_CODE AS "직무코드"
FROM EMPLOYEE;

SELECT EMAIL AS "이메일" , PHONE AS "전화번호"
FROM EMPLOYEE;

SELECT EMP_ID AS "사원ID", HIRE_DATE AS "입사일"
FROM EMPLOYEE;

SELECT EMP_NAME, AS "이름" , DEPT_CODE AS "부서" , SALARY AS "급여"
FROM EMPLOYEE;
중복되지 않은 DEPT_CODE
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;
중복되지 않은 JOB_CODE
SELECT DISTINCT JOB_CODE FROM EMPLOYEE;
중복되지 않은 SAL_LEVEL
SELECT DISTINCT SAL_LEVEL FROM EMPLOYEE;
중복되지 않은 MANAGER_ID
SELECT DISTINCT MANAGER_ID FROM EMPLOYEE;
중복되지 않은 EMP_NAME
SELECT DISTINCT EMP_NAME FROM EMPLOYEE;

DEPT_CODE가 D5이거나 SALARY가 2000000Q보다 큰 사원의 이름과 급여 선택
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
OR SALARY > 2000000;

--DEPT_CODE가 D6이거나 JOB_CODE가 J3인 사원의 이름과 급여를 선택
SELECT EMP_NAME, JOB_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR JOB_CODE = 'J3';
--SAL_LEVEL이 S5이거나 BONUS가 0.2인 사원의 이름과 급여수준 선택
SELECT EMP_NAME, SAL_LEVEL
FROM EMPLOYEE
WHERE SAL_LEVEL = 'S5' OR BONUS = '0.2';
--ENT_YN가 N이거나 HIRE_DATE가 2000년 이후인 사원의 이름과 입사일 선택
SELECT EMP_NAME,HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN = 'N' OR HIRE_DATE > TO DATE('2000-01-01','YYYY-MM-DD');

ORDER BY 

SELECT 개념정리에 넣어야 할내용

/*S
DUAL(DUmmy tAbLe)
Dummy : 실제로 사용되지 않은 데이터
더미테이블 : 실제로 존재하지 않는 테이블
	-> 테이블 만들기는 번거롭고.. 뭔가 테스트나 사용은 해봐야겠고..
	-> 단순히 데이터를 조회하거나 확인할 때 사용
*/

--존재하지 않는 테이블을 이용해서 현재시간 확인하기
SELECT SYSDATE, SYSTIMESTAMP
FROM DUAL;

/*

||연결 연산자
--문자열 이어쓰기
+나 , 로 연결하지 않고 ||를 사용해서 연결
*/

SELECT EMP_ID || EMP_NAME FROM EMPLOYEE;

SELECT EMP_NAME ||'의 월급은'||SALARY||'원 입니다.'
FROM EMPLOYEE;

--MENU 테이블
--메뉴이름 맨 앞에 카가 들어간 메뉴 출력
SELECT *
FROM MENU
WHERE MENU_NAME LIKE '카%';
--menu_price 3500인 메뉴들 출력
SELECT *
FROM MENU
WHERE MENU_PRICE = '3500';
--키오스크에서 1을 눌렀을 때 나올 메뉴 출력
SELECT *
FROM MENU
WHERE MENU_PRICE = 'i';
--특정 단어가 포함된 메뉴 설명 조회 카라멜
SELECT menu_name,menu_desc,menu_price
FROM menu
where menu_desc like '%카라멜%';
--가격이 낮은 순으로 메뉴 조회
select menu_name, menu_desc, menu_price
from menu
order by menu_price 

--직급 코드가 j5인 사원의 수를 조회
--J5 몇명인데?
select COUNT(*) AS "J5 COUNT"
FROM EMPLOYEE
WHERE JOB_CODE = 'J5';

SELECT EMP_NAME||'('||EMAIL||')'
FROM EMPLOYEE;

SELECT EMP_NAME||'-'||PHONE||')'
FROM EMPLOYEE;

SELECT EMP_ID||'('||DEPT_CODE||')'
FROM EMPLOYEE;

SELECT EMP_NAME||'-'||SALARY
FROM EMPLOYEE;

SELECT EMP_NAME ||':'|| SALARY AS "이름:급여" FROM EMPLOYEE;

SELECT EMP_NAME ||'-'|| SALARY * 12 AS "이름-연봉" FROM EMPLOYEE;

