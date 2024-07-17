import 'package:network_y/network.dart';

import '../../domain/entity/context_entity.dart';
import '../../domain/repository/context_repository.dart';
import '../models/context_model.dart';
import 'context_request.dart';

class NotionContextRepository implements ContextRepository {
  const NotionContextRepository({
    required this.apiClient,
  });

  final ApiClient apiClient;

  @override
  AsyncContexts getContexts() async {
    final _response = await apiClient.call<Map<String, Object?>>.call(const NotionContextRequest());

    return _response.map(
      (data) {
        final _result = List.castFrom<dynamic, Map<String, Object?>>(
          data['results'] as List<dynamic>? ?? [],
        );

        final _contexts = _result.map(ContextModel.fromMap).toList();

        return _contexts;
      },
    );
  }
}
