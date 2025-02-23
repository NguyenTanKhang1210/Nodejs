import express from "express";
import {
  forgotPassword,
  login,
  loginFacebook,
  register,
  resetPassword,
} from "../controllers/authController.js";

const authRoutes = express.Router();

// Đăng ký
authRoutes.post("/register", register);
// Đăng nhập
authRoutes.post("/login", login);

// forgot password
authRoutes.post("/forgot-password", forgotPassword);

// reset password
authRoutes.post("/reset-password", resetPassword);

// login facebook
authRoutes.post("/login-facebook", loginFacebook);

export default authRoutes;
