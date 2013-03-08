import QtQuick 1.0

import "../component" as Comp

Item {

    id: container

    width: 360
    height: 640

    Row {

        Comp.Button {
            id: pressMe
            text: "SAVE"
            onClicked: { console.log("...you clicked " + text) }
        }

        Comp.Button {
            id: dontPressMe
            text: "CANCEL"
            onClicked: { console.log("...you clicked " + text) }
        }
    }
}
