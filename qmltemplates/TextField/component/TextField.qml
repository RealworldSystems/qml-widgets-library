import QtQuick 1.0

FocusScope {
    id: container

    signal accepted

    property alias text: input.text
    property alias item: input

    property alias description: description.text
    property color descriptionColor: "black"

    width: description.width
    height: description.height + input.height

    Column {
        spacing: 2

        Text {
            id: description

            text: "NO DESCRIPTION"
            font { pixelSize: 16; bold: true }

            color: descriptionColor;
            horizontalAlignment: Qt.AlignRight
        }

        Rectangle {
            id: borderBox

            width: container.width; height: 25; radius: 0

            color: "white"
            border { color: "gray"; width: 2 }

            TextInput {
                id: input

                onAccepted: { container.accepted() }

                width: parent.width

                font { pixelSize: 16; }

                color: "#151515"; selectionColor: "mediumseagreen"

                focus: true
                selectByMouse: true

                text: ""
            }
        }
    }
}
