import QtQuick 2.0

ImageViewer{
    id:root
    signal close

    //imgPath: "file://tmp/file_example_JPG_100kB.jpg"
    //imgPath: "file://tmp/sample1.orf"
    //imgPath: fileDialog.fileUrl
    //imgPath:  "file://home/pou/FocusViewer/FocusViewer/FocusViewer/test_data/P6150085.jpg"
    //imgPath:  "file://home/pou/FocusViewer/FocusViewer/FocusViewer/test_data/P6150086.ORF"

    MouseArea{
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        onClicked: {
            root.close()
        }
    }
}
