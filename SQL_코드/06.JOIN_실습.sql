/***** JOIN 실습 *****/

--1. EMPLOYEE 테이블과 DEPARTMENT 테이블을 조인해서
-- 각 지원의 이름과 그 직원이 속한 부서명 조회
SELECT EMP_NAME,DEPT_TITLE
FROM EMPLOYEE2
JOIN department ON(DEPT_CODE=DEPT_ID);
--2. EMPLOYEE 테이블과 DEPARTMENT 테이블을 조인해서
-- 각 지원의 이름과 그 직원이 속한 부서명,급여 조회
--Ansi
SELECT EMP_NAME,DEPT_TITLE,SALARY
FROM EMPLOYEE2
JOIN department ON(DEPT_CODE=DEPT_ID);
--Oracle
SELECT EMP_NAME,DEPT_TITLE,SALARY
FROM EMPLOYEE2,DEPARTMENT
WHERE DEPT_CODE=DEPT_ID;
--3. EMPLOYEE 테이블과 SAL_GRADE 테이블을 조인해서
-- 각 직원의 이름과 급여 등급 조회
SELECT EMPLOYEE2.EMP_NAME,SAL_GRADE,SAL_LEVEL
FROM EMPLOYEE2
JOIN SAL_GRADE ON(EMPLOYEE2.SAL_LEVEL = SAL_GRADE.SAL_LEVEL);
/*
다른테이블에서 컬럼명은 다르지만 서로 의미하는 바가 같은 컬럼끼리는
컬럼명1 = 컬럼명2 사용할 수 있음

다른 테이블에서 컬럼명이 같을 때는 참조하는 테이블이 무엇인지 작성해줘야함
테이블명.컬럼명1 = 테이블명.컬럼명2
*/
--ORACLE
SELECT e.EMP_NAME, s.SAL_LEVEL
FROM EMPLOYEE2 e,SAL_GRADE s
WHERE e.SAL_LEVEL = s.SAL_LEVEL;

SELECT E.EMP_NAME,D.DEPT_TITLE,J.JOB_NAME
FROM EMPLOYEE2 E, DEPARTMENT D, JOB J
JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
JOIN JOB J ON (E.JOB_CODE = J.JOB(CODE));

--ORACLE


--1. 직원의 이메일 주소와 해당 부서의 부서명 조회
SELECT E.EMAIL,D.DEPT_TITLE
FROM EMPLOYEE2 E,DEPARTMENT D
WHERE E.DEPT_CODE = D.DEPT_ID;

SELECT E.EMP_NAME,D.DEPT_TITLE
FROM EMPLOYEE2 E,DEPARTMENT D
WHERE E.DEPT_CODE = D.DEPT_ID
AND E.SALARY >=3000000;

SELECT E.EMP_NAME,D.DEPT_TITLE,S.SAL_LEVEL
FROM EMPLOYEE2 E, DEPARTMENT D, SAL_GRADE S
WHERE E.DEPT_CODE = D.DEPT_ID
AND E.SAL_LEVEL = S.SAL_LEVEL;

--4. 직급이 대리이면서 아시아 지역에 근무하는 직원 조회
SELECT E.EMP_ID,E.EMP_NAME,J.JOB_NAME,D.DEPT_TITLE,L.LOCAL_NAME,E.SALARY
FROM EMPLOYEE2 E, DEPARTMENT D, JOB J, location L
WHERE E.JOB_CODE=J.JOB_CODE
AND E.DEPT_CODE = D.DEPT_ID
AND D.LOCATION_ID = L.LOCAL_CODE
AND J.JOB_NAME = '대리'
AND L.LOCAL_NAME LIKE 'ASIA%';
--사번 이름 직급명 부서명 근무지역명 급여를 조회

--1.D5부서에 속한 직원들의 이름과 직급명 조회
--테이블 EMPLOYEE2 JOB
SELECT E.EMP_NAME,J.JOB_NAME
FROM EMPLOYEE E,JOB J
WHERE E.JOB_CODE=J.JOB_CODE
AND E.DEPT_CODE = 'D5';
--2. 각 부서의 부서명과 해당 부서에 속한 직원의 평균급여 조회
--테이블 EMPLOYEE2 DEPARTMENT
SELECT D.DEPT_TITLE, FLOOR(AVG(E.SALARY))
FROM EMPLOYEE2 E,DEPARTMENT D
WHERE E.DEPT_CODE = D.DEPT_ID
GROUP BY D.DEPT_TITLE;
--GROUP BY
--AVG
--3.급여 등급이 S4 이상인 직원의 이름, 급여, 급여 등급 조회
SELECT E.EMP_NAME,E.SALARY,E.SAL_LEVEL
FROM EMPLOYEE2 E,SAL_GRADE S
WHERE E.SAL_LEVEL = S.SAL_LEVEL
AND S.SAL_LEVEL IN ('S4','S5','S6');
--테이블 EMPLOYEE SAL_GRADE
--WHERE IN
SELECT*FROM SAL_GRADE;