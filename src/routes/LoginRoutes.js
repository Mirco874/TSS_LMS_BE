import {Router} from 'express'

const loginRoutes= Router();

loginRoutes.post('/',(req,res)=>{

    res.send('users');
})

export default loginRoutes;