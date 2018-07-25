import QtQuick 2.11
import QtQuick.Window 2.11

import "Components"

Window {
    id: win
    width: 480
    height: 640
    visible: true
    minimumWidth: 480
    minimumHeight: 640
    title: "Aeternity"

    Rectangle {
        id: stateTitle
        anchors.top: win.top
        anchors.right: parent.right
        anchors.left: parent.left
        height: 40
        border.color: "gray"
        border.width: 1
        Text {
            id: textTitle
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            text: "Aeternity"
            font.pointSize: 13
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle {
        //
        // list
        //
    }

    Rectangle {
        id: scanningVeil
        visible: false
        opacity: 0.6
        //
        // TODO : this veil show the countdown for the udp handshake
        //
    }

    Rectangle {
        id: actionsZone
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        height: 60
        border.color: "gray"
        border.width: 1

        Row {
            id: row
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            spacing: 2
            state: "HOME"

            states: [
                State {
                    name: "HOME"
                    //
                    //
                }

            ]

            ActionButton {
                id: actionTest
                text: "?"
                height: parent.height
                //
                // TODO : ???
                //
            }

            ActionButton {
                id: actionScan
                text: "S"
                height: parent.height
                onActivate: {
                    //
                    //
                    //
                    console.log("activation !")
                    //
                    // TODO : update the list screen
                    // TODO : refresh the list ?
                    //
                    // TODO : change the state of the Rectangle
                    // TODO : activate the UDP handshake
                    //
                    lock = true
                    //
                    //
                    udpComm.startRequest()
                    //
                }
            }
        }
        //
        //
    }

    // TODO : list of detected aether
    // TODO : script to detect and list discovered aether
    // TODO : in the list, button to reveal the aether
    // TODO : screen dedicated to only one aether
    // TODO : on all screens, activate pattern
}
