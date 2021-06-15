import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Dialogs 1.3


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: "test_data"//shortcuts.home

        //Component.onCompleted: visible = true
    }


    ImageViewer{
        id:imageViever
        anchors.fill: parent
        //imgPath: "file://tmp/file_example_JPG_100kB.jpg"
        //imgPath: "file://tmp/sample1.orf"
        //imgPath: fileDialog.fileUrl
        //imgPath:  "file://home/pou/FocusViewer/FocusViewer/FocusViewer/test_data/P6150085.jpg"
        imgPath:  "file://home/pou/FocusViewer/FocusViewer/FocusViewer/test_data/P6150086.ORF"

    }
}
