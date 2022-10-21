import { Router} from 'express'
import dbConnection from '../connection/db.js';

const router= Router();

router.get('/chapters',async (req,res)=>{
    const[rows, fields]= await dbConnection.query("SELECT * FROM capitulo");
    res.send(rows);
})

router.get('/chapters/:id/material',async (req,res)=>{
    const[rows, fields]= await dbConnection.query(`
    SELECT  capitulo.titulo_capitulo as titulo_capitulo,
            capitulo.titulo_material as titulo_material,
            capitulo.descripcion_material as descripcion_material,
            archivo.enlace as enlace_material
    FROM capitulo,archivo 
    WHERE capitulo.id=? and 
    capitulo.id=archivo.id_capitulo`, [req.params.id]);
    res.send(rows);
})

router.get('/chapters/:id/forum',async (req,res)=>{
    const[rows, fields]= await dbConnection.query(`
    SELECT  capitulo.titulo_capitulo as titulo_capitulo,
            capitulo.titulo_material as titulo_material,
            capitulo.estado_foro as estado,
            capitulo.titulo_foro as titulo_foro,
            capitulo.descripcion_foro as descripcion_foro,
            mensaje.contenido as mensaje
    FROM capitulo,mensaje 
    WHERE capitulo.id=? and capitulo.id=mensaje.id_capitulo`, [req.params.id]);
    res.send(rows);
})

router.get('/chapters/:id/practice',async (req,res)=>{
    const[rows, fields]= await dbConnection.query(`
    SELECT  capitulo.titulo_capitulo as titulo_capitulo,
            capitulo.titulo_material as titulo_material,
            capitulo.enlace_practica as enlace_practica
    FROM capitulo
    WHERE capitulo.id=? `, [req.params.id]);
    res.send(rows);
})


router.get('/users', async(req,res)=>{
    const[rows, fields]= await dbConnection.query("SELECT * FROM usuario");
    res.send(rows);
})


router.post('/users', async(req,res)=>{
    const {nombre_completo,id_rol,email,password}=req.body
    const[rows, fields]= await dbConnection.query("INSERT INTO usuario (nombre_completo,id_rol,email,password) values(?,?,?,?)",[nombre_completo,id_rol,email,password]);
    res.send(rows);
})



export default router;