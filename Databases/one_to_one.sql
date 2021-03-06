PGDMP         *                z         
   one_to_one    14.2    14.2     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16624 
   one_to_one    DATABASE     n   CREATE DATABASE one_to_one WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE one_to_one;
                postgres    false            ?            1259    16630    author    TABLE     h   CREATE TABLE public.author (
    author_id integer NOT NULL,
    author_name character(255) NOT NULL
);
    DROP TABLE public.author;
       public         heap    postgres    false            ?            1259    16635    book    TABLE     y   CREATE TABLE public.book (
    book_id integer NOT NULL,
    book_name character(255) NOT NULL,
    author_id integer
);
    DROP TABLE public.book;
       public         heap    postgres    false            ?          0    16630    author 
   TABLE DATA           8   COPY public.author (author_id, author_name) FROM stdin;
    public          postgres    false    209   z
       ?          0    16635    book 
   TABLE DATA           =   COPY public.book (book_id, book_name, author_id) FROM stdin;
    public          postgres    false    210   ?
       `           2606    16634    author author_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);
 <   ALTER TABLE ONLY public.author DROP CONSTRAINT author_pkey;
       public            postgres    false    209            b           2606    16639    book book_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);
 8   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pkey;
       public            postgres    false    210            c           2606    16640    book fk_author    FK CONSTRAINT     w   ALTER TABLE ONLY public.book
    ADD CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES public.author(author_id);
 8   ALTER TABLE ONLY public.book DROP CONSTRAINT fk_author;
       public          postgres    false    210    3168    209            ?   *   x?3??M,??S??.J?M,??K?HUA??hć@? +?J?      ?   $   x?3??ML??I)-OT??Ӑ?hć?W? ??Fc     