--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-04-09 10:26:16

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

INSERT INTO public.image (id, file_name, product_id) VALUES (21, 'f321dbd3-5e53-4481-ac73-ff5c7a7171d5.1.jpeg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, '7d21e9ae-3796-4c23-bd72-f821f69d3944.2.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, '9a0b1688-5450-47fb-863d-5ea2e7e85c93.3.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, '8d7a9721-9a63-46bc-bc18-9a3b0e7604b3.4.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, '04e97296-0e79-4956-92ac-4c076f513af9.5.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, '07321854-c92e-43c9-82e8-39f32bee4c41.1.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, '8559683b-fc9f-498f-b563-53366ff4e450.2.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, '5a8ad8d7-04c1-4b20-960d-a5f0272e07fe.3.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, 'd63674b7-a848-4ebe-a2a7-b537f5bf9a0d.4.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, '6e276f6c-5ba2-429d-afb1-d2b938c50311.5.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, '7f101293-a8b5-466e-bcc5-636cb1c13cc8.1.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, '8e54edf9-a498-40c9-8b95-d6c5ec12c495.2.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, '2b10c789-715e-4024-9b22-79c226dc55bc.3.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, 'b9e93f8f-c99c-41a5-a74b-e8707377bc8b.4.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, '8dad857e-605f-46d9-acdb-e8c3b8feb6b6.5.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, '31451524-391d-4364-9f9f-6c8f3c2175ac.1 (1).jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, 'c83f7423-316c-4a2b-805d-eb9b4f5383ac.2.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, 'a335500e-34d6-4c28-96ef-09ecd85298c9.3.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, 'cc56dfa8-5bbb-4018-9cf1-a03659ec1287.4.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, 'ed414439-54b2-46af-9d35-8fee4da2a1d6.5.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (41, 'bae735c0-cdc5-4b76-b1e7-ce614816542c.1 .jpeg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (42, '9cd21242-8fed-4b8c-ae72-769e4a90f014.2.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (43, 'a282c416-5a3b-4528-a81b-6d64d0f5b11e.3.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (44, 'e8dc0adf-511d-42ac-b9fc-2ddad57b7595.4.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (45, '56bb8a07-d855-4243-8cbf-f414cb9d0f61.5.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (46, '61b61d47-cb15-49b0-998e-0e60e589bfee.1.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (47, 'ce6df913-144e-4604-8132-0a03cacb34f6.2.jpeg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (48, 'aa9a3558-c3cc-4c40-adc9-f3378287d702.3.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (49, 'a1f943a3-2b09-41cb-b13b-a1ad98298761.4.jpeg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (50, '267d0d9c-ad0b-4419-bccc-9b12e9f12c55.5.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (51, '7fc312e5-e8db-4c3b-bfd3-6c476548035f.1.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (52, '10b2c2dc-92a3-4850-9ec5-704f614cba2f.2.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (53, 'a23a2924-610f-4619-b189-425f6d462882.3.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (54, '41a0512f-758b-4ce5-af32-18fdcdd26f81.4.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (55, 'ee218314-340f-44ff-8238-61509ee37015.5.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (61, '6477d9d5-99a7-4fd4-8981-4ac9aec3730d.2023-04-08_10-07-46.png', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (62, '78f42198-b49c-4837-82c8-8edfa77857f0.2023-04-08_10-08-04.png', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (63, '9b3a32bd-8f7f-477a-bf30-723beb51373f.2023-04-08_10-08-22.png', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (64, '7997c89a-9c7c-44f9-8e5f-4364ac40dd3f.2023-04-08_10-09-17.png', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (65, '071e08c9-8ffb-4de4-870d-89183f2c364d.2023-04-08_10-09-36.png', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (66, 'c61e28bd-eeb6-45c2-8f57-ddb639d043c7.1.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (67, '8e055658-f30d-4e6b-a121-22942410e678.2.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (68, '6fc696c4-7922-4ef0-9533-790f06941a1c.3.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (69, '85410d2c-a394-470e-8933-c3209cee59ac.4.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (70, '58d79642-e01c-4457-a523-c6758446d61b.5.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (71, 'e188fbcf-d5ee-4612-93ea-a15b80c107dd.1.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (72, '648b4180-b428-4fe9-acd1-862c4c129037.2.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (73, 'd2843aed-af51-455a-8d5f-b9e85efd0450.3.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (74, '172a2b60-421a-4568-bb5c-6dde9a2773ff.4.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (75, 'ea7e6a71-04b8-4f12-8cd0-8a491dc98c9f.5.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (81, '3e68736d-13f7-4787-9850-b8d250a2c65b.', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (82, 'e6848b64-570a-47e8-bf6a-71be1d6724b2.', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (83, 'd6075d3b-8131-4786-bda5-f6d9276b3c7b.', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (84, '12e1987c-1e52-4e09-8078-234914ef464a.', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (85, 'ad2bdca9-5b7f-462d-833d-343091da2bf5.', 17);


--
-- TOC entry 3372 (class 0 OID 32361)
-- Dependencies: 219
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id, order_number) VALUES (17, 1, '2023-04-08 19:19:49.743315', '4893b04e-53d2-4469-aded-3b0da45bfc1e', 17995, 1, 2, 10, NULL);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id, order_number) VALUES (14, 1, '2023-04-08 14:56:40.846', 'f7482745-6531-4ac6-b8dd-729f4433b731', 1350, 1, 3, 6, NULL);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id, order_number) VALUES (9, 1, '2023-04-08 10:17:19.047144', '7e9598c1-dc6e-47bb-b6f5-34055c75aeb8', 42000, 2, 2, 13, NULL);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id, order_number) VALUES (10, 1, '2023-04-08 10:21:06.429235', '22408881-6049-4dc9-b1db-3cf51e7dd673', 33615, 1, 2, 11, NULL);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id, order_number) VALUES (12, 1, '2023-04-08 14:39:48.440407', '782a38b7-54c4-4cb7-bd8a-1c3e00f8ac6e', 11249, 3, 2, 8, NULL);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id, order_number) VALUES (13, 1, '2023-04-08 14:56:26.916482', '574aa029-4465-4506-9d1e-9465705587f6', 42000, 1, 3, 13, NULL);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id, order_number) VALUES (16, 1, '2023-04-08 15:22:48.30773', 'e1211f8d-d2c2-478c-a945-40093c78dc1e', 1350, 2, 2, 6, NULL);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id, order_number) VALUES (15, 1, '2023-04-08 14:57:39.432071', '5108d771-bb23-4372-af29-80f20d0959cb', 1350, 0, 3, 6, NULL);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id, order_number) VALUES (11, 1, '2023-04-08 10:21:17.716674', '8ca56cdd-03ab-4f5b-911b-f460034a632d', 17995, 3, 2, 10, NULL);


--
-- TOC entry 3374 (class 0 OID 32368)
-- Dependencies: 221
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (1, 'admin', '$2a$10$3Wp7mY3UhE/fDs64Fz6CmulT1lctqIWyA9Jb/EgbJNCLIwV5Op63u', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (2, 'user1', '$2a$10$F5a70g3jsuRK51wlC47qBOFyxgx.fBwDfjaoWA1iBV3mBOH1d7k8u', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (3, 'user3', '$2a$10$T0.3z6TY68itAacZUiie6e00wauWHoACTwfG7M0xQEjckTgnxB0Ui', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (4, 'user5', '$2a$10$UmaTeOuyYGZtwkW0BcvtiOzcBndrskfZzQTn6JyPS7napSjX.Nz.e', 'ROLE_ADMIN');


--
-- TOC entry 3376 (class 0 OID 32377)
-- Dependencies: 223
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (8, '2023-04-07 10:55:47.726475', 'Мужская футбольная куртка для тренировок в прохладную погоду. Утепленная модель дополнена стегаными вставками на подкладке и рукавах. Застежка на молнию и глубокий прилегающий капюшон. Современный приталенный крой', 11249, 'ВАЙЛДБЕРРИЗ', 'adidas Куртка', 'Коледино', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (9, '2023-04-07 10:56:42.479507', '5 в 1: Планетарный миксер с 3-мя насадками, Блендер, Мясорубка. Технология SmartMIX - прибор автоматически подбирает оптимальную мощность работы для каждого вида и количества ингредиентов. Технология PROtect+ защита двигателя от перегрева.** Надёжная конструкция со стальными шестернями. Планетарное вращение насадок. Чаша из нержавеющей стали. Объем чаши 5 л. 6 скоростных режимов. Плавная регулировка скорости. Импульсивный режим. Венчик для взбивания. Насадка для смешивания. Крюк для замешивания теста. Крышка чаши для добавления ингредиентов. Мясорубка: 2 диска из нержавеющей стали (5 и 7 мм). Кувшин блендера из высокопрочного стекла объемом 1,5 л.Низкий уровень шума. Система безопасного включения. Защита двигателя от перегрева. Отсек для намотки сетевого шнура. Прорезиненные ножки. Мощность: 1100 Вт.', 10990, 'ВАЙЛДБЕРРИЗ', 'Polaris Планетарный миксер / Кухонная машина PKM 1104, (POLARIS)', 'Коледино', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (10, '2023-04-07 10:57:23.549423', 'Беспроводной ручной портативный пылесос отлично подойдет для уборки различных помещений. В комплекте присутствуют фильтр, вертикальный стакан или контейнер для воды, есть насадки, но набор идет без мешка. Присутствует 3 бака для воды. В одном вода очищается, в другом - хранится в чистом виде, а в третий - поступает грязная. Также есть функция самоочистки пылесоса. И сухая, и влажная уборка с ним станут намного проще и быстрее. Щетка имеет мощный аккумулятор и работает на батарейка. Компактный мобильный пылесос может использоваться как швабра. Моющий прибор хорошо подойдет для уборки шерсти с дивана, чистки ковров, для пыли и грязи, или просто для мытья полов. Мобильный аккумуляторный пылесос очень хороший помощник для дома.', 17995, 'Официальный магазин Polaris', 'Redkey Вертикальный пылесос , моющий пылесос', 'Коледино', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (11, '2023-04-07 10:58:13.64409', 'Новая стиральная машина ATLANT серии INTENSE EXPERT имеет уникальный дизайн, который прекрасно дополнит любой интерьер своим внешним видом. С помощью новых сенсорных технологий достаточно легкого касания для выбора функций и программ. Светодиодные индикаторы и сегментный дисплей машины размещены на панели управления под небольшим углом, что облегчает визуальное восприятие отображаемой информации о работе машины. Благодаря интеллектуальным программам она не только интуитивно понятна в управлении, но и обеспечивает превосходные результаты стирки при низком потреблении воды и электроэнергии. Кроме того, действует увеличенная гарантия 5 лет на двигатель.', 33615, 'ВАЙЛДБЕРРИЗ', 'ATLANT Стиральная машина CMA-80 C 1214-01', 'Коледино', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (13, '2023-04-08 10:10:25.28', 'экран: 6.1" (2532x1170) OLED 60 Гц
память: встроенная 128 ГБ, оперативная 4 ГБ
фото: двойная камера, основная 12 МП
аккумулятор: 3240 мА·ч
процессор: Apple A15 Bionic', 42000, 'Яндекс-Маркет', 'Смартфон apple iphone 13', 'Ростов', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (5, '2023-04-08 10:11:25.280001', 'Размеры (ШхГхВ): 100х38,6х74,6 см Компьютерный стол Софи привлекает своей функциональностью, строгим дизайном и высоким уровнем прочности. Наш стол выполнен в трех цветах поэтому для него найдется место в любой комнате Вашего дома. Может использоваться как детский, компьютерный столик для учебы и отдыха или в кабинет и использовать его как рабочий стол. Вы можете расставить на него косметику и использовать как туалетный столик в спальню. В открытые полочки можно положить не только любимые книги и игрушки, но и различную мелочь для дома. Так же стол отлично впишется в любой офис и станет удобным рабочим местом для сотрудника. Модели обладают стандартной высотой, которая обеспечит вам и вашему ребенку комфортную посадку. Для стола используются сертифицированные, высококачественные ЛДСП, поэтому наша мебель прослужит вам не один год. К набору прилагается подробная инструкция по сборке.', 4000, 'Стендмебель - фабрика мебели', 'Стендмебель Стол письменный Софи СТМ, компьютерный', 'Коледино', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (14, '2023-04-08 12:50:34.257771', 'Размеры (ШхГхВ): 75,2х43х75 см. Комод неотъемлемая часть мебели квартиры или дома. Комод деревянный Ксения станет надежным помощником в хранении вещей. Комод для хранения представлен в нескольких цветах: белый, крафт белый, серый, дуб сонома и бук, что позволит вписать в интерьер комнаты и сочетать с другой мебелью в доме. Комод для вещей идет в двух вариантах: с ручками и без них. Во втором варианте в комоде убраны ручки и удлинен фасад, за который и происходит открывание. Универсальность тумбы позволяет использовать ее, как детскую мебель в комнате вашего ребенка, в четырех больших ящиках поместятся игрушки и вещи. Поставьте его вместе с письменным столом Альянс арт. 100243145 в детской и он станет помощником в хранении учебников, тетрадей и канцелярии. В спальне он выступит как тумба для ТВ. А поставив в прихожей, комод Ксения будет сочетаться с обувницей Грация арт. 114272890 и настенной вешалкой Глория арт. 73452816. Мебельная фабрика «Стендмебель» использует только высококачественные материалы и фурнитуру, мы заботимся о наших покупателях и хотим, чтобы наша мебель прослужила Вам как можно дольше. Мы делаем все возможное, чтобы наша продукция доезжала даже в самые дальние уголки нашей страны целой и радовало Вас, для этого мы упаковываем нашу продукцию в картон, а по периметру укрепляем упаковку пенопластом. Для сборки Вам понадобится отвертка или шуроповерт, ключ шестигранник идет в комплекте. Гарантия: 12 месяцев', 3960, 'Стендмебель - фабрика мебели', 'Стендмебель Комод с ящиками Ксения СТМ для вещей', 'Коледино', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (15, '2023-04-08 12:51:52.564481', 'Размеры (ШхГхВ): 60х25,6х75 смНаша обувница Джулия станет прекрасным решением для удобного хранения обуви в прихожей, создав комфорт и чистоту в Вашем доме. Основное преимущество данной модели - её компактные размеры, позволяющие сэкономить несколько квадратных метров пола прихожей даже небольшой квартиры, обувная полка подойдет для хранения мужской, женской и детской обуви. Благодаря классическому дизайну, универсальности и актуальным цветовым решениям этажерка для обуви отлично дополнит Ваш комплект мебели любого стиля. Обувница в прихожую или как ее еще называют, галошница оснащена изолированной полочкой под аксессуары, которая станет незаменимой для домашних мелочей, ключей, перчаток, шапок, шарфов или предметов по уходу за обувью. В закрытом состоянии используйте её, чтобы поставить сумочку или пакет, положить зонт. Обувница белая, как и другие цвета имеет три наклонные полки для обуви в прихожую общей вместимостью до 9 пар обуви. Обувница для обуви сделана из сертифицированных и высококачественных ЛДСП, поэтому она прослужит Вам не один год. Собрать полки для обуви легко в домашних условиях. К набору прилагается подробная инструкция по сборке. Габаритные размеры обувницы (ШхВхГ) 60х25,6х75 см. Так же предлагаем другие наши товары бренда Стендмебель: Вешалка Глория артикул 73452816, Обувница Дина артикул 73474145, Вешалка Грация-2 артикул 112396129', 2520, 'Стендмебель - фабрика мебели', 'Стендмебель Обувница Джулия СТМ, тумба для обуви', 'Коледино', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (7, '2023-04-07 10:55:08.742', 'Футболка мужская хлопок спортивная однотонная базовая модная свободная пляжная с коротким рукавом. Стильная хлопковая футболка классического кроя - это вещь унисекс, которая подойдет и мужчинам, и женщинам. СОСТАВ: ХЛОПОК 100% ПЛОТНОСТЬ 180 гр/мк в. Молодежная женская и мужская футболка выполнена из плотной хлопковой ткани и имеет круглый вырез горловины. Удлиненная футболка подходит для отдыха, туризма и занятий спортом: фитнеса, йоги, бега и тренировок в зале. В ней можно отправиться на прогулку в город. Базовая футболка вписывается в школьную форму и офисный стиль. Ее можно носить дома или надеть в школу и на работу в офис под пиджак. Трикотажная футболка оптимальна для носки летом. Она является базовой вещью и будет прекрасно сочетаться со всеми вещами в вашем гардеробе, в том числе в стиле оверсайз. Красивая футболка подойдет парням и девушкам любого роста - высоким и невысоким. Ее могут носить взрослые и подростки. В ассортименте большой выбор ярких цветов. Вы можете подарить ее на день рождения любимому мужу, маме, брату или папе. У нас есть акции и распродажи, вы можете купить наши товары в подарок со скидкой!', 338, 'UZcotton', 'UZcotton Футболка мужская хлопок спортивная однотонная базовая', 'Коледино', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (17, '2023-04-08 19:14:27.28063', 'ываыва', 3, 'к3к', 'ВАВЫА', 'Ростов', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (6, NULL, 'Джинсы молодежные на лето и осень - незаменимая вещь современного модного базового мужского гардероба. Удобные и функциональные - эти штаны брюки используются в качестве рабочей одежды, для дома, для спорта, для бега. Разнообразие моделей джинсовых брюк широкое: трубы, бананы, бойфренды, джоггеры, slim, бриджи, мотоджинсы. Особой популярностью пользуются прямые и зауженные к низу классические джинсы со средней и высокой посадкой. В коллекции бренда EREMES представлены синие голубые джинсы для мужчин высокого роста ( до 190 см), отлично сочетаются с рубашкой, толстовкой, худи, пиджаком и водолазкой. Модель штанов классического прямого кроя, застежка молния и шарнирная пуговица, накладные карманы сзади, штаны не зауженные, без флиса. Идеальная посадка обеспечена за счет точных лекал с фабрик Турции. Штаны подойдут обладателям больших размеров и высоким мальчикам подросткам. В них удобно водить автомобиль и мотоцикл. Мужские брюки комфортно носить в летний период. Подарок любимому другу папе. Турецкие джинсы мужские прямые широкие штаны классика брюки для невысоких мужская одежда для мальчиков рваные американки брюки с карманами без утепления скинни осень зима casual слоучи момы из плотного денима skinny с потертостями спортивки оверсайз стрейч светлые узкие молодежные слим большие зимние потертые по бокам больших размеров летние брюки', 1350, 'EREMES', 'Eremes Джинсы мужские прямые классические', 'Коледино', 2);


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

SELECT pg_catalog.setval('public.image_id_seq', 85, true);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 17, true);


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 220
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 4, true);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 39, true);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 17, true);


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


-- Completed on 2023-04-09 10:26:17

--
-- PostgreSQL database dump complete
--

