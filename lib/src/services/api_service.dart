import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_y/network.dart';

final apiServiceProvider = Provider<ApiClient>((ref) => ApiClient(apiExecutor: DioApiExecutor()));
