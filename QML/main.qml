// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle{
    width: 640
    height: 480

    Column
    {
        anchors.fill: parent
        MediaList
        {
            id: mediaList
            width: parent.width/2
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height - playerControl.height
        }

        PlayerControl{
            id: playerControl
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onPlayClicked:
			{
				player.Play();
				updateTimer.running = true;
			}
			
            onStopClicked:
			{
				player.Stop();
				playerControl.currentPosition = 0;
				updateTimer.running = false;
			}
            onPauseClicked:{player.Pause();}
            onBackwardClicked:{player.Seek(-30);}
            onForwardClicked:{player.Seek(30);}
        }
		
		Timer {
			id: updateTimer
			interval: 500; running: false; repeat: true
			onTriggered: 
			{
				playerControl.duration = player.GetDuration();
				playerControl.currentPosition = player.GetCurrentPosition();
			}
		}
    }
}
