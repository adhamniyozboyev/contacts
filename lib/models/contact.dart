class Contacts {
  int id;
  String name;
  String phoneNumber;
  String email;

  Contacts(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      this.email = ''});
}
