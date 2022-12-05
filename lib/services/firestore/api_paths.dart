class ApiPaths {
  static String posts(String postId) => "groups/$postId";
  static String groups() => "groups";
  static String group(String groupId) => "$groupId/posts";
}