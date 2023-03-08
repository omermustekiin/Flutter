import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final btcChannel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/ws/btcusdt@trade');
  final bnbChannel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/ws/bnbusdt@trade');
  @override
  void initState() {
    super.initState();
    myStreamListener();
  }

  myStreamListener() {
    btcChannel.stream.listen((message) {
      // channel.sink.add('Teslim Alındı!');
      // channel.sink.close(status.goingAway);
      Map getData = jsonDecode(message);
      setState(() {
        btcUsdtPrice = getData['p'];
      });
    });
    bnbChannel.stream.listen((message) {
      // channel.sink.add('Teslim Alındı!');
      // channel.sink.close(status.goingAway);
      Map getData = jsonDecode(message);
      setState(() {
        bnbUsdtPrice = getData['p'];
      });
    });
  }

  String btcUsdtPrice = "0";
  String bnbUsdtPrice = "0";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple[900],
        appBar: AppBar(
          title: const Text(
            "Web Socket Binance API",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    height: 60,
                    color: Colors.grey[900],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.currency_bitcoin_outlined,
                          color: Colors.orange,
                          size: 34,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "BTC/USDT",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          btcUsdtPrice.substring(0, btcUsdtPrice.length - 5),
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    height: 60,
                    color: Colors.grey[900],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.currency_bitcoin,
                          color: Colors.orange,
                          size: 34,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "BNB/USDT",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          bnbUsdtPrice.substring(0, btcUsdtPrice.length - 5),
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
