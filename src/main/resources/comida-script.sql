--DROP TABLE tb_comida;
--DROP SEQUENCE comida_seq;
--DROP TRIGGER tr_insert_id_comida;

CREATE TABLE tb_comida (
    id               NUMBER(10) NOT NULL PRIMARY KEY,
    nome             VARCHAR2(256),
    descricao        VARCHAR2(256),
    tipo             VARCHAR2(256),
    preco            NUMBER(10, 2),
    acompanhamento   VARCHAR2(256)
);

CREATE SEQUENCE comida_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER tr_insert_id_comida
                  BEFORE INSERT ON tb_comida FOR EACH ROW       
BEGIN
 
SELECT comida_seq.NEXTVAL
INTO :NEW.id
FROM DUAL;
END;
/


INSERT INTO TB_COMIDA (NOME, DESCRICAO, TIPO, PRECO, ACOMPANHAMENTO) VALUES ('Macarrao', 'Massa ao molho sugo com toque especial da casa', 'Massas italiana', 20.99,  'vinho tinto e salada com molho caezar');
INSERT INTO TB_COMIDA (NOME, DESCRICAO, TIPO, PRECO, ACOMPANHAMENTO) VALUES ('Prato Feito', 'Tipica culinaria brasileira com arroz e batata', 'Culinaria brasileira', 20.99,  'Suco natural');
INSERT INTO TB_COMIDA (NOME, DESCRICAO, TIPO, PRECO, ACOMPANHAMENTO) VALUES ('Feijoada', 'Arroz, feijao, bife, ovo frito e salada', 'Culinaria brasileira', 30.99,  'Farofa caseira e suco de laranja');
INSERT INTO TB_COMIDA (NOME, DESCRICAO, TIPO, PRECO, ACOMPANHAMENTO) VALUES ('X-TUDO', 'Lanche com tudo que voce pode imaginar', 'Fast Food', 30.99,  'refrigerante e batata');
INSERT INTO TB_COMIDA (NOME, DESCRICAO, TIPO, PRECO, ACOMPANHAMENTO) VALUES ('CheeseBurger', 'Hamburguer com queijo especial', 'Fast Food', 20.99,  'refrigerante Dolly');
INSERT INTO TB_COMIDA (NOME, DESCRICAO, TIPO, PRECO, ACOMPANHAMENTO) VALUES ('Route64', 'Hamburguer com fungi', 'Fast Food', 32.99,  'refrigerante e batata');
INSERT INTO TB_COMIDA (NOME, DESCRICAO, TIPO, PRECO, ACOMPANHAMENTO) VALUES ('Hamburguer tradicional', 'Pão, maionese, hamburguer, queijo e salada', 'Fast Food', 25.99,  'refrigerante e batata');

commit;

SELECT * FROM TB_COMIDA;