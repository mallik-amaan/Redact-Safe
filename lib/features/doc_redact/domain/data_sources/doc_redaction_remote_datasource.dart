abstract class DocRedactionRemoteDatasource {
  Future<void> getRedactedDocument();
  Future<void> redactDocument(StringBuffer file);
}
