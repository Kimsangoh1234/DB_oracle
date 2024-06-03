/*ORDER BY 실습하기*/
-- 1. EMPLOYEE 테이블에서 모든 직원읭 이름을 오름차순 정렬
SELECT* 
FROM employee2
ORDER BY EMP_NAME ASC;

SELECT*
FROM employee2
ORDER BY EMP_NAME DESC;

SELECT EMP_NAME AS "이름",EMP_ID AS"사번"
FROM employee2
ORDER BY EMP_NAME,EMP_ID DESC;

SELECT EMP_ID,EMP_NAME,SALARY AS "월급"
FROM employee2
ORDER BY "월급" DESC;

SELECT EMP_ID,EMP_NAME,BONUS AS"보너스",SALARY AS"월급"
FROM employee2
ORDER BY "보너스" DESC, "월급" ASC;
-->사람이나 어떤 값을 정렬해서 모두 보겠다 X
--->제일 많이 보너스 받는 값은 무엇이고, 월급 제일 나

SELECT DEPT_CODE AS"부서코드",JOB_CODE AS"직급코드",EMP_NAME AS"이름"
FROM EMPLOYEE
ORDER BY 부서코드 ASC, 직급코드 DESC, 이름 ASC;

SELECT EMAIL AS"이메일",PHONE AS"전화번호"
FROM employee
ORDER BY 이메일 ASC, 전화번호 DESC;

SELECT EMP_NAME AS"직원명",HIRE_DATE AS"입사일자"
FROM employee
ORDER BY 입사일자 ASC, 직원명 DESC;

-->동명이인인데 직급이 다르거나 