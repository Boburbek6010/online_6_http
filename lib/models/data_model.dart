class Data {

  late int id;
  late String employeeName;
  late int employeeSalary;
  late int employeeAge;
  late String profileImage;

  Data(
      this.id, 
      this.employeeName, 
      this.employeeSalary, 
      this.employeeAge, 
      this.profileImage,);

  Data.fromJson(dynamic json) {
    id = json['id'];
    employeeName = json['employee_name'];
    employeeSalary = json['employee_salary'];
    employeeAge = json['employee_age'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['employee_name'] = employeeName;
    map['employee_salary'] = employeeSalary;
    map['employee_age'] = employeeAge;
    map['profile_image'] = profileImage;
    return map;
  }

}