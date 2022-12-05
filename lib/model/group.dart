class Group {
  String id;
  String name;

  Group({
    required this.id,
    required this.name,
  });

  static Group fromMap(Map<String, dynamic> data) {
    assert(data.containsKey("id"), "Missing id property");
    assert(data.containsKey("name"), "Missing name property");

    return Group(
      id: data["id"].toString(),
      name: data["name"],
    );
  }
}
