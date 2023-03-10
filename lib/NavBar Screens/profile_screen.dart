import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Models/profile.dart';

class UserProfileData extends StatelessWidget {
  UserProfileData({Key? key}) : super(key: key);

  CollectionReference ref = FirebaseFirestore.instance.collection("scansignUsers");
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color.fromARGB(255, 56, 171, 216),
        elevation: 0.0,
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "User Profile Details",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Group 10 (1).png'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            FutureBuilder(
                future: ref.where('uid', isEqualTo: user!.uid).limit(1).get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return const Center(
                        child: Text(
                      'No data found',
                      style: TextStyle(color: Colors.black),
                    ));
                  } else {
                    if (snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text(
                          'No data found',
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (ctx, index) {
                            ProfileModel obj =
                                ProfileModel.fromDocumentSnapshot(
                                    doc: snapshot.data!.docs[index]);
                            // if (snapshot.hasData) {
                            return Column(
                              children: [
                                ListTile(
                                  leading:
                                      const Icon(Icons.perm_identity_rounded),
                                  title: const Text(
                                    "First-Name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    obj.firstName,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 110, 110, 110),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading:
                                      const Icon(Icons.perm_identity_rounded),
                                  title: const Text(
                                    "Last-Name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    obj.lastName,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 110, 110, 110),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.location_on),
                                  title: const Text(
                                    "Address",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    obj.address,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 110, 110, 110),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.numbers),
                                  title: const Text(
                                    "Telephone",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    obj.telephone,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 110, 110, 110),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    }
                  }
                }),
          ],
        ),
      ),
    );
  }
}