-- UPSERT - UPDATE + INSERT
/* 
INSERT INTO table_name (coulmn_list)
VALUES (values_list)
ON CONFLICT target_action;

target_action - DO NOTHING
- DO UPDATE SET column_name = value
WHERE condition
*/
-- CREATE A TABLE
CREATE TABLE TAGS (
	ID SERIAL PRIMARY KEY,
	TAG TEXT UNIQUE,
	UPDATE_DATE TIMESTAMP DEFAULT NOW()
);

-- INSERT RECORDS
INSERT INTO
	TAGS (TAG)
VALUES
	('Pen'),
	('Pencil')
RETURNING
	*;

-- INSERT A RECORDS ON CONFLICT DO NOTHING
INSERT INTO
	TAGS (TAG)
VALUES
	('Pencil')
ON CONFLICT (TAG) DO NOTHING;

SELECT
	*
FROM
	TAGS;

-- INSERT A RECORD ON CONFLICT DO UPDATE
INSERT INTO
	TAGS (TAG)
VALUES
	('Pen')
ON CONFLICT (TAG) DO
UPDATE
SET
	TAG = EXCLUDED.TAG || '1',
	UPDATE_DATE = NOW();

SELECT
	*
FROM
	TAGS;