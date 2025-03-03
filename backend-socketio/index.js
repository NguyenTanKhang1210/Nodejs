import express from "express";
import http from "http";
import { Server } from "socket.io";
import cors from "cors";

const app = express();
const server = http.createServer(app);
const io = new Server(server, {
  // define biến io server
  cors: {
    origin: "http://localhost:5173",
    methods: ["GET", "POST"],
    credentials: true,
  },
});

// B2: nhận event từ client
// io: đối tượng server socket
// socket: đối tượng client socket

let count = 1;

io.on("connection", (socket) => {
  console.log("New client connected: ", socket.id);

  // B3: gửi event từ server tới client
  io.emit("sendMessage", { message: "Hello from server" });

  // nhận event increment từ client
  socket.on("increment", () => {
    console.log("Increment event received");
    count = count + 1;
    io.emit("serverSendCount", { count });
  });
  socket.on("reset", () => {
    console.log("Reset event received");
    count = 0; // Reset lại giá trị đếm
    io.emit("serverSendCount", { count });
  });
});

const PORT = 3001;
server.listen(PORT, () => {
  console.log(`Server socketIO is running on port ${PORT}`);
});
