import {Router} from 'express'
import dbConnection from '../connection/db.js';

const messageRoutes= Router();

//obtener los mensajes que intercambie con un usuario
messageRoutes.get("/myMessages",async(req,res)=>{
    const {idUsuarioOrigen,idUsuarioDestino}=req.body;

    const getMyMessagesQuery=`SELECT * 
                              FROM mensaje_usuario 
                              WHERE id_emisor=?
                              AND id_receptor=?
                              `
    const [rows] =await dbConnection.query(getMyMessagesQuery,[idUsuarioOrigen,idUsuarioDestino])
    res.send(rows)
})

messageRoutes.post("/myMessages",async(req,res)=>{
    const {idUsuarioOrigen,idUsuarioDestino,contenido}=req.body;

    const putMessageQuery=`INSERT INTO mensaje_usuario (id_emisor, id_receptor,contenido) 
                              VALUES (?,?,?)`

   await dbConnection.query(putMessageQuery,[idUsuarioOrigen,idUsuarioDestino,contenido])

   res.status(201).send("created")

})


messageRoutes.delete("/myMessages/:id",async(req,res)=>{
    const {id}=req.params;

    const deleteMessageQuery=`DELETE FROM mensaje_usuario WHERE id = ?`

    await dbConnection.query(deleteMessageQuery,[id])

   res.status(200).send("successfull")
})




export default messageRoutes;