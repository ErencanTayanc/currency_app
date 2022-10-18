import 'package:currency_app/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:currency_app/models/currency_model.dart';
import 'package:currency_app/services/currency_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  //final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  final CurrencyService _currencyService = CurrencyService();
  List<Currency> currencies = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency App"),
      ),
      body: CurrencyListBuilder(currencyService: _currencyService),
      bottomNavigationBar: getNavigationBar(),
    );
  }
}

class CurrencyListBuilder extends StatelessWidget {
  const CurrencyListBuilder({
    Key? key,
    required CurrencyService currencyService,
  })  : _currencyService = currencyService,
        super(key: key);

  final CurrencyService _currencyService;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _currencyService.fetchCurrency(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  isThreeLine: false,
                  onTap: () => print("Tapped"),
                  title: Text(
                    snapshot.data![index].isim!,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  dense: true,
                  contentPadding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                  trailing: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.data![index].alis!),
                        //Text(snapshot.data![index].satis!)
                      ]),
                  leading: Text(
                    "% ${snapshot.data![index].degisim!.toString()}",
                    style: TextStyle(
                        color: snapshot.data![index].degisimYonu! == true
                            ? Colors.green
                            : Colors.red),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: Colors.grey.shade300,
                height: 1,
              ),
            );
          }
        }
        return Text('State: ${snapshot.connectionState}');
      },
    );
  }
}
