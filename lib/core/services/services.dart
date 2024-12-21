import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:safe_device/safe_device.dart';

import '../error/failure.dart';
import '../utils/permission_helper.dart';

part 'api_service.dart';
part 'firebase_service.dart';
part 'notification_service.dart';
part 'secure_storage_service.dart';
part 'token_service.dart';
part 'safe_device_service.dart';
part 'location_service.dart';
part 'permission_handler_service.dart';

class Services {}