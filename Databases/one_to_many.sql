PGDMP         ,                z            one_to_many    14.2    14.2     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16645    one_to_many    DATABASE     o   CREATE DATABASE one_to_many WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE one_to_many;
                postgres    false            ?            1259    16651    author    TABLE     ?   CREATE TABLE public.author (
    author_id integer NOT NULL,
    author_name character(255) NOT NULL,
    book_id integer NOT NULL
);
    DROP TABLE public.author;
       public         heap    postgres    false            ?            1259    16646    book    TABLE     b   CREATE TABLE public.book (
    book_id integer NOT NULL,
    book_name character(255) NOT NULL
);
    DROP TABLE public.book;
       public         heap    postgres    false            ?          0    16651    author 
   TABLE DATA           A   COPY public.author (author_id, author_name, book_id) FROM stdin;
    public          postgres    false    210   }
       ?          0    16646    book 
   TABLE DATA           2   COPY public.book (book_id, book_name) FROM stdin;
    public          postgres    false    209   ?
       b           2606    16655    author author_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);
 <   ALTER TABLE ONLY public.author DROP CONSTRAINT author_pkey;
       public            postgres    false    210            `           2606    16650    book book_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);
 8   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pkey;
       public            postgres    false    209            c           2606    16656    author fk_book    FK CONSTRAINT     q   ALTER TABLE ONLY public.author
    ADD CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES public.book(book_id);
 8   ALTER TABLE ONLY public.author DROP CONSTRAINT fk_book;
       public          postgres    false    210    3168    209            ?   3   x?3??M,??S??.J?M,??K?HUA?ӄ?tć?!??hp??qqq {?p?      ?   $   x?3??ML??I)-OT???hć?Ɉ?=... 
?h?     