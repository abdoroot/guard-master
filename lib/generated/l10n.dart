// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Your phone number require`
  String get validPhone {
    return Intl.message(
      'Your phone number require',
      name: 'validPhone',
      desc: '',
      args: [],
    );
  }

  /// `Your name require`
  String get validName {
    return Intl.message(
      'Your name require',
      name: 'validName',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `make sure your email`
  String get enterValidateEmail {
    return Intl.message(
      'make sure your email',
      name: 'enterValidateEmail',
      desc: '',
      args: [],
    );
  }

  /// `password should be contain 6 character or 6 number minimum`
  String get enterValidatePassword {
    return Intl.message(
      'password should be contain 6 character or 6 number minimum',
      name: 'enterValidatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Send validate code`
  String get sendValidateCode {
    return Intl.message(
      'Send validate code',
      name: 'sendValidateCode',
      desc: '',
      args: [],
    );
  }

  /// `This field require`
  String get requiredField {
    return Intl.message(
      'This field require',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Approved By Dubai Civil Defense`
  String get approvedByDubaiCivilDefense {
    return Intl.message(
      'Approved By Dubai Civil Defense',
      name: 'approvedByDubaiCivilDefense',
      desc: '',
      args: [],
    );
  }

  /// `Enter login information`
  String get enterLoginInformation {
    return Intl.message(
      'Enter login information',
      name: 'enterLoginInformation',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `yourname@domain.com`
  String get hintEmail {
    return Intl.message(
      'yourname@domain.com',
      name: 'hintEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `************`
  String get hintPassword {
    return Intl.message(
      '************',
      name: 'hintPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password ?`
  String get forgotYourPassword {
    return Intl.message(
      'Forgot your password ?',
      name: 'forgotYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `+971 *** *** ****`
  String get hintPhone {
    return Intl.message(
      '+971 *** *** ****',
      name: 'hintPhone',
      desc: '',
      args: [],
    );
  }

  /// `Do not worry, enter the data below and we will send you a confirmation code to change your password`
  String get doNotWorryEnterTheDataBelowAndWeWill {
    return Intl.message(
      'Do not worry, enter the data below and we will send you a confirmation code to change your password',
      name: 'doNotWorryEnterTheDataBelowAndWeWill',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueToChangePassword {
    return Intl.message(
      'Continue',
      name: 'continueToChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `change password`
  String get changePassword {
    return Intl.message(
      'change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `A confirmation code to change the password has been sent to the registered email`
  String get aConfirmationCodeToChangeThePasswordHasBeenSent {
    return Intl.message(
      'A confirmation code to change the password has been sent to the registered email',
      name: 'aConfirmationCodeToChangeThePasswordHasBeenSent',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid verification code`
  String get enterAValidVerificationCode {
    return Intl.message(
      'Enter a valid verification code',
      name: 'enterAValidVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Restore password`
  String get restorePassword {
    return Intl.message(
      'Restore password',
      name: 'restorePassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter the new password`
  String get enterTheNewPassword {
    return Intl.message(
      'Enter the new password',
      name: 'enterTheNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get passwordChangedSuccessfully {
    return Intl.message(
      'Password changed successfully',
      name: 'passwordChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get congratulations {
    return Intl.message(
      'Congratulations!',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `Restore`
  String get restore {
    return Intl.message(
      'Restore',
      name: 'restore',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUs {
    return Intl.message(
      'Contact us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `whatsapp no installed`
  String get whatsappNoInstalled {
    return Intl.message(
      'whatsapp no installed',
      name: 'whatsappNoInstalled',
      desc: '',
      args: [],
    );
  }

  /// `Request`
  String get request {
    return Intl.message(
      'Request',
      name: 'request',
      desc: '',
      args: [],
    );
  }

  /// `Activation`
  String get activation {
    return Intl.message(
      'Activation',
      name: 'activation',
      desc: '',
      args: [],
    );
  }

  /// `Admins`
  String get admins {
    return Intl.message(
      'Admins',
      name: 'admins',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `All Admins`
  String get allAdmins {
    return Intl.message(
      'All Admins',
      name: 'allAdmins',
      desc: '',
      args: [],
    );
  }

  /// `PC  Serial No: {no}`
  String pcSerialNo(Object no) {
    return Intl.message(
      'PC  Serial No: $no',
      name: 'pcSerialNo',
      desc: '',
      args: [no],
    );
  }

  /// `Not Actives`
  String get notActives {
    return Intl.message(
      'Not Actives',
      name: 'notActives',
      desc: '',
      args: [],
    );
  }

  /// `Actives`
  String get actives {
    return Intl.message(
      'Actives',
      name: 'actives',
      desc: '',
      args: [],
    );
  }

  /// `Company Trade license No. {lic}`
  String companyTradeLicenseNo(Object lic) {
    return Intl.message(
      'Company Trade license No. $lic',
      name: 'companyTradeLicenseNo',
      desc: '',
      args: [lic],
    );
  }

  /// `Message Question`
  String get messageQuestion {
    return Intl.message(
      'Message Question',
      name: 'messageQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get companyName {
    return Intl.message(
      'Company Name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Choses country`
  String get chosesCountry {
    return Intl.message(
      'Choses country',
      name: 'chosesCountry',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message(
      'Search...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Account Type`
  String get accountType {
    return Intl.message(
      'Account Type',
      name: 'accountType',
      desc: '',
      args: [],
    );
  }

  /// `Update information`
  String get updateInformation {
    return Intl.message(
      'Update information',
      name: 'updateInformation',
      desc: '',
      args: [],
    );
  }

  /// `Enter the old password and add the new password, then click Save`
  String get enterTheOldPasswordAndAddTheNewPasswordThen {
    return Intl.message(
      'Enter the old password and add the new password, then click Save',
      name: 'enterTheOldPasswordAndAddTheNewPasswordThen',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get oldPassword {
    return Intl.message(
      'Old Password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter your new password`
  String get reenterYourNewPassword {
    return Intl.message(
      'Re-enter your new password',
      name: 'reenterYourNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `All Activation`
  String get allActivation {
    return Intl.message(
      'All Activation',
      name: 'allActivation',
      desc: '',
      args: [],
    );
  }

  /// `All New requests`
  String get allNewRequests {
    return Intl.message(
      'All New requests',
      name: 'allNewRequests',
      desc: '',
      args: [],
    );
  }

  /// `Installing a new control panel`
  String get installingANewControlPanel {
    return Intl.message(
      'Installing a new control panel',
      name: 'installingANewControlPanel',
      desc: '',
      args: [],
    );
  }

  /// `Old requests`
  String get oldRequests {
    return Intl.message(
      'Old requests',
      name: 'oldRequests',
      desc: '',
      args: [],
    );
  }

  /// `new requests`
  String get newRequests {
    return Intl.message(
      'new requests',
      name: 'newRequests',
      desc: '',
      args: [],
    );
  }

  /// `All Old requests`
  String get allOldRequests {
    return Intl.message(
      'All Old requests',
      name: 'allOldRequests',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get newRe {
    return Intl.message(
      'New',
      name: 'newRe',
      desc: '',
      args: [],
    );
  }

  /// `No.`
  String get numRe {
    return Intl.message(
      'No.',
      name: 'numRe',
      desc: '',
      args: [],
    );
  }

  /// `Extend`
  String get extend {
    return Intl.message(
      'Extend',
      name: 'extend',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `New requests Details`
  String get newRequestsDetails {
    return Intl.message(
      'New requests Details',
      name: 'newRequestsDetails',
      desc: '',
      args: [],
    );
  }

  /// `Old`
  String get old {
    return Intl.message(
      'Old',
      name: 'old',
      desc: '',
      args: [],
    );
  }

  /// `Order status`
  String get orderStatus {
    return Intl.message(
      'Order status',
      name: 'orderStatus',
      desc: '',
      args: [],
    );
  }

  /// `Choses order status`
  String get chosesOrderStatus {
    return Intl.message(
      'Choses order status',
      name: 'chosesOrderStatus',
      desc: '',
      args: [],
    );
  }

  /// `Choses account type`
  String get chosesAccountType {
    return Intl.message(
      'Choses account type',
      name: 'chosesAccountType',
      desc: '',
      args: [],
    );
  }

  /// `Work`
  String get work {
    return Intl.message(
      'Work',
      name: 'work',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Send success...`
  String get sendSuccess {
    return Intl.message(
      'Send success...',
      name: 'sendSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Work Film`
  String get workFilm {
    return Intl.message(
      'Work Film',
      name: 'workFilm',
      desc: '',
      args: [],
    );
  }

  /// `Where do you want to send the film?`
  String get whereDoYouWantToSendTheFilm {
    return Intl.message(
      'Where do you want to send the film?',
      name: 'whereDoYouWantToSendTheFilm',
      desc: '',
      args: [],
    );
  }

  /// ` file has been sent successfully`
  String get fileHasBeenSentSuccessfully {
    return Intl.message(
      ' file has been sent successfully',
      name: 'fileHasBeenSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Activation status`
  String get activationStatus {
    return Intl.message(
      'Activation status',
      name: 'activationStatus',
      desc: '',
      args: [],
    );
  }

  /// `Choses activation status`
  String get chosesActivationStatus {
    return Intl.message(
      'Choses activation status',
      name: 'chosesActivationStatus',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Not Active`
  String get notActive {
    return Intl.message(
      'Not Active',
      name: 'notActive',
      desc: '',
      args: [],
    );
  }

  /// `Activation Code`
  String get activationCode {
    return Intl.message(
      'Activation Code',
      name: 'activationCode',
      desc: '',
      args: [],
    );
  }

  /// `System activation Key`
  String get systemActivationKey {
    return Intl.message(
      'System activation Key',
      name: 'systemActivationKey',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Save Success...`
  String get saveSuccess {
    return Intl.message(
      'Save Success...',
      name: 'saveSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message(
      'Admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `Technical`
  String get technical {
    return Intl.message(
      'Technical',
      name: 'technical',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Added Success...`
  String get addedSuccess {
    return Intl.message(
      'Added Success...',
      name: 'addedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Company name`
  String get enterYourCompanyName {
    return Intl.message(
      'Enter your Company name',
      name: 'enterYourCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your mobile number`
  String get enterYourMobileNumber {
    return Intl.message(
      'Enter your mobile number',
      name: 'enterYourMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Error Sent code`
  String get errorSentCode {
    return Intl.message(
      'Error Sent code',
      name: 'errorSentCode',
      desc: '',
      args: [],
    );
  }

  /// `Password Rest Email Sent.`
  String get passwordRestEmailSent {
    return Intl.message(
      'Password Rest Email Sent.',
      name: 'passwordRestEmailSent',
      desc: '',
      args: [],
    );
  }

  /// `Send New requests`
  String get sendNewRequests {
    return Intl.message(
      'Send New requests',
      name: 'sendNewRequests',
      desc: '',
      args: [],
    );
  }

  /// `Request No {req}`
  String requestNoReq(Object req) {
    return Intl.message(
      'Request No $req',
      name: 'requestNoReq',
      desc: '',
      args: [req],
    );
  }

  /// `Submitted`
  String get submitted {
    return Intl.message(
      'Submitted',
      name: 'submitted',
      desc: '',
      args: [],
    );
  }

  /// `You will receive a notification when your request is approved`
  String get youWillReceiveANotificationWhenYourRequestIsApproved {
    return Intl.message(
      'You will receive a notification when your request is approved',
      name: 'youWillReceiveANotificationWhenYourRequestIsApproved',
      desc: '',
      args: [],
    );
  }

  /// `canceled`
  String get canceled {
    return Intl.message(
      'canceled',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get finished {
    return Intl.message(
      'Finished',
      name: 'finished',
      desc: '',
      args: [],
    );
  }

  /// `OTP`
  String get otp {
    return Intl.message(
      'OTP',
      name: 'otp',
      desc: '',
      args: [],
    );
  }

  /// `Server Error....`
  String get serverError {
    return Intl.message(
      'Server Error....',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Error checking user existence: {e}`
  String errorCheckingUserExistence(Object e) {
    return Intl.message(
      'Error checking user existence: $e',
      name: 'errorCheckingUserExistence',
      desc: '',
      args: [e],
    );
  }

  /// `Welcome back {accountType}`
  String welcomeBack(Object accountType) {
    return Intl.message(
      'Welcome back $accountType',
      name: 'welcomeBack',
      desc: '',
      args: [accountType],
    );
  }

  /// `Make sure your email`
  String get makeSureYourEmail {
    return Intl.message(
      'Make sure your email',
      name: 'makeSureYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `There are no users yet`
  String get thereAreNoUsersYet {
    return Intl.message(
      'There are no users yet',
      name: 'thereAreNoUsersYet',
      desc: '',
      args: [],
    );
  }

  /// `No matching request found.`
  String get noMatchingDocumentFound {
    return Intl.message(
      'No matching request found.',
      name: 'noMatchingDocumentFound',
      desc: '',
      args: [],
    );
  }

  /// `updated successfully!`
  String get updatedSuccessfully {
    return Intl.message(
      'updated successfully!',
      name: 'updatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Request updated successfully!`
  String get requestUpdatedSuccessfully {
    return Intl.message(
      'Request updated successfully!',
      name: 'requestUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error updating request: {error}`
  String errorUpdatingRequestError(Object error) {
    return Intl.message(
      'Error updating request: $error',
      name: 'errorUpdatingRequestError',
      desc: '',
      args: [error],
    );
  }

  /// `Welcome {accountType}`
  String welcome(Object accountType) {
    return Intl.message(
      'Welcome $accountType',
      name: 'welcome',
      desc: '',
      args: [accountType],
    );
  }

  /// `Can not sign out: {e}`
  String canNotSignOut(Object e) {
    return Intl.message(
      'Can not sign out: $e',
      name: 'canNotSignOut',
      desc: '',
      args: [e],
    );
  }

  /// `Added successes`
  String get addedSuccesses {
    return Intl.message(
      'Added successes',
      name: 'addedSuccesses',
      desc: '',
      args: [],
    );
  }

  /// `Can not add: {e}`
  String canNotAdd(Object e) {
    return Intl.message(
      'Can not add: $e',
      name: 'canNotAdd',
      desc: '',
      args: [e],
    );
  }

  /// `Please choses the order status`
  String get pleaseChosesTheOrderStatus {
    return Intl.message(
      'Please choses the order status',
      name: 'pleaseChosesTheOrderStatus',
      desc: '',
      args: [],
    );
  }

  /// `New Request`
  String get newRequest {
    return Intl.message(
      'New Request',
      name: 'newRequest',
      desc: '',
      args: [],
    );
  }

  /// `Old Request`
  String get oldRequest {
    return Intl.message(
      'Old Request',
      name: 'oldRequest',
      desc: '',
      args: [],
    );
  }

  /// `Add New Request`
  String get addNewRequest {
    return Intl.message(
      'Add New Request',
      name: 'addNewRequest',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Failed to create a special code, try again`
  String get failedToCreateCode {
    return Intl.message(
      'Failed to create a special code, try again',
      name: 'failedToCreateCode',
      desc: '',
      args: [],
    );
  }

  /// `No found Network connection please enable!`
  String get noInternetConnection {
    return Intl.message(
      'No found Network connection please enable!',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Press again to exit!`
  String get pressAgainToExit {
    return Intl.message(
      'Press again to exit!',
      name: 'pressAgainToExit',
      desc: '',
      args: [],
    );
  }

  /// `Edit Request Number: {req}`
  String editRequest(Object req) {
    return Intl.message(
      'Edit Request Number: $req',
      name: 'editRequest',
      desc: '',
      args: [req],
    );
  }

  /// `Edit Activation: {req}`
  String editActivation(Object req) {
    return Intl.message(
      'Edit Activation: $req',
      name: 'editActivation',
      desc: '',
      args: [req],
    );
  }

  /// `Can't found pc serial number`
  String get cantFoundPcSerialNumber {
    return Intl.message(
      'Can\'t found pc serial number',
      name: 'cantFoundPcSerialNumber',
      desc: '',
      args: [],
    );
  }

  /// `Pc serial number not found`
  String get pcSerialNumberNotFound {
    return Intl.message(
      'Pc serial number not found',
      name: 'pcSerialNumberNotFound',
      desc: '',
      args: [],
    );
  }

  /// `update User error {error}`
  String updateUserError(Object error) {
    return Intl.message(
      'update User error $error',
      name: 'updateUserError',
      desc: '',
      args: [error],
    );
  }

  /// `update user successfully`
  String get updateUserSuccessfully {
    return Intl.message(
      'update user successfully',
      name: 'updateUserSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Admin status`
  String get adminStatus {
    return Intl.message(
      'Admin status',
      name: 'adminStatus',
      desc: '',
      args: [],
    );
  }

  /// `Activation code was generated successfully`
  String get activationCodeCreatedSuccess {
    return Intl.message(
      'Activation code was generated successfully',
      name: 'activationCodeCreatedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred when generating the activation code`
  String get activationCodeCreatedError {
    return Intl.message(
      'An error occurred when generating the activation code',
      name: 'activationCodeCreatedError',
      desc: '',
      args: [],
    );
  }

  /// `Your Account Not Active`
  String get yourAccountNotActive {
    return Intl.message(
      'Your Account Not Active',
      name: 'yourAccountNotActive',
      desc: '',
      args: [],
    );
  }

  /// `Not found user`
  String get notFoundUser {
    return Intl.message(
      'Not found user',
      name: 'notFoundUser',
      desc: '',
      args: [],
    );
  }

  /// `FCM is Null`
  String get fcmIsNull {
    return Intl.message(
      'FCM is Null',
      name: 'fcmIsNull',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get approved {
    return Intl.message(
      'Approved',
      name: 'approved',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get rejected {
    return Intl.message(
      'Rejected',
      name: 'rejected',
      desc: '',
      args: [],
    );
  }

  /// `Video Send`
  String get videoSend {
    return Intl.message(
      'Video Send',
      name: 'videoSend',
      desc: '',
      args: [],
    );
  }

  /// `Error: {error}`
  String errorError(Object error) {
    return Intl.message(
      'Error: $error',
      name: 'errorError',
      desc: '',
      args: [error],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
