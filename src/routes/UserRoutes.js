import { Router} from 'express'
import dbConnection from '../connection/db.js';

const userRoutes= Router();

userRoutes.get('/users/', async(req,res)=>{
    const query=`SELECT usuario.id as id,
                        nombre_completo,
                        email,
                        rol.nombre_rol as rol 
                FROM usuario,rol 
                WHERE usuario.id_rol=rol.id`;
    const[rows, fields]= await dbConnection.query(query);
    res.send(rows);
})

userRoutes.get('/users/:id', async(req,res)=>{
    const query=`SELECT usuario.id as id,
                    nombre_completo,
                    email,
                    rol.nombre_rol as rol 
                FROM usuario,rol 
                WHERE usuario.id_rol=rol.id and usuario.id=?`;
                
    const userId=req.params.id;

    const[rows, fields]= await dbConnection.query(query,[userId]);
    res.send(rows);
})


userRoutes.post('/users', async(req,res)=>{
    const {nombre_completo,id_rol,email,password}=req.body
    const query=`INSERT INTO usuario (nombre_completo,id_rol,email,password) 
                             VALUES(?,?,?,?)`;

    const[rows, fields]= await dbConnection.query(query,[nombre_completo,id_rol,email,password]);
    res.send(rows);
})



export default userRoutes;