/*
SELECT 문 정리
SELECT 컬럼명, 컬럼명 AS "별칭, 컬럼명,...
FROM 참조할 테이블명
WHERE 컬럼명 : 함수식 비교연산자 비교값
GROP BY 그룹을 묶을 컬럼명
HAVING 그룹함수식 비교연산자 비교값
ORDER BY 컬럼명 | 별칭 | 컬럼순번 정렬방식

--SELECT WHERE 절까지만 존재할 경우
3 SELECT 컬럼명 -> 마지막에 보여주겠다!! 결과물!!
1 FROM 테이블명
2 WHERE 조건식

--SELECT ORDER BY 절까지만 존재할 경우
2    SELECT 컬럼명
1    FROM 테이블명
3    WHERE 조건식
4    ORDER BY 정렬기준

GROUP BY 절
같은 값들이 여러개 기록된 컬럼을 가지고 같은 값들을
하나의 그룹으로 묶은 것

여러개의 값을 묶어서 하나로 처리할 목적으로 사용
그룹으로 묶은 값에 대해서 SELECT 절에서 그룹함수를 사용

그룹함수는 단 한개의 결과 값만 산출하기 때문에 그들이 여러개일 경우 오류 발생
여러개의 결과 값을 산출하기 위해 그룹함수가 적용된 그들의 기준을 ORDER BY 절에 기술해서 사용
*/

--EMPLOYEE 테이블에서 부서코드,부서별 급여 합계 조회

SELECT DEPT_CODE,SUM(SALARY)
FROM employee2
GROUP BY dept_code;
/*
SELECT DEPT_CODE,SUM(SALARY)
DEPT_CODE 부서코드와 각 부서의 급여 한계를 선택

GROUP BY DEPT_CODE;

DEPT_CODE 기준으로 그룹을 생성
동일한 부서코드를 가진 사람들을 하나의 그룹으로 묶고
각 그룹에 월급 합인 SUM(SALARY)를 적용해서
해당 부서의 모든 직원의 급여 합계를 계산한 것
*/

--EMPLOYEE 테이블에서
--부서코드와 부서별 보너스를 받는 사원의 수 조회
--1.SELECT 절에서 부서코드랑 보너스사원수 카운트 진행
SELECT DEPT_CODE,COUNT(*)AS"보너스받은 사원수"
--2.EMPLOYEE 테이블에서 조회하자
FROM EMPLOYEE2
--3.보너스 받은 사람만 보자 WHERE 조건!
WHERE BONUS IS NOT NULL
--4.각 부서 기준으로 몇명 받았는지 계산해서
--각 그룹에서 보너스 받은 사원수 조회
GROUP BY DEPT_CODE;

/*
DEPT_CODE 보너스받은사원수
(NULL)	    1
D1	        2
D9	        1
D5	        2
D6	        1
D8	        2
*/
--맨 밑에 ORDER BY를 추가해서 부서코드 순으로 정렬
SELECT DEPT_CODE,COUNT(*)AS"보너스받은 사원수"
FROM EMPLOYEE2
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

--EMPLOYEE 테이블에서 부서코드가 D5 D6인 부서의 평균 급여 조회
SELECT DEPT_CODE,FLOOR(AVG(SALARY))AS"평균급여"
FROM EMPLOYEE2
WHERE DEPT_CODE IN('D5','D6')
GROUP BY DEPT_CODE;