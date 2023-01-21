import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    Color color = Colors.black;
    User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(user?.displayName ?? 'Full Name'),
            accountEmail: Text(user?.email ?? 'new@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  user?.photoURL ??
                      'https://ui-avatars.com/api/?background=0D8ABC&color=fff&name=${user?.displayName ?? 'Full Name'}',
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: const ListTile(
              leading: Icon(
                Icons.person,
                size: 30,
              ),
              title: Text("Account"),
              subtitle: Text("Personal"),
              trailing: Icon(Icons.edit),
              autofocus: true,
            ),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text(user?.email ?? 'new@gmail.com'),
          ),
          const ListTile(
            leading: Icon(Icons.send),
            title: Text("Share"),
          ),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: Text("Sign out", style: TextStyle(color: color)),
            ),
          ),
        ],
      ),

      //   child: DrawerBody(
      // color: color,
      // user: this.user,
    );
  }
}
