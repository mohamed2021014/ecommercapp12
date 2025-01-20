import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  bool _isNotificationsEnabled = true;
  String _language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // تغيير لون الشريط العلوي إلى الأزرق
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: [
          // إعداد الملف الشخصي
          ListTile(
            title: const Text('Profile',),
            leading: const Icon(Icons.person, color: Colors.blue),
            onTap: () {
             // print("Go to Profile");
            },
          ),
          
          // إعدادات الإشعارات
          SwitchListTile(
            title:const Text('Enable Notifications', style: TextStyle()),
            value: _isNotificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _isNotificationsEnabled = value;
              });
            },
            secondary: const Icon(Icons.notifications_active, color: Colors.blue),
            activeColor: Colors.blue, // تغيير اللون عند التفعيل
            inactiveThumbColor: Colors.grey, // اللون عند تعطيل التبديل
            inactiveTrackColor: Colors.blue.shade100, // اللون عند تعطيل التبديل
          ),
          
          // إعدادات الوضع الداكن
          SwitchListTile(
            title: const Text('Enable Dark Mode',),
            value: _isDarkMode,
            onChanged: (bool value) {
              setState(() {
                _isDarkMode = value;
              });
            },
            secondary: const Icon(Icons.dark_mode, color: Colors.blue),
            activeColor: Colors.blue,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.blue.shade100,
          ),
          
          // إعداد اللغة
          ListTile(
            title: const Text('Language', ),
            subtitle: Text(_language,),
            leading: const Icon(Icons.language, color: Colors.blue),
            onTap: () {
              _showLanguageDialog(context);
            },
          ),
          
          // إعدادات الخصوصية
          ListTile(
            title: const Text('Privacy', ),
            leading: const Icon(Icons.lock, color: Colors.blue),
            onTap: () {
            //  print("Go to Privacy Settings");
            },
          ),
          
          // معلومات عن التطبيق
          ListTile(
            title: const Text('About',),
            leading: const Icon(Icons.info, color: Colors.blue),
            onTap: () {
           //   print("Go to About");
            },
          ),
          
          // تسجيل الخروج
          ListTile(
            title: const Text('Log Out', style: TextStyle(color: Colors.red)),
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            onTap: () {
             // print("Log out");
            },
          ),
        ],
      ),
    );
  }

  // مربع حوار لاختيار اللغة
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language', style: TextStyle(color: Colors.blue)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RadioListTile<String>(
                title: const Text('English', style: TextStyle(color: Colors.blue)),
                value: 'English',
                groupValue: _language,
                onChanged: (String? value) {
                  setState(() {
                    _language = value!;
                  });
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile<String>(
                title: const Text('Arabic', style: TextStyle(color: Colors.blue)),
                value: 'Arabic',
                groupValue: _language,
                onChanged: (String? value) {
                  setState(() {
                    _language = value!;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}