// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: button
    width: 100
    height: 100

    property alias image: buttonImage.source
    property alias text: buttonText.text
    property alias imageSourceSize: buttonImage.sourceSize
    signal clicked

    Image{
        width: parent.width
        height: parent.height
        id: buttonImage
        source: "images/Button-Play.png"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: buttonText
        text: "Button"
        anchors.centerIn: parent
        font.pixelSize: parent.width > parent.height ? parent.height * .5 : parent.width * .5
    }

    MouseArea {
         id: mouseArea
         anchors.fill: parent
         onClicked: {
             button.clicked()
         }
    }

    states: State {
          name: "pressed"; when: mouseArea.pressed == true
          PropertyChanges { target: button; color: "grey" }
    }
}
