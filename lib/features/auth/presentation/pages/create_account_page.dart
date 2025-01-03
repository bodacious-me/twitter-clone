import 'package:flutter/material.dart';
import 'package:twitterapp/features/auth/presentation/componenets/days_years_months.dart';
import 'package:twitterapp/features/auth/presentation/componenets/my_textfield.dart';
import 'package:twitterapp/features/auth/presentation/componenets/next_button.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  String dorpDownValue = 'One';
  String? _selectedMonth;
  String? _selectedDay;
  String? _selectedYear;
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8),
        child: Text(
          item,
          style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 20,
              color: Theme.of(context).colorScheme.primary),
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // text: create your account
              Center(
                child: Text(
                  'Create your aacount',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 45,
                      fontWeight: FontWeight.w600),
                ),
              ),
          
              const SizedBox(
                height: 40,
              ),
          
              // name textfield
              const Center(child: MyTextfield(hintText: 'Name', obsecure: false)),
              // email text fiels
              const Center(child: MyTextfield(hintText: 'Email', obsecure: false)),
              // password /// //
              const Center(child: MyTextfield(hintText: 'Password', obsecure: true)),
          
              // text
          
              Padding(
                padding: const EdgeInsets.only(right: 265.0, bottom: 10),
                child: Text(
                  'Date of birth',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20),
                ),
              ),
          
              // text
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  width: 400,
                  child: Text(
                      'This will not be shown publicly. Confirm your own age, even if this '
                      'account is for a business, a pet, or something else.',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w300)),
                ),
              ),
          
              // Row: Month, day and year tables
          
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            right: BorderSide(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 70,
                        margin: EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                          underline: Container(),
                          icon: const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 40,
                            ),
                          ),
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Month',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                          value: _selectedMonth,
                          items:
                              DaysYearsMonths().Months.map(buildMenuItem).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              this._selectedMonth = newValue;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            right: BorderSide(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 70,
                        margin: EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                          underline: Container(),
                          icon: const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 40,
                            ),
                          ),
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Day',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                          value: _selectedDay,
                          items: DaysYearsMonths().Days.map(buildMenuItem).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              this._selectedDay = newValue;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            right: BorderSide(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 70,
                        margin: EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                          underline: Container(),
                          icon: const Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 40,
                            ),
                          ),
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Year',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                          value: _selectedYear,
                          items:
                              DaysYearsMonths().Years.map(buildMenuItem).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              this._selectedYear = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          // NEXT button
          
              const Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: NextButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
