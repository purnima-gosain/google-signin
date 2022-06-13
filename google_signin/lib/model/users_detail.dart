class UserDetails {
  String? displayName;
  String? email;
  String? photoUrl;

  //constructors
  UserDetails({this.displayName, this.email, this.photoUrl});
  UserDetails.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    photoUrl = json['photoUrl'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    //object-data
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['photoUrl'] = this.photoUrl;
    data['email'] = this.email;

    return data;
  }
}
