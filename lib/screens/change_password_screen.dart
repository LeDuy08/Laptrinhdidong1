import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double mobileWidth = 450;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: mobileWidth,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
              )
            ],
          ),
          child: Column(
            children: [
              _buildFakeStatusBar(),
              _buildAppBar(context),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      
                      // Gọi các ô nhập liệu với thiết kế chữ đậm/to hơn
                      _buildPasswordField("Current Password"),
                      const SizedBox(height: 35),
                      
                      _buildPasswordField("New Password"),
                      const SizedBox(height: 35),
                      
                      _buildPasswordField("Retype New Password"),
                    ],
                  ),
                ),
              ),
              
              // Thanh bar iPhone
              Container(
                height: 5,
                width: 140,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget: Status Bar
  Widget _buildFakeStatusBar() {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 35, right: 25, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("9:41", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
          Row(
            children: [
              Icon(Icons.signal_cellular_alt, size: 18),
              SizedBox(width: 5),
              Icon(Icons.wifi, size: 18),
              SizedBox(width: 5),
              Icon(Icons.battery_full, size: 20),
            ],
          ),
        ],
      ),
    );
  }

  // Widget: App Bar
  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.close, size: 28),
            onPressed: () => Navigator.pop(context),
          ),
          const Text(
            "Change Password",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800), // Tiêu đề trang to và đậm hơn
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "SAVE",
              style: TextStyle(
                color: Color(0xFF00D1B2), 
                fontWeight: FontWeight.w900, // Chữ SAVE cực đậm
                fontSize: 17, // To hơn một chút
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- HÀM ĐÃ SỬA: CHỮ ĐẬM VÀ TO HƠN ---
  Widget _buildPasswordField(String label) {
    return TextFormField(
      obscureText: true,
      initialValue: "••••••",
      cursorColor: const Color(0xFF00D1B2),
      style: const TextStyle(
        fontSize: 20, // Tăng kích thước dấu chấm mật khẩu
        fontWeight: FontWeight.bold, // Làm dấu chấm đậm hơn
        letterSpacing: 3, // Khoảng cách giữa các dấu chấm rộng ra cho dễ nhìn
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black, 
          fontSize: 18, // Tăng kích thước chữ tiêu đề ô nhập
          fontWeight: FontWeight.w700, // Làm tiêu đề đậm (Bold)
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 1.5), // Đường gạch chân đậm hơn
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00D1B2), width: 2.5), // Khi nhấn vào gạch chân sẽ rất rõ
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}