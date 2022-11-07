import {createPool} from 'mysql2/promise'

const connection=createPool({
    host: 'localhost',
    user: 'root',
    database: 'tss_lms'
})

export default connection;
