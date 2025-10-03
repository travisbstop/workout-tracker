import postgres from 'postgres';

const sql = postgres({
    host: 'localhost',
    port: 5431,
    database: 'workout_tracker_postgres',
    username: 'postgres',
    password: 'password'
})

export default sql;