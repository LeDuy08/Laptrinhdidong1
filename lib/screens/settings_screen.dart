import 'package:flutter/material.dart';

// Đừng quên import trang Edit Profile vào đây
import 'edit_profile_screen.dart'; 

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Chiều rộng cố định cho giao diện di động trên Web
    const double mobileWidth = 450;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), 
      body: Center(
        child: Container(
          width: mobileWidth,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
              )
            ],
          ),
          child: Column(
            children: [
              // 1. THANH TRẠNG THÁI (Thời gian, Pin, Sóng)
              _buildFakeStatusBar(),

              // 2. App Bar giả lập (Nút X và Tiêu đề)
              _buildAppBar(context),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // 3. Thẻ Profile màu xanh Mint (Nút Edit Profile nằm ở đây)
                      _buildProfileCard(context), 

                      const SizedBox(height: 10),

                      // 4. Danh sách cài đặt
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            _buildSettingItem(
                              icon: Icons.notifications_none,
                              title: "Notifications",
                              trailing: Switch(
                                value: true,
                                onChanged: (val) {},
                                activeColor: Colors.white,
                                activeTrackColor: const Color(0xFF00D1B2),
                              ),
                            ),
                            _buildSettingItem(icon: Icons.language, title: "Languages"),
                            _buildSettingItem(icon: Icons.payment, title: "Payment"),
                            _buildSettingItem(icon: Icons.shield_outlined, title: "Privacy & Policies"),
                            _buildSettingItem(icon: Icons.email_outlined, title: "Feedback"),
                            _buildSettingItem(icon: Icons.menu_book_outlined, title: "Usage"),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 30),
                      
                      // Nút Sign out
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Sign out",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              // Thanh bar đen dưới cùng giả lập iPhone
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

  // --- HÀM GIẢ LẬP STATUS BAR ---
  Widget _buildFakeStatusBar() {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 35, right: 25, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "9:41",
            style: TextStyle(
              fontWeight: FontWeight.w900, 
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          Row(
            children: const [
              Icon(Icons.signal_cellular_alt, size: 18, color: Colors.black),
              SizedBox(width: 5),
              Icon(Icons.wifi, size: 18, color: Colors.black),
              SizedBox(width: 5),
              Icon(Icons.battery_full, size: 20, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }

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
            "Settings",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 48), 
        ],
      ),
    );
  }

  // --- SỬA LẠI HÀM NÀY ĐỂ CÓ THỂ CHUYỂN TRANG ---
  Widget _buildProfileCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF00D1B2), 
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/images/02.png'),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Yoo Jin",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Traveler",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          // Bọc nút Edit Profile trong GestureDetector để bắt sự kiện nhấn
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfileScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "EDIT PROFILE",
                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({required IconData icon, required String title, Widget? trailing}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.grey[700], size: 22),
          title: Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
        ),
        const Divider(height: 1, indent: 70, endIndent: 20),
      ],
    );
  }
}