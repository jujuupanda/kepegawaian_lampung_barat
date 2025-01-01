import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:safe_device/safe_device.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_file/open_file.dart';

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
part 'custom_text_form_field.dart';
part 'common_model.dart';
part 'secure_storage_helper.dart';
part 'camera_helper.dart';
part 'pdf_helper.dart';
part 'file_helper.dart';
