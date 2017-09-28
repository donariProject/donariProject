create table userinfo
(
  nickname varchar2(20) not null,
  id varchar2(30) primary key,
  pw varchar2(15) not null,
  email varchar2(30) not null
);

insert into userinfo values('test1','id1','pw1','test1@gmail.com');

commit;

create table saved_progress
(
  num number primary key,
  userId varchar2(30) REFERENCES userinfo (id),
  templateNum number not null
);

create sequence seq_saved_progress;

create table myvideos
(
  num number primary key,
  userId varchar2(30) REFERENCES userinfo (id),
  SavedProgress number REFERENCES saved_progress(num),
  path varchar2(200) not null unique
);

create sequence seq_myvideos;

create table subtitles
(
  num number primary key,
  SavedProgressNum number REFERENCES saved_progress(num),
  subtitlesIndex number not null unique,
  content varchar2(100)
);

create sequence seq_subtitles;

create table images
(
  num number primary key,
  savedprogressnum number REFERENCES saved_progress(num),
  imagesIndex number not null unique,
  path varchar2(200) not null unique
);

create sequence seq_images;