import initModels from "../models/init-models.js";
import connect from "../models/connect.js";
import bcrypt from "bcrypt";

const models = initModels(connect);
const register = async (req, res) => {
  try {
    // 1. Nhận dữ liệu: email, pass_word, full_name
    const { full_name, email, pass_word } = req.body;
    console.log("dữ liệu nhận", { full_name, email, pass_word });
    //2.Kiểm tra email đã tồn tại chưa
    // - Nếu tồn tại: trả về lỗi"Email đã tồn tại"
    // - Nếu chưa: thêm mới user vào db
    const userExists = await models.users.findOne({
      where: {
        email: email,
      },
    });
    if (userExists) {
      return res.status(400).json({ message: "Email đã tồn tại" });
    }
    // 3. Mã hóa password
    const hashPassword = bcrypt.hashSync(pass_word, 10);
    // 4. Thêm user (CREATE) vào db
    const result = await models.users.create({
      full_name: full_name,
      email: email,
      pass_word: hashPassword,
    });
    console.log("result: ", result);
    //5.Kiểm tra dữ liệu đổ về có pass không => xóa pass
    const userNew = result.dataValues;
    delete userNew.pass_word;
    //6. Trả dữ liệu đăng kí thành công cho FE
    res.status(200).json(result);
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: error.message });
  }
};

const login = async (req, res) => {
  try {
    // 1. Nhận dữ liệu: email, pass_word
    const { email, pass_word } = req.body;
    console.log({ email, pass_word });
    // 2. Kiểm tra email có tồn tại không
    // - Nếu chưa tồn tại: trả về lỗi "Email không tồn tại"
    // - Nếu tồn tại: đi tiếp
    const userExists = await models.users.findOne({
      where: {
        email: email,
      },
    });
    if (!userExists) {
      return res.status(400).json({ message: "Email không tồn tại" });
    }
    // 2.1 Thêm => kiểm tra tài khoản đăng nhập FB hay Google
    // TK đăng nhập bằng FB hoặc Google: trả về lỗi "Vui lòng đăng nhập bằng FB hoặc Google để cập nhật mật khẩu"
    if (!userExists.dataValues.pass_word) {
      return res.status(400).json({
        message: "Vui lòng đăng nhập bằng FB hoặc Google để cập nhật mật khẩu",
      });
    }
    // 3. Kiểm tra pass_word có khớp không
    const isPassword = bcrypt.compareSync(
      pass_word,
      userExists.dataValues.pass_word
    );
    if (!isPassword) {
      return res.status(400).json({ message: "Mật khẩu không đúng" });
    }
    // 3.1 Gửi email chào mừng
    // 4. Trả kết quả thành công
    res.status(200).json("Đăng nhập thành công");
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: error.message });
  }
};

export { register, login };
