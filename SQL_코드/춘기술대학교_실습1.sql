/* 춘 대학교 탐방기 */
--1. 춘 기술대학교 학과 이름과 계열 조회
-- 컬럼명 학과명 계열로 표시

SELECT department_name AS "학과 명", category "계열" 
FROM tb_department;

--2. 학과의 학과 정원을 조회
SELECT DEPARTMENT_NAME  || '의 정원은' || CAPACITY || '명 입니다.'
FROM tb_department;

--3. 국문학과에 다니는 여학생 중에 현재 휴학중인 여학생 조회
--국문학과 코드 DEPARTMENT_NO 001

SELECT * FROM TB_STUDENT;

SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_SSN, 8,   1) = '2'
AND ABSENCE_YN = 'Y'
AND DEPARTMENT_NO = '001';


--4번
--- 도서관에서 대출 도서 장기 연체자들을 찾아 이름 게시하고자 한다.
-----그 대상자들의 학번이 다음과 같을 때 대상자를 찾는 적절한 SQL 쿼리 구문
--A513079, A513090 A513091 A513110 A513119
-- WHERE IN  학생이름 내림차순
--TB_STUDENT
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NAME DESC;

--5 입학 정원이 20명이상 30명 이하인 학과들의 학과 이름과 계열 조회
SELECT DEPARTMENT_NAME, CATEGORY
FROM tb_department
WHERE CAPACITY BETWEEN 20 AND 30;

--6 
-- 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속학과를 가지고  있음
-- 춘 기술 대학교 총장의 이름을 알아낼 수 있는 SQL 문장 작성 총장은 NULL
SELECT * FROM TB_PROFESSOR;

SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE department_no IS NULL ;


--7. 수강신청을 하려고 한다. 선수과목 여부를 확인하는데,
-- 선수과목이 존재하는 과목들은 어떤 과목인지 과목번호 조회
SELECT * FROM TB_CLASS;
SELECT CLASS_NO , CLASS_NAME
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

--8. DISTINCT 활용해서
--춘 대학에는 어떤 카테고리 들이 있는지 조회
SELECT DISTINCT CATEGORY
FROM tb_department
ORDER BY CATEGORY;  --ORDER BY 1;

--9
--영문학과(학과코드 002) 학생들의 학번과 이름, 입학년도를
--입학 년도가 빠른 순으로 표시
--AS "학번" AS"이름" AS"입학년도"
SELECT  STUDENT_NO AS "학번",
                STUDENT_NAME AS "이름",    
                TO_CHAR(ENTRANCE_DATE, 'YYYY-MM-DD') AS "입학년도"
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002'
ORDER BY ENTRANCE_DATE;

--10
--춘 대학교 교수 중 이름이 세 글자가아닌 교수가 두명 있음
--그 교수의 이름과 주민번호 조회 
--FROM TB_PROFESSOR    WHERE LIKE 
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM tb_professor
WHERE professor_name NOT LIKE '___';

--14
-- 춘 기술대학교의 2000년 도 이후 입학자들은 학번이 A로 시작하게되었음
--- 2000년도 이전 학번을 받은 학생들의 학번과 이름 조회
--STUDENT_NO, STUDENT_NAME
--FROM TB_STUDENT
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%';
--15
--학번이 A517178인 한아름 학생의 학점 총 평점 구하기
-- AS 평점 점수 반올림 정수표기

SELECT * FROM TB_GRADE;
SELECT ROUND(AVG(POINT),1) AS "평점"
FROM TB_GRADE
WHERE student_no = 'A517178';

--> 소수점 제거 소수점 몇자리 까지 표기
---> 소수점 1자리까지 표기
----> ROUND(AVG(POINT),1)

--17
-- 지도교수를 배정받지 못한 학생의 수 조회
--TB_STUDENT 에서 COACH_PROFESSOR
SELECT COUNT(*)
FROM TB_STUDENT
WHERE coach_professor_no IS NULL;


--18
--- 학번이 A112113인 김고운 학생의 년도 별 평점
---- 화면 AS 년도 AS 년도 별 평점
----- 점수는 반올림해서 소수점 한자리까지만 표기
SELECT * FROM TB_GRADE;
SELECT SUBSTR(TERM_NO,1,4) AS "년도" , ROUND(AVG(POINT),1) AS "년도 별 평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY 1;

--20
--춘 대학교에 다니는 동명이인 학생들의 이름, 동명인 수 조회
--FROM TB_STUDENT
SELECT STUDENT_NAME AS "동일이름", COUNT(*) AS "동명인 수"
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) >1
ORDER BY 1;

-- 1번
-- 학생이름과 주소지를 조회하시오
-- 단, 출력 헤더는 "학생 이름", "주소지"로 하고, 정렬은 이름으로 오름차순 정렬
SELECT STUDENT_NAME AS"학생이름",STUDENT_ADDRESS AS"주소지"
FROM TB_STUDENT
ORDER BY STUDENT_NAME;
-- 2번
-- 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서 조회하시오.
SELECT*FROM TB_STUDENT;
SELECT STUDENT_NAME AS"학생이름",STUDENT_SSN AS"주민번호"
FROM TB_STUDENT
ORDER BY STUDENT_SSN DESC;
-- 3번
-- 주소지가 강원도나 경기도인 학생들 중 1900년대 학번을 가진 학생들의 
-- 이름과 학번, 주소를 이름 오름차순으로 조회하시오.
-- 단, 출력헤더에는 "학생이름", "학번", "거주지 주소"가 출력되도록 한다.
SELECT STUDENT_NAME AS"학생이름", STUDENT_NO AS"학번",STUDENT_ADDRESS AS"거주지주소"
FROM TB_STUDENT
WHERE(STUDENT_ADDRESS LIKE '강원%'OR
STUDENT_ADDRESS LIKE'경기도%')
AND STUDENT_NO NOT LIKE 'A%' 
ORDER BY "학생이름";
-- 4번
-- 현재 법학과 교수의 이름, 주민등록 번호를 나이가 많은 순서부터 조회하시오.
SELECT*FROM TB_PROFESSOR;
SELECT PROFESSOR_NAME AS"이름",PROFESSOR_SSN AS"주민등록번호"
FROM TB_PROFESSOR
WHERE department_no=005
ORDER BY PROFESSOR_SSN;
-- ANSI
-- ORACLE

-- 5번
-- 2004년 2학기에 'C3118100' 과목을 수강한 학생들의 학점을 조회하려고 한다. 
-- 학점이 높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 조회하시오.
-- (참고) 소수점 아래 2자리까지 0으로 표현 : TO_CHAR(NUMBER, 'FM9.00')
-- (FM : 조회 결과 양쪽 공백 제거)
SELECT * FROM tb_class_professor;
SELECT STUDENT_NAME,
FROM TB_GRADE
WHERE STUDENT_NO = 'C3118100'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY 1;

-- 6번
-- 학생 번호, 학생 이름, 학과 이름을 학생 이름 오름차순으로 조회하시오.

-- ANSI
-- ORACLE


-- 7번
-- 춘 기술대학교의 과목 이름, 해당 과목을 수업하는 학과 이름을 조회하시오.

-- ANSI
-- ORACLE



-- 8번
-- 과목, 해당 과목 교수 이름을 조회하시오.
-- TB_CLASS_PROFESSOR : 과목별 교수의 정보를 저장한 테이블(과목 코드, 학과 코드)

-- ANSI
-- TB_CLASS와  TB_PROFESSOR 테이블이 공통으로
-- DEPARTMENT_NO 컬럼을 가지고 있다 해서 이를 이용해서 JOIN을 하면 안됨!
-- ORACLE


-- 9번
-- 8번의 결과 중 '인문 사회' 계열에 속한 과목명, 교수이름을 과목명 오름차순으로 조회하시오.

-- ANSI
-- ORACLE

                        
-- 10번
-- 음악학과 학생들의 "학번", "학생 이름", "전체 평점"을 조회하시오.
-- (단, 평점은 소수점 1자리까지만 반올림하여 표시한다.)

-- ANSI
-- ORACLE


-- 11번
-- 학번이 A313047인 학생의 학과이름, 학생이름, 지도교수 이름을 조회하시오.

-- ANSI
-- ORACLE


-- 12번
-- 2007년도에 '인간관계론' 과목을 수강한 학생을 찾아 
-- 학생이름과 수강학기를 조회하는 SQL을 작성하시오.

-- ANSI
-- ORACLE


-- 13번
-- 예체능 계열 과목 중 과목 담당교수를 한 명도 배정받지 못한 과목을 찾아 
-- 과목 이름, 학과 이름을 조회하시오.

-- ANSI
-- ORACLE

-- 14번
-- 춘 기술대학교 서반아어학과 학생들의 지도교수를 게시하고자 한다. 
-- 학생이름, 지도교수이름 학번이 높은 순서로 조회하는 SQL을 작성하시오.
-- 단, 지도교수가 없을 경우 "지도교수 미지정"으로 표시

-- ANSI
-- ORACLE


-- 15번
-- 휴학생이 아닌 학생 중 평점이 4.0 이상인 학생을 찾아 
-- 학생의 학번, 이름, 학과, 이름, 평점을 조회하시오.

-- ANSI
-- ORACLE



-- 16번
-- 환경조경학과 전공과목들의 과목 별 평점을 조회하시오.
-- (평점은 TRUNC를 이용해 소수점 아래 둘째 자리까지 표시)
-- ANSI

-- ORACLE


-- 17번
-- 춘 기술대학교에 다니고 있는 최경희 학생과 같은 과 학생들의 이름과 주소를 조회하시오.
       
  
-- 18번
-- 국어국문학과에서 총 평점이 가장 높은 학생의 이름과 학번을 조회하시오


-- 19번
-- 춘 기술대학교의 "환경조경학과"가 속한 같은 계열 학과들의 
-- 학과 별 전공과목 평점을 파악하기 위한 적절한 SQL문을 작성하시오
-- 단, 출력헤더는 "계열 학과명", "전공평점"으로 표시되도록 하고, 
-- 평점은 소수점 첫째자리까지만 반올림하여 표시

-- ANSI
-- ORACLE


