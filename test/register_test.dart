
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:movieee/providers/auth_provider.dart';

// Mock FirebaseAuth instance
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// Mock FirebaseAuth instance
class MockUserCredential extends Mock implements UserCredential {}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  group('AuthProvider', () {
    late AuthProvider authProvider;
    late MockFirebaseAuth mockFirebaseAuth;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      authProvider = AuthProvider();
    });

    test('Register Successful', () async {
      // Arrange
      const email = 'testfgngbfd@example.com';
      const password = 'htjyujfhdgrhtj';
      const expectedMessage = "Successful registration!";
      when(mockFirebaseAuth.createUserWithEmailAndPassword(email: email, password: password))
          .thenAnswer((_) => Future.value(MockUserCredential()));

      // Act
      final result = await authProvider.register(email, password);

      // Assert
      expect(result, expectedMessage);
    });

  });
}
