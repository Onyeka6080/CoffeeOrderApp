import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/querystreamclass.dart';

class Database{

  late String uid;
  Database({required this.uid});
  CollectionReference ref =FirebaseFirestore.instance.collection('brews');

     streamsnapshot(QuerySnapshot hu){
       List<QS> piu;
       return hu.docs.map((e) {
         return QS(Name: e.get('name')??'', Sugar:e.get('sugar')??'',
             Strenght:e.get('strenght') ?? 0);
       }).toList();
     }

  Future updatedata(String name,String sugar, int strenght) async{
     return await ref.doc(uid).set({
      'name':name,
      'sugar':sugar,
      'strenght':strenght,
    });
  }

    Stream< List<QS>> wq(){
    return ref.snapshots().map((QuerySnapshot k) =>  streamsnapshot(k));
  }
  Stream<DocumentSnapshot> hmm(){
       return ref.doc(uid).snapshots();
  }
}