import 'dart:math';

import 'package:guard_master/common/services/firebase_ref.dart';
import 'package:guard_master/features/splash/data/models/codes_lic_model.dart';

String getRandomValueFromList(List list) {
  if (list.isEmpty) {
    return '';
  }
  final random = Random();
  final randomIndex = random.nextInt(list.length);
  return list[randomIndex];
}

List<String> generateUniqueLicensesRandomStrings(int count) {
  const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const digits = '0123456789';

  var uniqueStrings = <String>{};

  while (uniqueStrings.length < count) {
    var randomString = '';

    for (var i = 0; i < 5; i++) {
      if (i % 2 == 0) {
        randomString += letters[Random().nextInt(letters.length)];
      } else {
        randomString += digits[Random().nextInt(digits.length)];
      }
    }

    randomString += '-';

    for (var i = 0; i < 5; i++) {
      if (i % 2 == 0) {
        randomString += letters[Random().nextInt(letters.length)];
      } else {
        randomString += digits[Random().nextInt(digits.length)];
      }
    }

    randomString += '-';

    for (var i = 0; i < 5; i++) {
      if (i % 2 == 0) {
        randomString += letters[Random().nextInt(letters.length)];
      } else {
        randomString += digits[Random().nextInt(digits.length)];
      }
    }

    randomString += '-';

    for (var i = 0; i < 5; i++) {
      if (i % 2 == 0) {
        randomString += letters[Random().nextInt(letters.length)];
      } else {
        randomString += digits[Random().nextInt(digits.length)];
      }
    }

    randomString += '-';

    for (var i = 0; i < 5; i++) {
      if (i % 2 == 0) {
        randomString += digits[Random().nextInt(digits.length)];
      } else {
        randomString += letters[Random().nextInt(letters.length)];
      }
    }

    uniqueStrings.add(randomString);
  }

  return uniqueStrings.toList();
}

String generateUniqueOTPRandomStrings() {
  const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const digits = '0123456789';

  var randomString = '';

  // Generate the first part (e.g., DW)
  randomString += letters[Random().nextInt(letters.length)];
  randomString += letters[Random().nextInt(letters.length)];

  // Generate the second part (e.g., 286)
  for (var i = 0; i < 3; i++) {
    randomString += digits[Random().nextInt(digits.length)];
  }

  // Generate the third part (e.g., T)
  randomString += letters[Random().nextInt(letters.length)];

  return randomString;
}

List<String> generateUniqueOTPRandomStringsList(int count) {
  const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const digits = '0123456789';

  var uniqueStrings = <String>{};

  while (uniqueStrings.length < count) {
    var randomString = '';

    // Generate the first part (e.g., DW)
    randomString += letters[Random().nextInt(letters.length)];
    randomString += letters[Random().nextInt(letters.length)];

    // Generate the second part (e.g., 286)
    for (var i = 0; i < 3; i++) {
      randomString += digits[Random().nextInt(digits.length)];
    }

    // Generate the third part (e.g., T)
    randomString += letters[Random().nextInt(letters.length)];

    uniqueStrings.add(randomString);
  }

  return uniqueStrings.toList();
}

createLicAndOTP() async {
  final lic = await generateUniqueLicensesRandomStrings(100);
  final List<Future<Map<String, dynamic>>> futures = [];
  for (var l in lic) {
    final otp = await generateUniqueOTPRandomStringsList(10);
    final Map<String, dynamic> data =
        CodesLicModel(activationCode: l, otp: otp,pcSerialNo: null).toMap();
    futures.add(Future(() => data));
    await FirebaseCollection.codes.doc(l).set(data);
  }
  await Future.wait(futures);
}
