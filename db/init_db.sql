-- this script initializes the db and populates it with test data

CREATE DATABASE workout_tracker_postgres;

\c workout_tracker_postgres

CREATE TABLE exercises (
    exercise_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    exercise_name varchar(50) NOT NULL,
    exercise_description varchar(255) NOT NULL,
    is_body_weight boolean DEFAULT FALSE
);

INSERT INTO exercises (exercise_name, exercise_description, is_body_weight) VALUES
    ('Bench Press', 'hold the bar above your chest and push upwards', FALSE),
    ('Pushup', 'put your hands on the ground and push upwards', TRUE);


CREATE TABLE workout_plans (
    workout_plan_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    workout_plan_name varchar(50) NOT NULL,
    workout_plan_description varchar(255) NOT NULL
);

INSERT INTO workout_plans (workout_plan_name, workout_plan_description) VALUES
    ('FULL BODY', 'full body 3 days a week, 4 days rest'),
    ('bro split', 'push pull leg day');

CREATE TABLE workouts (
    workout_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    workout_plan_id int REFERENCES workout_plans(workout_plan_id),
    workout_date DATE NOT NULL
);

INSERT INTO workouts (workout_plan_id, workout_date) VALUES
    (1, '2025-10-02'),
    (1, '2015-02-14');

CREATE TABLE performed_exercises (
    performed_exercise_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    workout_id int REFERENCES workouts(workout_id),
    exercise_id int REFERENCES exercises(exercise_id),
    exercise_weight float DEFAULT NULL,
    exercise_reps int NOT NULL,
    exercise_notes varchar(255) NOT NULL
);

INSERT INTO performed_exercises (workout_id, exercise_id, exercise_weight, exercise_reps, exercise_notes) VALUES
    (1, 1, 32.5, 12, 'this is hard no cap'),
    (1, 2, NULL, 500, '500 easy reps lets freaking go');
    