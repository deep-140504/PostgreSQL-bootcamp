----------------------------------------------------------------------------------------------------
-- Self Joins Part 1
-- NORMAL USE CASE OF SELF JOIN IS TO
-- QUERY HEIRARCHICAL DATA
-- COMPARE ROWS WITHIN THE SAME TABLE
SELECT
	*
FROM
	LEFT_PRODUCTS T1
	INNER JOIN LEFT_PRODUCTS T2 ON T1.PRODUCT_ID = T2.PRODUCT_ID;

SELECT
	T1.MOVIE_NAME,
	T2.MOVIE_NAME,
	T1.MOVIE_LENGTH
FROM
	MOVIES T1
	INNER JOIN MOVIES T2 ON T1.MOVIE_LENGTH = T2.MOVIE_LENGTH
	AND T1.MOVIE_NAME <> T2.MOVIE_NAME
ORDER BY
	T1.MOVIE_LENGTH DESC,
	T1.MOVIE_NAME;

----------------------------------------------------------------------------------------------------
-- Self Joins Part 2
SELECT
	T1.MOVIE_NAME,
	T2.DIRECTOR_ID
FROM
	MOVIES T1
	INNER JOIN MOVIES T2 ON T1.DIRECTOR_ID = T2.MOVIE_ID
ORDER BY
	T2.DIRECTOR_ID;