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