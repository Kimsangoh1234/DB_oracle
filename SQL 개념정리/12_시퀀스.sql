/*SEQUENCE(순서,연속)
- 순차적으로 일정한 간격의 숫자(번호)를 발생시키는 객체
(자동번호생성기)

PK가 지정된 컬럼에 삽입될 값을 생성할 때 SEQUENCE를 이요하면 좋음
EX) 1번째 회원, 2번째 회원, 3번째 회원

[작성법]
CREATE SEQUENCE 시퀀스이름
[START WITH 숫자]--처음발생시킬 시작값 지점, 생략하면 자동으로 1이 기본값으로 설정
[INCREAMENT BY 숫자]--다음 값에 대한 증가값을 설정, 생략하면 자동으로 1씩 증가로 설정
[MAXVALUE 숫자 | NOMAXVALUE] -- 발생시킬 최대값 지정 ex)최대 1000명만 기록하겠다.
[MINVALUE 숫자 | NOMINVALUE] -- 발생시킬 최소값 지정 ex)21번부터 다시 시작하겠다.
[CYCLE|NOCYCLE}--값 순환 여부 지정
[CACHE 바이트크기 |NOCACHE] -- 캐쉬메모리 기본값은 20BYTE 최소값은 2BYTE
    --> 시퀀스의 캐시 메모리는 할당된 크기만큼 미리 다음 값을 생성해 저장해둠
    --> 시퀀스의 호출 시 미리 저장되어진 값들을 가져와 반환하므로 매번 시퀀스를 생성해서 반환하는 것보다 DB속도 향상
    
*사용 방법
시퀀스명.NEXTLVEL : 다음시퀀스 번호 얻어옴
시퀀스명.CURVAL : 현재 시퀀스 번호를 얻어옴
                    주의할 점 : 시퀀스가 생성되자마자 호출할경우 오류 발생
                    -->마지막으로 호출한 NEXTVAL 가 값 반환
*/
--시퀀스 생성(1.TB_TEST 테이블생성2.SEQ_TEST_NO 시퀀스 생성)
CREATE TABLE ETB_TEST(
TEST_NO NUMBER PRIMARY KEY,--ORACLE 지정
TEST_NAME VARCHAR2(30) NOT NULL
);

CREATE SEQUENCE SEQ_TEST_NO
START WITH 100--시작번호100
INCREMENT BY 5 -- NEXTVAL 호출 마다 5씩 즈가
MAXVALUE 150 -- 증가 간으한 최대값 150
NOCACHE       --

---위지정한 내용을 START부터 NORACHE까지 모두 생략 가능
-- SQL에서 설정한 기본값이 자동으로 매겨짐

--TB_TEST 테이블이 