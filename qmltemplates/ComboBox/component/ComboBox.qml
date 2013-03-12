/*
  source: http://qt-project.org/forums/viewthread/9275
*/

import QtQuick 1.0

FocusScope {
    id: comboBox

    property string initialText
    property int maxHeight
    property int selectedItem: 0
    property variant listModel
    signal expanded
    signal closed

    ComboBoxButton {
        id: comboBoxButton
        width: parent.width
        height: parent.height
//        source: "images/down.png"
        borderColor: "#fff"
        radius: 10
        margin: 5
        borderWidth: 2
        text: initialText
        textSize: parent.height-20

        onClicked: {
            if (listView.height == 0) {
                listView.height = Math.min(maxHeight, listModel.count*comboBoxButton.height)
                comboBox.expanded()}
            else {
                listView.height = 0
                comboBox.closed()}
        }
    }

    Component {
        id: comboBoxDelegate

        Rectangle {
            id: delegateRectangle
            width: comboBoxButton.width
            height: comboBoxButton.height
            color: "#00000000"
            radius: comboBoxButton.radius
            border.width: comboBoxButton.borderWidth
            border.color: comboBoxButton.borderColor

            Item {
                anchors.left: parent.left
                width: parent.width-parent.height-2*comboBoxButton.margin
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                // anchors.leftMargin: comboBoxButton.margin*2

                Text {
                    //color: "#fff"
                    color: index == listView.currentIndex ? "#ffff00" : "#ffffff"
                    anchors.centerIn: parent
                    font.pixelSize: comboBoxButton.height-20
                    text: value
                    font.bold: true
                }
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    listView.height = 0
                    listView.currentIndex = index
                    comboBox.selectedItem = index
                    comboBoxButton.text = value
                    comboBox.closed()
                }
            }
        }
    }

    ListView {
        // visible: false
        id: listView
        anchors.top: comboBoxButton.bottom
        anchors.left: comboBoxButton.left
        width: parent.width
        //height: Math.min(maxHeight, listModel.count*comboBoxButton.height)
        height: 0
        clip: true
        model: listModel
        delegate: comboBoxDelegate
        currentIndex: selectedItem

        Behavior on height {

            NumberAnimation {
                id: animateHeight
                property: "height"
                //from: 0.99
                //to: 1.0
                //loops: Animation.Infinite
                duration: 200
                easing {type: Easing.Linear}
            }
        }
    }
}
