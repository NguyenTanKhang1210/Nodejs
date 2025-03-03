import express from "express";
import { v2 as cloudinary } from "cloudinary";
import multer from "multer";
import { CloudinaryStorage } from "multer-storage-cloudinary";
import dotenv from "dotenv";

dotenv.config();

// cấu hình cloudinary
cloudinary.config({
  cloud_name: process.env.CLOUDINARY_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET,
});

// cấu hình multer với cloudinary
const storage = new CloudinaryStorage({
  cloudinary: cloudinary,
  params: {
    folder: "avatar", // nơi lưu hình trên cloudinary, nếu ko có folder thì cloudinary sẽ tạo folder mới có tên avatar
    format: async (req, file) => {
      // define những file cho phép upload lên cloudinary
      const allowFormats = ["png", "jpg", "gif", "webp", "jpeg"];
      // lấy định dạng file format
      // mimetype: image/png, image/jpeg,...
      // split: tách chuỗi thành mảng
      // image/png => ['image', 'png']

      const fileFormat = file.mimetype.split("/")[1];

      // kiểm tra định dạng file có hợp lệ ko
      // includes: kiểm tra phần tử có trong mảng ko
      if (allowFormats.includes(fileFormat)) {
        return fileFormat;
      }

      return "png"; // return định dạng default của hình
    },
    public_id: (req, file) => {
      // đặt tên hình
      const newName =
        new Date().getTime() + "-" + file.originalname.split(".")[0];
    },
  },
}); // define middleware uploadCloud
export const uploadCloud = multer({ storage });
