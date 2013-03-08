import QtQuick 1.0

FocusScope {
    id: container

    width: 220
    height: 28

    signal accepted

    property alias text: input.text
    property alias item: input

    property alias description: description.text
    property alias totalWidth: container.width

//    MouseArea {

//        anchors.fill: parent;

//        /*
//            GP: could we use the on change of focus property to highlight the target input field?
//        */

//        onClicked: {
//            input.focus = true;
//            borderBox.border.color = "green"
//            borderBox.border.width = 3
//        }
//    }

    Column {
        spacing: 2

        width: 200

        Text {
            id: description

            text: "NO DESCRIPTION"
            font { pixelSize: 16; bold: true; }

            color: "black"; styleColor: "black"
            horizontalAlignment: Qt.AlignRight
        }

        Rectangle {
            id: borderBox

            width: parent.width; height: 20; radius: 0

            color: "white"
            border { color: "gray"; width: 2 }

            TextInput {
                id: input

                onAccepted: { container.accepted() }

                width: parent.width
                anchors.centerIn: parent

                font { pixelSize: 16; }

                color: "#151515"; selectionColor: "mediumseagreen"

                focus: true
                selectByMouse: true

                text: ""
            }
        }
    }
}
