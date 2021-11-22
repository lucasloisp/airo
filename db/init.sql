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
