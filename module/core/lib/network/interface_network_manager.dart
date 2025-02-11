abstract class InterfaceNetworkManager {
  init({
    required String baseUrl,

    /// send timeout seconds
    required int sendTimeOut,

    /// connect timeOut seconds
    required int connectTimeOut,

    /// receive time out seconds
    required int receiveTimeOut,
    required String apiKey,
    required String apiSecret,
  });

  Future dioGet({
    required String path,
    String? token,
    Map<String, dynamic>? queryParam,
    required Function(Map<String, dynamic> json) fromJson,
  });

  Future dioPost({
    required String path,
    required dynamic model,
    String? token,
    required Function(Map<String, dynamic> json)? fromJson,
    bool isSendResponseDirect = false,
    Map<String, dynamic>? queryParam,
  });

  Future dioPut({
    required String path,
    required dynamic model,
    required String token,
    Map<String, dynamic>? queryParam,
    required Function(Map<String, dynamic> json)? fromJson,
  });

  Future dioDelete({
    required String path,
    required Function(Map<String, dynamic> json)? fromJson,
    required String token,
    Map<String, dynamic>? queryParam,
  });
}
