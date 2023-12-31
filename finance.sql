PGDMP      6    0                {            finance    14.5    14.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16487    finance    DATABASE     g   CREATE DATABASE finance WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Kazakh_Kazakhstan.utf8';
    DROP DATABASE finance;
                postgres    false                       0    0    finance    DATABASE PROPERTIES     -   ALTER DATABASE finance CONNECTION LIMIT = 1;
                     postgres    false            �            1255    24772 a   add_operation(integer, character varying, numeric, character varying, integer, character varying) 	   PROCEDURE     u  CREATE PROCEDURE public.add_operation(IN p_user_id integer, IN p_cat character varying, IN p_summ numeric, IN p_comm character varying, IN p_incfl integer DEFAULT 0, IN p_desc character varying DEFAULT ''::character varying)
    LANGUAGE plpgsql
    AS $$
declare
	v_cnt integer;
	v_id  integer;
begin
	select count(*) into v_cnt from category where code=p_cat;
	if v_cnt = 0 then
		insert into category(incomefl, code,descr) values(p_incfl, p_cat, p_desc);
	end if;
	select id into v_id from category where code=p_cat; 
	insert into operations(user_id, category_id, comment,summ) values(p_user_id, v_id, p_comm,p_summ);
end;$$;
 �   DROP PROCEDURE public.add_operation(IN p_user_id integer, IN p_cat character varying, IN p_summ numeric, IN p_comm character varying, IN p_incfl integer, IN p_desc character varying);
       public          postgres    false            �            1255    24751    add_user_ctg()    FUNCTION     �  CREATE FUNCTION public.add_user_ctg() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
insert into user_categories(user_id,category_id)
values  (NEW.id, 1),
	    (NEW.id, 2),
		(NEW.id, 3),
	    (NEW.id, 4),
		(NEW.id, 5),
	    (NEW.id, 6),
		(NEW.id, 7),
	    (NEW.id, 8),
		(NEW.id, 9),
		(NEW.id, 10),
	    (NEW.id, 11),
		(NEW.id, 12),
	    (NEW.id, 13);
		return new;
END;
$$;
 %   DROP FUNCTION public.add_user_ctg();
       public          postgres    false            �            1255    24748    add_user_ctg(integer)    FUNCTION     {  CREATE FUNCTION public.add_user_ctg(u_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
insert into user_categories(user_id,category_id)
values  (u_id, 1),
	    (u_id, 2),
		(u_id, 3),
	    (u_id, 4),
		(u_id, 5),
	    (u_id, 6),
		(u_id, 7),
	    (u_id, 8),
		(u_id, 9),
		(u_id, 10),
	    (u_id, 11),
		(u_id, 12),
	    (u_id, 13);
		commit;
	return 1;
END;
$$;
 1   DROP FUNCTION public.add_user_ctg(u_id integer);
       public          postgres    false            �            1255    24750    add_user_ctg_prc() 	   PROCEDURE     �  CREATE PROCEDURE public.add_user_ctg_prc()
    LANGUAGE plpgsql
    AS $$
begin
insert into user_categories(user_id,category_id)
values  (NEW.user_id, 1),
	    (NEW.user_id, 2),
		(NEW.user_id, 3),
	    (NEW.user_id, 4),
		(NEW.user_id, 5),
	    (NEW.user_id, 6),
		(NEW.user_id, 7),
	    (NEW.user_id, 8),
		(NEW.user_id, 9),
		(NEW.user_id, 10),
	    (NEW.user_id, 11),
		(NEW.user_id, 12),
	    (NEW.user_id, 13);
		commit;
END;
$$;
 *   DROP PROCEDURE public.add_user_ctg_prc();
       public          postgres    false            �            1259    24725    category    TABLE     �   CREATE TABLE public.category (
    id integer NOT NULL,
    incomefl integer DEFAULT 0 NOT NULL,
    code character varying(100) NOT NULL,
    descr character varying(1000)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    24736    category_id_seq    SEQUENCE     �   ALTER TABLE public.category ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210            �            1259    24754 
   operations    TABLE     �   CREATE TABLE public.operations (
    op_id integer NOT NULL,
    user_id integer NOT NULL,
    category_id integer NOT NULL,
    comment character varying(1000),
    summ numeric
);
    DROP TABLE public.operations;
       public         heap    postgres    false            �            1259    24753    operations_op_id_seq    SEQUENCE     �   ALTER TABLE public.operations ALTER COLUMN op_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.operations_op_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    24733    user_categories    TABLE     V   CREATE TABLE public.user_categories (
    user_id integer,
    category_id integer
);
 #   DROP TABLE public.user_categories;
       public         heap    postgres    false            �            1259    16488    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    fullname character varying(500),
    log_date date,
    nickname character varying(100)
);
    DROP TABLE public.users;
       public         heap    postgres    false                      0    24725    category 
   TABLE DATA           =   COPY public.category (id, incomefl, code, descr) FROM stdin;
    public          postgres    false    210   �&       	          0    24754 
   operations 
   TABLE DATA           P   COPY public.operations (op_id, user_id, category_id, comment, summ) FROM stdin;
    public          postgres    false    214   �'                 0    24733    user_categories 
   TABLE DATA           ?   COPY public.user_categories (user_id, category_id) FROM stdin;
    public          postgres    false    211   �'                 0    16488    users 
   TABLE DATA           A   COPY public.users (id, fullname, log_date, nickname) FROM stdin;
    public          postgres    false    209   B(                  0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 13, true);
          public          postgres    false    212                       0    0    operations_op_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.operations_op_id_seq', 3, true);
          public          postgres    false    213            q           2606    24732    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    210            s           2606    24758    operations operations_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.operations
    ADD CONSTRAINT operations_pkey PRIMARY KEY (op_id);
 D   ALTER TABLE ONLY public.operations DROP CONSTRAINT operations_pkey;
       public            postgres    false    214            o           2606    16494    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    209            x           2620    24752    users add_user_ctg_tr    TRIGGER     q   CREATE TRIGGER add_user_ctg_tr AFTER INSERT ON public.users FOR EACH ROW EXECUTE FUNCTION public.add_user_ctg();
 .   DROP TRIGGER add_user_ctg_tr ON public.users;
       public          postgres    false    209    217            w           2606    24766     operations operation_fk_category    FK CONSTRAINT     �   ALTER TABLE ONLY public.operations
    ADD CONSTRAINT operation_fk_category FOREIGN KEY (category_id) REFERENCES public.category(id) NOT VALID;
 J   ALTER TABLE ONLY public.operations DROP CONSTRAINT operation_fk_category;
       public          postgres    false    3185    210    214            v           2606    24761    operations operation_fk_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.operations
    ADD CONSTRAINT operation_fk_user FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;
 F   ALTER TABLE ONLY public.operations DROP CONSTRAINT operation_fk_user;
       public          postgres    false    209    3183    214            u           2606    24742 )   user_categories user_category_fk_category    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_categories
    ADD CONSTRAINT user_category_fk_category FOREIGN KEY (category_id) REFERENCES public.category(id) NOT VALID;
 S   ALTER TABLE ONLY public.user_categories DROP CONSTRAINT user_category_fk_category;
       public          postgres    false    211    3185    210            t           2606    24737 &   user_categories user_category_fk_users    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_categories
    ADD CONSTRAINT user_category_fk_users FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;
 P   ALTER TABLE ONLY public.user_categories DROP CONSTRAINT user_category_fk_users;
       public          postgres    false    209    211    3183                 x^eP�N�0����T�ny�ݙ�T��I-�RI"��hʀ�$$�����(���Ĺ��X,����UB���||1�D�����i�K���G?�å�J!���	z�=�j�H�a��e3뜹҂���b;$���t^�ۂdɚ:_��<Ϭ�̽������3K�=C���k��l����	���S�u4I��hޱK��6I�1��m��J��e�:g��b�̤��ؚ�ɷ�����M�7��8[���E�R2���'�?虻<�R����i      	   2   x^3�417�4�075�4�t��,�����2F6�
�p��qqq Q�|         :   x^M͹  ���+���z��:�e�H^yrWD3����p�	���`�l\������         :   x^317�4�075�t��,�H-R�N,.��MJ��4202�5��54�,(�*������ dqu     