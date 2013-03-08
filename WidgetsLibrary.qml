// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

import 'qmltemplates/AccordionList/component' as AccordionListPackage
import 'qmltemplates/DatePicker/component' as DatePickerPackage
import 'qmltemplates/Button/component' as ButtonPackage

Rectangle {

    width: 360
    height: 360

    Text {
        anchors.centerIn: parent
        text: "Hello World"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Column {

        width: parent.width

        DatePickerPackage.DateReel {
            id: dateReel
            width: parent.width
        }

        ButtonPackage.Button {
            id: someButton
            text: "CLICK ME"
            onClicked: { console.log("...you clicked me") }
        }

        TextInput {

            text: "WTF"

            BorderImage {
                border { top: 8; bottom: 8; left: 8; right: 8 }
            }
        }
    }
}
