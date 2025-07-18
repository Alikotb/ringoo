
import '../../generated/assets.dart';

class CallsModel {
  final String name;
  final String date;
  final String image;
  final bool type;

  CallsModel({
    required this.name,
    required this.type,
    required this.date,
    required this.image,
  });

}

final calls = [
  CallsModel(name:"Ali",type:true,date:"2 min ago",image:Assets.imgAli, ),
  CallsModel(name:"Yussef Nasser",type:false,date:"1 hour ago",image:Assets.imgYoussef, ),
  CallsModel(name:"Mohamed Tag",type:true,date:"10 hours ago",image:Assets.imgTag4, ),
  CallsModel(name:"Abdelaziz Maher",type:false,date:"2 min ago",image:Assets.imgZizo, ),
  CallsModel(name:"Ali",type:true,date:"2 min ago",image:Assets.imgAli, ),
 ];