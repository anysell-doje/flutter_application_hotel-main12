class TravelUser {
  String travel_email;
  String travel_pw;
  String travel_tel;
  String travel_name;
  TravelUser(
      this.travel_email, this.travel_pw, this.travel_tel, this.travel_name);

  factory TravelUser.fromJson(Map<String, dynamic> json) => TravelUser(
        json['travel_email'],
        json['travel_pw'],
        json['travel_tel'],
        json['travel_name'],
      );

  Map<String, dynamic> toJson() => {
        'travel_email': travel_email,
        'travel_pw': travel_pw,
        'travel_tel': travel_tel,
        'travel_name': travel_name,
      };
}
