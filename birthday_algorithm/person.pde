class person {
  int bDay;
  String name;

  int bDaysBefore = -1;
  int bDaysAfter = -1;

  ArrayList<person> peopleBefore = new ArrayList<person>();
  ArrayList<person> peopleAfter = new ArrayList<person>();


  person(int bDay, String name) {
    this.bDay = bDay;
    this.name = name;
  }
}
