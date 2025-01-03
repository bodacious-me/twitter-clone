import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twitterapp/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://mbkjaazwdgdssyhjtvit.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1ia2phYXp3ZGdkc3N5aGp0dml0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU1NDgxMTgsImV4cCI6MjA1MTEyNDExOH0.yeetF2dLeEHJaNQ_R5VNvjC13NVLmy3hotnMXVqlA-E",
  );
  runApp(MyApp());
}
