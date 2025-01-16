// let check = "Welcome to Node.js";
// console.log(check);
// import express from 'express'
import express from "express";

// khởi tạo ứng dụng express
const app = express();

// khai báo API đơn giản
// param1: đường dẫn API. Kiểu string
// param2: func xử lí API
// domain default của BE: http://localhost:3000
// => http://localhost:3000/
// req:nhận yêu cầu từ client(frontend, postman, ...)
// res: trả về kết quả cho client
app.get("/", (req, res) => {
  res.send("Hello World");
});

app.get("/test", (req, res) => {
  res.send("Test APIádasd");
});

// đê code luôn tự thay đổi mà ko cần start lại: npm i nodemon

// khai báo port mặc định cho BE
const port = 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
