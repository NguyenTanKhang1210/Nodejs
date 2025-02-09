import express from "express";
import { login, register } from "../controllers/authController.js";

const authRoutes = express.Router();

// Đăng ký
authRoutes.post("/register", register);
// Đăng nhập
authRoutes.post("/login", login);

export default authRoutes;
