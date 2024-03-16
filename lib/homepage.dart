import 'package:flutter/material.dart';
import 'package:interview/dashboared.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});
}

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final List<Contact> _contacts = []; // List to store contacts
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  late SharedPreferences logindata;
  late bool myusername;
  void initState() {

    initial();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),titleSpacing: 00.0,
          centerTitle: true,
          bottomOpacity: 1.0,
          toolbarHeight: 60.2,
          shadowColor: Colors.black,
          toolbarOpacity: 1.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)
              )
          ),backgroundColor: Colors.blueGrey,
              elevation: 0.00,actions: [
        IconButton(onPressed: ()
        {

          logindata.setBool('tops', true);
          Navigator.pushReplacement(context,
              new MaterialPageRoute(builder: (context) => dashboared()));

        }, icon: Icon(Icons.logout))
      ],
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          final contact = _contacts[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  contact.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  contact.phoneNumber,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[700],
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                onTap: () {
                  // Handle onTap event if needed
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddContactDialog(context);
        },
        child: Icon(Icons.add),
      ),
        drawer: Drawer(
    child: ListView(
    children: [
    UserAccountsDrawerHeader(

    accountName: Text("tasmin hirapara"),
    accountEmail: Text("tasminhirapara@gmail.com"),
    currentAccountPicture: CircleAvatar(
    backgroundColor:Colors.white,
    child: Text("T",
    style: TextStyle(fontSize: 40.0),
    ),
    ),
    decoration: BoxDecoration(color: Colors.blueGrey),

    ),

    ListTile(
    leading: Icon(Icons.home), title: Text("Home"),
    onTap: () {


    // Navigator.pop(context);
    },
    ),
    ListTile(
    leading: Icon(Icons.person), title: Text("About"),
    onTap: () {

    //Navigator.pop(context);
    },
    ),
    ListTile(
    leading: Icon(Icons.logout), title: Text("Logout"),
    onTap: () {
      logindata.setBool('tops', true);
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => dashboared()));
    },
    ),

    ],
    ),
    ),
    );
  }

  void _showAddContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _addContact(); // Add contact
                Navigator.pop(context); // Close dialog
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addContact() {
    final String name = _nameController.text.trim();
    final String phoneNumber = _phoneNumberController.text.trim();
    if (name.isNotEmpty && phoneNumber.isNotEmpty) {
      setState(() {
        _contacts.add(Contact(name: name, phoneNumber: phoneNumber));
      });
      // Clear text fields after adding contact
      _nameController.clear();
      _phoneNumberController.clear();
    }
  }
  void initial() async
  {
    logindata= await SharedPreferences.getInstance();
    setState(() {
      myusername = logindata.getString("phone") as bool;
    });

  }
}
