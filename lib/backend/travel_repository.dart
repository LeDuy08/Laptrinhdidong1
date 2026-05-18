class UserProfile {
  String firstName;
  String lastName;
  String email;
  String role;
  String avatarImage;
  String coverImage;

  UserProfile({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.avatarImage,
    required this.coverImage,
  });

  String get fullName => '$firstName $lastName';
}

class Journey {
  final String id;
  final String title;
  final String location;
  final String date;
  final String mainImage;
  final String sideImage1;
  final String sideImage2;
  final int remainingImages;
  int likes;

  Journey({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.mainImage,
    required this.sideImage1,
    required this.sideImage2,
    this.remainingImages = 0,
    this.likes = 0,
  });
}

class PhotoItem {
  final String id;
  final String assetPath;

  PhotoItem({required this.id, required this.assetPath});
}

class AppNotification {
  final String id;
  final String content;
  final String time;
  final bool isSystem;
  final bool showButton;
  bool isRead;

  AppNotification({
    required this.id,
    required this.content,
    required this.time,
    this.isSystem = false,
    this.showButton = false,
    this.isRead = false,
  });
}

class Comment {
  final String id;
  final String author;
  final String date;
  final String content;

  Comment({
    required this.id,
    required this.author,
    required this.date,
    required this.content,
  });
}

class PostDetail {
  final String title;
  final String author;
  final String date;
  final String excerpt;
  final String coverImage;
  final List<String> hashtags;
  final List<Comment> comments;

  PostDetail({
    required this.title,
    required this.author,
    required this.date,
    required this.excerpt,
    required this.coverImage,
    required this.hashtags,
    required this.comments,
  });
}

class RelatedPost {
  final String id;
  final String title;
  final String date;
  final String image;

  RelatedPost({
    required this.id,
    required this.title,
    required this.date,
    required this.image,
  });
}

class TravelRepository {
  final UserProfile userProfile;
  final List<Journey> _journeys = [];
  final List<PhotoItem> _photos = [];
  final List<AppNotification> _notifications = [];
  late final PostDetail postDetail;
  final List<RelatedPost> _relatedPosts = [];

  TravelRepository()
      : userProfile = UserProfile(
          firstName: 'Yoo',
          lastName: 'Jin',
          email: 'yoojin@gmail.com',
          role: 'Traveler',
          avatarImage: 'assets/images/02.png',
          coverImage: 'assets/images/01.png',
        ) {
    _journeys.addAll([
      Journey(
        id: 'journey-1',
        title: 'A memory in Danang',
        location: 'Danang, Vietnam',
        date: 'Jan 20, 2020',
        mainImage: 'assets/images/07.png',
        sideImage1: 'assets/images/08.png',
        sideImage2: 'assets/images/09.png',
        likes: 234,
      ),
      Journey(
        id: 'journey-2',
        title: 'Sapa in spring',
        location: 'Sapa, Vietnam',
        date: 'Mar 15, 2021',
        mainImage: 'assets/images/010.png',
        sideImage1: 'assets/images/011.png',
        sideImage2: 'assets/images/012.png',
        remainingImages: 6,
        likes: 128,
      ),
    ]);

    _photos.addAll([
      PhotoItem(id: 'photo-1', assetPath: 'assets/images/03.png'),
      PhotoItem(id: 'photo-2', assetPath: 'assets/images/04.png'),
      PhotoItem(id: 'photo-3', assetPath: 'assets/images/05.png'),
      PhotoItem(id: 'photo-4', assetPath: 'assets/images/06.png'),
      PhotoItem(id: 'photo-5', assetPath: 'assets/images/03.png'),
      PhotoItem(id: 'photo-6', assetPath: 'assets/images/04.png'),
    ]);

    _notifications.addAll([
      AppNotification(
        id: 'notif-1',
        content: 'Tuan Tran accepted your request for the trip in Danang, Vietnam on Jan 20, 2020',
        time: 'Jan 16',
      ),
      AppNotification(
        id: 'notif-2',
        content: 'Emmy sent you an offer for the trip in Ho Chi Minh, Vietnam on Feb 12, 2020',
        time: 'Jan 16',
      ),
      AppNotification(
        id: 'notif-3',
        content: 'Thanks! Your trip in Danang, Vietnam on Jan 20, 2020 has been finished. Please leave a review for the guide Tuan Tran.',
        time: 'Jan 24',
        isSystem: true,
        showButton: true,
      ),
    ]);

    postDetail = PostDetail(
      title: 'Title here: Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      author: 'Chin-Sun',
      date: 'Mar 8, 2020',
      excerpt:
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      coverImage: 'assets/images/017.png',
      hashtags: [
        '#Vietnam Local Guide',
        '#Hoi An',
        '#Da Nang Local Tour',
        '#Vietnam',
        '#Guide',
      ],
      comments: [
        Comment(
          id: 'comment-1',
          author: 'Chin-Hwa Lee',
          date: 'Mar 10, 2020',
          content:
              'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
        ),
      ],
    );

    _relatedPosts.addAll([
      RelatedPost(id: 'related-1', title: 'New Destination in Danang City', date: 'Feb 5, 2020', image: 'assets/images/023.png'),
      RelatedPost(id: 'related-2', title: r'$1 Flight Ticket', date: 'Feb 5, 2020', image: 'assets/images/024.png'),
      RelatedPost(id: 'related-3', title: 'Visit Korea in this Tet Holiday', date: 'Jan 26, 2020', image: 'assets/images/025.png'),
    ]);
  }

  List<Journey> get journeys => List.unmodifiable(_journeys);
  List<PhotoItem> get photos => List.unmodifiable(_photos);
  List<AppNotification> get notifications => List.unmodifiable(_notifications);
  List<RelatedPost> get relatedPosts => List.unmodifiable(_relatedPosts);

  void updateProfile({required String firstName, required String lastName, required String email}) {
    userProfile.firstName = firstName;
    userProfile.lastName = lastName;
    userProfile.email = email;
  }

  void updateAvatar(String assetPath) {
    userProfile.avatarImage = assetPath;
  }

  void updateCoverImage(String assetPath) {
    userProfile.coverImage = assetPath;
  }

  Journey addJourney({
    required String title,
    required String location,
    String date = 'Today',
    String mainImage = 'assets/images/07.png',
    String sideImage1 = 'assets/images/08.png',
    String sideImage2 = 'assets/images/09.png',
    int remainingImages = 0,
  }) {
    final journey = Journey(
      id: 'journey-${_journeys.length + 1}',
      title: title,
      location: location,
      date: date,
      mainImage: mainImage,
      sideImage1: sideImage1,
      sideImage2: sideImage2,
      remainingImages: remainingImages,
      likes: 0,
    );
    _journeys.add(journey);
    return journey;
  }

  PhotoItem addPhoto(String assetPath) {
    final photo = PhotoItem(id: 'photo-${_photos.length + 1}', assetPath: assetPath);
    _photos.add(photo);
    return photo;
  }

  void markNotificationRead(String id) {
    final notification = _notifications.firstWhere((item) => item.id == id, orElse: () => throw StateError('Notification not found'));
    notification.isRead = true;
  }

  int get unreadNotificationCount => _notifications.where((item) => !item.isRead).length;

  void addComment({required String author, required String content, required String date}) {
    postDetail.comments.add(Comment(
      id: 'comment-${postDetail.comments.length + 1}',
      author: author,
      date: date,
      content: content,
    ));
  }
}
