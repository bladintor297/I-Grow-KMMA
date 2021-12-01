import 'package:flutter/material.dart';
import 'package:flutter_group9/group.dart';
import 'package:flutter_group9/maininterface.dart';
import 'package:flutter_group9/widget/custom_page_route.dart';

void main() {
  runApp(ViewGroup());
}

class ViewGroup extends StatefulWidget {
  const ViewGroup({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ViewGroupState();
  }
}

class ViewGroupState extends State<ViewGroup> {
  List<Color> _colors = <Color>[
    Colors.green.shade700,
    Colors.red.shade700,
  ];
  //variable declaration
  var _likeStatus = false;
  var _membersCount = 1;
  var _currentColorIndex = 0;
  var _currentOverlayIndex = 1;
  var _joinStatus = false;
  var _buttonText = "Join";
  var _isPostDisabled = true;
  //update FAB disable or enable
  void updateIsPostDisabled(bool status) {
    if (status == true) {
      _isPostDisabled = false;
    } else if (status == false) {
      _isPostDisabled = true;
    }
  }
  //update like status
  void updateLikeStatus(){

    if(_likeStatus==false){

      setState(() {
        _likeStatus=true;
      });
      
    }
    else if(_likeStatus==true){
      
      setState(() {
        _likeStatus=false;      
      });
      

    }
  }
  //update join button color
  void updateColor() {
    if (_currentColorIndex == 0) {
      _currentColorIndex = 1;
      _currentOverlayIndex = 0;
    } else if (_currentColorIndex == 1) {
      _currentColorIndex = 0;
      _currentOverlayIndex = 1;
    }
  }

  //alert dialog
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please confirm'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Would you like to leave this group?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop();
                updateStatus();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //update member count after join button pressed
  void updateMembersNum(bool status) {
    if (status == false) {
      _membersCount--;
    } else if (status == true) {
      _membersCount++;
    }
  }

  //implement updateStatus fx and alertDialog
  void verifyAction() {
    if (_joinStatus == false) {
      updateStatus();
    } else if (_joinStatus == true) {
      _showMyDialog();
    }
  }

  //update join status
  void updateStatus() {
    if (_joinStatus == false) {
      setState(() {
        _joinStatus = true;
        updateColor();
        updateMembersNum(_joinStatus);
        updateIsPostDisabled(_joinStatus);
        // hasBeenPressed = true;
      });
      _buttonText = "Leave";
      print("status : $_joinStatus");
    } else if (_joinStatus == true) {
      // _showMyDialog();
      setState(() {
        _joinStatus = false;
        updateColor();
        updateMembersNum(_joinStatus);
        updateIsPostDisabled(_joinStatus);
        // hasBeenPressed = false;
      });
      _buttonText = "Join";
      print("status : $_joinStatus");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[700],
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainInterface.select(1),
                    ));
              },
            ),
            title: const Text(
              "Group Page",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.lightGreen[100],
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 22,
                          ),
                                                                                  //Gambar bawang  
                          
                          
                          PhysicalModel(                                       
                            color: Colors.black,
                            shadowColor: Colors.green,
                            elevation: 10,
                            shape: BoxShape.circle,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                //  boxShadow: [BoxShadow(
                                //    color: Colors.grey,
                                //    spreadRadius: 3,
                                //    blurRadius: 10,
                                //    offset: Offset(0.0, 3.0)
                                //  )],
                              ),
                              child: const FittedBox(
                                child: CircleAvatar(
                                  radius: 75,
                                  backgroundImage:
                                      AssetImage("assets/onion.jpg"),
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          SizedBox(height: 22,),

                          
                                                                                              //start of group title
                          Column(
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.topCenter,
                                children: <Widget>[
                                  PhysicalModel(
                                    color: Colors.black,
                                    shadowColor: Colors.green,
                                    elevation: 20,
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      width: 360,
                                      height: 145,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF0E3311)
                                            .withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.only(
                                        left: 24.0, right: 24.0),
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10.0),
                                      //  boxShadow: const [BoxShadow(
                                      //    blurRadius: 10,
                                      //    color: Colors.grey,
                                      //    spreadRadius: 3,
                                      //    offset: Offset(0.0, 3.0))],
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Group Bawang",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.info_outline_rounded,
                                                color: Colors.green[700],
                                              ),
                                              tooltip: "About Group",
                                            )
                                          ],
                                        ),
                                        Align(
                                          child: Text(
                                            "${_membersCount} members",
                                            style: TextStyle(
                                                color: Colors.grey[600]),
                                          ),
                                          alignment: Alignment.centerLeft,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              SizedBox(
                                                width: 150,
                                                child: ElevatedButton(
                                                  onPressed: verifyAction,
                                                  child: Text(
                                                    _buttonText,
                                                    style: TextStyle(
                                                        color: Colors.white70,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(_colors[
                                                                  _currentColorIndex]),
                                                      overlayColor:
                                                          MaterialStateProperty
                                                              .all<Color>(_colors[
                                                                  _currentOverlayIndex]),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18.0),
                                                      ))),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 150,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Show Members",
                                                    style: TextStyle(
                                                        color: Colors.white70,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(Colors
                                                                  .grey
                                                                  .shade500),
                                                      overlayColor:
                                                          MaterialStateProperty
                                                              .all<Color>(Colors
                                                                  .green
                                                                  .shade700),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18.0),
                                                      ))),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),

                                                                                           //start of post
                          Column(
                            children: [
                              PhysicalModel(
                                color: Colors.transparent,
                                shadowColor: Colors.green,
                                elevation: 20,
                                child: Container(
                                  width: 360,
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          FittedBox(
                                            fit: BoxFit.contain,
                                            child: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    "assets/Daus.jpg")),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("Firdaus Hishamudin",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                "1h",
                                                style: TextStyle(
                                                    color: Colors.grey[600]),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Jom tanam bawang dirumah!",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 200,
                                        child: FittedBox(
                                          fit: BoxFit.fill,
                                          child: Image.asset(
                                              "assets/BawangPost1.jpg"),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                                                   
                                      Container(                                        //like comment share

                                        width: double.infinity,
                                        height: 40,
                                        decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade500,), bottom: BorderSide(color: Colors.grey.shade500,))),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                                                          
                                          Row(
                                            children: [
                                              IconButton(
                                                  iconSize: 20,
                                                  onPressed: updateLikeStatus,
                                                  icon: Icon(
                                                    Icons.thumb_up_outlined,
                                                    color: _likeStatus? Colors.green[700]:Colors.grey[500],
                                                  ),
                                                  tooltip: "Like this post",
                                                ),
                                              Text("Like",style: TextStyle(fontSize: 14,color: _likeStatus? Colors.green[700] : Colors.grey[500]),)
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              IconButton(
                                                  iconSize: 20,
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.comment_outlined,
                                                    color: Colors.grey[500],
                                                  ),
                                                  tooltip: "Comment this post",
                                                ),
                                              Text("Comment",style: TextStyle(fontSize: 14,color: Colors.grey[500]),)
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              IconButton(
                                                  iconSize: 20,
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.share_outlined,
                                                    color: Colors.grey[500],
                                                  ),
                                                  tooltip: "Share this post",
                                                ),
                                              Text("Share",style: TextStyle(fontSize: 14,color: Colors.grey[500]),)
                                            ],
                                          ),
                                          


                                        ],),


                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),

                           Column(                                          //second post
                            children: [
                              PhysicalModel(
                                color: Colors.transparent,
                                shadowColor: Colors.green,
                                elevation: 20,
                                child: Container(
                                  width: 360,
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          FittedBox(
                                            fit: BoxFit.contain,
                                            child: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    "assets/Guy1.jfif")),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("Amirul Aiman",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                "2d",
                                                style: TextStyle(
                                                    color: Colors.grey[600]),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Tips menyimpan bawang",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 200,
                                        child: FittedBox(
                                          fit: BoxFit.fill,
                                          child: Image.asset(
                                              "assets/SimpanBawangPost2.jfif"),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                                                   
                                      Container(                                        //like comment share

                                        width: double.infinity,
                                        height: 40,
                                        decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade500,), bottom: BorderSide(color: Colors.grey.shade500,))),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                                                          
                                          Row(
                                            children: [
                                              IconButton(
                                                  iconSize: 20,
                                                  onPressed: updateLikeStatus,
                                                  icon: Icon(
                                                    Icons.thumb_up_outlined,
                                                    color: _likeStatus? Colors.green[700]:Colors.grey[500],
                                                  ),
                                                  tooltip: "Like this post",
                                                ),
                                              Text("Like",style: TextStyle(fontSize: 14,color: _likeStatus? Colors.green[700] : Colors.grey[500]),)
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              IconButton(
                                                  iconSize: 20,
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.comment_outlined,
                                                    color: Colors.grey[500],
                                                  ),
                                                  tooltip: "Comment this post",
                                                ),
                                              Text("Comment",style: TextStyle(fontSize: 14,color: Colors.grey[500]),)
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              IconButton(
                                                  iconSize: 20,
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.share_outlined,
                                                    color: Colors.grey[500],
                                                  ),
                                                  tooltip: "Share this post",
                                                ),
                                              Text("Share",style: TextStyle(fontSize: 14,color: Colors.grey[500]),)
                                            ],
                                          ),
                                          


                                        ],),


                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),

                          
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          floatingActionButton: FloatingActionButton(
            onPressed:
                _isPostDisabled ? null : () => print("Go to create post page"),
            child: Icon(
              Icons.add_outlined,
              color: _isPostDisabled ? Colors.transparent : Colors.white70,
            ),
            elevation: _isPostDisabled ? 0 : 6,
            backgroundColor:
                _isPostDisabled ? Colors.transparent : Colors.green[700],
            tooltip: _isPostDisabled ? null : "Add Post",
          )),
    );
  }
}
