CREATE SEQUENCE board_file_seq;

CREATE TABLE board_gallery(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100),
caption VARCHAR2(200),
imagePath VARCHAR2(100),
regdate DATE
);

CREATE SEQUENCE board_gallery_seq;
