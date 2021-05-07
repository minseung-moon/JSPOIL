create table oil(
	o_number number(6) not null primary key,
	olikind varchar2(20),
	price number(6)
);

create sequence oilSEQ
start with 1
increment by 1;

insert into oil values (oilSEQ.nextval, '고급 휘발유', 1581);
insert into oil values (oilSEQ.nextval, '휘발유', 1377);
insert into oil values (oilSEQ.nextval, '경유', 1177);
insert into oil values (oilSEQ.nextval, '등유', 695);

create table member(
	m_number number(2) not null primary key,
	name varchar2(20),
	jumin varchar2(15),
	tel1 varchar2(3),
	tel2 varchar2(4),
	tel3 varchar2(4),
	payment varchar2(6),
	card_number varchar2(16),
	membership varchar2(2)
);

create sequence memberSEQ
start with 1
increment by 1;

insert into member values(memberSEQ.nextval, '강서현', '650204-2111111', '010', '1111', '1111', '1', '0000000000001111', '2');
insert into member values(memberSEQ.nextval, '전지선', '661229-2111111', '010', '2222', '2222', '2', null, '2');
insert into member values(memberSEQ.nextval, '김재식', '780809-1111111', '010', '3333', '3333', '1', '0000000000002222', '2');
insert into member values(memberSEQ.nextval, '남진웅', '800719-1111111', '010', '4444', '4444', '2', null, '2');
insert into member values(memberSEQ.nextval, '예준일', '820603-1111111', '010', '5555', '5555', '1', '0000000000003333', '2');
insert into member values(memberSEQ.nextval, '표종식', '830825-2111111', '010', '6666', '6666', '2', null, '1');
insert into member values(memberSEQ.nextval, '전다정', '870504-2111111', '010', '7777', '7777', '1', '0000000000004444', '1');
insert into member values(memberSEQ.nextval, '유채은', '900407-2111111', '010', '8888', '8888', '2', null, '1');
insert into member values(memberSEQ.nextval, '하성욱', '910624-1111111', '010', '9999', '9999', '1', '0000000000005555', '1');

// 1. 카드, 2.현금 // 1.회원, 2.비회원

create table record(
	m_number number(2) not null,
	o_number number(6) not null,
	r_date date,
	r_liter number(6),
	primary key(m_number, o_number)
);

insert into record values(1, 1, '21.04.01', 30);
insert into record values(2, 1, '21.04.02', 40);
insert into record values(3, 2, '21.04.02', 50);
insert into record values(4, 2, '21.04.03', 35);
insert into record values(5, 2, '21.04.03', 20);
insert into record values(6, 3, '21.04.04', 30);
insert into record values(7, 3, '21.04.04', 40);
insert into record values(8, 3, '21.04.05', 60);
insert into record values(9, 4, '21.04.05', 10);

-- select r.r_date, sum(o.price*r.r_liter) from record r inner join oil o on r.o_number = o.o_number group by r.r_date order by r.r_date;