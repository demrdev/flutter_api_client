// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'base_api_client.dart';
// import 'my_api_client.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter API Client Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final MyApiClient apiClient = MyApiClient(baseUrl: 'https://jsonplaceholder.typicode.com/');
//   String? _result;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

//   void changeLoading() {
//     setState(() {
//       isLoading = !isLoading;
//     });
//   }

//   void _fetchData() async {
//     changeLoading();
//     try {
//       final response = await apiClient.dio.get('todos');
//       print('Status Code: ${response.statusCode}');
//       print('Response Data: ${response.data}');
//       setState(() {
//         _result = response.data.toString();
//       });
//     } catch (e) {
//       print('Error: $e');
//       setState(() {
//         _result = 'Error: $e';
//       });
//     } finally {
//       changeLoading();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter API Client Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'API Result:',
//               style: Theme.of(context).textTheme.headline6,
//             ),
//             SizedBox(height: 10),
//             !isLoading
//                 ? Expanded(
//                     child: ListView.builder(
//                       itemCount: _result == null ? 0 : jsonDecode(_result!).length,
//                       itemBuilder: (BuildContext context, int index) {
//                         var todo = jsonDecode(_result!)[index];
//                         return ListTile(
//                           title: Text(todo['title']),
//                           subtitle: Text('Completed: ${todo['completed']}'),
//                         );
//                       },
//                     ),
//                   )
//                 : const CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     );
//   }

// // class _MyHomePageState extends State<MyHomePage> {
// //   final MyApiClient apiClient = MyApiClient(baseUrl: 'https://jsonplaceholder.typicode.com/');
// //   bool isLoading = false;

// //   String? _result;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Flutter API Client Example'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             Text(
// //               'API Result:',
// //               style: Theme.of(context).textTheme.headline6,
// //             ),
// //             const SizedBox(height: 10),
// //             _result != null
// //                 ? Text(
// //                     _result!,
// //                     style: const TextStyle(fontSize: 16),
// //                   )
// //                 : const CircularProgressIndicator(),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _fetchData,
// //         tooltip: 'Fetch Data',
// //         child: const Icon(Icons.refresh),
// //       ),
// //     );
// //   }

// //   void _fetchData() async {
// //     changeLoading();
// //     try {
// //       final data = await apiClient.fetchData('todos/1');
// //       setState(() {
// //         _result = data.toString();
// //       });
// //     } catch (e) {
// //       setState(() {
// //         _result = 'Error: $e';
// //       });
// //     }
// //     changeLoading();
// //   }

// //   void changeLoading() {
// //     setState(() {
// //       isLoading = !isLoading;
// //     });
// //   }
// // }
// }





// import 'package:flutter/material.dart';

// import 'main.dart';
// import 'my_api_client.dart';

// class _MyHomePageState extends State<MyHomePage> {
//   final MyApiClient apiClient = MyApiClient(baseUrl: 'https://jsonplaceholder.typicode.com/');
//   String? _result;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

  // void changeLoading() {
  //   setState(() {
  //     isLoading = !isLoading;
  //   });
  // }

//   void _fetchData() async {
//     changeLoading();
//     try {
//       final data = await apiClient.fetchData('todos');
//       setState(() {
//         _result = data.toString();
//       });
//     } catch (e) {
//       setState(() {
//         _result = 'Error: $e';
//       });
//     }
//     changeLoading();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter API Client Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'API Result:',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             SizedBox(height: 10),
//             !isLoading
//                 ? SingleChildScrollView(
//                     child: Text(
//                       _result!,
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   )
//                 : CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
// }