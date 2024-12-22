import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:safe_device/safe_device.dart';
import 'package:shimmer/shimmer.dart';

import '../error/failure.dart';
import '../services/services.dart';

part 'app_device_helper.dart';
part 'color_helper.dart';
part 'common_widget.dart';
part 'failure_helper.dart';
part 'location_helper.dart';
part 'convert_helper.dart';
part 'permission_helper.dart';
part 'text_style_helper.dart';