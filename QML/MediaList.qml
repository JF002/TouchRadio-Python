// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0

Rectangle
{
    MouseArea { anchors.fill: parent; onClicked: console.log(mediaListView.model.count) }
    ListModel
    {
        id: mediaModel

        ListElement {
            name: "I don't want to have sex with you";
            attributes: [
                ListElement { description: "Soldout" },
                ListElement { description: "Stop talking" }
            ]
        }
        ListElement {
            name: "I can't wait";
            attributes: [
                ListElement { description: "Soldout" },
                ListElement { description: "Stop talking" }
            ]
        }
        ListElement {
            name: "A taste of candy";
            attributes: [
                ListElement { description: "Soldout" },
                ListElement { description: "Stop talking" }
            ]
        }
        ListElement {
            name: "You're not ok";
            attributes: [
                ListElement { description: "Soldout" },
                ListElement { description: "Stop talking" }
            ]
        }
        ListElement {
            name: "Get out";
            attributes: [
                ListElement { description: "Soldout" },
                ListElement { description: "Stop talking" }
            ]
        }
        ListElement {
            name: "You dirt";
            attributes: [
                ListElement { description: "Soldout" },
                ListElement { description: "Stop talking" }
            ]
        }
        ListElement {
            name: "We are soldout";
            attributes: [
                ListElement { description: "Soldout" },
                ListElement { description: "Stop talking" }
            ]
        }
        ListElement {
            name: "You're different";
            attributes: [
                ListElement { description: "Soldout" },
                ListElement { description: "Stop talking" }
            ]
        }
        ListElement {
            name: "For your next girlfriend";
            attributes: [
                ListElement { description: "Soldout" },
                ListElement { description: "Stop talking" }
            ]
        }
    }

    Component
    {
         id: mediaListDelegate

         Item
         {
             id: delegateItem
             width: parent.width; height: 55
             clip: true

             Row
             {
                 anchors.verticalCenter: parent.verticalCenter
                 spacing: 10

                 Column
                 {
                     Image {
                         fillMode: Image.PreserveAspectFit
                         source: "images/Stereo.png"
                         height: 25
                         width: 25
                         MouseArea { anchors.fill: parent; onClicked: console.log("clicked") }
                     }
                 }

                 Column {
                     anchors.verticalCenter: parent.verticalCenter

                     Text {
                         text: name
                         font.pixelSize: 15
                         color: "black"
                     }
                     Row {
                         spacing: 5
                         Repeater {
                             model: attributes
                             Text { text: description; color: "black" }
                         }
                     }
                 }
             }
         }
     }

    ListView
    {
             id: mediaListView
             model: mediaModel
             delegate: mediaListDelegate


            anchors.fill: parent


    }
}
