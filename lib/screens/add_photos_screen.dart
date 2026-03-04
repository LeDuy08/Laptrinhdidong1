import 'package:flutter/material.dart';

class AddPhotosScreen extends StatelessWidget {
  const AddPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double mobileWidth = 450;

    // Danh sách ảnh giả lập để hiển thị
    final List<Map<String, dynamic>> photoList = [
      {'path': 'assets/images/03.png', 'selected': false},
      {'path': 'assets/images/04.png', 'selected': true},
      {'path': 'assets/images/07.png', 'selected': false},
      {'path': 'assets/images/010.png', 'selected': false},
      {'path': 'assets/images/05.png', 'selected': true},
      {'path': 'assets/images/07.png', 'selected': true},
      {'path': 'assets/images/08.png', 'selected': false},
      {'path': 'assets/images/04.png', 'selected': false},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: mobileWidth,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
          ),
          child: Column(
            children: [
              // 1. THANH TRẠNG THÁI (9:41)
              _buildFakeStatusBar(),

              // 2. APP BAR (Nút X, Tiêu đề, nút DONE)
              _buildAppBar(context),

              // 3. LƯỚI ẢNH CHỌN (GRID VIEW)
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(2),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: photoList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _buildTakePhotoButton();
                    }
                    var item = photoList[index - 1];
                    return _buildSelectableImage(item['path'], item['selected']);
                  },
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

  // Widget: Header App Bar với chữ DONE màu xanh Mint
  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.close, size: 28, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          const Text(
            "Add Photos",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "DONE",
              style: TextStyle(
                color: Color(0xFF00D1B2),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget: Ô đầu tiên - Take Photo
  Widget _buildTakePhotoButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF00D1B2).withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.camera_alt, color: Color(0xFF00D1B2), size: 30),
          SizedBox(height: 5),
          Text(
            "Take Photo",
            style: TextStyle(color: Color(0xFF00D1B2), fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  // Widget: Ô ảnh có vòng tròn chọn
  Widget _buildSelectableImage(String path, bool isSelected) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(path, fit: BoxFit.cover),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? const Color(0xFF00D1B2) : Colors.transparent,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: isSelected
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : null,
          ),
        ),
      ],
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
}