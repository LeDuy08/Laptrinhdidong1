import 'package:flutter/material.dart';

import '../backend/travel_repository.dart';
import '../widgets/journey_card.dart';
import 'my_journeys_screen.dart';
import 'my_photos_screen.dart';
// 1. Thêm import trang Notifications
import 'notifications_screen.dart';
import 'settings_screen.dart'; 

class ProfileScreen extends StatefulWidget {
  final TravelRepository repository;

  const ProfileScreen({super.key, required this.repository});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                            MaterialPageRoute(builder: (context) => MyPhotosScreen(repository: widget.repository)),
                          );
                        },
                        child: _buildSectionTitle("My Photos"),
                      ),
                      
                      _buildPhotoGrid(),
                      
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyJourneysScreen(repository: widget.repository)),
                          );
                        },
                        child: _buildSectionTitle("My Journeys"),
                      ),
                      ...widget.repository.journeys.map((journey) => JourneyCard(
                        title: journey.title,
                        location: journey.location,
                        date: journey.date,
                        mainImg: journey.mainImage,
                        sideImg1: journey.sideImage1,
                        sideImg2: journey.sideImage2,
                        remainingImages: journey.remainingImages > 0 ? journey.remainingImages : null,
                      )),
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
          widget.repository.userProfile.coverImage,
          height: 180,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 15, 
          right: 15, 
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen(repository: widget.repository)))
                .then((_) => setState(() {}));
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
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage(widget.repository.userProfile.avatarImage),
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
                    children: [
                      Text(widget.repository.userProfile.fullName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      Text(widget.repository.userProfile.email, style: const TextStyle(color: Colors.grey, fontSize: 12)),
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
    final photos = widget.repository.photos;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildRoundedImage(photos[0].assetPath, 110)),
              const SizedBox(width: 5),
              Expanded(child: _buildRoundedImage(photos[1].assetPath, 110)),
              const SizedBox(width: 5),
              Expanded(child: _buildRoundedImage(photos[2].assetPath, 110)),
            ],
          ),
          const SizedBox(height: 5),
          _buildRoundedImage(photos[3].assetPath, 150),
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
            MaterialPageRoute(builder: (context) => NotificationsScreen(repository: widget.repository)),
          );
        }
      },
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: ''),
        const BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: ''),
        const BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
        BottomNavigationBarItem(
          icon: Badge(
            label: Text('${widget.repository.unreadNotificationCount}'),
            child: const Icon(Icons.notifications_none),
          ),
          label: 'Notifications',
        ),
        const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}