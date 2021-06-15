import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: win
    width: 640
    height: 480
    visible: true
    title: qsTr("Ovladani pravym tl. myší")


    Component.onCompleted: {
        if(Qt.application.arguments.length>1){
            console.log("Number of args: "+Qt.application.arguments.length)
            var file= "file:///" + applicationDirPath+"/"+Qt.application.arguments[1]
            console.log("Set default image: "+file)
            stack.push(0,preview,{images:[file]})
            stack.push(detail, {"imgPath": file})
        }
    }


    StackView {
            id: stack
            initialItem: preview
            anchors.fill: parent
    }



    Component {
      id: preview
      Preview {
        onShowDetail: {
            stack.push(detail, {"imgPath": fileName})
        }
      } // specify property bindings
    }

    Component {
      id: detail
      BigImage{
          onClose: {
              stack.pop()
          }
      }
    }


}
