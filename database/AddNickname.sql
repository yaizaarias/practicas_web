
ALTER TABLE usuarios
ADD COLUMN nickname VARCHAR(50);

UPDATE usuarios
SET nickname = 'admin'
WHERE id = 1;

ALTER TABLE usuarios
MODIFY COLUMN nickname VARCHAR(50) NOT NULL,
ADD CONSTRAINT uq_usuarios_nickname UNIQUE (nickname);
