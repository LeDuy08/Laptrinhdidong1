import 'package:flutter/material.dart';

import '../backend/travel_repository.dart';
import '../widgets/journey_card.dart';
// Import trang Add Journey để thực hiện chuyển cảnh
import 'add_journey_screen.dart'; 

class MyJourneysScreen extends StatelessWidget {
  final TravelRepository repository;

  const MyJourneysScreen({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
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
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
              )
            ],
          ),
          child: Column(
            children: [
              // 1. THANH TRẠNG THÁI (9:41)
              _buildFakeStatusBar(),

              // 2. APP BAR (Nút quay lại và Tiêu đề)
              _buildAppBar(context),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // 3. NÚT ADD JOURNEY (Nhấn để chuyển sang AddJourneyScreen)
                      _buildAddJourneyButton(context),

                      // 4. DANH SÁCH CÁC KỶ NIỆM
                      ...repository.journeys.map((journey) => JourneyCard(
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

              // Thanh điều hướng iPhone dưới cùng
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

  // Widget: Nút Add Journey với viền xanh Mint đặc trưng
  Widget _buildAddJourneyButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddJourneyScreen(repository: repository)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF00D1B2), width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add, color: Color(0xFF00D1B2), size: 28),
              SizedBox(width: 8),
              Text(
                "Add Journey",
                style: TextStyle(
                  color: Color(0xFF00D1B2),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget: Giả lập thanh trạng thái iOS
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

  // Widget: Thanh tiêu đề với nút quay lại to đậm
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
                padding: EdgeInsets.only(right: 48), // Bù trừ cho nút Back để text nằm chính giữa
                child: Text(
                  "My Journeys",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}