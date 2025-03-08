SQL> create user ing identified by psw;

User created.

SQL> grant all privileges to ing
  2  
SQL> grant all privileges to ing;

Grant succeeded.

SQL> Connect ing/psw;
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> CREATE TABLE usine (NU int,
  2   NomU varchar(15),
  3   Ville varchar(15),
  4   CONSTRAINT pk_usine PRIMARY KEY (NU));

Table created.

SQL> Desc user_tables;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TABLE_NAME                                NOT NULL VARCHAR2(30)
 TABLESPACE_NAME                                    VARCHAR2(30)
 CLUSTER_NAME                                       VARCHAR2(30)
 IOT_NAME                                           VARCHAR2(30)
 STATUS                                             VARCHAR2(8)
 PCT_FREE                                           NUMBER
 PCT_USED                                           NUMBER
 INI_TRANS                                          NUMBER
 MAX_TRANS                                          NUMBER
 INITIAL_EXTENT                                     NUMBER
 NEXT_EXTENT                                        NUMBER
 MIN_EXTENTS                                        NUMBER
 MAX_EXTENTS                                        NUMBER
 PCT_INCREASE                                       NUMBER
 FREELISTS                                          NUMBER
 FREELIST_GROUPS                                    NUMBER
 LOGGING                                            VARCHAR2(3)
 BACKED_UP                                          VARCHAR2(1)
 NUM_ROWS                                           NUMBER
 BLOCKS                                             NUMBER
 EMPTY_BLOCKS                                       NUMBER
 AVG_SPACE                                          NUMBER
 CHAIN_CNT                                          NUMBER
 AVG_ROW_LEN                                        NUMBER
 AVG_SPACE_FREELIST_BLOCKS                          NUMBER
 NUM_FREELIST_BLOCKS                                NUMBER
 DEGREE                                             VARCHAR2(40)
 INSTANCES                                          VARCHAR2(40)
 CACHE                                              VARCHAR2(20)
 TABLE_LOCK                                         VARCHAR2(8)
 SAMPLE_SIZE                                        NUMBER
 LAST_ANALYZED                                      DATE
 PARTITIONED                                        VARCHAR2(3)
 IOT_TYPE                                           VARCHAR2(12)
 TEMPORARY                                          VARCHAR2(1)
 SECONDARY                                          VARCHAR2(1)
 NESTED                                             VARCHAR2(3)
 BUFFER_POOL                                        VARCHAR2(7)
 FLASH_CACHE                                        VARCHAR2(7)
 CELL_FLASH_CACHE                                   VARCHAR2(7)
 ROW_MOVEMENT                                       VARCHAR2(8)
 GLOBAL_STATS                                       VARCHAR2(3)
 USER_STATS                                         VARCHAR2(3)
 DURATION                                           VARCHAR2(15)
 SKIP_CORRUPT                                       VARCHAR2(8)
 MONITORING                                         VARCHAR2(3)
 CLUSTER_OWNER                                      VARCHAR2(30)
 DEPENDENCIES                                       VARCHAR2(8)
 COMPRESSION                                        VARCHAR2(8)
 COMPRESS_FOR                                       VARCHAR2(12)
 DROPPED                                            VARCHAR2(3)
 READ_ONLY                                          VARCHAR2(3)
 SEGMENT_CREATED                                    VARCHAR2(3)
 RESULT_CACHE                                       VARCHAR2(7)

SQL> Select table_name from tabs;

TABLE_NAME                                                                      
------------------------------                                                  
USINE                                                                           

SQL> Desc usine;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NU                                        NOT NULL NUMBER(38)
 NOMU                                               VARCHAR2(15)
 VILLE                                              VARCHAR2(15)

SQL> create table produit ( np integer,
  2    nomp varchar (20),
  3    couleur varchar (10) ,
  4    poids real ,
  5    CONSTRAINT pk_produit PRIMARY KEY (np),
  6    CONSTRAINT ck_produit check (poids>0)
  7   ) ;

Table created.

SQL> Desc user_constraints;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 OWNER                                              VARCHAR2(120)
 CONSTRAINT_NAME                           NOT NULL VARCHAR2(30)
 CONSTRAINT_TYPE                                    VARCHAR2(1)
 TABLE_NAME                                NOT NULL VARCHAR2(30)
 SEARCH_CONDITION                                   LONG
 R_OWNER                                            VARCHAR2(120)
 R_CONSTRAINT_NAME                                  VARCHAR2(30)
 DELETE_RULE                                        VARCHAR2(9)
 STATUS                                             VARCHAR2(8)
 DEFERRABLE                                         VARCHAR2(14)
 DEFERRED                                           VARCHAR2(9)
 VALIDATED                                          VARCHAR2(13)
 GENERATED                                          VARCHAR2(14)
 BAD                                                VARCHAR2(3)
 RELY                                               VARCHAR2(4)
 LAST_CHANGE                                        DATE
 INDEX_OWNER                                        VARCHAR2(30)
 INDEX_NAME                                         VARCHAR2(30)
 INVALID                                            VARCHAR2(7)
 VIEW_RELATED                                       VARCHAR2(14)

SQL> select CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  2   from user_constraints;

CONSTRAINT_NAME                C TABLE_NAME                                     
------------------------------ - ------------------------------                 
PK_USINE                       P USINE                                          
CK_PRODUIT                     C PRODUIT                                        
PK_PRODUIT                     P PRODUIT                                        

SQL> select CONSTRAINT_NAME, CONSTRAINT_TYPE
  2     from user_constraints
  3    Where TABLE_NAME='PRODUIT';

CONSTRAINT_NAME                C                                                
------------------------------ -                                                
CK_PRODUIT                     C                                                
PK_PRODUIT                     P                                                

SQL> select CONSTRAINT_NAME, CONSTRAINT_TYPE
  2      from user_constraints
  3      Where TABLE_NAME='USINE';

CONSTRAINT_NAME                C                                                
------------------------------ -                                                
PK_USINE                       P                                                

SQL>  create table fournisseur (nf integer,
  2   nomf varchar (25),
  3   statut varchar (25),
  4   ville varchar (15),
  5   email varchar (50),
  6   CONSTRAINT pk_fournisseur PRIMARY KEY (nf),
  7   CONSTRAINT uk_fournisseur UNIQUE (email),
  8   CONSTRAINT ck_fournisseur check (email like '%@%' )
  9   ) ;

Table created.

SQL> create table fournisseur1 (nf integer primary key,
  2   nomf varchar (25),
  3   statut varchar (25),
  4   ville varchar (15),
  5   email varchar (50) unique);

Table created.

SQL>  select CONSTRAINT_NAME, CONSTRAINT_TYPE
  2   from user_constraints
  3   Where TABLE_NAME='FOURNISSEUR1';

CONSTRAINT_NAME                C                                                
------------------------------ -                                                
SYS_C007883                    P                                                
SYS_C007884                    U                                                

SQL>  select CONSTRAINT_NAME, CONSTRAINT_TYPE
  2   from user_constraints
  3   Where TABLE_NAME=upper('fournisseur');

CONSTRAINT_NAME                C                                                
------------------------------ -                                                
CK_FOURNISSEUR                 C                                                
PK_FOURNISSEUR                 P                                                
UK_FOURNISSEUR                 U                                                

SQL> Alter table fournisseur1 add constraint ck_four check (email like
  2  '%@%' );

Table altered.

SQL>  select CONSTRAINT_NAME, CONSTRAINT_TYPE
  2   from user_constraints
  3   Where TABLE_NAME='FOURNISSEUR1';

CONSTRAINT_NAME                C                                                
------------------------------ -                                                
SYS_C007883                    P                                                
SYS_C007884                    U                                                
CK_FOUR                        C                                                

SQL> Drop table fournisseur1;

Table dropped.

SQL> create table livraison (np integer ,
  2   nu integer ,
  3   nf integer ,
  4   quantite integer,
  5   Constraint pk_livraison primary key (np,nu ,nf),
  6   Constraint fk_livraison_prod foreign key (np) references produit (np) on delete cascade,
  7   Constraint fk_livraison_usin foreign key (nu) references usine (nu) on delete cascade,
  8   Constraint fk_livraison_four foreign key (nf) references fournisseur (nf) on delete cascade,
  9   Constraint ck_livraison check (quantite>0)
 10   );

Table created.

SQL> Show user
USER is "ING"
SQL> Desc user_users;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 USERNAME                                  NOT NULL VARCHAR2(30)
 USER_ID                                   NOT NULL NUMBER
 ACCOUNT_STATUS                            NOT NULL VARCHAR2(32)
 LOCK_DATE                                          DATE
 EXPIRY_DATE                                        DATE
 DEFAULT_TABLESPACE                        NOT NULL VARCHAR2(30)
 TEMPORARY_TABLESPACE                      NOT NULL VARCHAR2(30)
 CREATED                                   NOT NULL DATE
 INITIAL_RSRC_CONSUMER_GROUP                        VARCHAR2(30)
 EXTERNAL_NAME                                      VARCHAR2(4000)

SQL> Select username,created from user_users;

USERNAME                       CREATED                                          
------------------------------ ---------                                        
ING                            07-MAR-25                                        

SQL> Select table_name from tabs;

TABLE_NAME                                                                      
------------------------------                                                  
USINE                                                                           
PRODUIT                                                                         
FOURNISSEUR                                                                     
LIVRAISON                                                                       

SQL> desc fournisseur;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NF                                        NOT NULL NUMBER(38)
 NOMF                                               VARCHAR2(25)
 STATUT                                             VARCHAR2(25)
 VILLE                                              VARCHAR2(15)
 EMAIL                                              VARCHAR2(50)

SQL> alter table fournisseur add Adresse varchar(100);

Table altered.

SQL> desc fournisseur;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NF                                        NOT NULL NUMBER(38)
 NOMF                                               VARCHAR2(25)
 STATUT                                             VARCHAR2(25)
 VILLE                                              VARCHAR2(15)
 EMAIL                                              VARCHAR2(50)
 ADRESSE                                            VARCHAR2(100)

SQL> alter table fournisseur modify adresse not null;

Table altered.

SQL> Desc fournisseur;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NF                                        NOT NULL NUMBER(38)
 NOMF                                               VARCHAR2(25)
 STATUT                                             VARCHAR2(25)
 VILLE                                              VARCHAR2(15)
 EMAIL                                              VARCHAR2(50)
 ADRESSE                                   NOT NULL VARCHAR2(100)

SQL> select constraint_name, constraint_type from user_constraints where
  2  table_name=upper('fournisseur');

CONSTRAINT_NAME                C                                                
------------------------------ -                                                
CK_FOURNISSEUR                 C                                                
PK_FOURNISSEUR                 P                                                
UK_FOURNISSEUR                 U                                                
SYS_C007891                    C                                                

SQL> alter table fournisseur drop column Adresse;

Table altered.

SQL> desc fournisseur;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NF                                        NOT NULL NUMBER(38)
 NOMF                                               VARCHAR2(25)
 STATUT                                             VARCHAR2(25)
 VILLE                                              VARCHAR2(15)
 EMAIL                                              VARCHAR2(50)

SQL> INSERT INTO Usine (NU, NomU, Ville) VALUES (1, 'Citroen', 'Paris');

1 row created.

SQL> INSERT INTO Usine (NU, NomU, Ville) VALUES (2, 'Peugeot', 'Sochaux');

1 row created.

SQL> INSERT INTO Usine (NU, NomU, Ville) VALUES (3, 'Citroen', 'Sochaux');

1 row created.

SQL> INSERT INTO Usine (NU, NomU, Ville) VALUES (4, 'Renault', 'Paris');

1 row created.

SQL> INSERT INTO Usine (NU, NomU, Ville) VALUES (5, 'Toyota', 'Lyon');

1 row created.

SQL> INSERT INTO Produit (NP, NomP, Couleur, Poids) VALUES (1, 'Plaquette', 'Noir', 0.257);

1 row created.

SQL> INSERT INTO Produit (NP, NomP, Couleur, Poids) VALUES (2, 'SiŠge', 'Rouge', 15.230);

1 row created.

SQL> INSERT INTO Produit (NP, NomP, Couleur, Poids) VALUES (3, 'SiŠge', 'Vert', 15.230);

1 row created.

SQL> INSERT INTO Produit (NP, NomP, Couleur, Poids) VALUES (4, 'Pare-brise', NULL, 11.900);

1 row created.

SQL> INSERT INTO Produit (NP, NomP, Couleur, Poids) VALUES (5, 'R‚troviseur', 'Vert', 1.020);

1 row created.

SQL> INSERT INTO Fournisseur (NF, NomF, Statut, Ville, Email) VALUES (1, 'Monroe', 'Producteur', 'Lyon', 'monroe@gmail.com');

1 row created.

SQL> INSERT INTO Fournisseur (NF, NomF, Statut, Ville, Email) VALUES (2, 'Au bon siŠge', 'Sous-traitant', 'Limoges', 'au_bon_siege@gmail.com');

1 row created.

SQL> INSERT INTO Fournisseur (NF, NomF, Statut, Ville, Email) VALUES (3, 'Saint Gobain', 'Producteur', 'Paris', 'sait_gobain@gmail.com');

1 row created.

SQL> INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (3, 1, 2, 60);
INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (3, 1, 2, 60)
                                          *
ERROR at line 1:
ORA-00911: invalid character 


SQL> INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (1, 2, 3, 2500);
INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (1, 2, 3, 2500)
                                          *
ERROR at line 1:
ORA-00911: invalid character 


SQL> INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (2, 3, 3, 3000);
INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (2, 3, 3, 3000)
                                          *
ERROR at line 1:
ORA-00911: invalid character 


SQL> INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (3, 2, 3, 120);
INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (3, 2, 3, 120)
                                          *
ERROR at line 1:
ORA-00911: invalid character 


SQL> INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (1, 2, 3, 45);
INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (1, 2, 3, 45)
                                          *
ERROR at line 1:
ORA-00911: invalid character 


SQL> INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (2, 1, 3, 7);
INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (2, 1, 3, 7)
                                          *
ERROR at line 1:
ORA-00911: invalid character 


SQL> INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (1, 2, 3, 52);
INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (1, 2, 3, 52)
                                          *
ERROR at line 1:
ORA-00911: invalid character 


SQL> INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (2, 1, 1, 250);
INSERT INTO Livraison (NP, NU, NF, Quantit‚) VALUES (2, 1, 1, 250)
                                          *
ERROR at line 1:
ORA-00911: invalid character 


SQL> INSERT INTO Livraison (NP, NU, NF, Quantite) VALUES (3, 1, 2, 60);

1 row created.

SQL> INSERT INTO Livraison (NP, NU, NF, Quantite) VALUES (1, 2, 3, 2500);

1 row created.

SQL> INSERT INTO Livraison (NP, NU, NF, Quantite) VALUES (2, 3, 3, 3000);

1 row created.

SQL> INSERT INTO Livraison (NP, NU, NF, Quantite) VALUES (3, 2, 3, 120);

1 row created.

SQL> INSERT INTO Livraison (NP, NU, NF, Quantite) VALUES (1, 2, 3, 45);
INSERT INTO Livraison (NP, NU, NF, Quantite) VALUES (1, 2, 3, 45)
*
ERROR at line 1:
ORA-00001: unique constraint (ING.PK_LIVRAISON) violated 


SQL> INSERT INTO Livraison (NP, NU, NF, Quantite) VALUES (2, 1, 3, 7);

1 row created.

SQL> INSERT INTO Livraison (NP, NU, NF, Quantite) VALUES (1, 2, 3, 52);
INSERT INTO Livraison (NP, NU, NF, Quantite) VALUES (1, 2, 3, 52)
*
ERROR at line 1:
ORA-00001: unique constraint (ING.PK_LIVRAISON) violated 


SQL> INSERT INTO Livraison (NP, NU, NF, Quantite) VALUES (2, 1, 1, 250);

1 row created.

SQL>  select nu , nomu
  2   from usine
  3   where ville = 'Sochaux' ;

        NU NOMU                                                                 
---------- ---------------                                                      
         2 Peugeot                                                              
         3 Citroen                                                              

SQL> select nf
  2   from livraison
  3   where nu = 1
  4   and np = 3 ;

        NF                                                                      
----------                                                                      
         2                                                                      

SQL>   select nomf
  2   from fournisseur
  3   where nf in ( select nf
  4   from livraison
  5   where nu=1 and np=3);

NOMF                                                                            
-------------------------                                                       
Au bon siŠge                                                                    

SQL>  select nomf
  2   from livraison l, fournisseur f
  3   where nu = 1 and np = 3
  4   And f.nf = l.nf;

NOMF                                                                            
-------------------------                                                       
Au bon siŠge                                                                    

SQL>  select np , nomp
  2   from produit
  3   where couleur is null ;

        NP NOMP                                                                 
---------- --------------------                                                 
         4 Pare-brise                                                           

SQL>  select distinct nomu
  2   from usine
  3   order by nomu ;

NOMU                                                                            
---------------                                                                 
Citroen                                                                         
Peugeot                                                                         
Renault                                                                         
Toyota                                                                          

SQL>  select nu
  2   from usine
  3   where nomu like 'C%' ;

        NU                                                                      
----------                                                                      
         1                                                                      
         3                                                                      

SQL>  select np
  2   from produit
  3   where nomp like '%s%' or nomp like '%S%' ;

        NP                                                                      
----------                                                                      
         2                                                                      
         3                                                                      
         4                                                                      
         5                                                                      

SQL>  select NomP, Couleur
  2   from produit p, livraison l
  3   where nf = 2
  4   And l.np = p.np;

NOMP                 COULEUR                                                    
-------------------- ----------                                                 
SiŠge                Vert                                                       

SQL> select NomP, Couleur
  2   from produit
  3   where np in ( select np
  4   from livraison
  5   where nf =2);

NOMP                 COULEUR                                                    
-------------------- ----------                                                 
SiŠge                Vert                                                       

SQL>  select nf
  2   from livraison l, produit p
  3   where Couleur = 'Rouge'
  4   and nu=1
  5   and l.np=p.np;

        NF                                                                      
----------                                                                      
         1                                                                      
         3                                                                      

SQL>  select nf
  2   from livraison
  3   where nu = 1
  4   And np in (select np
  5   from produit
  6   where couleur='Rouge');

        NF                                                                      
----------                                                                      
         1                                                                      
         3                                                                      

SQL>  select distinct NomF
  2   from livraison l, produit p, fournisseur f, usine u
  3   where Couleur='Rouge'
  4   And u.ville='Sochaux' or u.ville='Paris'
  5   And l.np=p.np
  6   And l.nf=f.nf
  7   And l.nu=u.nu;

NOMF                                                                            
-------------------------                                                       
Au bon siŠge                                                                    
Monroe                                                                          
Saint Gobain                                                                    

SQL>  select np
  2   from livraison l, fournisseur f, usine u
  3   Where u.ville= f.ville
  4   And l.nf=f.nf
  5   and l.nu=u.nu;

        NP                                                                      
----------                                                                      
         2                                                                      

SQL>   select distinct l.nu
  2   from livraison l, fournisseur f, usine u
  3   Where u.ville <> f.ville
  4   And l.nf=f.nf
  5   and l.nu=u.nu
  6   Order by l.nu;

        NU                                                                      
----------                                                                      
         1                                                                      
         2                                                                      
         3                                                                      

SQL>  select nf
  2   from livraison
  3   where nu = 1
  4   intersect
  5   select nf
  6   from livraison
  7   where nu = 2 ;

        NF                                                                      
----------                                                                      
         3                                                                      

SQL>  select distinct l1.nf
  2   from livraison l1 , livraison l2
  3   where l1.nf=l2.nf
  4   and l1.nu=1
  5   and l2.nu=2;

        NF                                                                      
----------                                                                      
         3                                                                      

SQL> set linesize 150
SQL>  select *
  2   from livraison l1 , livraison l2
  3   where l1.nf=l2.nf and l1.nu=1 and l2.nu=2;

        NP         NU         NF   QUANTITE         NP         NU         NF   QUANTITE                                                               
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                                               
         2          1          3          7          3          2          3        120                                                               
         2          1          3          7          1          2          3       2500                                                               

SQL>  select *
  2   from usine u, livraison l
  3   Where u.nu=l.nu;

        NU NOMU            VILLE                   NP         NU         NF   QUANTITE                                                                
---------- --------------- --------------- ---------- ---------- ---------- ----------                                                                
         1 Citroen         Paris                    3          1          2         60                                                                
         2 Peugeot         Sochaux                  1          2          3       2500                                                                
         3 Citroen         Sochaux                  2          3          3       3000                                                                
         2 Peugeot         Sochaux                  3          2          3        120                                                                
         1 Citroen         Paris                    2          1          3          7                                                                
         1 Citroen         Paris                    2          1          1        250                                                                

6 rows selected.

SQL> select distinct nomu
  2   from usine u, livraison l
  3   Where u.nu=l.nu
  4   Order by nomu;

NOMU                                                                                                                                                  
---------------                                                                                                                                       
Citroen                                                                                                                                               
Peugeot                                                                                                                                               

SQL>   select distinct nu
  2   from livraison
  3   where np in (select np
  4   from livraison
  5   where nf =3);

        NU                                                                                                                                            
----------                                                                                                                                            
         1                                                                                                                                            
         2                                                                                                                                            
         3                                                                                                                                            

SQL> Connect system
Connected.
SQL> create tablespace Livraison_TBS datafile 'C:\livraison_TBS.dat' size
  2  100M autoextend on online;

Tablespace created.

SQL> create temporary tablespace Livraison_TempTBS tempfile
  2  'c:\livraison_TempTBS.dat' size 100M autoextend on;

Tablespace created.

SQL> Alter user ing default tablespace Livraison_TBS temporary tablespace
  2  Livraison_TempTBS;

User altered.

SQL> Desc dba_users;
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 USERNAME                                                                            NOT NULL VARCHAR2(30)
 USER_ID                                                                             NOT NULL NUMBER
 PASSWORD                                                                                     VARCHAR2(30)
 ACCOUNT_STATUS                                                                      NOT NULL VARCHAR2(32)
 LOCK_DATE                                                                                    DATE
 EXPIRY_DATE                                                                                  DATE
 DEFAULT_TABLESPACE                                                                  NOT NULL VARCHAR2(30)
 TEMPORARY_TABLESPACE                                                                NOT NULL VARCHAR2(30)
 CREATED                                                                             NOT NULL DATE
 PROFILE                                                                             NOT NULL VARCHAR2(30)
 INITIAL_RSRC_CONSUMER_GROUP                                                                  VARCHAR2(30)
 EXTERNAL_NAME                                                                                VARCHAR2(4000)
 PASSWORD_VERSIONS                                                                            VARCHAR2(8)
 EDITIONS_ENABLED                                                                             VARCHAR2(1)
 AUTHENTICATION_TYPE                                                                          VARCHAR2(8)

SQL> select DEFAULT_TABLESPACE, TEMPORARY_TABLESPACE from
  2  dba_users where USERNAME='ING';

DEFAULT_TABLESPACE             TEMPORARY_TABLESPACE                                                                                                   
------------------------------ ------------------------------                                                                                         
LIVRAISON_TBS                  LIVRAISON_TEMPTBS                                                                                                      

SQL> Connect ing/psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL>  CREATE TABLE TableErreurs (adresse ROWID,
  2   utilisateur VARCHAR2(30),
  3   nomTable VARCHAR2(30),
  4   nomContrainte VARCHAR2(30));

Table created.

SQL>  create table fournisseur1 (nf integer primary key,
  2   nomf varchar (25),
  3   statut varchar (25),
  4   ville varchar (15),
  5   email varchar (50) unique);

Table created.

SQL> Alter table fournisseur1 add constraint ck_four check (email like
  2  '%@%' );

Table altered.

SQL> ALTER TABLESPACE Livraison_TBS OFFLINE;

Tablespace altered.

SQL> select * from fournisseur;

        NF NOMF                      STATUT                    VILLE           EMAIL                                                                  
---------- ------------------------- ------------------------- --------------- --------------------------------------------------                     
         1 Monroe                    Producteur                Lyon            monroe@gmail.com                                                       
         2 Au bon siŠge              Sous-traitant             Limoges         au_bon_siege@gmail.com                                                 
         3 Saint Gobain              Producteur                Paris           sait_gobain@gmail.com                                                  

SQL> create table test (a int, b char);
create table test (a int, b char)
*
ERROR at line 1:
ORA-01542: tablespace 'LIVRAISON_TBS' is offline, cannot allocate space in it 


SQL> Select * from fournisseur1;
Select * from fournisseur1
              *
ERROR at line 1:
ORA-00376: file 6 cannot be read at this time 
ORA-01110: data file 6: 'C:\LIVRAISON_TBS.DAT' 


SQL> ALTER TABLESPACE Livraison_TBS ONLINE;

Tablespace altered.

SQL> select constraint_name, constraint_type, status from user_constraints
  2  where table_name=upper('fournisseur1');

CONSTRAINT_NAME                C STATUS                                                                                                               
------------------------------ - --------                                                                                                             
SYS_C007892                    P ENABLED                                                                                                              
SYS_C007893                    U ENABLED                                                                                                              
CK_FOUR                        C ENABLED                                                                                                              

SQL> insert into fournisseur1 values ( 1 ,'Saint
  2  Gobain','Producteur','Paris','saint_goubain@gmail.com') ;

1 row created.

SQL> insert into fournisseur1 values ( 2 ,'Au bon siege','Sous
  2  traitant','Limoges','au_bon_siegegmail.com') ;
insert into fournisseur1 values ( 2 ,'Au bon siege','Sous
*
ERROR at line 1:
ORA-02290: check constraint (ING.CK_FOUR) violated 


SQL> alter table fournisseur1 disable constraint CK_FOUR;

Table altered.

SQL> select constraint_name, constraint_type, status from user_constraints
  2  where table_name=upper('fournisseur1');

CONSTRAINT_NAME                C STATUS                                                                                                               
------------------------------ - --------                                                                                                             
SYS_C007892                    P ENABLED                                                                                                              
SYS_C007893                    U ENABLED                                                                                                              
CK_FOUR                        C DISABLED                                                                                                             

SQL> insert into fournisseur1 values ( 2 ,'Au bon siege','Sous
  2  traitant','Limoges','au_bon_siegegmail.com') ;

1 row created.

SQL> select * from tableerreurs;

no rows selected

SQL> alter table fournisseur1 enable constraint CK_FOUR;
alter table fournisseur1 enable constraint CK_FOUR
                                           *
ERROR at line 1:
ORA-02293: cannot validate (ING.CK_FOUR) - check constraint violated 


SQL> insert into fournisseur1 values ( 2 ,'Au bon siege','Sous
  2  traitant','Limoges','au_bon_siegegmail.com') ;
insert into fournisseur1 values ( 2 ,'Au bon siege','Sous
*
ERROR at line 1:
ORA-00001: unique constraint (ING.SYS_C007892) violated 


SQL> alter table fournisseur1 enable constraint CK_FOUR exceptions into
  2  tableerreurs;
alter table fournisseur1 enable constraint CK_FOUR exceptions into
                                           *
ERROR at line 1:
ORA-02293: cannot validate (ING.CK_FOUR) - check constraint violated 


SQL> ----from here le tp 2 va commencer
SQL> create user USERFOUR identified by psw default tablespace
  2  Livraison_TBS temporary tablespace Livraison_TempTBS;

User created.

SQL> connect system
Connected.
SQL> SELECT USERNAME FROM DBA_USERS;

USERNAME                                                                                                                                              
------------------------------                                                                                                                        
ING                                                                                                                                                   
USERFOUR                                                                                                                                              
ADMIN                                                                                                                                                 
USERTEST                                                                                                                                              
DBAIOT                                                                                                                                                
NEWUSER                                                                                                                                               
SYSTEM                                                                                                                                                
SYS                                                                                                                                                   
TP1                                                                                                                                                   
ANONYMOUS                                                                                                                                             
APEX_PUBLIC_USER                                                                                                                                      

USERNAME                                                                                                                                              
------------------------------                                                                                                                        
APEX_040000                                                                                                                                           
FLOWS_FILES                                                                                                                                           
XS$NULL                                                                                                                                               
ORACLE_OCM                                                                                                                                            
DIP                                                                                                                                                   
OUTLN                                                                                                                                                 
APPQOSSYS                                                                                                                                             
XDB                                                                                                                                                   
DBSNMP                                                                                                                                                
CTXSYS                                                                                                                                                
MDSYS                                                                                                                                                 

USERNAME                                                                                                                                              
------------------------------                                                                                                                        
HR                                                                                                                                                    

23 rows selected.

SQL> connect USERFOUR /psw
ERROR:
ORA-01045: user USERFOUR lacks CREATE SESSION privilege; logon denied 


Warning: You are no longer connected to ORACLE.
SQL> connect ing/psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> grant create session to USERFOUR ;

Grant succeeded.

SQL> connect system/psw
ERROR:
ORA-01017: invalid username/password; logon denied 


Warning: You are no longer connected to ORACLE.
SQL> connect system/imimane
Connected.
SQL> desc dba_sys_privs (--dba_sys_privs contient tous les privilŠges
Usage: DESCRIBE [schema.]object[@db_link]
SQL> systŠmes)
SP2-0042: unknown command "systŠmes)" - rest of line ignored.
SQL> desc dba_sys_privs (--dba_sys_privs contient tous les privilŠges
Usage: DESCRIBE [schema.]object[@db_link]
SQL> systŠmes);
SP2-0042: unknown command "systŠmes)" - rest of line ignored.
SQL> connect USERFOUR /psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> connect ing/psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> grant create table, create view, create user to USERFOUR ;

Grant succeeded.

SQL> create table test (a integer, b char(1));

Table created.

SQL> drop table test
  2  
SQL> DROP TABLE test
  2  
SQL> connect USERFOUR /psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> create table test (a integer, b char(1));
create table test (a integer, b char(1))
*
ERROR at line 1:
ORA-01950: no privileges on tablespace 'LIVRAISON_TBS' 


SQL> connect ing/psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> alter user USERFOUR quota unlimited on LIVRAISON_TBS;

User altered.

SQL> connect USERFOUR /psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> create table test (a integer, b char(1));

Table created.

SQL> select table_name from tabs;

TABLE_NAME                                                                                                                                            
------------------------------                                                                                                                        
TEST                                                                                                                                                  

SQL> insert into test values (1, 'b');

1 row created.

SQL> select * from test;

         A B                                                                                                                                          
---------- -                                                                                                                                          
         1 b                                                                                                                                          

SQL> select object_name, object_type from user_objects;

OBJECT_NAME                                                                                                                      OBJECT_TYPE          
-------------------------------------------------------------------------------------------------------------------------------- -------------------  
TEST                                                                                                                             TABLE                

SQL> create view view1 as select a from test;

View created.

SQL> select * from view1;

         A                                                                                                                                            
----------                                                                                                                                            
         1                                                                                                                                            

SQL> select object_name, object_type from user_objects;

OBJECT_NAME                                                                                                                      OBJECT_TYPE          
-------------------------------------------------------------------------------------------------------------------------------- -------------------  
TEST                                                                                                                             TABLE                
VIEW1                                                                                                                            VIEW                 

SQL> connect system/imimane;
Connected.
SQL> connect ing/psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> grant select on FOURNISSEUR to USERFOUR ;

Grant succeeded.

SQL> connect system/imimane
Connected.
SQL> desc dba_tab_privs
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 GRANTEE                                                                             NOT NULL VARCHAR2(30)
 OWNER                                                                               NOT NULL VARCHAR2(30)
 TABLE_NAME                                                                          NOT NULL VARCHAR2(30)
 GRANTOR                                                                             NOT NULL VARCHAR2(30)
 PRIVILEGE                                                                           NOT NULL VARCHAR2(40)
 GRANTABLE                                                                                    VARCHAR2(3)
 HIERARCHY                                                                                    VARCHAR2(3)

SQL> connect USERFOUR /psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> select * from user_tab_privs; (donne les privilŠges objet de
  2  l'utilisateur connect‚)
  3  
SQL> Select * from FOURNISSEUR;
Select * from FOURNISSEUR
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> Select * from ing. FOURNISSEUR;

        NF NOMF                      STATUT                    VILLE           EMAIL                                                                  
---------- ------------------------- ------------------------- --------------- --------------------------------------------------                     
         1 Monroe                    Producteur                Lyon            monroe@gmail.com                                                       
         2 Au bon siŠge              Sous-traitant             Limoges         au_bon_siege@gmail.com                                                 
         3 Saint Gobain              Producteur                Paris           sait_gobain@gmail.com                                                  

SQL> connect system/imimane
Connected.
SQL> select grantee, owner, table_name, privilege, grantable from
  2  dba_tab_privs where grantee='USERFOUR';

GRANTEE                        OWNER                          TABLE_NAME                     PRIVILEGE                                GRA             
------------------------------ ------------------------------ ------------------------------ ---------------------------------------- ---             
USERFOUR                       ING                            FOURNISSEUR                    SELECT                                   NO              

SQL> connect USERFOUR /psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> select * from user_tab_privs;

GRANTEE                        OWNER                          TABLE_NAME                     GRANTOR                                                  
------------------------------ ------------------------------ ------------------------------ ------------------------------                           
PRIVILEGE                                GRA HIE                                                                                                      
---------------------------------------- --- ---                                                                                                      
USERFOUR                       ING                            FOURNISSEUR                    ING                                                      
SELECT                                   NO  NO                                                                                                       
                                                                                                                                                      

SQL> connect ing/psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> grant index on FOURNISSEUR to USERFOUR ;

Grant succeeded.

SQL> create index NOM_IX on ing. FOURNISSEUR(nomf);

Index created.

SQL> connect USERFOUR /psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> create index NOM_IX on ing. FOURNISSEUR(nomf);
create index NOM_IX on ing. FOURNISSEUR(nomf)
                                        *
ERROR at line 1:
ORA-01408: such column list already indexed 


SQL> connect ing/psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> DROP INDEX NOM_IX;

Index dropped.

SQL> connect USERFOUR /psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> create index NOM_IX on ing. FOURNISSEUR(nomf);

Index created.

SQL> connect ing/psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> grant index on FOURNISSEUR to USERFOUR ;

Grant succeeded.

SQL> connect USERFOUR /psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> Select * from user_tab_privs;

GRANTEE                        OWNER                          TABLE_NAME                     GRANTOR                                                  
------------------------------ ------------------------------ ------------------------------ ------------------------------                           
PRIVILEGE                                GRA HIE                                                                                                      
---------------------------------------- --- ---                                                                                                      
USERFOUR                       ING                            FOURNISSEUR                    ING                                                      
INDEX                                    NO  NO                                                                                                       
                                                                                                                                                      
USERFOUR                       ING                            FOURNISSEUR                    ING                                                      
SELECT                                   NO  NO                                                                                                       
                                                                                                                                                      

SQL> create index NOM_IX on ing. FOURNISSEUR(nomf);
create index NOM_IX on ing. FOURNISSEUR(nomf)
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object 


SQL> revoke all privileges from USERFOUR;
revoke all privileges from USERFOUR
*
ERROR at line 1:
ORA-01031: insufficient privileges 


SQL> connect ing /psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> revoke all privileges from USERFOUR;
revoke all privileges from USERFOUR
*
ERROR at line 1:
ORA-01952: system privileges not granted to 'USERFOUR' 


SQL> revoke create session, create user, create table, create view from
  2  USERFOUR ;

Revoke succeeded.

SQL> connect system /imimane
Connected.
SQL> select privilege , admin_option from dba_sys_privs where
  2  grantee=upper(' USERFOUR ');

no rows selected

SQL> connect ing/psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> revoke delete on produit from USERFOUR ;
revoke delete on produit from USERFOUR 
*
ERROR at line 1:
ORA-01927: cannot REVOKE privileges you did not grant 


SQL> Revoke select, index on fournisseur from USERFOUR;

Revoke succeeded.

SQL> revoke select on livraison from USERFOUR ;
revoke select on livraison from USERFOUR 
*
ERROR at line 1:
ORA-01927: cannot REVOKE privileges you did not grant 


SQL> connect USERFOUR /psw
ERROR:
ORA-01045: user USERFOUR lacks CREATE SESSION privilege; logon denied 


Warning: You are no longer connected to ORACLE.
SQL> connect system /imimane
Connected.
SQL> connect ing/psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> create profile USERFOUR_Profil limit
  2   sessions_per_user 3
  3   cpu_per_call 2000
  4   connect_time 60
  5   logical_reads_per_session 1200
  6   private_sga 40K
  7   idle_time 15
  8   failed_login_attempts 5
  9   password_lock_time 1
 10   password_life_time 70
 11   password_reuse_time 50
 12   password_reuse_max unlimited
 13   password_grace_time 5;

Profile created.

SQL> connect system /imimane
Connected.
SQL> select * from dba_profiles where profile=upper('USERFOUR_Profil');

PROFILE                        RESOURCE_NAME                    RESOURCE LIMIT                                                                        
------------------------------ -------------------------------- -------- ----------------------------------------                                     
USERFOUR_PROFIL                COMPOSITE_LIMIT                  KERNEL   DEFAULT                                                                      
USERFOUR_PROFIL                SESSIONS_PER_USER                KERNEL   3                                                                            
USERFOUR_PROFIL                CPU_PER_SESSION                  KERNEL   DEFAULT                                                                      
USERFOUR_PROFIL                CPU_PER_CALL                     KERNEL   2000                                                                         
USERFOUR_PROFIL                LOGICAL_READS_PER_SESSION        KERNEL   1200                                                                         
USERFOUR_PROFIL                LOGICAL_READS_PER_CALL           KERNEL   DEFAULT                                                                      
USERFOUR_PROFIL                IDLE_TIME                        KERNEL   15                                                                           
USERFOUR_PROFIL                CONNECT_TIME                     KERNEL   60                                                                           
USERFOUR_PROFIL                PRIVATE_SGA                      KERNEL   40960                                                                        
USERFOUR_PROFIL                FAILED_LOGIN_ATTEMPTS            PASSWORD 5                                                                            
USERFOUR_PROFIL                PASSWORD_LIFE_TIME               PASSWORD 70                                                                           

PROFILE                        RESOURCE_NAME                    RESOURCE LIMIT                                                                        
------------------------------ -------------------------------- -------- ----------------------------------------                                     
USERFOUR_PROFIL                PASSWORD_REUSE_TIME              PASSWORD 50                                                                           
USERFOUR_PROFIL                PASSWORD_REUSE_MAX               PASSWORD UNLIMITED                                                                    
USERFOUR_PROFIL                PASSWORD_VERIFY_FUNCTION         PASSWORD DEFAULT                                                                      
USERFOUR_PROFIL                PASSWORD_LOCK_TIME               PASSWORD 1                                                                            
USERFOUR_PROFIL                PASSWORD_GRACE_TIME              PASSWORD 5                                                                            

16 rows selected.

SQL> select * from dba_profiles where profile=upper('USERFOUR_Profil') and
  2  limit <>'DEFAULT';

PROFILE                        RESOURCE_NAME                    RESOURCE LIMIT                                                                        
------------------------------ -------------------------------- -------- ----------------------------------------                                     
USERFOUR_PROFIL                SESSIONS_PER_USER                KERNEL   3                                                                            
USERFOUR_PROFIL                CPU_PER_CALL                     KERNEL   2000                                                                         
USERFOUR_PROFIL                LOGICAL_READS_PER_SESSION        KERNEL   1200                                                                         
USERFOUR_PROFIL                IDLE_TIME                        KERNEL   15                                                                           
USERFOUR_PROFIL                CONNECT_TIME                     KERNEL   60                                                                           
USERFOUR_PROFIL                PRIVATE_SGA                      KERNEL   40960                                                                        
USERFOUR_PROFIL                FAILED_LOGIN_ATTEMPTS            PASSWORD 5                                                                            
USERFOUR_PROFIL                PASSWORD_LIFE_TIME               PASSWORD 70                                                                           
USERFOUR_PROFIL                PASSWORD_REUSE_TIME              PASSWORD 50                                                                           
USERFOUR_PROFIL                PASSWORD_REUSE_MAX               PASSWORD UNLIMITED                                                                    
USERFOUR_PROFIL                PASSWORD_LOCK_TIME               PASSWORD 1                                                                            

PROFILE                        RESOURCE_NAME                    RESOURCE LIMIT                                                                        
------------------------------ -------------------------------- -------- ----------------------------------------                                     
USERFOUR_PROFIL                PASSWORD_GRACE_TIME              PASSWORD 5                                                                            

12 rows selected.

SQL> Set linesize 150;
SQL> Desc dba_users;
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 USERNAME                                                                            NOT NULL VARCHAR2(30)
 USER_ID                                                                             NOT NULL NUMBER
 PASSWORD                                                                                     VARCHAR2(30)
 ACCOUNT_STATUS                                                                      NOT NULL VARCHAR2(32)
 LOCK_DATE                                                                                    DATE
 EXPIRY_DATE                                                                                  DATE
 DEFAULT_TABLESPACE                                                                  NOT NULL VARCHAR2(30)
 TEMPORARY_TABLESPACE                                                                NOT NULL VARCHAR2(30)
 CREATED                                                                             NOT NULL DATE
 PROFILE                                                                             NOT NULL VARCHAR2(30)
 INITIAL_RSRC_CONSUMER_GROUP                                                                  VARCHAR2(30)
 EXTERNAL_NAME                                                                                VARCHAR2(4000)
 PASSWORD_VERSIONS                                                                            VARCHAR2(8)
 EDITIONS_ENABLED                                                                             VARCHAR2(1)
 AUTHENTICATION_TYPE                                                                          VARCHAR2(8)

SQL> select username, profile from dba_users where
  2  username=upper('userfour');

USERNAME                       PROFILE                                                                                                                
------------------------------ ------------------------------                                                                                         
USERFOUR                       DEFAULT                                                                                                                

SQL> select username, profile from dba_users where username='ING';

USERNAME                       PROFILE                                                                                                                
------------------------------ ------------------------------                                                                                         
ING                            DEFAULT                                                                                                                

SQL> connect ing/psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> alter user USERFOUR profile USERFOUR_Profil;

User altered.

SQL> connect system/imimane
Connected.
SQL> select role from dba_roles where
  2  role='GESTIONNAIRE_DES_LIVRAISONS';

no rows selected

SQL> connect ing/psw
Error accessing PRODUCT_USER_PROFILE
Warning:  Product user profile information not loaded!
You may need to run PUPBLD.SQL as SYSTEM
Connected.
SQL> create role GESTIONNAIRE_DES_LIVRAISONS;

Role created.

SQL> grant select on FOURNISSEUR to GESTIONNAIRE_DES_LIVRAISONS;

Grant succeeded.

SQL>  grant select on PRODUIT to GESTIONNAIRE_DES_LIVRAISONS;

Grant succeeded.

SQL>  grant select on USINE to GESTIONNAIRE_DES_LIVRAISONS;

Grant succeeded.

SQL>  grant update on LIVRAISON to GESTIONNAIRE_DES_LIVRAISONS;

Grant succeeded.

SQL> grant GESTIONNAIRE_DES_LIVRAISONS to USERFOUR ;

Grant succeeded.

SQL> connect system/imimane
Connected.
SQL> SPOOL OFF
