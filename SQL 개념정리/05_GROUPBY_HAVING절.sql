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

--여러 컬러를 묶어서 그룹으로 지정 가능

--GROUP BY 사용시 주의할점

-->SELECT문에 GROUP BY 절을 사용한 경우




SELECT DEPT_CODE,JOB_CODE,SUM(SALARY)
FROM EMPLOYEE2
GROUP BY DEPT_CODE,JOB_CODE
ORDER BY DEPT_CODE;

-----------------------------------------------------------
--WHERE 절 : 지정된 테이블에서 어떤 행만을 조회 결과로 삼을 것인지 조정을 지정하는 구문
--          (테이블 내에서 특정 컬럼만 뽑아서 사용하겠다는 조건문)

--HAVING 절 : 그룹 함수로 구해 올 그룹에 대한 조건을 설정할 때 사용
--          (그룹에 대한 조건, 어떤 그룹만 조회하겠다)

--부서별 평균 급여가 3000000원 이상인 사원만 조회하고 오름차순 정렬
--> 급여가 3000000원 이상인 지원들만 대상으로 각 부서의 평균 급여계산
SELECT DEPT_CODE,AVG(SALARY)
FROM EMPLOYEE2
WHERE SALARY >=3000000
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;
--부서별 평균 급여가 3000000원 이상인 부서를 조회하고 부서코드 오름차순 정렬
SELECT DEPT_CODE,AVG(SALARY)
FROM EMPLOYEE2
--WHERE SALARY >=3000000;
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >=3000000
ORDER BY DEPT_CODE;

/*
D6	3366666.66666666666666666666666666666667
D9	5900000

WHERE절의 경우 조건에 맞는 값만 가지고 온 후 보여준다면
HAVING절은 
*/

--집계함수(ROLLUP,CUBE)
--그룹 별 산출한 결과 값의 집계를 계산하는 함수
--GROUP BY 절에서만 작성할 수 있는 함수
--WHERE ORDER SELECT에서 사용하지 않고 GROUP BY에서 작성

--ROLLUP함수: 그룹별로 중간 집계를 처리하는 함수
--그룹별로 묶여진 값에 대한 '중간 집계'와 '총 집계'를 계산해서 자동으로 추가하는 함수
-- *인자로 전달받은 그룹중에서 가장 먼저 지정한 그룹별 한계와 총 합계를 구하는 함수

--EMPLOYEE 테이블에서
--각 부서에 소속된 직급 별 급여합
--부서별 급여 합
--전체 직원 급여 총합 조회

SELECT DEPT_CODE,JOB_CODE,SUM(SALARY)
FROM EMPLOYEE2
GROUP BY ROLLUP(DEPT_CODE,JOB_CODE)
ORDER BY DEPT_CODE;
/*
--> employee 테이블에서 DEPT_CODE와 JOB_CODE 기준으로 SALARY 함께 구함
특정그룹의 합계 전체
부서코드가 동일한 모든 행의 합계
그룹의 합계
부서 직급 월급일
D1	J6	6440000 <-- D1 부서의 J6 직급 급여 합계
D1	J7	1380000 <-- D1 부서의 J7 직급 급여 합계
D1		7820000 <-- D1 부서 전체의 급여 합계
D2	J4	6520000<-- D2 부서의 J7 직급 급여 합계
D2		6520000<-- D2 부서의 J7 직급 급여 합계
D5	J3	3500000<-- D5 부서의 J7 직급 급여 합계
D5	J5	8460000<-- D5 부서의 J7 직급 급여 합계
D5	J7	3800000<-- D5 부서의 J7 직급 급여 합계
D5		15760000<-- D5 부서의 J7 직급 급여 합계
D6	J3	7300000<-- D6 부서의 J7 직급 급여 합계
D6	J4	2800000
D6		10100000
D8	J6	6986240
D8		6986240
D9	J1	8000000
D9	J2	9700000
D9		17700000
	J6	2320000
	J7	2890000
		5210000
        
카페 
빠나쁘레소 아메리카노 총매출
        카페라떼 총매출
        아메리카노 
*/


--CUBE 함수 : 그룹별 산출한 결과를 집계하는 함수
-- 
SELECT DEPT_CODE,JOB_CODE,SUM(SALARY)
FROM EMPLOYEE2
GROUP BY CUBE(DEPT_CODE,JOB_CODE)
ORDER BY DEPT_CODE;
/*
CUBE는 ROLLUP보다 더 포괄적인 집계 결과 생성
CUBE는 모든 가능한 모든 것을 조합하고 조합에 해당 결과와 총하
D1	J6	6440000
D1	J7	1380000
D1		7820000
D2	J4	6520000
D2		6520000
D5	J3	3500000
D5	J5	8460000
D5	J7	3800000
D5		15760000
D6	J3	7300000
D6	J4	2800000
D6		10100000
D8	J6	6986240
D8		6986240
D9	J1	8000000
D9	J2	9700000
D9		17700000

	J1	8000000
	J2	9700000
	J3	10800000
	J4	9320000
	J5	8460000
	J6	2320000
	J6	15746240
	J7	2890000
	J7	8070000
  */ 
  
--UNION INTERSECT MINUS

--INTERSECT : 여러개의 SELECT한 결과에서 공통 부분만 결과로 추출

--부서코드가 'D5'이면서 급여가 300만 초과하는 사원의
--이름,부서코드,급여조회
--1)부서코드가 'D5'
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE2
WHERE DEPT_CODE='D5'

INTERSECT

--2)급여가 300만원 초과
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE2
WHERE SALARY>3000000;

-->INTERSECT 사용하지 않아도,GROUP BY WHERE 조건으로 구분지을수 있음

---- MINUS : 선행 SELECT 결과에서 다음 SELECT 결과와 겹치는 부분을 제외한 나머지 부분만 추출 ----
--부서코드 D5중 급여가 300만원 초과인 직원 제외
--1)부서코드가 D5
--1)부서코드가 'D5'
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE2
WHERE DEPT_CODE='D5'

INTERSECT

--2)급여가 300만원 초과
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE2
WHERE SALARY>3000000;

-->MINUS 사용하지 않아도,GROUP BY WHERE 조건으로 구분지을수 있음



------UNION : 여러개의 쿼리 결과를 하나로 합치는 연산자-----
--중복된 영역을 제외하여 하나로 합침

--부서코드가 'D5' 또는 'D6'인 사원 이름, 부서코드 조회

--1)부서코드가 'D5' 조회
SELECT EMP_NAME,DEPT_CODE
FROM EMPLOYEE2
WHERE DEPT_CODE = 'D5'

UNION

SELECT EMP_NAME,DEPT_CODE
FROM EMPLOYEE2
WHERE DEPT_CODE = 'D6';

--UNION ALL : 여러개의 쿼리 결과를 하나로 합치는 연산자
--UNION과 차이점은 중복영역을 모두 포함

--부서코드가 'D5'이거나 급여가 300만 초과하는 사원의 
--이름 부서코드 급여 조회(중복포함)

--1)부서코드가 'D5'
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE2
WHERE DEPT_CODE='D5'

UNION ALL

SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE2
WHERE SALARY>3000000;

/***************
집합 연산(SET OPERATION)

여러 개의 SELECT 결과물을 하나의 퀴리로 만드는 연산자
여러가지 조건이 있을 때 그에 해당하는 여러개의 결과값을 결합시키고 싶을 때 사용
--장점 : 초보자들이 사용하기 좋음(조건을 덜 생각해도 됨)
--주의할점 : 집합 연산에 사용되는 SELECT 문은 SELECT 절이 동일해야함

--UNION은 OR 같은 개념 --> 중복제거
--INTERSECT AND와 같은 개념
--MINUS는 차집합 같은 개념
--UNION ALL은 OR 결과 값에 AND 결과 값이 더해진 값-->중복이 제거되지 않은 채로 합쳐짐

*****************/