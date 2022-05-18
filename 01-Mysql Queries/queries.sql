--Llista el nom de tots els productos que hi ha en la taula producto.
SELECT nombre FROM producto;
--Llista els noms i els preus de tots els productos de la taula producto.
SELECT nombre, precio FROM producto;
--Llista totes les columnes de la taula producto.
SELECT * FROM  producto;
--Llista el nom dels productos, el preu en euros i el preu en dòlars nord-americans (USD).
SELECT nombre , precio, precio*1.04 AS DollarPrice FROM producto
--Llista el nom dels productos, el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars nord-americans.
SELECT nombre AS nom_de_producto, precio AS euros, precio*1.04 AS dolars_nord_americans FROM producto
--Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.
SELECT UPPER(RTRIM(nombre)) AS nombre, precio FROM producto;
--Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.
SELECT LOWER(RTRIM(nombre)) AS nombre, precio FROM producto;
--Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre , CONCAT(UPPER(LEFT(nombre,2)),SUBSTR(nombre, 3 , 99 )) AS nombre_dos_mayuscula FROM fabricante ;
--Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.
SELECT nombre, ROUND(precio) FROM producto ;
--Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, FLOOR(precio) from producto;
--Llista el codi dels fabricants que tenen productos en la taula producto.
SELECT codigo_fabricante from producto;
--Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCT codigo_fabricante from producto;
--Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM fabricante ORDER BY nombre;
--Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM fabricante ORDER BY nombre DESC;
--Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
SELECT nombre, precio FROM producto ORDER BY nombre, precio DESC;
--Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT * FROM fabricante LIMIT 5;
--Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM fabricante LIMIT 3,2;
--Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
--Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
--Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre  from producto WHERE codigo_fabricante = 2;
--Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT producto.nombre, precio, fabricante.nombre FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;  
--Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricant, per ordre alfabètic.
SELECT producto.nombre, precio, fabricante.nombre FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY fabricante.nombre;  
--Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades.
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;
--Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT producto.nombre, precio, fabricante.nombre FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio LIMIT 1;  
--Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT producto.nombre, precio, fabricante.nombre FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio DESC LIMIT 1;  
--Retorna una llista de tots els productes del fabricant Lenovo.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
--Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
SELECT nombre FROM producto WHERE codigo_fabricante = 6 AND precio > 200;
--Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN.
SELECT nombre FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;
--Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Utilitzant l'operador IN.
SELECT nombre FROM producto WHERE codigo_fabriacante IN ('1','3','5');
--Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT producto.nombre, precio, fabricante.nombre FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%e';
--Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
SELECT producto.nombre, precio, fabricante.nombre FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%w%';
--Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
SELECT producto.nombre, precio, fabricante.nombre FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= 180 ORDER BY producto.precio DESC , producto.nombre;
ç--Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT DISTINCT fabricante.codigo, fabricante.nombre FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;
--Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
--Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.nombre IS NULL;
--Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
--Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense utilitzar INNER JOIN).

--Llista el nom del producte més car del fabricant Lenovo.
SELECT nombre FROM producto WHERE codigo_fabricante = 2 ORDER BY precio DESC LIMIT 1;
--Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT nombre FROM producto WHERE codigo_fabricante = 3 ORDER BY precio LIMIT 1;
--Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.

--Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.

--UNIVERSITAT
--Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre
--Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL AND tipo = 'alumno'
--Retorna el llistat dels alumnes que van néixer en 1999.
SELECT nombre, apellido1, apellido2, fecha_nacimiento FROM persona WHERE (fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31') AND tipo = 'alumno'
--Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.
SELECT nombre, apellido1, apellido2, nif FROM persona WHERE telefono IS NULL AND tipo = 'profesor' AND nif LIKE '%K'
--Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7
--Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT persona.apellido1,persona.apellido2,persona.nombre, departamento.nombre FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN  departamento ON departamento.id = profesor.id_departamento WHERE persona.tipo = 'profesor' ORDER BY persona.apellido1, persona.apellido2, persona.nombre
--Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM curso_escolar LEFT JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar LEFT JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura LEFT JOIN persona ON persona.id = alumno_se_matricula_asignatura.id_alumno WHERE persona.nif LIKE '%26902806M%';
--Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id LEFT JOIN grado ON grado.id = 4;
--Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT persona.nombre FROM persona LEFT JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id LEFT JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura LEFT JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE curso_escolar.anyo_inicio = '2018';
--Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
--Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. -El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT departamento.nombre AS departamento, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON departamento.id = profesor.id_departamento ORDER BY departamento.nombre, persona.apellido1, persona.nombre DESC
--Retorna un llistat amb els professors que no estan associats a un departament.
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON departamento.id = profesor.id_departamento WHERE departamento.nombre IS NULL ORDER BY departamento.nombre, persona.apellido1, persona.nombre   
--Retorna un llistat amb els departaments que no tenen professors associats.
SELECT departamento.nombre AS departamento, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id RIGHT JOIN departamento ON departamento.id = profesor.id_departamento WHERE persona.nombre IS NULL ORDER BY departamento.nombre
--Retorna un llistat amb els professors que no imparteixen cap assignatura.
SELECT DISTINCT persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN asignatura ON asignatura.id_profesor = persona.id WHERE asignatura.id_profesor IS NULL
--Retorna un llistat amb les assignatures que no tenen un professor assignat.
SELECT departamento.nombre AS departamento FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id RIGHT JOIN departamento ON departamento.id = profesor.id_departamento WHERE persona.nombre IS NULL ORDER BY departamento.nombre;
--Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT nombre FROM asignatura WHERE id_profesor IS NULL
--Consultes resum:
--Retorna el nombre total d'alumnes que hi ha.
SELECT count(id) FROM persona WHERE persona.tipo = 'alumno'
--Calcula quants alumnes van néixer en 1999.
SELECT count(id) FROM persona WHERE fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31' AND persona.tipo = 'alumno' 
--Calcula quants professors hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a menor pel nombre de professors.
SELECT departamento.nombre, count(profesor.id_profesor) FROM departamento RIGHT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre

--Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT departamento.nombre, count(profesor.id_profesor) FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre
--Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT grado.nombre, count(asignatura.id_grado) FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre ORDER BY count(asignatura.id_grado) DESC
--Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT grado.nombre AS nombre_grado, count(asignatura.id_grado) AS numero_asignaturas FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre HAVING count(asignatura.id_grado) > 40 ORDER BY count(asignatura.id_grado) DESC 
--Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.

--Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.

--Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.

--Retorna totes les dades de l'alumne més jove.
SELECT * FROM universidad.persona ORDER BY fecha_nacimiento DESC LIMIT 1;
--Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.