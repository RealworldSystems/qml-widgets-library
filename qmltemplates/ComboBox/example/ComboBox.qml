/*
  source: http://qt-project.org/forums/viewthread/9275
*/

import QtQuick 1.0
import "../component" as Comp

Rectangle {

    id: main
    width: 200
    height: 300
    anchors.fill: parent
    color: "#777"

    ListModel {

        id: model

        ListElement {
            value: "Hello"
        }

        ListElement {
            value: "Ciao!"
        }

        ListElement {
            value: "Fröhliche Weihnachten!"
        }

        ListElement {
            value: "Bonne journée"
        }
    }

    Comp.ComboBox {
        id: comboBox
        listModel: model

//        anchors { top: parent.top; left: parent.left }

        width: parent.width
        height: main.height/6

        maxHeight: main.height/2

        initialText: "Choose your greeting!"
    }
}
