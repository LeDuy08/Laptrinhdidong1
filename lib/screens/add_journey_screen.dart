import 'package:flutter/material.dart';

class AddJourneyScreen extends StatelessWidget {
  const AddJourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Giới hạn chiều rộng 450px để chạy Web trông như điện thoại
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
              // 1. THANH TRẠNG THÁI (9:41, Pin, Sóng)
              _buildFakeStatusBar(),

              // 2. APP BAR (Nút X, Tiêu đề, nút DONE)
              _buildAppBar(context),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      // 3. Ô NHẬP TÊN HÀNH TRÌNH
                      _buildTextField("Name", "Journey's Name"),
                      
                      const SizedBox(height: 35),

                      // 4. Ô NHẬP ĐỊA ĐIỂM
                      _buildTextField("Location", "Location of Journey"),

                      const SizedBox(height: 40),

                      // 5. NÚT UPLOAD PHOTOS (Viền xanh mint nét đứt)
                      _buildUploadButton(),
                    ],
                  ),
                ),
              ),

              // Thanh gạch ngang dưới cùng giả lập iPhone
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

  // Widget: Status Bar giả lập
  Widget _buildFakeStatusBar() {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 35, right: 25, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "9:41",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
          ),
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

  // Widget: Header App Bar chuẩn mẫu
  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.close, size: 30, color: Colors.black),
            onPressed: () => Navigator.pop(context), // Nhấn X để quay lại
          ),
          const Text(
            "Add Journey",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "DONE",
              style: TextStyle(
                color: Color(0xFF00D1B2),
                fontWeight: FontWeight.w900,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget: Ô nhập liệu (Chữ to, đậm, gạch chân)
  Widget _buildTextField(String label, String hint) {
    return TextFormField(
      cursorColor: const Color(0xFF00D1B2),
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20, // Chữ tiêu đề to
          fontWeight: FontWeight.w800, // Chữ tiêu đề đậm
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black26, fontWeight: FontWeight.normal),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12, width: 1.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00D1B2), width: 2.5),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }

  // Widget: Nút Upload Photos
  Widget _buildUploadButton() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // Tạo viền xanh mint nét đứt giả lập (Dùng Border thông thường)
        border: Border.all(
          color: const Color(0xFF00D1B2).withOpacity(0.5),
          width: 1.5,
          style: BorderStyle.solid, 
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.camera_alt, color: Color(0xFF00D1B2), size: 24),
          SizedBox(width: 10),
          Text(
            "Upload Photos",
            style: TextStyle(
              color: Color(0xFF00D1B2),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}