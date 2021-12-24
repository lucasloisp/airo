CREATE TABLE IF NOT EXISTS exercise_set
(
    exercise_name TEXT    NOT NULL,
    set_date      DATE    NOT NULL,
    set_order     INTEGER,
    weight        REAL,
    reps          INTEGER NOT NULL,
    rpe           REAL,
    PRIMARY KEY (exercise_name, set_date, set_order)
);

CREATE VIEW exercise_set_e1rm AS
SELECT s.*,
       rp.percentage,
       s.weight * 100 / rp.percentage AS e1rm
FROM exercise_set s
         LEFT JOIN rpe_percentage rp on s.reps = rp.reps AND s.rpe = rp.rpe

CREATE VIEW daily_1rm_per_exercise AS
SELECT es.set_date, es.exercise_name, es.e1rm
FROM exercise_set_e1rm es
         INNER JOIN (
    SELECT esj.set_date, esj.exercise_name, MAX(esj.e1rm) as e1rm
    FROM exercise_set_e1rm esj
    GROUP BY (esj.set_date, esj.exercise_name)
) esj ON esj.set_date = es.set_date AND esj.exercise_name = es.exercise_name AND esj.e1rm = es.e1rm