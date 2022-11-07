import {Router} from 'express'
import dbConnection from '../connection/db.js';

const chapterRoutes= Router();

chapterRoutes.get('/chapters/:id/material',async (req,res)=>{
    const [rows,field]= await dbConnection.query(`
    SELECT  capitulo.id as id_capitulo,
            capitulo.titulo_capitulo,
            capitulo.titulo_material,
            capitulo.descripcion_material,
            archivo.id as id_archivo,
            archivo.nombre_archivo as nombre_archivo,
            archivo.tipo as tipo,
            archivo.enlace as enlace_material,
            archivo.contenido
    FROM capitulo,archivo
    WHERE capitulo.id=? and capitulo.id=archivo.id_capitulo`, [req.params.id]);
    
    const material=rows.map((item)=>{
        return ({ 
            id_archivo:item.id_archivo,
            nombre_archivo:item.nombre_archivo,
            tipo:item.tipo,
            enlace_material:item.enlace_material,
            contenido:item.contenido })
        });

    const result={
        id_capitulo:rows[0].id_capitulo,
        titulo_capitulo:rows[0].titulo_capitulo,
        titulo_material:rows[0].titulo_material,
        descripcion_material:rows[0].descripcion_material,
        material:material
    };
    res.send(result);
})

chapterRoutes.get('/chapters/:id/forum',async (req,res)=>{
    const[rows, fields]= await dbConnection.query(`
    SELECT  capitulo.titulo_capitulo as titulo_capitulo,
            capitulo.titulo_material as titulo_material,
            capitulo.estado_foro as estado,
            capitulo.titulo_foro as titulo_foro,
            capitulo.descripcion_foro as descripcion_foro,
            mensaje.id as id_mensaje,
            mensaje.autor as autor,
            mensaje.contenido as mensaje
    FROM capitulo,mensaje 
    WHERE capitulo.id=? and capitulo.id=mensaje.id_capitulo`, [req.params.id]);
    
    const messages= rows.map((item)=>{
        return ({
                id_mensaje:item.id_mensaje,
                autor:item.autor,
                mensaje:item.mensaje
        });
    });
    const result= {
        titulo_capitulo: rows[0].titulo_capitulo,
        titulo_material: rows[0].titulo_material,
        estado: rows[0].estado,
        titulo_foro: rows[0].titulo_foro,
        descripcion_foro: rows[0].descripcion_foro,
        mensajes: messages
    }
    res.send(result);
})

chapterRoutes.get('/chapters/:id/practice',async (req,res)=>{
    const[rows, fields]= await dbConnection.query(`SELECT 	capitulo.id as id_capitulo ,
                                                            capitulo.titulo_capitulo as titulo_capitulo,
                                                            practica.id as id_practica,
                                                            practica.titulo_practica as titulo_practica,
                                                            practica.enlace_practica as enlace_practica,
                                                            practica.contenido as contenido
                                                    FROM capitulo,practica 
                                                    WHERE capitulo.id=practica.id_capitulo
                                                    AND capitulo.id=?`, [req.params.id]);
    const practices= rows.map((item)=>{
        return ({
                id_practica:item.id_practica,
                titulo_practica:item.titulo_practica,
                enlace_practica:item.enlace_practica,
                contenido:item.contenido
                });
    });

    const result= {
        id_capitulo: rows[0].id_capitulo,
        titulo_capitulo: rows[0].titulo_capitulo,
        practicas: practices
    }

    res.send(result);
})


export default chapterRoutes;