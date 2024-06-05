/******    CREATE TABLE 실습  ******/

--고객 테이블 CUSTOMER
create table coustomer(
CUSTOMER_ID NUMBER(10,0) PRIMARY KEY,
CUSTOMER_NAME VARCHAR2(100) NOT NULL,
CUSTOMER_EMAIL VARCHAR2(100) CONSTRAINT C_E_U UNIQUE,
CUSTOMER_PHONE VARCHAR2(20),
CUSTOMER_ADDRESS VARCHAR2(255),

CONSTRAINT C_P_UIQUE UNIQUE(CUSTOMER_PHONE)
);
COMMENT ON COLUMN coustomer.CUSTOMER_ID  IS '고객아이디'; -- 주석작성
COMMENT ON COLUMN coustomer.CUSTOMER_NAME  IS '고객이름'; -- 주석작성
COMMENT ON COLUMN coustomer.CUSTOMER_EMAIL  IS '고객이메일'; -- 주석작성
COMMENT ON COLUMN coustomer.CUSTOMER_PHONE  IS '고객핸드폰번호'; -- 주석작성
COMMENT ON COLUMN coustomer.CUSTOMER_ADDRESS  IS '고객주소'; -- 주석작성
/*
ORA-01780: string literal required
01780. 00000 -  "string literal required"
-> 큰 따옴표 문제

오류 보고 -
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"

->테이블이름에 큰 따옴표를 넣어도 문제가 없지만
큰 따옴표 같은 경우 대소문자를 구분하는 명칭이 적혀있기 때문에 에러가 발생할 수 있음
*/


COMMIT;



-- PRODUCT 테이블 생성
CREATE TABLE PRODUCT (
PRODUCT_ID NUMBER(10,0) CONSTRAINT P_I_P PRIMARY KEY, 
PRODUCT_NAME VARCHAR2(100) NOT NULL,
PRODUCT_PRICAE NUMBER(10,2) NOT NULL,
PRODUCT_DESC VARCHAR2(200) CONSTRAINT P_D_U UNIQUE
);
COMMIT;
-- PRODUCT 값 추가
INSERT INTO PRODUCT
VALUES (1, '아메리카노', 3000, '신선한 원두로 만든 아메리카노');
INSERT INTO PRODUCT
VALUES (2, '카페라떼', 2500, '부드러운 우유가 들어간 라떼');
INSERT INTO PRODUCT
VALUES (3,'카푸치노',3500, '진한 커피와 거품이 어우러진 카푸치노');
INSERT INTO PRODUCT
VALUES (4, '카라멜 마키아토', 4000, '달콤한 카라멜 시럽이 들어간 마키아토');

COMMIT;

-- FOOD_COMPANY TABLE 생성
CREATE TABLE FOOD_COMPANY (
    COMPANY_ID              NUMBER(10,0) PRIMARY KEY,   --회사 ID 기본키
    COMPANY_NAME        VARCHAR2(100) NOT NULL,     -- 회사 이름 (NULL 불가)
    COMPANY_ADDRESS  VARCHAR2(255),                        -- 회사 주소
    COMPANY_PHONE      VARCHAR2(20)                           -- 회사 전화번호     
);
--> Table FOOD_COMPANY이(가) 생성되었습니다.


-- SNACKS 테이블 생성
CREATE TABLE SNACKS (
SNACK_ID NUMBER(10,0) PRIMARY KEY, -- 과자 ID (기본키)
SNACK_NAME VARCHAR2(100) NOT NULL, -- 과자 이름 (NULL 불가)
PRICE NUMBER(10, 2) NOT NULL, --가격(NULL 불가)
COMPANY_ID NUMBER(10,0),  -->  핵심 포인트

CONSTRAINT FK_COMPANY FOREIGN KEY (COMPANY_ID)
REFERENCES FOOD_COMPANY(COMPANY_ID)
ON DELETE CASCADE -- 부모 삭제시 자식까지 삭제해줘
);
--> ORA-00904: COMPANY_ID NUMBER(10,0),  -->  핵심 포인트

----> 부모에서 COMPANY_ID 자식에서도 COMPANY_ID 써야하느냐? 아닙니다!

-- SNACKS 테이블 생성
CREATE TABLE SNACKS1 (
SNACK_ID NUMBER(10,0) PRIMARY KEY, -- 과자 ID (기본키)
SNACK_NAME VARCHAR2(100) NOT NULL, -- 과자 이름 (NULL 불가)
PRICE NUMBER(10, 2) NOT NULL, --가격(NULL 불가)
CCCCCCCCC    NUMBER(10,0),  -->  핵심 포인트

CONSTRAINT FK_COMPANY1 FOREIGN KEY (CCCCCCCCC)
REFERENCES FOOD_COMPANY(COMPANY_ID)
ON DELETE CASCADE -- 부모 삭제시 자식까지 삭제해줘
);


-- SNACKS 테이블 생성
CREATE TABLE SNACKS2 (
SNACK_ID NUMBER(10,0) PRIMARY KEY, -- 과자 ID (기본키)
SNACK_NAME VARCHAR2(100) NOT NULL, -- 과자 이름 (NULL 불가)
PRICE NUMBER(10, 2) NOT NULL, --가격(NULL 불가)
AAAAAA    NUMBER(10,0),  -->  핵심 포인트

CONSTRAINT FK_COMPANY2 FOREIGN KEY (AAAAAA)
REFERENCES FOOD_COMPANY(COMPANY_ID)
ON DELETE CASCADE -- 부모 삭제시 자식까지 삭제해줘
);

-- SNACKS 테이블 생성
CREATE TABLE SNACKS3 (
SNACK_ID NUMBER(10,0) PRIMARY KEY, -- 과자 ID (기본키)
SNACK_NAME VARCHAR2(100) NOT NULL, -- 과자 이름 (NULL 불가)
PRICE NUMBER(10, 2) NOT NULL, --가격(NULL 불가)
ABCDEF    NUMBER(10,0),  -->  핵심 포인트

CONSTRAINT FK_COMPANY3 FOREIGN KEY (ABCDEF)
REFERENCES FOOD_COMPANY(COMPANY_ID)
ON DELETE CASCADE -- 부모 삭제시 자식까지 삭제해줘
);

--> ABCDEF  FOREIGN KEY 키를 참조할 변수명
---> 참조할 변수명   FK_COMPANY3 규칙명 작성해주는데 규칙명은 모든 테이블 합쳐서 동일한 이름을 쓸 수 없음



--테이블 생성 DRINK_COMPANY (
    -- DRINK_ID NUMBER 10, 0   기본키
    -- DRINK_NAME   VARCHER2(100) NOT NULL
    -- DRINK_ADDRESS VARCHER2 (255)
    -- DRINK_PHONE VARCHER2(20)
    

-- 테이블 생성 SOFTS (
    SOFTS_ID NUMBER(10,0) 기본키
    SOFTS_NAME VARCHAR2(100) 널 불가
    PRICE   NUMBER 10,2   NULL 불가
    
    COMPANY_ID NUMBER (10,0) --회사 ID
    부모삭제시 자식 삭제하는 FOREIGN KEY 생성  외래키 이름 : DK_COMPANY

--DRINK_COMPANY
--1, '고가콜라', '서울시 강남구', '02-1234-5678'
--2, '뱁시', '서울시 중구', '02-8765-4321'

--SOFTS
--1, '콜라', 1500, 1
--2, '사이다', 1200, 1
--3, '벱시콜라', 1000, 2
--4, '마운틴듀오', 2000, 2
)