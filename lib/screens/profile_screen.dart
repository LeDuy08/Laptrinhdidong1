import 'package:flutter/material.dart';

import '../widgets/journey_card.dart';
import 'my_journeys_screen.dart';
import 'my_photos_screen.dart';
// 1. Thêm import trang Notifications
import 'notifications_screen.dart';
import 'settings_screen.dart'; 

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double mobileWidth = 450;

    return Scaffold(
      backgroundColor: const Color(0xFFECEFF1),
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
              _buildFakeStatusBar(), 

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeaderWithInfo(context), 
                      
                      const SizedBox(height: 20),
                      
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MyPhotosScreen()),
                          );
                        },
                        child: _buildSectionTitle("My Photos"),
                      ),
                      
                      _buildPhotoGrid(),
                      
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MyJourneysScreen()),
                          );
                        },
                        child: _buildSectionTitle("My Journeys"),
                      ),
                      const JourneyCard(
                        title: "A memory in Danang",
                        location: "Danang, Vietnam",
                        date: "Jan 20, 2020",
                        mainImg: 'assets/images/07.png',
                        sideImg1: 'assets/images/08.png',
                        sideImg2: 'assets/images/09.png',
                      ),
                      const JourneyCard(
                        title: "Sapa in spring",
                        location: "Sapa, Vietnam",
                        date: "Mar 15, 2021",
                        mainImg: 'assets/images/010.png',
                        sideImg1: 'assets/images/011.png',
                        sideImg2: 'assets/images/012.png',
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              // 2. Truyền context vào đây để Navigator hoạt động
              _buildBottomBar(context), 
            ],
          ),
        ),
      ),
    );
  }

  // --- CÁC HÀM BỔ TRỢ ---

  Widget _buildFakeStatusBar() {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 35, right: 20, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "9:41",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
          ),
          Row(
            children: const [
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

  Widget _buildHeaderWithInfo(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          'assets/images/01.png',
          height: 180,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 15, 
          right: 15, 
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
            },
            child: const Icon(Icons.settings, color: Colors.white, size: 20),
          ),
        ),
        const Positioned(bottom: 10, right: 15, child: Icon(Icons.camera_alt, color: Colors.white, size: 20)),
        
        Positioned(
          bottom: -45, 
          left: 20,
          right: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end, 
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: const CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('assets/images/02.png'),
                    ),
                  ),
                  Positioned(
                    bottom: -5,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.teal, 
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(Icons.camera_alt, color: Colors.white, size: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15), 
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("Yoo Jin", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      Text("yoojin@gmail.com", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 10), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(
            width: 25,
            child: Stack(
              children: const [
                Icon(Icons.chevron_right, color: Colors.grey, size: 20),
                Positioned(left: 7, child: Icon(Icons.chevron_right, color: Colors.grey, size: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildRoundedImage('assets/images/03.png', 110)),
              const SizedBox(width: 5),
              Expanded(child: _buildRoundedImage('assets/images/04.png', 110)),
              const SizedBox(width: 5),
              Expanded(child: _buildRoundedImage('assets/images/05.png', 110)),
            ],
          ),
          const SizedBox(height: 5),
          _buildRoundedImage('assets/images/06.png', 150),
        ],
      ),
    );
  }

  Widget _buildRoundedImage(String path, double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.asset(path, height: height, width: double.infinity, fit: BoxFit.cover),
    );
  }

  // --- SỬA HÀM BOTTOM BAR ---
  Widget _buildBottomBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      currentIndex: 4, 
      onTap: (index) {
        // Nút Chuông là vị trí thứ 4 (index = 3)
        if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NotificationsScreen()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
        BottomNavigationBarItem(
          icon: Badge(
            label: Text("2"), // Hiện số 2 thông báo như hình mẫu
            child: Icon(Icons.notifications_none),
          ),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}