import { Router } from "express";
const router = Router();
import {createUsers, getUser, getUsers, updateUsers, deleteUser} from '../controllers/user.controllers'
router.get('/users',getUsers );
router.post('/users',createUsers );
router.get('/users/:id',getUser);
router.put('/users/:id',updateUsers );
router.delete('/users/:id',deleteUser ); 





export default router;