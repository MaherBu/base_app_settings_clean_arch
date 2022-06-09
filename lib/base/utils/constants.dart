import 'package:flutter/material.dart';

class PreferencesKeys {
  static const API_BASE_URL = 'api_base_url';
  static const USER_ID = 'user_id';
  static const USER_TOKEN = 'user_token';
  static const FB_USER_TOKEN = 'fb_user_token';
  static const CONSTANTS_KEY = 'constants_key';
  static const USER_REFRESH_TOKEN = 'user_refresh_token';
  static const IS_DEVICE_REGISTERED = 'is_device_registered';
  static const USER_PROFILE = 'user_profile';
  static const CUSTOMER_PROFILE = 'customer_profile';
  static const USER_PRIVATE_TOKEN = 'user_private_token';
  static const PASSWORD = 'password';
  static const USERNAME = 'user_name';
  static const USER_EMAIL = 'user_email';
  static const BIRTH_DATE = 'birth_date';
  static const USER_GENDER = 'user_gender';
  static const USER_PICTURE = 'user_picture';
  static const APP_LANGUAGE = 'app_language';
  static const IS_LOGGED_IN = 'is_logged_in';
  static const USER_FIRST_NAME = 'first_name';
  static const USER_LAST_NAME = 'last_name';
  static const USER_FULL_NAME = 'full_name';
  static const MOBILE_NUMBER = 'mobile_number';

  static const SESSION_COOKIE = 'session_cookie';
  static const SERVER_CONFIG = 'server_config';
  static const SITE_ID = 'site_id';
  static const PARTNER_ID = 'partner_id';
}

// BASE URL
const String BASE_URL = 'http://qabbani2-001-site1.itempurl.com/';

// Supported languages
const LANGUAGE_ARABIC = 'ar';
const LANGUAGE_ENGLISH = 'en';
const LANGUAGE_DEFAULT = LANGUAGE_ENGLISH;

// Errors
const UNKNOWN_ERROR = 0;
const NETWORK_ERROR = 1;
const SERVER_ERROR = 2;

// Response codes
const STATUS_OK = 200;
const BAD_REQUEST = 400;
const NOT_FOUND = 404;
const SERVER_EXCEPTION = 500;

const STATUS_SUCCESS = 'success';
const STATUS_FAILURE = 'failure';


// const int kPageSize = 20;
// const int kRepliesPageSize = 3;

// const int kPostBodyLines = 8;
// const int kCommentBodyLines = 5;

// const kDesignSize = Size(375, 812);
const kMediaAspectRatio = AspectRatio(aspectRatio: 75 / 88);

const int kOkCode = 0;
const int kUnauthorizedCode = -20;
const int kTwoFactorCode = -21;
const int kNeedOtpCode = -22;

class PrefsKeys {
  static const userId = 'user_id_key';
  static const user = 'user_key';
  static const userAccessToken = 'user_access_token_key';
  static const userRefreshToken = 'user_refresh_token_key';
  static const fbId = 'firebase_id_key';
  static const language = 'language_key';
  static const code = 'code';
  static const theme = 'theme';
  static const firebaseToken = 'firebase_token';
  static const deviceGuid = 'device_guid';
}
