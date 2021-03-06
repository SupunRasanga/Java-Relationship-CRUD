PGDMP         -                z            many_to_many    14.2    14.2     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16687    many_to_many    DATABASE     p   CREATE DATABASE many_to_many WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE many_to_many;
                postgres    false            ?            1259    16688    author    TABLE     h   CREATE TABLE public.author (
    author_id integer NOT NULL,
    author_name character(255) NOT NULL
);
    DROP TABLE public.author;
       public         heap    postgres    false            ?            1259    16693    book    TABLE     b   CREATE TABLE public.book (
    book_id integer NOT NULL,
    book_name character(255) NOT NULL
);
    DROP TABLE public.book;
       public         heap    postgres    false            ?            1259    16714    book_author    TABLE     p   CREATE TABLE public.book_author (
    common_id integer NOT NULL,
    book_id integer,
    author_id integer
);
    DROP TABLE public.book_author;
       public         heap    postgres    false            ?            1259    16713    book_author_common_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.book_author_common_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.book_author_common_id_seq;
       public          postgres    false    212                       0    0    book_author_common_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.book_author_common_id_seq OWNED BY public.book_author.common_id;
          public          postgres    false    211            d           2604    16717    book_author common_id    DEFAULT     ~   ALTER TABLE ONLY public.book_author ALTER COLUMN common_id SET DEFAULT nextval('public.book_author_common_id_seq'::regclass);
 D   ALTER TABLE public.book_author ALTER COLUMN common_id DROP DEFAULT;
       public          postgres    false    212    211    212            ?          0    16688    author 
   TABLE DATA           8   COPY public.author (author_id, author_name) FROM stdin;
    public          postgres    false    209   ?       ?          0    16693    book 
   TABLE DATA           2   COPY public.book (book_id, book_name) FROM stdin;
    public          postgres    false    210   ?       ?          0    16714    book_author 
   TABLE DATA           D   COPY public.book_author (common_id, book_id, author_id) FROM stdin;
    public          postgres    false    212   1                  0    0    book_author_common_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.book_author_common_id_seq', 11, true);
          public          postgres    false    211            f           2606    16692    author author_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);
 <   ALTER TABLE ONLY public.author DROP CONSTRAINT author_pkey;
       public            postgres    false    209            j           2606    16719    book_author book_author_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_author_pkey PRIMARY KEY (common_id);
 F   ALTER TABLE ONLY public.book_author DROP CONSTRAINT book_author_pkey;
       public            postgres    false    212            h           2606    16697    book book_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);
 8   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pkey;
       public            postgres    false    210            l           2606    16725    book_author fk_author    FK CONSTRAINT     ~   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES public.author(author_id);
 ?   ALTER TABLE ONLY public.book_author DROP CONSTRAINT fk_author;
       public          postgres    false    3174    209    212            k           2606    16720    book_author fk_book    FK CONSTRAINT     v   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES public.book(book_id);
 =   ALTER TABLE ONLY public.book_author DROP CONSTRAINT fk_book;
       public          postgres    false    3176    210    212            ?   <   x?3??M,??S??.J?M,??K?HUA?ˈ?1;3'Q?%5'? 1'1}Dy?b???? >I?      ?   &   x?3??ML??I)-OT??ˈ?+?l?z?b???? L?Dr      ?      x?3?4?4?2?F\`Ғ?(???? 5??     