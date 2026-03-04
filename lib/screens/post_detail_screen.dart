import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({super.key});

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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. ẢNH BÌA LỚN CÓ NÚT "X" VÀ STATUS BAR
                      _buildCoverImage(context),

                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 2. THANH TƯƠNG TÁC ĐẦU BÀI
                            _buildInteractionBar(),
                            const SizedBox(height: 20),

                            // 3. TIÊU ĐỀ CHÍNH
                            const Text(
                              "Title here: Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 1.3),
                            ),
                            const SizedBox(height: 15),

                            // 4. THÔNG TIN TÁC GIẢ
                            _buildAuthorInfo(),
                            const SizedBox(height: 25),

                            // 5. ĐOẠN VĂN BẢN MỞ ĐẦU
                            _buildLongText(),
                            const SizedBox(height: 20),

                            // 6. TRÌNH PHÁT VIDEO
                            _buildVideoPlaceholder(),
                            const SizedBox(height: 30),

                            // 7. PHẦN NỘI DUNG ĐAN XEN
                            _buildSubHeader("Header here: Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                            _buildLongText(),
                            const SizedBox(height: 15),
                            _buildSideBySideImages(), 
                            const SizedBox(height: 15),
                            _buildLongText(),
                            const SizedBox(height: 15),
                            
                            const Text(
                              "It was popularised in the 1960s with the release of Letraset sheets (Link)",
                              style: TextStyle(color: Color(0xFF00D1B2), decoration: TextDecoration.underline),
                            ),
                            const SizedBox(height: 25),

                            // --- KHÚC ĐÃ ĐỔI THỨ TỰ ---
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset('assets/images/026.png', fit: BoxFit.cover, width: double.infinity),
                            ),
                            const SizedBox(height: 20),

                            _buildHashtags(),
                            const SizedBox(height: 15),
                            
                            _buildInteractionBar(), 
                            const SizedBox(height: 30),

                            // 9. PHẦN BÌNH LUẬN
                            _buildCommentSection(),
                            const SizedBox(height: 40),

                            // 10. BÀI VIẾT LIÊN QUAN
                            _buildRelatedPosts(),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Thanh bar iPhone dưới cùng
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

  // --- CẬP NHẬT: THÊM STATUS BAR (Thời gian, Pin, Wifi...) ---
  Widget _buildCoverImage(BuildContext context) {
    return Stack(
      children: [
        // Ảnh bìa
        ClipRRect(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
          child: Image.asset('assets/images/017.png', height: 300, width: double.infinity, fit: BoxFit.cover),
        ),

        // THANH TRẠNG THÁI (9:41, Sóng, Wifi, Pin)
        Positioned(
          top: 12,
          left: 35,
          right: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "9:41",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15),
              ),
              Row(
                children: [
                  Icon(Icons.signal_cellular_alt, color: Colors.white, size: 18),
                  SizedBox(width: 5),
                  Icon(Icons.wifi, color: Colors.white, size: 18),
                  SizedBox(width: 5),
                  Icon(Icons.battery_full, color: Colors.white, size: 20),
                ],
              ),
            ],
          ),
        ),

        // NÚT ĐÓNG "X" (Đẩy xuống một chút để không đè Status Bar)
        Positioned(
          top: 50,
          left: 20,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
              child: const Icon(Icons.close, color: Colors.white, size: 24),
            ),
          ),
        ),
      ],
    );
  }

  // --- CÁC WIDGET THÀNH PHẦN GIỮ NGUYÊN ---

  Widget _buildInteractionBar() {
    return Row(
      children: [
        const Icon(Icons.favorite_border, color: Color(0xFF00D1B2), size: 28),
        const SizedBox(width: 8),
        const Text("Like 46", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        const Spacer(),
        const Icon(Icons.facebook, color: Colors.grey, size: 24), 
        const SizedBox(width: 15),
        const Icon(Icons.share, color: Colors.grey, size: 24), 
        const SizedBox(width: 15),
        const Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 24), 
      ],
    );
  }

  Widget _buildAuthorInfo() {
    return Row(
      children: [
        const CircleAvatar(radius: 22, backgroundImage: AssetImage('assets/images/018.png')),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Chin-Sun", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text("Mar 8, 2020", style: TextStyle(color: Colors.grey, fontSize: 13)),
          ],
        ),
      ],
    );
  }

  Widget _buildLongText() {
    return const Text(
      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      style: TextStyle(color: Colors.black87, fontSize: 15, height: 1.6),
    );
  }

  Widget _buildSubHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        title,
        style: const TextStyle(color: Color(0xFF00D1B2), fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildVideoPlaceholder() {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset('assets/images/019.png', height: 220, width: double.infinity, fit: BoxFit.cover),
        ),
        const Icon(Icons.play_circle_fill, color: Color(0xFF00D1B2), size: 60), 
      ],
    );
  }

  Widget _buildSideBySideImages() {
    return Row(
      children: [
        Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('assets/images/020.png', height: 140, fit: BoxFit.cover))),
        const SizedBox(width: 10),
        Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('assets/images/021.png', height: 140, fit: BoxFit.cover))),
      ],
    );
  }

  Widget _buildHashtags() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: ["#Vietnam Local Guide", "#Hoi An", "#Da Nang Local Tour", "#Vietnam", "#Guide"]
          .map((tag) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
                child: Text(tag, style: const TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500)),
              ))
          .toList(),
    );
  }

  Widget _buildCommentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Comments (1)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Icon(Icons.keyboard_arrow_up, size: 30, color: Color(0xFF00D1B2)),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(radius: 20, backgroundColor: Colors.blue, child: Text("CH", style: TextStyle(color: Colors.white))),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Chin-Hwa Lee", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Mar 10, 2020", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  SizedBox(height: 8),
                  Text("This is an amazing trip! I want to visit here someday.", style: TextStyle(fontSize: 14, height: 1.4)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        TextField(
          decoration: InputDecoration(
            hintText: "Add Your Comment",
            prefixIcon: const Icon(Icons.add_circle, color: Color(0xFF00D1B2), size: 30),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.grey[100],
          ),
        ),
      ],
    );
  }

  Widget _buildRelatedPosts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Related Posts", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        const SizedBox(height: 20),
        _buildRelatedItem("New Destination in Danang City", "Feb 5, 2020", 'assets/images/023.png'),
        _buildRelatedItem("\$1 Flight Ticket", "Feb 5, 2020", 'assets/images/024.png'),
        _buildRelatedItem("Visit Korea in this Tet Holiday", "Jan 26, 2020", 'assets/images/025.png'),
      ],
    );
  }

  Widget _buildRelatedItem(String title, String date, String img) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(date, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          const SizedBox(height: 10),
          ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.asset(img, height: 150, width: double.infinity, fit: BoxFit.cover)),
        ],
      ),
    );
  }
}