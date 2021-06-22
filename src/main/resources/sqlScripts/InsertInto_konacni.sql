-- STATUS PODACI

INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (NEXTVAL('status_seq'), 'Budžetski student', 'prva');
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (NEXTVAL('status_seq'), 'Samofinansirajući student', 'druga');
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (NEXTVAL('status_seq'), 'Budžetski student', 'treca');

INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (NEXTVAL('status_seq'), 'Budžetski student', 'druga');
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (NEXTVAL('status_seq'), 'Samofinansirajući student', 'treca');
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (NEXTVAL('status_seq'), 'Budžetski student', 'prva');

INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (NEXTVAL('status_seq'), 'Budžetski student', 'cetvrta');
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (NEXTVAL('status_seq'), 'Samofinansirajući student', 'prva');
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (NEXTVAL('status_seq'), 'Budžetski student', 'prva');


--TEST PODATAK
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (-100, 'Test naziv status', 'Test o');


-- FAKULTET PODACI

INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (NEXTVAL('fakultet_seq'), 'Fakultet tehnickih nauka', 'Novi Sad');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (NEXTVAL('fakultet_seq'), 'Pravni fakultet', 'Novi Sad');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (NEXTVAL('fakultet_seq'), 'Filoloski fakultet', 'Beograd');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (NEXTVAL('fakultet_seq'), 'Kriminalisticki fakultet', 'Beograd');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (NEXTVAL('fakultet_seq'), 'Veterinarski fakultet', 'Novi Sad');

--TEST PODATAK
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (-100, 'Test naziv fakultet', 'Test sediste fakultet');


-- DEPARTMAN PODACI

INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (NEXTVAL('departman_seq'), 'Inzenjerstvo informacionih sistema', 'IIS', 1);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (NEXTVAL('departman_seq'), 'Rimsko prvao', 'RP', 2);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (NEXTVAL('departman_seq'), 'Histologija i embrilogija', 'HIE', 5);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (NEXTVAL('departman_seq'), 'Japanski', 'JAP', 3);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (NEXTVAL('departman_seq'), 'Forenzika', 'FO', 4);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (NEXTVAL('departman_seq'), 'Racunarstvo i Automatika', 'RA', 1);

--TEST PODATAK
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (-100, 'Test naziv departmana', 'Test o', 1);

-- STUDENT PODACI

INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (NEXTVAL('student_seq'), 'Selena', 'Garcev', 'jap34g2017', 7, 4);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (NEXTVAL('student_seq'), 'Aleksandra', 'Mrkobrada','rp20g2018', 2, 2);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (NEXTVAL('student_seq'), 'Nikola', 'Vlaskalin', 'rap100g2018', 1, 6);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (NEXTVAL('student_seq'), 'Teodora', 'Dzigurski', 'he1g2018', 5, 3);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (NEXTVAL('student_seq'), 'Damir', 'Bleskanj', 'it49g2018', 8, 1);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (NEXTVAL('student_seq'), 'Nevena', 'Mandic', 'f38g2018', 3, 5);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (NEXTVAL('student_seq'), 'Marijana', 'Djordjijev', 'it30g2017', 4, 1);

--TEST PODATAK
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (-100, 'Test naziv departmana', 'Test oznaka departmana','Test broj_indexa', 1, 2);
