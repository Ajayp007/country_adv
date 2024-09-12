import 'package:country_adv/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getCountry();
  }

  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("World"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: providerW!.countryModelList!.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, 'detail',
                  arguments: providerW!.countryModelList![index]);
            },
            title: Text(
                "${providerR!.countryModelList![index].nameModel!.common}"),
            trailing: IconButton(
              icon: const Icon(Icons.favorite_border_outlined),
              onPressed: () {
                providerR!.setLikeCountry(
                    providerR!.countryModelList![index].nameModel!.common!,
                    providerR!.countryModelList![index].flagsModel!.png!);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Data Add Successfully"),
                  ),
                );
              },
            ),
            subtitle: Text(
                "Independent :- ${providerR!.countryModelList![index].independent}"),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "${providerR!.countryModelList![index].flagsModel!.png}"),
            ),
          );
        },
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZVg2z2kt8AEPcnS872V2cZX5pWkaJA480BEuRXwUk65jjVNv84FxCyWXPz37wt6yRcs4&usqp=CAU"),
              ),
              const SizedBox(
                height: 24,
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.home_outlined,
                  size: 24,
                  color: Colors.black,
                ),
                title: const Text(
                  "Home",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, 'like');
                },
                leading: const Icon(
                  Icons.favorite_border_outlined,
                  size: 24,
                  color: Colors.black,
                ),
                title: const Text(
                  "Favourite",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.share_outlined,
                  size: 24,
                  color: Colors.black,
                ),
                title: const Text(
                  "Share",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
