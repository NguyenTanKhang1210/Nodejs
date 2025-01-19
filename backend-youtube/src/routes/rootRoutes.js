// rootRoutes sẽ tổng hợp tất cả các routes của ứng dụng.
// VD: routes của user, product, order, ...
// defind rootRoutes
import express from "express";
// lưu ý:khi import 1 file thì cần ghi đuôi .js
import userRoutes from "./userRoutes.js";
import videoRoutes from "./videoRoutes.js";

const rootRoutes = express.Router();

//import userRoutes vào rootRoutes
// http://localhost:3000/users/....
rootRoutes.use("/users", userRoutes);
rootRoutes.use("/videos", videoRoutes);

export default rootRoutes;
