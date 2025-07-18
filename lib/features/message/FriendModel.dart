
import '../../generated/assets.dart';

class FriendChatModel {
  final String name;
  final String message;
  final String date;
  final String image;
  final int numUnreadedMsg;

  FriendChatModel({
    required this.name,
    required this.message,
    required this.date,
    required this.image,
    required this.numUnreadedMsg,
  });

}

final friends = [
  FriendChatModel(name:"Ali",message:"How are u?",date:"2 min ago",image:Assets.imgAli,numUnreadedMsg: 2 ),

  FriendChatModel(name:"Yussef Nasser",message:"todooo ya gazma?",date:"1 hour ago",image:Assets.imgYoussef,numUnreadedMsg: 1 ),
  FriendChatModel(name:"Mohamed Tag",message:"إن مع العسر يسرا ",date:"10 hours ago",image:Assets.imgTag4,numUnreadedMsg: 0 ),
  FriendChatModel(name:"Abdelaziz Maher",message:"إنت ازاي تجرحنيييي",date:"2 min ago",image:Assets.imgZizo,numUnreadedMsg: 0 ),
  FriendChatModel(name:"Ali",message:"How are u?",date:"2 min ago",image:Assets.imgAli,numUnreadedMsg: 2 ),

  FriendChatModel(name:"Yussef Nasser",message:"todooo ya gazma?",date:"1 hour ago",image:Assets.imgYoussef,numUnreadedMsg: 1 ),
  FriendChatModel(name:"Mohamed Tag",message:"إن مع العسر يسرا ",date:"10 hours ago",image:Assets.imgTag4,numUnreadedMsg: 0 ),
  FriendChatModel(name:"Abdelaziz Maher",message:"إنت ازاي تجرحنيييي",date:"2 min ago",image:Assets.imgZizo,numUnreadedMsg: 0 ),
  FriendChatModel(name:"Ali",message:"How are u?",date:"2 min ago",image:Assets.imgAli,numUnreadedMsg: 2 ),

  FriendChatModel(name:"Yussef Nasser",message:"todooo ya gazma?",date:"1 hour ago",image:Assets.imgYoussef,numUnreadedMsg: 1 ),
  FriendChatModel(name:"Mohamed Tag",message:"إن مع العسر يسرا ",date:"10 hours ago",image:Assets.imgTag4,numUnreadedMsg: 0 ),
  FriendChatModel(name:"Abdelaziz Maher",message:"إنت ازاي تجرحنيييي",date:"2 min ago",image:Assets.imgZizo,numUnreadedMsg: 0 ),
  FriendChatModel(name:"Ali",message:"How are u?",date:"2 min ago",image:Assets.imgAli,numUnreadedMsg: 2 ),

  FriendChatModel(name:"Yussef Nasser",message:"todooo ya gazma?",date:"1 hour ago",image:Assets.imgYoussef,numUnreadedMsg: 1 ),
  FriendChatModel(name:"Mohamed Tag",message:"إن مع العسر يسرا ",date:"10 hours ago",image:Assets.imgTag4,numUnreadedMsg: 0 ),
  FriendChatModel(name:"Abdelaziz Maher",message:"إنت ازاي تجرحنيييي",date:"2 min ago",image:Assets.imgZizo,numUnreadedMsg: 0 ),
  FriendChatModel(name:"Ali Kotb",message:"How are u?",date:"2 min ago",image:Assets.imgHamada,numUnreadedMsg: 2 ),
];



final groups = [
  FriendChatModel(name:"الجمل العان",message:"https://www.facebok.com",date:"2 min ago",image:Assets.imgCamel,numUnreadedMsg: 2 ),

  FriendChatModel(name:"🍏 vs 📱",message:"https://www.meet.google",date:"1 hour ago",image:"",numUnreadedMsg: 1 ),
  FriendChatModel(name:"MAD 45",message:"Android Developer",date:"10 hours ago",image:Assets.imgMad,numUnreadedMsg: 0 ),
  FriendChatModel(name:"Help_ITI_Mobile (Native)",message:"إنت ازاي تجرحنيييي",date:"2 min ago",image:Assets.imgHelp,numUnreadedMsg: 0 ),
  FriendChatModel(name:"الختمة الاسبوعية",message:"تم الجزء 24",date:"2 min ago",image:Assets.imgQuran,numUnreadedMsg: 2 ),


];