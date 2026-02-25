import 'package:flutter/material.dart';

import '../../models/apod_model.dart';
import '../../services/nasa_api_service.dart';
import '../../widgets/nasa_card.dart';
import '../../error/error_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NasaApiService _apiService = NasaApiService();
  late Future<List<Apod>> _nasaFuture;

  @override
  void initState() {
    super.initState();
    print("HomePage loaded");
    _nasaFuture = _apiService.fetchApod(count: 5);
  }

  void _refresh() {
    setState(() {
      _nasaFuture = _apiService.fetchApod(count: 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text(
          "AstroScope",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 10,
        centerTitle: true,
        backgroundColor: Colors.white12,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refresh,
          ),
        ],
      ),
      body: FutureBuilder<List<Apod>>(
        future: _nasaFuture,
        builder: (context, snapshot) {

          // Loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error state
          if (snapshot.hasError) {
            return Error(
              error: snapshot.error.toString(),
            );
          }

          // Empty state
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "No data available",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          final nasaList = snapshot.data!;

          // Success state
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: nasaList.length,
            itemBuilder: (context, index) {
              return NasaCard(
                nasa: nasaList[index],
              );
            },
          );
        },
      ),
    );
  }
}
