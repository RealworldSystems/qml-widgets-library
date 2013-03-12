/*
  source: http://qt-project.org/forums/viewthread/9275
*/

import QtQuick 1.0

FocusScope {
    id: container
    signal clicked
    property string source
    property string text
    property string color: "#ffffff"
    property int textSize: 12
    property string borderColor: "#00000000"
    property int borderWidth: 0
    property int radius: 0
    property int margin: 0

    Rectangle {
        id: buttonRectangle
        anchors.fill: parent
        color: "#00000000"
        radius: container.radius
        border.width: container.borderWidth
        border.color: container.borderColor

        Item {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: container.margin*2

            Text {
                color: container.color
                anchors.centerIn: parent
                font.pixelSize: container.textSize
                text: container.text+" "
                font.bold: true
            }
        }

        MouseArea {
            id: mouseArea;
            anchors.fill: parent
            onClicked: {
                buttonRectangle.state = "pressed"
                stateTimer.start()
                container.clicked()
            }
        }

        states: State {
            name: "pressed"
        }

        Timer {
            id: stateTimer
            interval: 200;
            repeat: false
            onTriggered: buttonRectangle.state = 'State0'
        }

        transitions: Transition {
            NumberAnimation { properties: "scale"; duration: 200; easing.type: Easing.InOutQuad }
        }
    }
}
