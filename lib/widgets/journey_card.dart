import 'package:flutter/material.dart';

// Nhớ import trang chi tiết để Navigator có thể hoạt động
import '../screens/post_detail_screen.dart';

class JourneyCard extends StatelessWidget {
  final String title, location, date, mainImg, sideImg1, sideImg2;
  final int? remainingImages;

  const JourneyCard({
    super.key,
    required this.title,
    required this.location,
    required this.date,
    required this.mainImg,
    required this.sideImg1,
    required this.sideImg2,
    this.remainingImages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        children: [
          // 1. PHẦN HÌNH ẢNH
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: SizedBox(
              height: 180,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(mainImg, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        // --- CẬP NHẬT: Nhấn vào đây để chuyển trang ---
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(sideImg1, fit: BoxFit.cover),
                              ),
                              if (remainingImages != null && remainingImages! > 0)
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const PostDetailScreen(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    color: Colors.black.withOpacity(0.5),
                                    child: Center(
                                      child: Text(
                                        "+$remainingImages",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Expanded(child: Image.asset(sideImg2, fit: BoxFit.cover)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // 2. PHẦN THÔNG TIN CHI TIẾT
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const Icon(Icons.more_horiz, color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.teal),
                    const SizedBox(width: 4),
                    Text(location, style: const TextStyle(color: Colors.teal, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    Row(
                      children: [
                        const Icon(Icons.favorite_border, size: 18, color: Colors.teal),
                        const SizedBox(width: 4),
                        const Text("234 Likes", style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}