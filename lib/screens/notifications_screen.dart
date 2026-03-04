import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
              // 1. HEADER (Ảnh nền Cầu Rồng + Tiêu đề Notifications trắng)
              _buildHeader(context),

              // 2. DANH SÁCH THÔNG BÁO
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero, // Sát lên phần header
                  children: [
                    _buildNotificationItem(
                      avatar: 'assets/images/014.png', // Tạm dùng avatar có sẵn
                      statusIcon: Icons.location_on,
                      badgeColor: Colors.lightGreen,
                      content: "Tuan Tran accepted your request for the trip in Danang, Vietnam on Jan 20, 2020",
                      time: "Jan 16",
                    ),
                    _buildNotificationItem(
                      avatar: 'assets/images/015.png',
                      statusIcon: Icons.assignment,
                      badgeColor: Colors.orange,
                      content: "Emmy sent you an offer for the trip in Ho Chi Minh, Vietnam on Feb 12, 2020",
                      time: "Jan 16",
                    ),
                    _buildNotificationItem(
                      isSystem: true, // Thông báo từ hệ thống (chữ b)
                      statusIcon: Icons.edit,
                      badgeColor: Colors.blue,
                      content: "Thanks! Your trip in Danang, Vietnam on Jan 20, 2020 has been finished. Please leave a review for the guide Tuan Tran.",
                      time: "Jan 24",
                      showButton: true,
                    ),
                  ],
                ),
              ),

              // 3. THANH ĐIỀU HƯỚNG DƯỚI CÙNG (Sáng ở nút số 4)
              _buildBottomBar(context),
            ],
          ),
        ),
      ),
    );
  }

  // Widget: Header Stack chuẩn mẫu thiết kế
  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        // Ảnh nền Cầu Rồng
        Image.asset(
          'assets/images/013.png', 
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        // Lớp phủ tối nhẹ để chữ trắng nổi bật
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.black.withOpacity(0.2),
        ),
        // Status Bar giả lập (Chữ trắng trên nền ảnh)
        const Positioned(
          top: 12, left: 35, right: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("9:41", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15)),
              Row(
                children: [
                  Icon(Icons.signal_cellular_alt, color: Colors.white, size: 18),
                  SizedBox(width: 5),
                  Icon(Icons.wifi, color: Colors.white, size: 18),
                  SizedBox(width: 5),
                  Icon(Icons.battery_full, color: Colors.white, size: 20),
                ],
              )
            ],
          ),
        ),
        // Nút Tìm kiếm Search
        Positioned(
          top: 60,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
            child: const Icon(Icons.search, color: Colors.white, size: 22),
          ),
        ),
        // Tiêu đề Notifications to và đậm
        const Positioned(
          bottom: 25,
          left: 20,
          child: Text(
            "Notifications",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35, // Chữ rất to
              fontWeight: FontWeight.w900, // Rất đậm
            ),
          ),
        ),
      ],
    );
  }

  // Widget: Từng dòng thông báo có Badge đè lên Avatar
  Widget _buildNotificationItem({
    String? avatar,
    required IconData statusIcon,
    required Color badgeColor,
    required String content,
    required String time,
    bool isSystem = false,
    bool showButton = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar + Badge Icon góc dưới phải
          Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: isSystem ? const Color(0xFF00D1B2) : Colors.grey[200],
                backgroundImage: avatar != null ? AssetImage(avatar) : null,
                child: isSystem 
                  ? const Text("b", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)) 
                  : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: badgeColor, 
                    shape: BoxShape.circle, 
                    border: Border.all(color: Colors.white, width: 2)
                  ),
                  child: Icon(statusIcon, color: Colors.white, size: 12),
                ),
              )
            ],
          ),
          const SizedBox(width: 15),
          // Nội dung text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content, 
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.4)
                ),
                const SizedBox(height: 5),
                Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                if (showButton) ...[
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00D1B2),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("Leave Review", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  )
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget: Bottom Bar sáng ở nút Thông báo (số 4)
  Widget _buildBottomBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      currentIndex: 3, // Nút thứ 4 (index 3) được chọn
      onTap: (index) {
        if (index == 4) Navigator.pop(context); // Nhấn nút số 5 để về Profile
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
        BottomNavigationBarItem(
          icon: Badge(
            label: Text("2"), // Badge đỏ số 2
            child: Icon(Icons.notifications),
          ),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
      ],
    );
  }
}