// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: playerControl
    width: 360
    height: 100

    signal playClicked
    signal stopClicked
    signal pauseClicked
    signal backwardClicked
    signal forwardClicked
	
	property alias duration: progressBar.maximum
	property alias currentPosition: progressBar.value

    Column
    {
        width: parent.width
        height: parent.height

        Row{
            height: parent.height-25
            width: parent.width

            Button{
                id: btPrevious
                text: ""
                image: "images/Button-Previous.png"
                width: parent.width/5
                height: parent.height
                imageSourceSize.width: (width>height)?width:height
                imageSourceSize.height: (width>height)?width:height
                onClicked:{playerControl.backwardClicked();}
            }

            Button{
                id: btPlay
                text: ""
                image: "images/Button-Play.png"
                width: parent.width/5
                height: parent.height
                imageSourceSize.width: (width>height)?width:height
                imageSourceSize.height: (width>height)?width:height
                onClicked:{playerControl.playClicked();}
            }

            Button {
                id: btPause
                text: ""
                image: "images/Button-Pause.png"
                width: parent.width/5
                height: parent.height
                onClicked:{playerControl.pauseClicked();}

            }
            Button {
                id: btStop
                text: ""
                image: "images/Button-Stop.png"
                width: parent.width/5
                height: parent.height
                onClicked:{progressBar.value = 0; playerControl.stopClicked();}
            }

            Button{
                id: btNext
                text: ""
                image: "images/Button-Next.png"
                width: parent.width/5
                height: parent.height
                imageSourceSize.width: (width>height)?width:height
                imageSourceSize.height: (width>height)?width:height
                onClicked:{playerControl.forwardClicked();}
            }
        }

        ProgressBar
        {
            id: progressBar
            width: parent.width
            height: 25
            value:25
            color: "grey"
        }
    }





}

