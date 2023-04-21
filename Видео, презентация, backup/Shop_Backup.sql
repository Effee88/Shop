--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-04-18 11:33:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 32347)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 32346)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 217 (class 1259 OID 32354)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 32353)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 216
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- TOC entry 219 (class 1259 OID 32361)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL,
    order_number character varying(255)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 32360)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 221 (class 1259 OID 32368)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 32367)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 220
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 223 (class 1259 OID 32377)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 32387)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 32386)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_cart_id_seq OWNER TO postgres;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;


--
-- TOC entry 222 (class 1259 OID 32376)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 3198 (class 2604 OID 32350)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 32357)
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 32364)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 32371)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 32380)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 32390)
-- Name: product_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);


--
-- TOC entry 3368 (class 0 OID 32347)
-- Dependencies: 215
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Мебель');
INSERT INTO public.category (id, name) VALUES (2, 'Одежда');
INSERT INTO public.category (id, name) VALUES (3, 'Бытовая техника');


--
-- TOC entry 3370 (class 0 OID 32354)
-- Dependencies: 217
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (156, '41beb03a-bb67-43d5-a0ce-0637c01db24b.1 (1).jpg', 32);
INSERT INTO public.image (id, file_name, product_id) VALUES (157, 'fc762dcc-b6e4-4ad1-90df-7022a4cb3e20.1.jpg', 32);
INSERT INTO public.image (id, file_name, product_id) VALUES (158, '844c5377-589d-41b0-a31e-78ac96989db5.2.jpg', 32);
INSERT INTO public.image (id, file_name, product_id) VALUES (159, '30f04ae1-503b-41ca-9315-cd58618ca179.3.jpg', 32);
INSERT INTO public.image (id, file_name, product_id) VALUES (160, '45be59e4-075d-4dcd-a070-534c7148e815.4.jpg', 32);
INSERT INTO public.image (id, file_name, product_id) VALUES (161, '179371c2-5551-49c4-89de-15553d132e2c.1.jpg', 33);
INSERT INTO public.image (id, file_name, product_id) VALUES (162, '74452811-0d3a-4c55-8c85-5f42fc1755db.2.jpg', 33);
INSERT INTO public.image (id, file_name, product_id) VALUES (163, 'c1a1c6a4-d43c-41e7-916e-694f37952ad4.3.jpg', 33);
INSERT INTO public.image (id, file_name, product_id) VALUES (164, '42b83995-eaaf-4a3a-a2b0-a8b769fb13a0.4.jpg', 33);
INSERT INTO public.image (id, file_name, product_id) VALUES (165, 'cdb86413-055f-4b43-9851-81ff4356b17a.5.jpg', 33);
INSERT INTO public.image (id, file_name, product_id) VALUES (166, '0e12989b-06d0-4eb0-80a1-b93df9920f86.1 (1).jpg', 34);
INSERT INTO public.image (id, file_name, product_id) VALUES (167, 'a155af7d-984a-4c82-b37d-a8c324219986.2.jpg', 34);
INSERT INTO public.image (id, file_name, product_id) VALUES (168, '248ee1ca-ceb1-4416-ab57-cece5cbf6700.3.jpg', 34);
INSERT INTO public.image (id, file_name, product_id) VALUES (169, '60d4e3c7-385d-4163-ac08-6ac7cd10b755.4.jpg', 34);
INSERT INTO public.image (id, file_name, product_id) VALUES (170, '97dc200f-c8ee-4d5e-a5d1-17a381b019dd.5.jpg', 34);
INSERT INTO public.image (id, file_name, product_id) VALUES (171, 'b149caac-8e9f-48c7-8021-9dd0d3b57132.1.jpg', 35);
INSERT INTO public.image (id, file_name, product_id) VALUES (172, '15d191e7-1b8d-4913-aba6-9ba13d29bdfa.2.jpg', 35);
INSERT INTO public.image (id, file_name, product_id) VALUES (173, 'ced01854-2cad-41e9-a3ca-f993be2f7314.3.jpg', 35);
INSERT INTO public.image (id, file_name, product_id) VALUES (174, '0560303d-95d8-4fcc-a75e-d8c0c9bf4899.4.jpg', 35);
INSERT INTO public.image (id, file_name, product_id) VALUES (175, '7e01093b-cc24-4ff7-a8a2-4426c2f60edc.5.jpg', 35);
INSERT INTO public.image (id, file_name, product_id) VALUES (176, '978b258a-69cb-48a8-af1b-b5d40d712ef5.2.jpg', 36);
INSERT INTO public.image (id, file_name, product_id) VALUES (177, '2e9a65e9-17c9-446a-a8ac-c54d01053854.3.jpg', 36);
INSERT INTO public.image (id, file_name, product_id) VALUES (178, '6d73d212-8ab9-46d3-bdf9-5ddbb0763113.4.jpg', 36);
INSERT INTO public.image (id, file_name, product_id) VALUES (179, '3381954e-1728-46b9-826f-2706ca3bf469.5.jpg', 36);
INSERT INTO public.image (id, file_name, product_id) VALUES (180, 'a8fc1534-89f8-46d7-8c47-3b1b059141cf.5 (1).jpg', 36);
INSERT INTO public.image (id, file_name, product_id) VALUES (181, '21abeaa7-8811-4a39-a5f9-e0219f0e2528.1.jpg', 37);
INSERT INTO public.image (id, file_name, product_id) VALUES (182, 'ed9faea9-e06a-42a2-9422-4ea4a0fe5d43.2.jpg', 37);
INSERT INTO public.image (id, file_name, product_id) VALUES (183, 'fd5c52de-605f-4c84-8c94-62663fb643c0.3.jpg', 37);
INSERT INTO public.image (id, file_name, product_id) VALUES (184, 'c64209e6-083b-42a5-8339-5bdc1e15dd03.4.jpg', 37);
INSERT INTO public.image (id, file_name, product_id) VALUES (185, '596ab7e7-b681-4c80-8d9a-61fd76bc5891.5.jpg', 37);
INSERT INTO public.image (id, file_name, product_id) VALUES (186, 'e6db33d1-44d8-4247-a596-d21bffd4b117.1 (1).jpg', 38);
INSERT INTO public.image (id, file_name, product_id) VALUES (187, '9ffdf2fa-27a1-42b3-a075-8e9fb41caa9a.2.jpg', 38);
INSERT INTO public.image (id, file_name, product_id) VALUES (188, '5229a395-af71-4a6e-89e2-45c9919bac34.3.jpg', 38);
INSERT INTO public.image (id, file_name, product_id) VALUES (189, 'edd9a6df-f8f5-4402-80f5-6dfb510bb802.4.jpg', 38);
INSERT INTO public.image (id, file_name, product_id) VALUES (190, '8fa6365c-9091-46db-a897-955d21feb975.5.jpg', 38);
INSERT INTO public.image (id, file_name, product_id) VALUES (191, '1089f874-0a78-4df4-b570-71b68dd03841.1 (1).jpg', 39);
INSERT INTO public.image (id, file_name, product_id) VALUES (192, '1768bf07-48ba-4300-9104-2f02b42ce5b6.1.jpg', 39);
INSERT INTO public.image (id, file_name, product_id) VALUES (193, 'a0bfdd42-a5d2-44d7-aec9-0ca7edc12f74.2 (1).jpg', 39);
INSERT INTO public.image (id, file_name, product_id) VALUES (194, '80636445-0e65-446f-8029-6eed7ee8634c.2.jpg', 39);
INSERT INTO public.image (id, file_name, product_id) VALUES (195, 'b1cf82d5-a468-4dab-90f0-37e96f81cf4e.3.jpg', 39);
INSERT INTO public.image (id, file_name, product_id) VALUES (196, 'a6a77bb5-7279-4683-b473-e6333175b16b.1 (2).jpg', 40);
INSERT INTO public.image (id, file_name, product_id) VALUES (197, '622bb7cc-b102-4350-83d7-b5686e148b48.2.jpg', 40);
INSERT INTO public.image (id, file_name, product_id) VALUES (198, '5f5c6a03-f8fe-4633-9960-dda53ed564ad.3.jpg', 40);
INSERT INTO public.image (id, file_name, product_id) VALUES (199, 'c76cd934-91b4-47aa-abb1-d02b860e255b.4.jpg', 40);
INSERT INTO public.image (id, file_name, product_id) VALUES (200, 'a04d8aa4-acec-4fe4-85d8-36638eeebe91.5.jpg', 40);
INSERT INTO public.image (id, file_name, product_id) VALUES (141, '00cff21f-d32b-4f84-80e2-49fd51e67840.1 (1).jpg', 29);
INSERT INTO public.image (id, file_name, product_id) VALUES (142, 'd493406f-984c-4116-a19b-08e4ddb391d5.2.jpg', 29);
INSERT INTO public.image (id, file_name, product_id) VALUES (143, '5ef45efe-e630-4ee2-a254-3cac31548c97.3.jpg', 29);
INSERT INTO public.image (id, file_name, product_id) VALUES (144, '83044d59-b96d-4fd9-a02f-4a289c428cd8.4.jpg', 29);
INSERT INTO public.image (id, file_name, product_id) VALUES (145, '33c61759-b780-4128-b3fd-70da7a9a16c3.5.jpg', 29);
INSERT INTO public.image (id, file_name, product_id) VALUES (146, '69ab4b15-a8cf-44b9-a2a5-b50c8330df3f.1.jpg', 30);
INSERT INTO public.image (id, file_name, product_id) VALUES (147, 'e0b01e9d-132d-40cf-aa8c-08c34255a43b.2.jpg', 30);
INSERT INTO public.image (id, file_name, product_id) VALUES (148, '8833f8c6-0aba-4f6b-ab71-f83b00ac9bc7.3.jpg', 30);
INSERT INTO public.image (id, file_name, product_id) VALUES (149, '83d2674f-661b-4bcd-9620-2f4a197136d7.4.jpg', 30);
INSERT INTO public.image (id, file_name, product_id) VALUES (150, '84885006-557c-4442-a1bb-205deb0d0348.5.jpg', 30);
INSERT INTO public.image (id, file_name, product_id) VALUES (151, 'de0fa631-2f37-4386-bff4-f03d1954b72b.1.jpg', 31);
INSERT INTO public.image (id, file_name, product_id) VALUES (152, '6740753b-3a57-4fc4-9a10-aea22faae7bf.3.jpg', 31);
INSERT INTO public.image (id, file_name, product_id) VALUES (153, '931ebeec-061b-4350-b2a9-0561dd90cc0a.4.jpg', 31);
INSERT INTO public.image (id, file_name, product_id) VALUES (154, 'e3589c89-66b2-4de8-a9df-1904c0483739.5.jpg', 31);
INSERT INTO public.image (id, file_name, product_id) VALUES (155, '4460351c-be43-43e5-8076-8c7f8d6c27a3.2.jpg', 31);


--
-- TOC entry 3372 (class 0 OID 32361)
-- Dependencies: 219
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id, order_number) VALUES (50, 1, '2023-04-18 11:26:16.926014', 'ac063b50-dd7d-48fb-83df-4775e0f64106', 51472, 2, 2, 39, NULL);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id, order_number) VALUES (51, 1, '2023-04-18 11:26:23.708993', 'c9f264ca-5217-4d23-8ede-3f0c2dca045d', 12952, 2, 2, 34, NULL);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id, order_number) VALUES (49, 1, '2023-04-18 11:26:08.51109', '02ca1f19-68a1-414f-8a08-bedbee5046aa', 41790, 1, 2, 32, NULL);


--
-- TOC entry 3374 (class 0 OID 32368)
-- Dependencies: 221
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (1, 'admin', '$2a$10$3Wp7mY3UhE/fDs64Fz6CmulT1lctqIWyA9Jb/EgbJNCLIwV5Op63u', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (2, 'user1', '$2a$10$F5a70g3jsuRK51wlC47qBOFyxgx.fBwDfjaoWA1iBV3mBOH1d7k8u', 'ROLE_USER');


--
-- TOC entry 3376 (class 0 OID 32377)
-- Dependencies: 223
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (37, '2023-04-18 11:08:07.475751', 'Комоды и тумбы - важные элементы мебели, без которых не обходятся ни один дом или квартира. Комод с ящиками будет уместен везде: спальня, гостиная, детская, кухня, ванная, прихожая, офис. Вы можете использовать широкий большой комод для хранения вещей, для сувениров, для цветов, для одежды, для обуви, для косметики. Наши покупатели часто отдают предпочтение данной модели, когда выбирают мебель для прихожей или мебель в гостиную, когда ищут комод под телевизор или комод для игрушек с ящиками. В последнее время комоды популярно ставить парно получается комод двойной. Если использовать комод с зеркалом, то получится идеальный туалетный стол. ', 2699, 'LETTA', 'LETTA Комод деревянный для вещей узкий', 'Коледино', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (38, '2023-04-18 11:09:23.567689', 'Компьютерное игровое (геймерское) офисное кресло Helmi HL-S02 Virage – представитель линейки кресел, стилизованных под сиденье спортивных автомобилей. Стремительная форма спинки и элементы цвета «металлик» с контрастными вставками дополняют сходство с передовыми дизайнами автомобильных интерьеров. Максимальная нагрузка составляет 120 кг. Газпатрон 3 класса по стандарту DIN EN 16955. Каркас – немонолитный, материал набивки – вспененный полиуретан, крестовина – пластиковая, подлокотники – пластиковые, материал обивки – ткань/экокожа чёрного цвета с серыми вставками кантом.', 6968, 'Аралкин Н. Ю.', 'Helmi Кресло игровое', 'Ростов', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (39, '2023-04-18 11:11:31.095965', 'Молниеносная скорость загрузки благодаря сверхскоростному накопителю SSD, невероятный эффект погружения благодаря тактильной отдаче, адаптивным спусковым кнопкам и 3D-звуку, а также потрясающие игры нового поколения для PlayStation. Испытайте мощь нового ЦП, графического процессора и SSD с особой встроенной системой ввода и вывода, которые переворачивают представления о возможностях PlayStation. Сверхскоростной накопитель SSD - расширение игровых возможностей благодаря молниеносной загрузке установленных на PS5 игр.', 51472, 'WILDBERRIES', 'PlayStation Игровая консоль PlayStation 5 825 ГБ', 'Ростов', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (40, '2023-04-18 11:16:45.538129', 'УВАЖАЕМЫЕ ПОКУПАТЕЛИ! РАЗМЕРНАЯ СЕТКА НАШИХ ДЖИНС НАХОДИТСЯ В ФОТОЛЕНТЕ. ЗАКАЗЫВАЙТЕ, ПОЖАЛУЙСТА, ДЖИНСЫ ОРИЕНТИРУЯСЬ НА РАЗМЕРНУЮ СЕТКУ В ФОТОЛЕНТЕ Джинсы с высокой посадкой из премиального хлопка от бренда Bronks представлены в классических цветах денима: черном, голубом, синем, белом, светло - голубом. Стильная трендовая модель выполнена в фасоне мом (mom) с завышенной посадкой, это прямые баллоны и багги, бойфренды и бананы, американки и слоучи. Удачный состав (хлопок 92%, полиэстер 6%, спандекс 2%) с полиэфирным волокном и спандексом делает эту модель эластичной и стрейчевой, благодаря комфортному крою и удачной посадке модель подчеркивает талию и прекрасно смотрится на любой фигуре.', 2926, 'WILDBERRIES', 'Bronks Джинсы женские с высокой посадкой', 'Ростов', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (36, '2023-04-18 11:30:05', 'Столик журнальный- простое и удобное решение для Вашего дома. Столик для ноутбука прекрасно впишется в любой интерьер, а благодаря компактным размерам подойдет даже для маленькой квартиры. Приставной столик имеет удобные размеры, стильный дизайн, столик для завтрака предназначен для тех, кто любит элегантность, натуральные материалы. Журнальный столик белый заменит стол круглый кухонный, стол компьютерный белый и кофейный столик.Придиванный столик продуман до мелочей под функциональность. ', 3204, 'Детский Магазин', 'Mebstudia Столик журнальный для ноутбука', 'Ростов', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (29, '2023-04-18 10:36:56.763495', 'Куртка мужская весенняя из искусственного меха бренда BANKOL. Одна из главных новинок сезона - мужская демисезонная короткая плюшевая куртка из искусственного меха, имитирующего овчину с длинным рукавом. Если вы ищете повседневную одежду для мужчин без капюшона, cмело заказывайте стильную демисезонную ветровку BANKOL коллекции весна 2023.', 5083, 'BANKOL/SHWЭDAR', 'BANKOL Куртка демисезонная с мехом', 'Коледино', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (30, '2023-04-18 10:41:05.4629', 'Флисовая толстовка на молнии в свободном стиле! Мягкая, комфортная и стильная! Такая одежда всегда в тренде и моде, тк это отличная и удобная одежда на каждый день! Худи для мужчин и для женщин! Плотная и утепленная! Также плюшевая кофта оверсайз отличный выбор для подростков!', 2791, 'XIAZHILIAN', '21problem Толстовка мужская плюшевая', 'Ростов', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (31, '2023-04-18 10:42:58.18788', 'Джинсы на подростка оверсайз с высокой талией подойдут для прогулок, спорта или путешествий. Джинсы для школы, как школьная форма для мальчиков или спортивная одежда для дома (домашняя одежда). Зауженные книзу летние или осение (на осень)', 2973, 'Urban Street', 'Urban Street Джинсы бананы мужские', 'Ростов', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (32, '2023-04-18 10:51:00.004773', 'Модель представлена для международного рынка. Новая система двух камер не оставит никого из ваших друзей за кадром. Самый быстрый процессор iPhone и мощный аккумулятор позволят больше делать и тратить меньше времени на подзарядку. А высочайшее качество видео на iPhone означает, что ваши истории станут еще ярче и детальнее.', 41790, 'WILDBERRIES', 'Apple iPhone 11 64GB (Global)', 'Коледино', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (33, '2023-04-18 10:58:54.514784', 'Модель для рынка СНГ. Проходит предварительную активацию для возможности ввоза в РФ. Корпус Apple iPhone 13 Pro Max выполнен из прочной нержавеющей стали и надежно защищен от пыли и влаги в соответствии со стандартом IP68. В нем установлен мощный процессор A15 Bionic. Этому мобильному устройству любые задачи по плечу, оно быстро запускает ресурсоемкие приложения и поддерживает их стабильную работу.', 52000, 'WILDBERRIES', 'Apple iPhone 13 Pro Max 1TB (СНГ)', 'Ростов', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (34, '2023-04-18 11:02:03.183838', 'Холодильник компактный Midea Ретро решит вопрос с хранением продуктовых припасов в офисе, на даче или в гостинице. Вместительность модели составляет 93 л. Модель оснащена отдельной холодильной камерой с более низкой температурой, регулируемыми ножками. Энергетический класс A+ реализует маленькие расходы электроэнергии. ', 12952, 'WILDBERRIES', 'Midea Холодильник Midea MDRD142SLF Ретро', 'Ростов', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (35, '2023-04-18 11:04:08.835685', 'Настольная варочная панель для дома и дачи. Компактная портативная модель отличается надежностью и простотой эксплуатации. Работа электроплиты основана на принципе индукции, когда нагревается посуда, а не рабочая поверхность. Это позволяет оптимизировать затраты на электроэнергию, снизить риск получения ожогов и значительно облегчает уборку. Еда, случайно попавшая на стеклокерамическое покрытие во время приготовления, не пригорает. Все пятна и загрязнения легко вытираются влажной губкой без механических усилий.', 5185, 'il Monte Official', 'Il Monte Индукционная плита настольная', 'Коледино', 3);


--
-- TOC entry 3378 (class 0 OID 32387)
-- Dependencies: 225
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 216
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 200, true);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 51, true);


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 220
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 16, true);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 186, true);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 40, true);


--
-- TOC entry 3206 (class 2606 OID 32352)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 32359)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 32366)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 32375)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 32392)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 32385)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 32394)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3220 (class 2606 OID 32400)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3222 (class 2606 OID 32410)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3221 (class 2606 OID 32405)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3219 (class 2606 OID 32395)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3223 (class 2606 OID 32420)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3224 (class 2606 OID 32415)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2023-04-18 11:33:47

--
-- PostgreSQL database dump complete
--

