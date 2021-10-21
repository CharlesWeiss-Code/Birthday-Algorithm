int peopleCount = 10;

ArrayList<person> people = new ArrayList<person>();
String[] names = {"Charlie", "Ben", "Josh", "Ardath"};
ArrayList<person> correctAnswer = new ArrayList<person>();

void setup() {
  generatePeople();
  sortBdays();
  printAnswer();
}

public void generatePeople() {
  for (int i = 0; i < peopleCount; i++) {
    people.add(new person(int(random(0, 365)), name()));
  }
}

public String name() {
  int nameIndex = int(random(0, names.length));
  return names[nameIndex];
}

public void sortBdays() {
  // could optimise preformance by adding data to other and p in one iteration
  for (person p : people) {
    for (person other : people) {
      if (other.bDay < p.bDay) {
        p.bDaysBefore++;
        p.peopleBefore.add(other);
        // possible optimization BELOW
        // other.peopleAfter.add(p);
      } else {
        p.bDaysAfter++;
        p.peopleAfter.add(other);
        // possible optimization BELOW
        //other.peopleBefore.add(p);
      }
    }
  }

  for (person p : people) {
    if (p.bDaysBefore == p.bDaysAfter) {
      correctAnswer.add(p);
    }
  }
}

public void printAnswer() {
  if (correctAnswer.size() == 0) {
    println(" No one has an equal number of birthdays before and after thiers.");
  }
  for (person p : correctAnswer) {
    println(p.name + " has an equal number of birthdays before and after thiers.");
    println(" ");
    println("PEOPLE BEFORE");
    for (person person : p.peopleBefore) {
      println(person.name + "'s Birthday: " + person.bDay);
    }
    println(" ");
    println("PEOPLE AFTER");
    for (person person : p.peopleAfter) {
      println(person.name + "'s Birthday: " + person.bDay);
    }
  }
}
