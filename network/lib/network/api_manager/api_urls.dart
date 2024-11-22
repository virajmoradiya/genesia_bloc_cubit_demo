part of '../../network.dart';

abstract interface class ApiUrl {
  // base url
  static const String baseUrl = "backend.cappsule.co.in";

  // other path
  static const String login = "/api/v1/login";
  static const String verifyOtp = "/api/v1/verify_otp";
  static const String register = "/api/v1/register";
  static const String userProfile = "/api/v1/user_profile";
  static const String updateUserProfile = "/api/v1/update_UserProfile";
  static const String getSavedAddress = "/api/v1/get_saved_address";
  static const String deleteAddress = "/api/v1/delete_address";
  static const String prescriptionList = "/api/v1/prescription_list";
  static const String renamePrescription = "/api/v1/rename_prescription";
  static const String deletePrescription = "/api/v1/delete_prescription";
  static const String multiImageUpload = "/api/v1/multipleImageUpload";
  static const String addLocation = "/api/v1/add_location";
  static const String editLocation = "/api/v1/edit_location";
  static const String createRedisInv = "/api/v1/create_redis_inv";
  static const String newSearch = "/api/v1/new_search";
  static const String newSuggest = "/api/v1/new_suggest";
  static const String getMedicineDetails = "/api/v1/getWebsiteMedicineDetails";
  static const String getWebsiteHealthProductDetails = "/api/v1/getWebsiteHealthProductDetails";
  static const String getWebsiteSaltDetails = "/api/v1/getWebsiteSaltDetails";

}
