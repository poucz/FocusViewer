import QtQuick 2.0

Item {
    property var focusPoint:    Qt.point(20,80)
    property var focusSize:     Qt.size(10, 10)

    property alias imgPath: img.source


    onImgPathChanged: {
        console.log("new image was loadeed "+imgPath)
        imgInfo.loadNewImage(imgPath)
    }

    function printValues(){
        console.log("Rect on pos: "+focusPoint)
        console.log("Img orig size:   "+img.sourceSize.width+","+img.sourceSize.height)
        console.log("Img current size :"+img.paintedWidth+","+img.paintedHeight)
        console.log("Rect act pos: "+focus.x+","+focus.y)
    }

    onWidthChanged:  printValues();
    onHeightChanged: printValues();

    Column{
        Text {
            text: qsTr("text")
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
            x:((imgCanvas.width-img.paintedWidth)/2)   + ((focusPoint.x*img.paintedWidth)/100)
            y:((imgCanvas.height-img.paintedHeight)/2) + ((focusPoint.y*img.paintedHeight)/100)
            width: 100
            height: 50
            border.color: "red"
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
