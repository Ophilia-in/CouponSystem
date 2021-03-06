import 'package:adminapp/models/dealerModel.dart';
import 'package:adminapp/rest/ids.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IndividualRejectedDealer extends StatelessWidget {
  final Dealer dealer;
  const IndividualRejectedDealer({Key key, this.dealer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(dealer.firmName??dealer.name??"Not Available"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: ExtendedImage.network(
                 dealer.photoUrl,
                   cache: true,
                ),
              ),
              ListTile(
                title: Text("Name"),
                subtitle: Text(dealer.name),
              ),
              ListTile(
                title: Text("Uid"),
                subtitle: Text(dealer.uid),
              ),
              ListTile(
                title: Text("Firm Name"),
                subtitle: Text(dealer.firmName??""),
              ),
              ListTile(
                title: Text("Account Type"),
                subtitle: Text(dealer.accountType??""),
              ),
              ListTile(
                title: Text("Dealer ID"),
                subtitle: Text(dealer.dealerId??""),
              ),
              ListTile(
                title: Text("Phone Number"),
                subtitle: Text(dealer.phone??"Not Available"),
              ),
              ListTile(
                title: Text("Email"),
                subtitle: Text(dealer.email),
              ),
              ListTile(
                title: Text("Earned"),
                subtitle: Text(dealer.earned.toString()),
              ),
              ListTile(
                title: Text("Points"),
                subtitle: Text(dealer.points.toString()),
              ),
              ListTile(
                title: Text("Created At"),
                subtitle:
                    Text(DateFormat('dd MMM y kk:mm').format(dealer.createdAt)),
              ),
              ExpansionTile(
                  children: [
                    (dealer.ids == null || dealer.ids.length != 3)
                        ? Text("Ids Not yet added")
                        : Ids(dealer.ids, _width)
                  ],
                  title: Text(
                    "Ids  :",
                    style: Theme.of(context).textTheme.headline5,
                  )),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
