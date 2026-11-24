SELECT category, SUM(revenue) AS ingreso_total
FROM ventas
GROUP BY category
ORDER BY ingreso_total DESC;

SELECT region,
       SUM(revenue) AS Ingresos,
       SUM(profit)  AS Ganancias,
       ROUND(SUM(profit) / SUM(revenue) * 100, 2) AS Margen_prcnt
FROM ventas
GROUP BY region
ORDER BY Margen_prcnt DESC;

SELECT
sub_category,
SUM(revenue) as Ingresos,
SUM(profit) as Ganancias,
ROUND(SUM(profit)/SUM(revenue)*100, 2) as Margen_prcnt,
CASE
         WHEN SUM(profit) / SUM(revenue) * 100 < 0  THEN 'Pérdida'
         WHEN SUM(profit) / SUM(revenue) * 100 < 15 THEN 'Crítico'
         WHEN SUM(profit) / SUM(revenue) * 100 < 25 THEN 'Medio'
         ELSE 'Saludable'
       END AS estado
FROM ventas
GROUP BY sub_category
ORDER BY Margen_prcnt ASC;