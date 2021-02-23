import { Request, Response } from "express";
import { user } from '../entity/user'
import { getRepository } from "typeorm"

export const getUsers = async (req: Request, res: Response):Promise <Response>  =>{
 const users =await getRepository(user).find();
 return res.json(users);
}


export const getUser = async (req: Request, res: Response):Promise <Response>  =>{
    
    const results =await getRepository(user).findOne(  req.params.id);
    return res.json(results);
   }

export const createUsers = async (req: Request, res: Response):Promise <Response>  =>{
    
   const newUser =   getRepository(user).create(req.body);
  const results =  await getRepository(user).save(newUser);
  return res.json (results)
   };

   export const updateUsers = async (req: Request, res: Response):Promise <Response>  =>{
  const User = await  getRepository(user).findOne(req.params.id);
  if (User){
    getRepository(user).merge(User, req.body);
    const results = await  getRepository(user).save(User);
  }
  return res.status(404).json({msg: 'Not user found'});
   
    };
    export const deleteUser = async (req: Request, res: Response):Promise <Response>  =>{
    
        const results =await getRepository(user).delete(  req.params.id);
        return res.json(results);
       }