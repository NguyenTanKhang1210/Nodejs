import React, { useState, useEffect } from "react";
import "../style/Chat.css";
import { io } from "socket.io-client";

const socket = io("http://localhost:3001", {
  withCredentials: true,
});

const Chat = ({ chat, onClose }) => {
  const [messages, setMessages] = useState([
    // {
    //     text: 'dài nhiều sớ tốn thời gian đường tóc',
    //     sender: 'user2',
    //     id: 1,
    //     avatar: '/src/assets/jack.png'  // Sửa đường dẫn đến ảnh avatar trong assets
    // },
    // {
    //     text: 'Mà nó đẹp á thấy',
    //     sender: 'user2',
    //     id: 2,
    //     avatar: '/src/assets/jack.png'  // Sửa đường dẫn đến ảnh avatar trong assets
    // },
    // {
    //     text: 'đẹp thì chịu vậy rồi 😂',
    //     sender: 'user1',
    //     id: 3,
    //     avatar: '/src/assets/jack.png',  // Sửa đường dẫn đến ảnh avatar trong assets
    // },
  ]);

  const [newMessage, setNewMessage] = useState("");
  const [image, setImage] = useState(null);
  // currentUser là user hiện tại
  const [currentUser, setCurrentUser] = useState(null);

  const handleSendMessage = () => {
    if (newMessage.trim() || image) {
      // lấy thông tin user từ localStorage
      const token = localStorage.getItem("USER_LOGIN");

      // decode token (cheat decode)
      const parts = token.split(".");
      if (parts.length !== 3) throw new Error("Invalid token format");

      const payload = parts[1]; // Lấy phần payload của JWT (Base64 encoded)
      const decodedPayload = atob(payload); // Giải mã Base64

      // parse string JSON thành JSON
      // {"payload":{"userId":26},"iat":1741419151,"exp":1741426351}
      const userInfor = JSON.parse(decodedPayload).payload;
      setCurrentUser(userInfor.userId);

      console.log("currentUser: ", currentUser);

      const newMsg = {
        text: newMessage,
        receivedId: chat.userId,
        senderId: currentUser,
        avatar: "/src/assets/jack.png", // Sửa đường dẫn đến ảnh avatar trong assets
        image: image,
      };

      // Gửi tin nhắn lên server socketIO
      socket.emit("sendMessage", newMsg);

      // lưu tin nhắn vào state
      // messages.push(newMsg);
      // setMessages(messages);
      setNewMessage("");
      setImage(null);
    }
  };

  const handleImageUpload = (e) => {
    const file = e.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onloadend = () => setImage(reader.result);
      reader.readAsDataURL(file);
    }
  };

  const handleKeyPress = (e) => {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      handleSendMessage();
    }
  };

  socket.on("receiveMessage", (message) => {
    console.log("receiveMessage: ", message);
    messages.push(message);
    setMessages(messages);
  });

  useEffect(() => {
    const chatContent = document.querySelector(".messages-container");

    if (chatContent) {
      chatContent.scrollTop = chatContent.scrollHeight;
    }
  }, [messages]);
  console.log("chat: ", chat);
  // tạo thêm useEffect để lắng nghe sự kiện nhận tin nhắn từ server
  // useEffect(() => {
  //     socket.on('receiveMessage', (message) => {
  //         console.log("receiveMessage: ", message);
  //         messages.push(message);
  //         setMessages(messages);
  //     });
  // }, [chat]);

  return (
    <div className="chat-container">
      {/* Header */}
      <div className="chat-header">
        <div className="user-info">
          <div className="avatar-container">
            <img
              src={chat.avatar} // Đổi lại avatar trong assets
              alt="Avatar"
              className="avatar"
            />
            <div className="status-dot"></div>
          </div>
          <div className="user-details">
            <div className="user-name">{chat.name}</div>
            <div className="user-status">Đang hoạt động</div>
          </div>
        </div>
        <div className="header-actions">
          <button className="header-button">
            <i className="fas fa-phone-alt"></i> {/* FontAwesome icon */}
          </button>
          <button className="header-button">
            <i className="fas fa-video"></i> {/* FontAwesome icon */}
          </button>
          <button className="header-button">-</button>
          <button className="header-button close" onClick={onClose}>
            <i className="fas fa-times"></i> {/* FontAwesome icon */}
          </button>
        </div>
      </div>

      {/* Messages */}
      <div className="messages-container">
        {messages.map((message) => (
          <div
            key={message.id}
            className={`message ${
              message.senderId === currentUser ? "sent" : "received"
            }`}
          >
            {message.senderId === currentUser && (
              <img
                src={message.avatar}
                alt="Avatar"
                className="message-avatar"
              />
            )}
            <div className="message-content">
              <div>{message.text}</div>
              {message.image && (
                <img
                  src={message.image}
                  alt="Uploaded"
                  className="message-image"
                />
              )}
            </div>
          </div>
        ))}
      </div>

      {/* Input Area */}
      <div className="chat-input">
        <div className="input-container">
          <div className="input-actions">
            <label className="action-button">
              <input
                type="file"
                onChange={handleImageUpload}
                style={{ display: "none" }}
                accept="image/*"
              />
              <i className="fas fa-image"></i> {/* FontAwesome icon */}
            </label>
            <button className="action-button">
              <i className="fas fa-paperclip"></i> {/* FontAwesome icon */}
            </button>
            <button className="action-button">
              <i className="fas fa-gift"></i> {/* FontAwesome icon */}
            </button>
          </div>
          <input
            type="text"
            value={newMessage}
            onChange={(e) => setNewMessage(e.target.value)}
            onKeyPress={handleKeyPress}
            placeholder="Aa"
            className="message-input"
          />
          <button className="action-button">
            <i className="fas fa-smile"></i> {/* FontAwesome icon */}
          </button>
          <button className="action-button" onClick={handleSendMessage}>
            <i className="fas fa-thumbs-up"></i> {/* FontAwesome icon */}
          </button>
        </div>
      </div>
    </div>
  );
};

export default Chat;
