DROP TABLE IF EXISTS publishers;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS book_isbns;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS book2auth;
DROP TABLE IF EXISTS book2url;

DROP INDEX IF EXISTS isbns;
DROP INDEX IF EXISTS b2au;
DROP INDEX IF EXISTS b2uu;

CREATE TABLE publishers (
    doab_id INTEGER PRIMARY KEY,
    publisher VARCHAR(250)
);

CREATE TABLE books (
    doab_id INTEGER PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    year INTEGER,
    pub_id INTEGER,
    language VARCHAR(50),
    license VARCHAR(100),
    updated varchar(25)
);

CREATE TABLE book_isbns (
    doab_id INTEGER,
    isbn VARCHAR(14)
);

CREATE UNIQUE INDEX isbns ON book_isbns (doab_id, isbn);

CREATE TABLE authors (
    name varchar(50),
    type varchar(10)
);

CREATE UNIQUE INDEX authnames ON authors (name, type);

CREATE TABLE book2auth (
    book_id INTEGER NOT NULL,
    author VARCHAR(50) NOT NULL,
    rel VARCHAR(10)
);

CREATE UNIQUE INDEX b2au ON book2auth (book_id, author, rel);

CREATE TABLE book2url (
    book_id INTEGER NOT NULL,
    url VARCHAR(500) NOT NULL
);

CREATE UNIQUE INDEX b2uu ON book2url (book_id, url);
