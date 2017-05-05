USE leiExpress;

select * FROM bilhete
into outfile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/bilhete.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM cidades
into outfile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/cidades.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM cliente
into outfile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/cliente.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM comboio
into outfile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/comboio.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM estação
into outfile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/estacao.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM lugares
into outfile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/lugar.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM paises
into outfile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/pais.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM percurso
into outfile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/percurso.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';
