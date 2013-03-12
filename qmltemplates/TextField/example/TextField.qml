import QtQuick 1.1

import "../component" as Comp

Item {

    width: 600
    height: 600

    Column {

        width: parent.width

        spacing: 5

        TextInput {
            text: "hello there"
        }

        Comp.TextField {
            width: parent.width
            description: "What is you?"
            onAccepted: { console.log("...you have just hit enter!") }
        }

        Comp.TextField {
            width: parent.width
            description: "What is you?"
            onAccepted: { console.log("...you have just hit enter!") }
        }

        Comp.TextField {
            width: parent.width
            description: "What is you?"
            onAccepted: { console.log("...you have just hit enter!") }
        }
    }
}
