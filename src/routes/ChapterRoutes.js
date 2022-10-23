import {Router} from 'express'


const ChapterRoutes= Router();
ChapterRoutes.get('/:id',(req,res)=>{

    if(querySize!==0 ){
        let query="SELECT * FROM capitulo WHERE id=? and ";
        let values=[req.params.id];

        const atributes=req.query;
        for (const property in atributes) {

            query+=property + "=? and " ;
            values.push(atributes[property])

            //el ultimo atriburo del query object
            //que pasa si se inventan un atributo del query
        }
        query=query.substring(0,query.length-4);
        console.log(query)
        console.log(values)
        const[rows, fields]=  dbConnection.query(query,[req.params.id]);
        res.send("asd");
    }

})













export default ChapterRoutes;