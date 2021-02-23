"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = require("express");
var router = express_1.Router();
var user_controllers_1 = require("../controllers/user.controllers");
router.get('/users', user_controllers_1.getUsers);
router.post('/users', user_controllers_1.createUsers);
router.get('/users/:id', user_controllers_1.getUser);
router.put('/users/:id', user_controllers_1.updateUsers);
router.delete('/users/:id', user_controllers_1.deleteUser);
exports.default = router;
