import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/features/auth/presentation/componenets/days_years_months.dart';
import 'package:twitterapp/features/auth/presentation/componenets/my_textfield.dart';
import 'package:twitterapp/features/auth/presentation/componenets/next_button.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_bloc.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_events.dart';

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
  String? dateOfBirth;
  final FocusNode email_focusNode = FocusNode();
  final FocusNode name_focusNode = FocusNode();
  final FocusNode password_focusNode = FocusNode();
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController name_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  final String profileImageUrl_controller = 'httttppdwesds';
  final TextEditingController date_of_birth_controller =
      TextEditingController();
  void signup() async {
    print('called the signup button');
    if (_selectedDay != null &&
        _selectedMonth != null &&
        _selectedYear != null) {
      dateOfBirth = '$_selectedMonth-$_selectedDay-$_selectedYear';
      print(dateOfBirth);
    } else {
      dateOfBirth = null;
    }
    try {
      final authCubit = context.read<AuthBloc>().add(SignUpEvent(
          email_controller.text,
          name_controller.text,
          password_controller.text,
          profileImageUrl_controller,
          dateOfBirth));
    } catch (e) {
      throw Exception('error in signup method in createAcount PAGE: ${e}');
    }
  }

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
  void dispose() {
    email_controller.dispose();
    email_focusNode.dispose();
    password_focusNode.dispose();
    name_focusNode.dispose();
    name_controller.dispose();
    password_controller.dispose();
    //profileImageUrl_controller.dispose();
    date_of_birth_controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: Center(
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
              Center(
                  child: MyTextfield(
                      focusNode: name_focusNode,
                      hintText: 'Name',
                      obsecure: false,
                      controller: name_controller)),
              // email text fiels
              Center(
                  child: MyTextfield(
                focusNode: email_focusNode,
                hintText: 'Email',
                obsecure: false,
                controller: email_controller,
              )),
              // password /// //
              Center(
                  child: MyTextfield(
                focusNode: password_focusNode,
                hintText: 'Password',
                obsecure: true,
                controller: password_controller,
              )),
        
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
                          items: DaysYearsMonths()
                              .Months
                              .map(buildMenuItem)
                              .toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedMonth = newValue;
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
                          items:
                              DaysYearsMonths().Days.map(buildMenuItem).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedDay = newValue;
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
                              _selectedYear = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // NEXT button
        
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: NextButton(
                  onTap: () {
                    signup();
                    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //     content: Text('Please fill out the credentials')));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
