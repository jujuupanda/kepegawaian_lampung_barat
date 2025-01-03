part of 'auth_data_source.dart';

class AuthRemoteDataSource extends AuthDataSource {
  @override
  Future<Either<Failure, AuthModel>> login(LoginParam params) async {
    const endpoint = "/api/v1/auth/login";
    final data = {
      "email": params.username,
      "password": params.password,
    };
    final result = await ApiService.loginRequest(endpoint, data);
    await SecureStorageHelper.write(
      key: "username",
      value: "julio",
    );
    return result.fold(
      (failure) => Left(failure),
      (success) => Right(AuthModel.fromJson(success)),
    );
  }
}
