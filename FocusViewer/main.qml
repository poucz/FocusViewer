import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    ImageViewer{
        anchors.fill: parent
        //imgPath: "file://tmp/file_example_JPG_100kB.jpg"
        imgPath: "file://tmp/sample1.orf"
    }
}
