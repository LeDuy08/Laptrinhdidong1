import 'package:duamoi/backend/travel_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TravelRepository repository;

  setUp(() {
    repository = TravelRepository();
  });

  test('initial user profile contains full name and email', () {
    expect(repository.userProfile.fullName, 'Yoo Jin');
    expect(repository.userProfile.email, 'yoojin@gmail.com');
  });

  test('update profile changes first name, last name and email', () {
    repository.updateProfile(firstName: 'Minh', lastName: 'Anh', email: 'minhanh@example.com');
    expect(repository.userProfile.firstName, 'Minh');
    expect(repository.userProfile.lastName, 'Anh');
    expect(repository.userProfile.email, 'minhanh@example.com');
  });

  test('update avatar changes profile image asset', () {
    repository.updateAvatar('assets/images/014.png');
    expect(repository.userProfile.avatarImage, 'assets/images/014.png');
  });

  test('update cover image changes profile cover asset', () {
    repository.updateCoverImage('assets/images/010.png');
    expect(repository.userProfile.coverImage, 'assets/images/010.png');
  });

  test('initial journey count is two', () {
    expect(repository.journeys.length, 2);
  });

  test('add journey appends a new journey', () {
    final journey = repository.addJourney(title: 'New Trip', location: 'Hanoi, Vietnam');
    expect(repository.journeys.contains(journey), isTrue);
    expect(repository.journeys.last.title, 'New Trip');
    expect(repository.journeys.last.location, 'Hanoi, Vietnam');
  });

  test('add photo increases photo count', () {
    final before = repository.photos.length;
    repository.addPhoto('assets/images/05.png');
    expect(repository.photos.length, before + 1);
    expect(repository.photos.last.assetPath, 'assets/images/05.png');
  });

  test('initial unread notification count is three', () {
    expect(repository.unreadNotificationCount, 3);
  });

  test('mark notification read decreases unread count', () {
    final id = repository.notifications.first.id;
    repository.markNotificationRead(id);
    expect(repository.notifications.first.isRead, isTrue);
    expect(repository.unreadNotificationCount, 2);
  });

  test('post detail author and title are available', () {
    expect(repository.postDetail.author, 'Chin-Sun');
    expect(repository.postDetail.title, contains('Lorem Ipsum'));
  });

  test('add comment increases comment count', () {
    final before = repository.postDetail.comments.length;
    repository.addComment(author: 'Test User', content: 'Nice post!', date: 'May 18, 2026');
    expect(repository.postDetail.comments.length, before + 1);
    expect(repository.postDetail.comments.last.author, 'Test User');
  });

  test('related posts include ticket offer title', () {
    final titles = repository.relatedPosts.map((item) => item.title).toList();
    expect(titles, contains(r'$1 Flight Ticket'));
  });
}
