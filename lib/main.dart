import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

// *************  for single  ************//

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   StreamController<String> streamController = StreamController();
//   TextEditingController textEditingController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text('Stream Controller'),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             StreamBuilder<String>(
//                 stream: streamController.stream,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return Text(
//                       snapshot.data.toString(),
//                       style: const TextStyle(
//                           fontSize: 30, fontWeight: FontWeight.bold),
//                     );
//                   } else {
//                     return const Text(
//                       'No data',
//                       style:
//                           TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                     );
//                   }
//                 }),
//             const SizedBox(
//               height: 10,
//             ),
//             Center(
//               child: SizedBox(
//                   width: 200,
//                   child: TextField(
//                     controller: textEditingController,
//                   )),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   streamController.add(textEditingController.text);
//                 },
//                 child: const Text('Click'))
//           ],
//         ));
//   }
// }

//*********for more than one ********** *//

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<String> streamController = StreamController();
  late Stream<String> dataStream;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    dataStream = streamController.stream.asBroadcastStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Stream Controller'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<String>(
                stream: dataStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data ?? 'Null Data',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    );
                  } else {
                    return const Text(
                      'No data',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    );
                  }
                }),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<String>(
                stream: dataStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data ?? 'Null Data',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    );
                  } else {
                    return const Text(
                      'No data',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    );
                  }
                }),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                  width: 200,
                  child: TextField(
                    controller: textEditingController,
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  streamController.add(textEditingController.text);
                },
                child: const Text('Click'))
          ],
        ));
  }
}
