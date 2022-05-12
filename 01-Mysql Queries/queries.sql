--Llista el nom de tots els productos que hi ha en la taula producto.
SELECT nombre FROM `producto`;
--Llista els noms i els preus de tots els productos de la taula producto.
SELECT nombre, precio FROM `producto`;
--Llista totes les columnes de la taula producto.
DESCRIBE `producto`;
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
SELECT nombre, precio FROM producto ORDER BY nombre;
SELECT nombre, precio FROM producto ORDER BY precio DESC;
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
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;  
--Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricant, per ordre alfabètic.
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY fabricante.nombre;  
--Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades.
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;
--Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio LIMIT 1;  
--Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio DESC LIMIT 1;  
--Retorna una llista de tots els productes del fabricant Lenovo.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
--Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
SELECT nombre FROM producto WHERE codigo_fabricante = 6 AND precio > 200;
--Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN.
SELECT nombre FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;
--Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Utilitzant l'operador IN.
SELECT nombre FROM producto WHERE codigo_fabriacante IN ('1','3','5');
--Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%e';
--Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%w%';
--Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= 180 ORDER BY producto.precio DESC;
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= 180 ORDER BY producto.nombre;
--Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT DISTINCT fabricante.codigo, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;
--Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.

--Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.

--Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).

--Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense utilitzar INNER JOIN).

--Llista el nom del producte més car del fabricant Lenovo.

--Llista el nom del producte més barat del fabricant Hewlett-Packard.

--Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.

--Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.