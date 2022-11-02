import {Router} from 'express'
import dbConnection from '../connection/db.js';

const classRoutes= Router();

//metodo para obtener los capitulos (o temario) de una clase
classRoutes.get('/class/:id',async (req,res)=>{
    const idClase=req.params.id;
    const query=`SELECT clase.id as id_clase,
                    clase.nombre_clase as nombre_clase,
                    capitulo.titulo_capitulo as titulo_capitulo,
                    capitulo.titulo_material as titulo_material,
                    capitulo.descripcion_material as descripcion_material,
                    capitulo.estado_foro as estado_foro,
                    capitulo.titulo_foro as titulo_foro,
                    capitulo.descripcion_foro as descripcion_foro,
                    capitulo.enlace_practica as enlace_practica
                FROM clase,capitulo 
                WHERE clase.id=? and clase.id=capitulo.id_clase`;

    const[rows, fields]= await dbConnection.query(query,[idClase]);

    const chaptersList=rows.map((row)=>{
        return{ titulo_capitulo: row.titulo_capitulo,
                titulo_material: row.titulo_material,
                descripcion_material: row.descripcion_material,
                estado_foro: row.estado_foro,
                titulo_foro: row.titulo_foro,
                descripcion_foro: row.descripcion_foro,
                enlace_practica: row.enlace_practica
            }
    });

    console.log(chaptersList)

    const result={
                id_clase:rows[0].id_clase,
                nombre_clase:rows[0].nombre_clase,
                capitulos:chaptersList
    }
    console.log(result)

    res.send(result);
})


//metodo para obtener los usuarios estudiantes de una clase
classRoutes.get('/class/:id/users', async(req,res)=>{
    const userId=req.params.id;
    const query=`SELECT usuario.id as id_usuario,
                        usuario.nombre_completo as nombre_completo,
                        usuario.email as email,
                        rol.nombre_rol as rol 
                FROM usuario,usuario_clase,clase,rol 
                where usuario.id=usuario_clase.id_usuario 
                    and rol.id=usuario.id_rol
                    and clase.id=usuario_clase.id_clase
                    and usuario.id_rol=2
                    and clase.id=?`
    const[rows, fields]= await dbConnection.query(query,[userId]);
    res.send(rows);
})

//metodo para guardar un estudiante en una clase
classRoutes.post('/class',async (req,res)=>{
    const nombreClase=req.body.nombre_clase;
    const query=`INSERT INTO clase(nombre_clase) VALUES (?)`;
    const[rows, fields]= await dbConnection.query(query,[nombreClase]);
    res.send(rows);
})



export default classRoutes;