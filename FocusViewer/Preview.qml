import QtQuick 2.0
import QtQuick.Dialogs 1.3


Item {
    property var  images: []
    property alias model: grid.model
    property alias imagesFolder: fileDialog.folder
    signal showDetail(var fileName)



    id:root

    /*
        "file://home/pou/FocusViewer/FocusViewer/FocusViewer/test_data/P6150085.ORF",
        "file://home/pou/FocusViewer/FocusViewer/FocusViewer/test_data/P6150086.ORF",
        "file://home/pou/FocusViewer/FocusViewer/FocusViewer/test_data/P6150087.ORF",
        "file://home/pou/FocusViewer/FocusViewer/FocusViewer/test_data/P6150088.ORF"
    ]//*/


    Component.onCompleted: {
        console.log("Default img: "+images)
        grid.model=null
        grid.model=images
    }

    FileDialog {
        id: fileDialog
        selectMultiple:true
        title: "Please choose a file"
        //folder: "file:///media/data/Obrázky/Anežka/nerostrideno/P5210011.ORF"
        //Component.onCompleted: visible = true
        onAccepted: {
            grid.model=null
            images=[]
            for(var i=0;i<fileDialog.fileUrls.length;i++){
                images.push(fileDialog.fileUrls[i])
            }
            grid.model=images
        }
    }

    MouseArea{
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        onClicked: {
            fileDialog.visible=true
        }
    }




    GridView{
        id: grid
        anchors.fill: parent
        cellWidth: 220
        cellHeight: 220
        model: images
        delegate: Item{
                    width: 200
                    height: 200
                    ImageViewer{
                        anchors.fill: parent
                        imgPath:  images[index]
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log("detail")
                            root.showDetail(images[index])
                        }
                    }
                }
    }

}
