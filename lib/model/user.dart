class User {
  String username;
  String email;
   int cycleLength;
  DateTime recentPeriodDate;
  int periodLength;




  User(this.username, this.email,this.cycleLength,this.recentPeriodDate,this.periodLength);

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'cycleLength':cycleLength,
        'recentPeriodDate':recentPeriodDate,
        'periodLength':periodLength,
      };


  
}
