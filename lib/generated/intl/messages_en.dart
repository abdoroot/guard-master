// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(e) => "Can not add: ${e}";

  static String m1(e) => "Can not sign out: ${e}";

  static String m2(lic) => "Company Trade license No. ${lic}";

  static String m3(req) => "Edit Activation: ${req}";

  static String m4(req) => "Edit Request Number: ${req}";

  static String m5(e) => "Error checking user existence: ${e}";

  static String m6(error) => "Error: ${error}";

  static String m7(error) => "Error updating request: ${error}";

  static String m8(no) => "PC  Serial No: ${no}";

  static String m9(req) => "Request No ${req}";

  static String m10(error) => "update User error ${error}";

  static String m11(accountType) => "Welcome ${accountType}";

  static String m12(accountType) => "Welcome back ${accountType}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aConfirmationCodeToChangeThePasswordHasBeenSent":
            MessageLookupByLibrary.simpleMessage(
                "A confirmation code to change the password has been sent to the registered email"),
        "accountType": MessageLookupByLibrary.simpleMessage("Account Type"),
        "activation": MessageLookupByLibrary.simpleMessage("Activation"),
        "activationCode":
            MessageLookupByLibrary.simpleMessage("Activation Code"),
        "activationCodeCreatedError": MessageLookupByLibrary.simpleMessage(
            "An error occurred when generating the activation code"),
        "activationCodeCreatedSuccess": MessageLookupByLibrary.simpleMessage(
            "Activation code was generated successfully"),
        "activationStatus":
            MessageLookupByLibrary.simpleMessage("Activation status"),
        "active": MessageLookupByLibrary.simpleMessage("Active"),
        "actives": MessageLookupByLibrary.simpleMessage("Actives"),
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "addNewRequest":
            MessageLookupByLibrary.simpleMessage("Add New Request"),
        "addedSuccess":
            MessageLookupByLibrary.simpleMessage("Added Success..."),
        "addedSuccesses":
            MessageLookupByLibrary.simpleMessage("Added successes"),
        "admin": MessageLookupByLibrary.simpleMessage("Admin"),
        "adminStatus": MessageLookupByLibrary.simpleMessage("Admin status"),
        "admins": MessageLookupByLibrary.simpleMessage("Admins"),
        "allActivation": MessageLookupByLibrary.simpleMessage("All Activation"),
        "allAdmins": MessageLookupByLibrary.simpleMessage("All Admins"),
        "allNewRequests":
            MessageLookupByLibrary.simpleMessage("All New requests"),
        "allOldRequests":
            MessageLookupByLibrary.simpleMessage("All Old requests"),
        "approved": MessageLookupByLibrary.simpleMessage("Approved"),
        "approvedByDubaiCivilDefense": MessageLookupByLibrary.simpleMessage(
            "Approved By Dubai Civil Defense"),
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "camera": MessageLookupByLibrary.simpleMessage("Camera"),
        "canNotAdd": m0,
        "canNotSignOut": m1,
        "canceled": MessageLookupByLibrary.simpleMessage("canceled"),
        "cantFoundPcSerialNumber": MessageLookupByLibrary.simpleMessage(
            "Can\'t found pc serial number"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("change password"),
        "chosesAccountType":
            MessageLookupByLibrary.simpleMessage("Choses account type"),
        "chosesActivationStatus":
            MessageLookupByLibrary.simpleMessage("Choses activation status"),
        "chosesCountry": MessageLookupByLibrary.simpleMessage("Choses country"),
        "chosesOrderStatus":
            MessageLookupByLibrary.simpleMessage("Choses order status"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "companyName": MessageLookupByLibrary.simpleMessage("Company Name"),
        "companyTradeLicenseNo": m2,
        "confirmNewPassword":
            MessageLookupByLibrary.simpleMessage("Confirm New Password"),
        "congratulations":
            MessageLookupByLibrary.simpleMessage("Congratulations!"),
        "contactUs": MessageLookupByLibrary.simpleMessage("Contact us"),
        "continueToChangePassword":
            MessageLookupByLibrary.simpleMessage("Continue"),
        "country": MessageLookupByLibrary.simpleMessage("Country"),
        "doNotWorryEnterTheDataBelowAndWeWill":
            MessageLookupByLibrary.simpleMessage(
                "Do not worry, enter the data below and we will send you a confirmation code to change your password"),
        "editActivation": m3,
        "editRequest": m4,
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "enterAValidVerificationCode": MessageLookupByLibrary.simpleMessage(
            "Enter a valid verification code"),
        "enterLoginInformation":
            MessageLookupByLibrary.simpleMessage("Enter login information"),
        "enterTheNewPassword":
            MessageLookupByLibrary.simpleMessage("Enter the new password"),
        "enterTheOldPasswordAndAddTheNewPasswordThen":
            MessageLookupByLibrary.simpleMessage(
                "Enter the old password and add the new password, then click Save"),
        "enterValidateEmail":
            MessageLookupByLibrary.simpleMessage("make sure your email"),
        "enterValidatePassword": MessageLookupByLibrary.simpleMessage(
            "password should be contain 6 character or 6 number minimum"),
        "enterYourCompanyName":
            MessageLookupByLibrary.simpleMessage("Enter your Company name"),
        "enterYourEmail":
            MessageLookupByLibrary.simpleMessage("Enter your email"),
        "enterYourMobileNumber":
            MessageLookupByLibrary.simpleMessage("Enter your mobile number"),
        "enterYourName":
            MessageLookupByLibrary.simpleMessage("Enter your name"),
        "errorCheckingUserExistence": m5,
        "errorError": m6,
        "errorSentCode":
            MessageLookupByLibrary.simpleMessage("Error Sent code"),
        "errorUpdatingRequestError": m7,
        "extend": MessageLookupByLibrary.simpleMessage("Extend"),
        "failedToCreateCode": MessageLookupByLibrary.simpleMessage(
            "Failed to create a special code, try again"),
        "fcmIsNull": MessageLookupByLibrary.simpleMessage("FCM is Null"),
        "fileHasBeenSentSuccessfully": MessageLookupByLibrary.simpleMessage(
            " file has been sent successfully"),
        "finished": MessageLookupByLibrary.simpleMessage("Finished"),
        "forgotYourPassword":
            MessageLookupByLibrary.simpleMessage("Forgot your password ?"),
        "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "hintEmail":
            MessageLookupByLibrary.simpleMessage("yourname@domain.com"),
        "hintPassword": MessageLookupByLibrary.simpleMessage("************"),
        "hintPhone": MessageLookupByLibrary.simpleMessage("+971 *** *** ****"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "installingANewControlPanel": MessageLookupByLibrary.simpleMessage(
            "Installing a new control panel"),
        "invalidPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Invalid phone number"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "makeSureYourEmail":
            MessageLookupByLibrary.simpleMessage("Make sure your email"),
        "messageQuestion":
            MessageLookupByLibrary.simpleMessage("Message Question"),
        "mobileNumber": MessageLookupByLibrary.simpleMessage("Mobile Number"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
        "newRe": MessageLookupByLibrary.simpleMessage("New"),
        "newRequest": MessageLookupByLibrary.simpleMessage("New Request"),
        "newRequests": MessageLookupByLibrary.simpleMessage("new requests"),
        "newRequestsDetails":
            MessageLookupByLibrary.simpleMessage("New requests Details"),
        "noInternetConnection": MessageLookupByLibrary.simpleMessage(
            "No found Network connection please enable!"),
        "noMatchingDocumentFound":
            MessageLookupByLibrary.simpleMessage("No matching request found."),
        "notActive": MessageLookupByLibrary.simpleMessage("Not Active"),
        "notActives": MessageLookupByLibrary.simpleMessage("Not Actives"),
        "notFoundUser": MessageLookupByLibrary.simpleMessage("Not found user"),
        "numRe": MessageLookupByLibrary.simpleMessage("No."),
        "old": MessageLookupByLibrary.simpleMessage("Old"),
        "oldPassword": MessageLookupByLibrary.simpleMessage("Old Password"),
        "oldRequest": MessageLookupByLibrary.simpleMessage("Old Request"),
        "oldRequests": MessageLookupByLibrary.simpleMessage("Old requests"),
        "orderStatus": MessageLookupByLibrary.simpleMessage("Order status"),
        "otp": MessageLookupByLibrary.simpleMessage("OTP"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordChangedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Password changed successfully"),
        "passwordRestEmailSent":
            MessageLookupByLibrary.simpleMessage("Password Rest Email Sent."),
        "passwordsDoNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "pcSerialNo": m8,
        "pcSerialNumberNotFound":
            MessageLookupByLibrary.simpleMessage("Pc serial number not found"),
        "pending": MessageLookupByLibrary.simpleMessage("Pending"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone number"),
        "pleaseChosesTheOrderStatus": MessageLookupByLibrary.simpleMessage(
            "Please choses the order status"),
        "pressAgainToExit":
            MessageLookupByLibrary.simpleMessage("Press again to exit!"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "reenterYourNewPassword":
            MessageLookupByLibrary.simpleMessage("Re-enter your new password"),
        "rejected": MessageLookupByLibrary.simpleMessage("Rejected"),
        "request": MessageLookupByLibrary.simpleMessage("Request"),
        "requestNoReq": m9,
        "requestUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Request updated successfully!"),
        "requiredField":
            MessageLookupByLibrary.simpleMessage("This field require"),
        "restore": MessageLookupByLibrary.simpleMessage("Restore"),
        "restorePassword":
            MessageLookupByLibrary.simpleMessage("Restore password"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "saveSuccess": MessageLookupByLibrary.simpleMessage("Save Success..."),
        "search": MessageLookupByLibrary.simpleMessage("Search..."),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "sendNewRequests":
            MessageLookupByLibrary.simpleMessage("Send New requests"),
        "sendSuccess": MessageLookupByLibrary.simpleMessage("Send success..."),
        "sendValidateCode":
            MessageLookupByLibrary.simpleMessage("Send validate code"),
        "serverError": MessageLookupByLibrary.simpleMessage("Server Error...."),
        "submitted": MessageLookupByLibrary.simpleMessage("Submitted"),
        "systemActivationKey":
            MessageLookupByLibrary.simpleMessage("System activation Key"),
        "technical": MessageLookupByLibrary.simpleMessage("Technical"),
        "thereAreNoUsersYet":
            MessageLookupByLibrary.simpleMessage("There are no users yet"),
        "updateInformation":
            MessageLookupByLibrary.simpleMessage("Update information"),
        "updateUserError": m10,
        "updateUserSuccessfully":
            MessageLookupByLibrary.simpleMessage("update user successfully"),
        "updatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("updated successfully!"),
        "validName": MessageLookupByLibrary.simpleMessage("Your name require"),
        "validPhone":
            MessageLookupByLibrary.simpleMessage("Your phone number require"),
        "videoSend": MessageLookupByLibrary.simpleMessage("Video Send"),
        "welcome": m11,
        "welcomeBack": m12,
        "whatsappNoInstalled":
            MessageLookupByLibrary.simpleMessage("whatsapp no installed"),
        "whereDoYouWantToSendTheFilm": MessageLookupByLibrary.simpleMessage(
            "Where do you want to send the film?"),
        "work": MessageLookupByLibrary.simpleMessage("Work"),
        "workFilm": MessageLookupByLibrary.simpleMessage("Work Film"),
        "youWillReceiveANotificationWhenYourRequestIsApproved":
            MessageLookupByLibrary.simpleMessage(
                "You will receive a notification when your request is approved"),
        "yourAccountNotActive":
            MessageLookupByLibrary.simpleMessage("Your Account Not Active")
      };
}
