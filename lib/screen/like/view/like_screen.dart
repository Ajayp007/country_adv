import 'package:country_adv/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({super.key});

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getCountryData();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(),
        child: ListView.builder(
          itemCount: providerW!.likeCountryImg.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(providerW!.likeCountryImg[index]),
                  ),
                  title: Text(providerW!.likeCountryName[index]),
                  trailing: IconButton(
                    onPressed: () {
                      providerW!.deleteLikeCountry(index);
                    },
                    icon: const Icon(Icons.delete_outline),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
