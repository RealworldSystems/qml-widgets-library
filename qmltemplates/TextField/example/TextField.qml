import QtQuick 1.0

import "../component" as Comp

Item {
    id: container

    width: 600
    height: 600

    Comp.TextField {
        description: "Enter your name"
        onAccepted: { console.log("...you have just hit enter!") }
    }
}
