student(vinh).
class(CS3520).
takes(vinh, CS3520).
professor(edwin).
teaches(edwin, CS3520).

/* is_student_of(X, Y) :- teaches(Y, Z), takes(X, Z).
*/

goes_dancing(alex).
goes_dancing(betty) :- goes_dancing(alex).
goes_dancing(charlie) :- goes_dancing(betty).
goes_dancing(daniel) :- goes_dancing(charlie).
goes_dancing(ellen) :- goes_dancing(daniel).
