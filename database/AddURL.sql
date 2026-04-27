
USE musica_db;

ALTER TABLE canciones
ADD COLUMN URL VARCHAR(150);

/*EJEMPLO DE USO*/
UPDATE canciones
SET URL = 'https://www.youtube.com/watch?v=DyDfgMOUjCI'
WHERE id = 31;

