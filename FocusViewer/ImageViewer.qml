import QtQuick 2.0

Item {
    //property var focusPoint:        Qt.point(4608/2,3456/2)
    //property var focusPointPercent: Qt.point(50,50)
    //property var focusSize:         Qt.size(10, 10)

    property var focusPoint:        imgInfo.focusPoint
    property var focusPointPercent: imgInfo.focusPointPercent
    property var focusSize:         imgInfo.focusSize

    property alias imgPath: img.source


    onImgPathChanged: {
        console.log("new image was loadeed "+imgPath)
        imgInfo.loadNewImage(imgPath)
    }

    function printValues(){
        //console.log("Rect on pos: "+focusPointPercent+"%")
        //console.log("Img orig size:   "+img.sourceSize.width+","+img.sourceSize.height)
        //console.log("Img current size :"+img.paintedWidth+","+img.paintedHeight)
        //console.log("Rect act pos: "+focus.x+","+focus.y)
        //
        //
        //console.log("Pomer sirky: "+(img.paintedWidth/img.sourceSize.width))
        //console.log("Pomer bod na sirze: "+(img.paintedWidth/img.sourceSize.width)*focusPoint.x)
    }

    onWidthChanged:  printValues();
    onHeightChanged: printValues();

    Column{
        z:1
        Text {
            text: qsTr("text")
        }
        Text {
            text: focusPointPercent.x +"%,"+focusPointPercent.y+"%"
        }
        Text {
            text: focusPoint.x +","+focusPoint.y
        }
        Text {
            text: focusSize.width +"x"+focusSize.height
        }

        Rectangle{
            width: 50
            height: 50
            color: "green"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    printValues()
                }
            }
        }
    }



    Item{
        id:imgCanvas
        anchors.fill: parent
        Image {
            id: img
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: focus
            x:((imgCanvas.width-img.paintedWidth)/2)   + ((focusPointPercent.x*img.paintedWidth)/100)
            y:((imgCanvas.height-img.paintedHeight)/2) + ((focusPointPercent.y*img.paintedHeight)/100)
            width: focusSize.width
            height: focusSize.height
            border.color: "red"
            border.width: 2
            color: "transparent"
        }

        Rectangle {
            id: focus2
            x: (((imgCanvas.width-img.paintedWidth)/2) +  (img.paintedWidth/img.sourceSize.width)*focusPoint.x )+1
            y: (((imgCanvas.height-img.paintedHeight)/2)+(img.paintedHeight/img.sourceSize.height)*focusPoint.y) +1
            width: focusSize.width
            height: focusSize.height
            border.color: "green"
            border.width: 2
            color: "transparent"
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
