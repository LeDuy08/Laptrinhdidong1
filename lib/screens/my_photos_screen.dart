import 'package:flutter/material.dart';

import '../backend/travel_repository.dart';
import 'add_photos_screen.dart'; 

class MyPhotosScreen extends StatelessWidget {
  final TravelRepository repository;

  const MyPhotosScreen({super.key, required this.repository});

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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _buildAddPhotoButton(context)), 
                          const SizedBox(width: 5),
                          if (repository.photos.length > 0) Expanded(child: _buildImageItem(repository.photos[0].assetPath)),
                          const SizedBox(width: 5),
                          if (repository.photos.length > 1) Expanded(child: _buildImageItem(repository.photos[1].assetPath)),
                        ],
                      ),
                      const SizedBox(height: 5),

                      if (repository.photos.length > 2) _buildImageItem(repository.photos[2].assetPath, height: 200),
                      const SizedBox(height: 5),

                      Row(
                        children: [
                          if (repository.photos.length > 3) Expanded(child: _buildImageItem(repository.photos[3].assetPath)),
                          const SizedBox(width: 5),
                          if (repository.photos.length > 4) Expanded(child: _buildImageItem(repository.photos[4].assetPath)),
                          const SizedBox(width: 5),
                          if (repository.photos.length > 5) Expanded(child: _buildImageItem(repository.photos[5].assetPath)),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              
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

  // --- HÀM ĐÃ SỬA ĐỂ CHUYỂN TRANG ---
  Widget _buildAddPhotoButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddPhotosScreen(repository: repository)),
        );
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF00D1B2).withOpacity(0.5), width: 1),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add, color: Color(0xFF00D1B2), size: 35),
              SizedBox(height: 5),
              Text(
                "Add Photos", 
                style: TextStyle(color: Color(0xFF00D1B2), fontSize: 10, fontWeight: FontWeight.bold)
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Các hàm _buildFakeStatusBar, _buildAppBar, _buildImageItem giữ nguyên như code cũ của bạn
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

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left, size: 35, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          const Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 48),
                child: Text(
                  "My Photos",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageItem(String path, {double? height}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: Image.asset(
        path,
        height: height,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}