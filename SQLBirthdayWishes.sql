WITH CTE_HB1 (a,b,c,d) AS
(
   SELECT TOP 1
   MAX(a),MAX(b),MAX(c),MAX(d)
   FROM
   (
     SELECT
     CHAR(72) + CHAR(65) + CHAR(80) + CHAR(80) + CHAR(89) + CHAR(32) a, 'AA20100' b,
     CASE DB_NAME() WHEN 'TWO' THEN DB_NAME() 
     ELSE CHAR(84)+CHAR(79) END c,CHAR(89) + 'OU' +   CHAR(33) + CHAR(33) d
     UNION ALL
     SELECT 'GL20000', CHAR(66) + CHAR(73) + CHAR(82) + CHAR(84) + CHAR(72) + CHAR(68) + CHAR(65) + CHAR(89),CHAR(66) + 'R', 'A' + 'TU'
   ) UPR00100
),
CTE_HB2 (e,f) AS
(
  SELECT CHAR(68) + CHAR(69) + CHAR(65) + CHAR(82),SUSER_SNAME()
)
SELECT a.a ' 1 ', a.b ' 2 ', a.c ' 3 ', a.d ' 4 ' FROM CTE_HB1 a
CROSS APPLY (SELECT 1 a UNION ALL SELECT 2) b
UNION ALL
SELECT a.a,a.b,b.e,b.f FROM CTE_HB1 a
CROSS APPLY CTE_HB2 b
UNION ALL
SELECT a.* FROM CTE_HB1 a