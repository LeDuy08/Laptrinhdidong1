import 'package:flutter/material.dart';

import 'change_password_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      
                      _buildEditableAvatar(),

                      const SizedBox(height: 45),

                      // Hàng nhập tên: Chữ đậm và to
                      Row(
                        children: [
                          Expanded(child: _buildTextField("First Name", "Yoo")),
                          const SizedBox(width: 20),
                          Expanded(child: _buildTextField("Last Name", "Jin")),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // Trường Password: Dấu chấm to và đậm
                      _buildTextField("Password", "••••••", isPassword: true),

                      const SizedBox(height: 20),

                      // Nút Change Password: Đậm nét hơn
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
                            );
                          },
                          child: const Text(
                            "Change Password",
                            style: TextStyle(
                              color: Color(0xFF00D1B2), 
                              fontWeight: FontWeight.w900, // Cực đậm
                              fontSize: 16, // To hơn một chút
                            ),
                          ),
                        ),
                      ),
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

  // Widget: App Bar (Sửa chữ Edit Profile và SAVE đậm hơn)
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
            "Edit Profile",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "SAVE",
              style: TextStyle(
                color: Color(0xFF00D1B2), 
                fontWeight: FontWeight.w900, 
                fontSize: 17
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget: Avatar
  Widget _buildEditableAvatar() {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/images/02.png'),
        ),
        Positioned(
          right: 0,
          top: 5,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFF00D1B2),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
          ),
        ),
      ],
    );
  }

  // --- HÀM ĐÃ SỬA: CHỮ ĐẬM VÀ TO HƠN CHO TRANG EDIT ---
  Widget _buildTextField(String label, String initialValue, {bool isPassword = false}) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: isPassword,
      cursorColor: const Color(0xFF00D1B2),
      style: TextStyle(
        fontSize: 18, // Nội dung nhập to hơn
        fontWeight: FontWeight.w600, // Nội dung đậm vừa phải
        letterSpacing: isPassword ? 3 : 0, // Dấu chấm mật khẩu thưa ra
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black, 
          fontSize: 18, // Tên trường (First Name, Last Name...) to và đậm
          fontWeight: FontWeight.w800,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 1.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00D1B2), width: 2.5),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}