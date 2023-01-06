import 'package:flutter/material.dart';

void main() {
  runApp(BenimUyg());
}

class BenimUyg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown[300],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const CircleAvatar(
                  radius: 70.0,
                  backgroundColor: Colors.lime,
                  backgroundImage: AssetImage('assets/img/kahve.jpg'),
                ),
                Text(
                  'Flutter Kahvecisi',
                  style: TextStyle(
                    fontSize: 45.0,
                    color: Colors.brown[900],
                    fontFamily: 'Fondamento',
                  ),
                ),
                const Text(
                  '"BİR FİNCAN UZAĞINIZDA..." ',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 200,
                  child: const Divider(
                    color: Colors.brown,
                    height: 30.0,
                  ),
                ),
                Card(
                    color: Colors.brown[900],
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 40.0),
                    child: const ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      title: Text(
                        'siparis@fkahvecisi.com',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          //fontFamily: 'Source Sans Pro',
                        ),
                      ),
                    )),
                Card(
                    color: Colors.brown[900],
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 40.0),
                    child: const ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      title: Text(
                        '+90 555 55 55',
                        style: TextStyle(
                          color: Colors.white,
                          //fontFamily: 'Source Sans Pro',
                          fontSize: 18.0,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
