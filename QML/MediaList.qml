// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0

Rectangle
{
	id: baseRectangle
	property alias items: mediaListView.model

    MouseArea { anchors.fill: parent; onClicked: console.log(mediaListView.model.count) }

    ListView
    {
		id: mediaListView
		anchors.fill: parent
			 
		delegate: 
			Component 
			{
                Rectangle
                {
                    id: componentRectangle
                    width: parent.width
                    height: 40
                    color: ((index % 2 == 0)?"#222":"#111")
                    
                    Row
                    {
                        width: parent.width
                        
                        Image
                        {
                            id: rowImage
                            height: 40

                            fillMode:Image.PreserveAspectFit
                            source: 
                            {
                                if(model.thing.isDirectory) "images/button.png";
                                    else "images/Audio.png"
                            }
                        }
                    
                        Rectangle 
                        {
                            id: rectangleItem
                            height: 40
                            width: parent.width-40
                            color: componentRectangle.color
                            Text 
                            {
                                id: title
                                elide: Text.ElideRight
                                text: model.thing.name
                                color: "white"
                                font.bold: {
                                    if(model.thing.isDirectory) true;
                                    else false;
                                }
                                anchors.leftMargin: 10
                                anchors.fill: parent
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                    
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked: { console.log("Clicked"); mediaExplorer.fileOrDirectorySelected(model.thing, items) }
                    } 
                }
                
			}
     }
}
