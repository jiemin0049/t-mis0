CREATE TABLE syswork (
    centerunit character(11) NOT NULL,
    workdate character(8) NOT NULL,
    lastedate character(8) NOT NULL,
    nextdate character(8) NOT NULL,
    workstatus char NOT NULL,
    PRIMARY KEY(centerunit, workdate)
);

CREATE TABLE units (
    unitno character(11) NOT NULL,
    unitname varchar(20) NOT NULL,
    unitclass char NOT NULL,
    unitchode character(6) NOT NULL,
    unitparent character(11) NOT NULL,
    unittellerpro character(2) NOT NULL,
    unittype char NOT NULL,
    unitdescription varchar(30),
    PRIMARY KEY(unitno)
);

CREATE TABLE teller (
    id character(4) NOT NULL,
    unitno character(11) NOT NULL,
    status char NOT NULL,
    startdate character(8),
    password varchar(20) NOT NULL,
    unlockpassword varchar(20) NOT NULL,
    name varchar(20) NOT NULL,
    dept varchar(20),
    type char NOT NULL,
    station varchar(20),
    cashlimit double precision,
    translimit double precision,
    superior varchar(14),
    creator character(4) NOT NULL,
    createdate character(8) NOT NULL,
    sessionid varchar(30),
    description varchar(30),
    PRIMARY KEY(id)
);

CREATE TABLE applog (
    tellerid character(4) NOT NULL,
    date character(8) NOT NULL,
    time character(6) NOT NULL,
    function character(11) NOT NULL,
    action character(30) NOT NULL,
    amount double precision,
    address character(16),
    description character(30)
);

CREATE TABLE sysfunction (
    id	character(11)	Not null,
    name Character(40) Not null,
    parentid Character(11)	Not null,
    description	varchar(100),
    relation varchar(100) Not null,
    available	Char Not null,
    type Char	Not null,
    layer char Not null,
    filepath varChar(100)	Not null,
    Expand char,
    display char,
    memo varChar(30),
    PRIMARY KEY(id)
);

CREATE TABLE tellerfunc (
  tellerid character(4) not null,
  funcid	varchar(11) not null,
  oplimit	character(4)	not null,
  funcposition varchar(10) Not null,
  funcdescription	varchar(100),
  memo	varchar(30),
  PRIMARY KEY(tellerid, funcid)
);