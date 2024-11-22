part of '../../network.dart';

abstract class _ApiHandler {
  Future<http.Response?> callPost(
      {required String url, required Map<String, dynamic>? body, Map<String, String>? header, Map<String, String>? params});

  Future<http.Response?> callPatch(
      {required String url, required Map<String, dynamic>? body, Map<String, String>? header, Map<String, String>? params});

  Future<http.Response?> callDelete(
      {required String url, required Map<String, dynamic>? body, Map<String, String>? header, Map<String, String>? params});

  Future<http.Response?> callGet({required String url, Map<String, String>? header, Map<String, String>? params});
  Future<http.Response?> callMultipart(
      {required String url,
        Map<String, String>? body,
        required Map<String, String> header,
        Map<String, String>? params,
        required MultiPartType type,
        required List<File> files,
        required String fileKey});

  http.Response? checkResponse({required http.Response response});

  void getHeader(Map<String, String>? header);
}

class ApiManager implements _ApiHandler {
  ApiManager._();

  static final ApiManager _instance = ApiManager._();

  static ApiManager get instance => _instance;

  @override
  Future<http.Response?> callPost(
      {required String url, required Map<String, dynamic>? body, Map<String, String>? header, Map<String, String>? params}) async {
    Uri apiUrl;
    if (params == null) {
      apiUrl = Uri.https(ApiUrl.baseUrl, url);
    } else {
      apiUrl = Uri.https(ApiUrl.baseUrl, url).replace(queryParameters: params);
    }

    log("apiUrl===>$apiUrl");
    var response = await http.post(apiUrl, body: jsonEncode(body), headers: getHeader(header)).onError((error, stackTrace) {
      log("error===>$error");
      throw error ?? const DefaultException();
    });
    return checkResponse(response: response);
  }

  @override
  Future<http.Response?> callGet({required String url, Map<String, String>? header, Map<String, String>? params}) async {
    Uri apiUrl;
    if (params == null) {
      apiUrl = Uri.https(ApiUrl.baseUrl, url);
    } else {
      apiUrl = Uri.https(ApiUrl.baseUrl, url).replace(queryParameters: params);
    }
    log("apiUrl===>$apiUrl");
    var response = await http.get(apiUrl, headers: getHeader(header)).onError((error, stackTrace) {
      log("error===>$error");
      throw error ?? const DefaultException();
    }).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const TimeoutException();
      },
    );

    return checkResponse(response: response);
  }

  @override
  Future<http.Response?> callPatch(
      {required String url, required Map<String, dynamic>? body, Map<String, String>? header, Map<String, String>? params}) async {
    Uri apiUrl;
    if (params == null) {
      apiUrl = Uri.https(ApiUrl.baseUrl, url);
    } else {
      apiUrl = Uri.https(ApiUrl.baseUrl, url).replace(queryParameters: params);
    }

    log("apiUrl===>$apiUrl");
    var response = await http.patch(apiUrl, body: jsonEncode(body), headers: getHeader(header)).onError((error, stackTrace) {
      log("error===>$error");
      throw error ?? const DefaultException();
    });
    return checkResponse(response: response);
  }

  @override
  Future<http.Response?> callDelete(
      {required String url, required Map<String, dynamic>? body, Map<String, String>? header, Map<String, String>? params}) async {
    Uri apiUrl;
    if (params == null) {
      apiUrl = Uri.https(ApiUrl.baseUrl, url);
    } else {
      apiUrl = Uri.https(ApiUrl.baseUrl, url).replace(queryParameters: params);
    }

    log("apiUrl===>$apiUrl");
    var response = await http.delete(apiUrl, body: jsonEncode(body), headers: getHeader(header)).onError((error, stackTrace) {
      log("error===>$error");
      throw error ?? const DefaultException();
    });
    return checkResponse(response: response);
  }


  @override
  Future<http.Response?> callMultipart(
      {required String url,
        Map<String, String>? body,
        required Map<String, String> header,
        Map<String, String>? params,
        required MultiPartType type,
        required List<File> files,
        required String fileKey}) async {
    Uri apiUrl;
    if (params == null) {
      apiUrl = Uri.https(ApiUrl.baseUrl, url);
    } else {
      apiUrl = Uri.https(ApiUrl.baseUrl, url).replace(queryParameters: params);
    }

    log("apiUrl===>$apiUrl");

    var request = http.MultipartRequest(type.value, apiUrl);

      for(var file in files){
        var fileData = http.MultipartFile(
          fileKey,
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: file.path.split('/').last,
        );
        request.files.add(fileData);
      }



    request.headers.addAll(header);

    if (body != null) {
      request.fields.addAll(body);
    }

    var streamedResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamedResponse).onError((error, stackTrace) {
      log("error===>$error");
      throw error ?? const DefaultException();
    });

    return checkResponse(response: response);
  }


  @override
  http.Response? checkResponse({required http.Response response}) {
    String? message;
    if (response.body.isNotEmpty) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse is Map && decodedResponse.containsKey("message")) {
        message = decodedResponse['message'];
      }
    }

    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      // handle Unauthorized token (navigation)
      throw UnAuthenticated(message: message);
    } else {
      //throw
      throw DefaultException(message: message);
    }
  }

  @override
  Map<String, String> getHeader(Map<String, String>? header) {
    Map<String, String> apiHeader = {ApiKeys.contentType: ApiUtils.applicationJson};
    // if (PrefService.instance.authToken != null) {
    //   apiHeader[ApiKeys.authorization] = "Bearer ${PrefService.instance.authToken}";
    // }
    if (header != null) {
      apiHeader.addAll(header);
    }
    return apiHeader;
  }
}

enum MultiPartType {
  post(value: "POST"),
  put(value: "PUT");

  final String value;

  const MultiPartType({required this.value});
}