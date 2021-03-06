PGDMP         -                y            postgres    13.4    13.4      ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    13442    postgres    DATABASE     l   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE postgres;
                postgres    false            ?           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3031                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            ?           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            ?            1259    17307    author    TABLE     ?   CREATE TABLE public.author (
    id character varying(8) NOT NULL,
    name character varying(20),
    num_books numeric(5,0)
);
    DROP TABLE public.author;
       public         heap    postgres    false            ?            1259    17302    banking_account    TABLE     ?   CREATE TABLE public.banking_account (
    id character varying(10) NOT NULL,
    balance numeric(15,2),
    branch_name character varying(20),
    city character varying(30)
);
 #   DROP TABLE public.banking_account;
       public         heap    postgres    false            ?            1259    17324    book    TABLE       CREATE TABLE public.book (
    id character varying(5) NOT NULL,
    publisher_id character varying(8) NOT NULL,
    author_id character varying(8) NOT NULL,
    book_name character varying(15),
    genre character varying(15),
    num_pages numeric(4,0),
    price numeric(5,2)
);
    DROP TABLE public.book;
       public         heap    postgres    false            ?            1259    17297 	   main_user    TABLE     ?  CREATE TABLE public.main_user (
    id character varying(5) NOT NULL,
    name character varying(20),
    b_street_name character varying(20),
    b_postal_code character varying(6),
    b_province character varying(15),
    b_country character varying(30),
    street_name character varying(20),
    postal_code character varying(6),
    province character varying(15),
    country character varying(30)
);
    DROP TABLE public.main_user;
       public         heap    postgres    false            ?            1259    17312 	   publisher    TABLE     m  CREATE TABLE public.publisher (
    id character varying(8) NOT NULL,
    name character varying(20),
    street_name character varying(20),
    postal_code character varying(6),
    province character varying(15),
    country character varying(30),
    email character varying(30) NOT NULL,
    phone character varying(20),
    banking_id character varying(10)
);
    DROP TABLE public.publisher;
       public         heap    postgres    false            ?            1259    17341 
   user_order    TABLE     ?   CREATE TABLE public.user_order (
    id character varying(5) NOT NULL,
    book_id character varying(5),
    warehouse character varying(20)
);
    DROP TABLE public.user_order;
       public         heap    postgres    false            ?          0    17307    author 
   TABLE DATA           5   COPY public.author (id, name, num_books) FROM stdin;
    public          postgres    false    203    &       ?          0    17302    banking_account 
   TABLE DATA           I   COPY public.banking_account (id, balance, branch_name, city) FROM stdin;
    public          postgres    false    202   ?&       ?          0    17324    book 
   TABLE DATA           _   COPY public.book (id, publisher_id, author_id, book_name, genre, num_pages, price) FROM stdin;
    public          postgres    false    205   '       ?          0    17297 	   main_user 
   TABLE DATA           ?   COPY public.main_user (id, name, b_street_name, b_postal_code, b_province, b_country, street_name, postal_code, province, country) FROM stdin;
    public          postgres    false    201   ?'       ?          0    17312 	   publisher 
   TABLE DATA           t   COPY public.publisher (id, name, street_name, postal_code, province, country, email, phone, banking_id) FROM stdin;
    public          postgres    false    204   ?(       ?          0    17341 
   user_order 
   TABLE DATA           <   COPY public.user_order (id, book_id, warehouse) FROM stdin;
    public          postgres    false    206   ?)       :           2606    17311    author author_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.author DROP CONSTRAINT author_pkey;
       public            postgres    false    203            8           2606    17306 $   banking_account banking_account_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.banking_account
    ADD CONSTRAINT banking_account_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.banking_account DROP CONSTRAINT banking_account_pkey;
       public            postgres    false    202            @           2606    17330    book book_id_key 
   CONSTRAINT     I   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_id_key UNIQUE (id);
 :   ALTER TABLE ONLY public.book DROP CONSTRAINT book_id_key;
       public            postgres    false    205            B           2606    17328    book book_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id, publisher_id, author_id);
 8   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pkey;
       public            postgres    false    205    205    205            6           2606    17301    main_user main_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.main_user
    ADD CONSTRAINT main_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.main_user DROP CONSTRAINT main_user_pkey;
       public            postgres    false    201            <           2606    17318    publisher publisher_id_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_id_key UNIQUE (id);
 D   ALTER TABLE ONLY public.publisher DROP CONSTRAINT publisher_id_key;
       public            postgres    false    204            >           2606    17316    publisher publisher_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (id, email);
 B   ALTER TABLE ONLY public.publisher DROP CONSTRAINT publisher_pkey;
       public            postgres    false    204    204            D           2606    17345    user_order user_order_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_order
    ADD CONSTRAINT user_order_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.user_order DROP CONSTRAINT user_order_pkey;
       public            postgres    false    206            G           2606    17336    book book_author_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.author(id);
 B   ALTER TABLE ONLY public.book DROP CONSTRAINT book_author_id_fkey;
       public          postgres    false    2874    205    203            F           2606    17331    book book_publisher_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_publisher_id_fkey FOREIGN KEY (publisher_id) REFERENCES public.publisher(id);
 E   ALTER TABLE ONLY public.book DROP CONSTRAINT book_publisher_id_fkey;
       public          postgres    false    205    204    2876            E           2606    17319 #   publisher publisher_banking_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_banking_id_fkey FOREIGN KEY (banking_id) REFERENCES public.banking_account(id);
 M   ALTER TABLE ONLY public.publisher DROP CONSTRAINT publisher_banking_id_fkey;
       public          postgres    false    202    204    2872            I           2606    17356 "   user_order user_order_book_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.user_order
    ADD CONSTRAINT user_order_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(id);
 L   ALTER TABLE ONLY public.user_order DROP CONSTRAINT user_order_book_id_fkey;
       public          postgres    false    206    2880    205            H           2606    17346    user_order user_order_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.user_order
    ADD CONSTRAINT user_order_id_fkey FOREIGN KEY (id) REFERENCES public.main_user(id);
 G   ALTER TABLE ONLY public.user_order DROP CONSTRAINT user_order_id_fkey;
       public          postgres    false    2870    206    201            ?   _   x?34? N??????ļԌ̜N#.C??!?SjIIe?{N~~n%?1L܈??.?71/???&j?\Z??\?????ih ?0????r??qqq ٱ?      ?   {   x?34?NC ?gh???_?????????X?????eSd?i??,8?|?9??sJ??*?8M!?ANΜ!?E?y%?Yc?????9??'P?([????P`q??1g??kJ.H{W? ??(?      ?   ?   x?M??
? ???a$????i????` ?J+u????2?????????)?Df$?i?q???=EP? ?BV??*4???63?????_5???og?Շ9?b?TՑ5??uo???P?/[? B? z??k???3.???hM7??m????cT?BS      ?     x?}??N?0?k?aP??沅J?h???
!Y?j?h%Ai??oO???8???a`??W? ?ą5<?z?ɑMϰ?oF????䴅{2T??M??q??Y&K?mE?k???%??a????j,???	v?,O=W???????ZLm?rY??ncX?)u??N:`??????q???kk0'ð?,?_??.;???	??R[t??;jk??p???GJ???v??ɹ?? ?ᓳ???e?䣸??¬i?(???????.???n??      ?     x?e?QO?0????4?h???fq?>?4k??0?}{???{j??_?w4?)??j?p?????]`??/?\Ű??A???w???Gӑ???i???,@?P????N?E?)????
't?(*
E؉4??b3?)x??3K?`??5?>??`?UZ[`?:_&W?@F?v????k??,???E{T????*L?]T???_?2?'?fr??8????~O??l֓?s?v?W??A??#????)<?u?ۀ??w?K?Fg?Go$??/~z&      ?   <   x?34 NC0?_??W???rBH?Ģ???\??'?D4愐(?&?nf? ??     