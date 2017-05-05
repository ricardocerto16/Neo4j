USING PERIODIC COMMIT
LOAD CSV FROM "file:///cliente1.csv" AS line
CREATE (c:Cliente { ClienteID: (line[0]),
Nome: (line[2]),
Email: (line[1]),
Password: (line[3]),
Saldo: TOFLOAT(line[4])})

USING PERIODIC COMMIT
LOAD CSV FROM "file:///cidades1.csv" AS line
CREATE (ci:Cidade { CidadeID: (line[1]),
Nome: (line[0]),
Paises: (line[2])})

USING PERIODIC COMMIT
LOAD CSV FROM "file:///comboio1.csv" AS line
CREATE (co:Comboio {ComboioID: (line[0]),
Capacidade: (line[1])})

USING PERIODIC COMMIT
LOAD CSV FROM "file:///estacao1.csv" AS line
CREATE (e:Estacao {EstacaoID: (line[1]),
Nome: (line[0]),
Cidade: (line[2])})

USING PERIODIC COMMIT
LOAD CSV FROM "file:///paises1.csv" AS line
CREATE (pa:Pais {PaisID: (line[1]), 
Nome: (line[0])})

USING PERIODIC COMMIT
LOAD CSV FROM "file:///percurso1.csv" AS line
CREATE (pe:Percurso { PercursoID: (line[0]),
Partida: (line[1]),
Chegada: (line[2]),
Linha: (line[3]),
Preco: (line[4]),
Comboio: (line[5])})

USING PERIODIC COMMIT
LOAD CSV FROM "file:///lugares1.csv" AS line
CREATE (l:Lugar { NumeroLugar: (line[0]),
Carruagem: (line[1]),
Tipo: (line[2]),
Comboio: (line[3])})

USING PERIODIC COMMIT
LOAD CSV FROM "file:///bilhete1.csv" AS line
CREATE (b:Bilhete { BilheteID: (line[0]),
Carruagem: (line[1]),
Lugar: (line[2]),
Preco: (line[3]),
Tipo: (line[4]),
Data: (line[5]),
Viagem: (line[6]),
Cliente: (line[7]),
Percurso: (line[8])})



CREATE INDEX ON :Cliente(ClienteID);
CREATE INDEX ON :Bilhete(BilheteID);
CREATE INDEX ON :Percurso(PercursoID);
CREATE INDEX ON :Comboio(ComboioID);
CREATE INDEX ON :Estacao(EstacaoID);
CREATE INDEX ON :Pais(PaisID);
CREATE INDEX ON :Cidade(CidadeID);
CREATE INDEX ON :Lugar(NumeroLugar);
CREATE INDEX ON :Lugar(ComboioID);



USING PERIODIC COMMIT
LOAD CSV FROM "file:///bilhete1.csv" AS row
MATCH (bil:Bilhete {BilheteID: row[0]})
MATCH (cli:Cliente {ClienteID: row[7]})
MERGE (cli) -[:RESERVA]-> (bil);

USING PERIODIC COMMIT
LOAD CSV FROM "file:///bilhete1.csv" AS row
MATCH (bil:Bilhete {BilheteID: row[0]})
MATCH (per:Percurso {PercursoID: row[8]})
MERGE (per) -[:POSSUI]-> (bil);

USING PERIODIC COMMIT
LOAD CSV FROM "file:///lugares1.csv" AS row
MATCH (lug:Lugar {NumeroLugar: row[0]}) 
MATCH (comb:Comboio {ComboioID: row[3]})
MERGE (lug) -[:PERTENCE]-> (comb);

USING PERIODIC COMMIT
LOAD CSV FROM "file:///cidades1.csv" AS row
MATCH (ci:Cidade {CidadeID: row[1]})
MATCH (pa:Pais {PaisID: row[2]})
MERGE (pa) -[:TEM]-> (ci);

USING PERIODIC COMMIT
LOAD CSV FROM "file:///estacao1.csv" AS row
MATCH (e:Estacao {EstacaoID: row[1]})
MATCH (ci:Cidade {CidadeID: row[2]})
MERGE (ci) -[:EXISTE]-> (e);

USING PERIODIC COMMIT
LOAD CSV FROM "file:///percurso1.csv" AS row
MATCH (per:Percurso {PercursoID: row[0]})
MATCH (co: Comboio {ComboioID: row[5]})
MERGE (co) -[:ASSOCIADO]-> (per);

USING PERIODIC COMMIT
LOAD CSV FROM "file:///percurso1.csv" AS row
MATCH (per:Percurso {PercursoID: row[0]})
MATCH (e: Estacao {EstacaoID: row[6]})
MERGE (per) -[:ORIGEM]-> (e);

USING PERIODIC COMMIT
LOAD CSV FROM "file:///percurso1.csv" AS row
MATCH (per:Percurso {PercursoID: row[0]})
MATCH (e:Estacao {EstacaoID: row[7]})
MERGE (per) -[:DESTINO]-> (e);




