import 'package:flutter/material.dart';

import '../backend/travel_repository.dart';
import 'change_password_screen.dart';

class EditProfileScreen extends StatefulWidget {
  final TravelRepository repository;

  const EditProfileScreen({super.key, required this.repository});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final List<String> _avatarOptions = [
    'assets/images/02.png',
    'assets/images/014.png',
    'assets/images/018.png',
    'assets/images/03.png',
  ];
  final List<String> _coverOptions = [
    'assets/images/01.png',
    'assets/images/07.png',
    'assets/images/010.png',
    'assets/images/017.png',
  ];

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.repository.userProfile.firstName);
    _lastNameController = TextEditingController(text: widget.repository.userProfile.lastName);
    _emailController = TextEditingController(text: widget.repository.userProfile.email);
    _passwordController = TextEditingController(text: '••••••');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      _buildEditableCover(),

                      const SizedBox(height: 20),
                      _buildEditableAvatar(),

                      const SizedBox(height: 45),

                      Row(
                        children: [
                          Expanded(child: _buildTextField('First Name', _firstNameController)),
                          const SizedBox(width: 20),
                          Expanded(child: _buildTextField('Last Name', _lastNameController)),
                        ],
                      ),

                      const SizedBox(height: 25),
                      _buildTextField('Email', _emailController),

                      const SizedBox(height: 35),

                      _buildTextField('Password', _passwordController, isPassword: true),

                      const SizedBox(height: 20),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
                            );
                          },
                          child: const Text(
                            'Change Password',
                            style: TextStyle(
                              color: Color(0xFF00D1B2),
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
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

  // Widget: App Bar (Sửa chữ Edit Profile và SAVE đậm hơn)
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
            "Edit Profile",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          TextButton(
            onPressed: () {
              widget.repository.updateProfile(
                firstName: _firstNameController.text,
                lastName: _lastNameController.text,
                email: _emailController.text,
              );
              Navigator.pop(context);
            },
            child: const Text(
              'SAVE',
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

  // Widget: Cover Image
  Widget _buildEditableCover() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.repository.userProfile.coverImage,
                width: double.infinity,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 12,
              top: 12,
              child: GestureDetector(
                onTap: _showCoverSelection,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: _showCoverSelection,
          child: const Text(
            'Change Cover Photo',
            style: TextStyle(
              color: Color(0xFF00D1B2),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // Widget: Avatar
  Widget _buildEditableAvatar() {
    return Column(
      children: [
        GestureDetector(
          onTap: _showAvatarSelection,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(widget.repository.userProfile.avatarImage),
              ),
              Positioned(
                right: 0,
                top: 5,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00D1B2),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: _showAvatarSelection,
          child: const Text(
            'Change Avatar',
            style: TextStyle(
              color: Color(0xFF00D1B2),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  void _showAvatarSelection() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Choose avatar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(height: 1),
              ..._avatarOptions.map(
                (path) => ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage(path)),
                  title: const Text('Select this avatar'),
                  onTap: () {
                    setState(() {
                      widget.repository.updateAvatar(path);
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCoverSelection() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Choose cover photo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(height: 1),
              ..._coverOptions.map(
                (path) => ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(path, width: 50, height: 50, fit: BoxFit.cover),
                  ),
                  title: const Text('Select this cover'),
                  onTap: () {
                    setState(() {
                      widget.repository.updateCoverImage(path);
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // --- HÀM ĐÃ SỬA: CHỮ ĐẬM VÀ TO HƠN CHO TRANG EDIT ---
  Widget _buildTextField(String label, TextEditingController controller, {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      cursorColor: const Color(0xFF00D1B2),
      style: TextStyle(
        fontSize: 18, // Nội dung nhập to hơn
        fontWeight: FontWeight.w600, // Nội dung đậm vừa phải
        letterSpacing: isPassword ? 3 : 0, // Dấu chấm mật khẩu thưa ra
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black, 
          fontSize: 18, // Tên trường (First Name, Last Name...) to và đậm
          fontWeight: FontWeight.w800,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 1.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00D1B2), width: 2.5),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}