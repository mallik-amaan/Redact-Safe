import 'package:flutter/services.dart';
import 'package:redact_safe/core/services/redaction_api_service.dart';
import 'package:redact_safe/features/doc_redact/domain/data_sources/doc_redaction_remote_datasource.dart';

class DocReactionRemoteDatasourceImpl extends DocRedactionRemoteDatasource {
  final RedactionService redactionService;

  DocReactionRemoteDatasourceImpl({required this.redactionService});
  @override
  Future<void> getRedactedDocument() async {
    try {} catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> redactDocument(StringBuffer file) async {
    var jobId = await redactionService.redactDoc(file.toString());
  }
}
