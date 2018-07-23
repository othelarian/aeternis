import QtQuick 2.11
import QtQuick.Window 2.11

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
        id: actionsZone
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        height: 60
        border.color: "gray"
        border.width: 1
        //
        //
        Text {
            //
            text: "actions zone"
            //
        }
    }

    // TODO : list of detected aether
    // TODO : button to detect aether
    // TODO : script to detect and list discovered aether
    // TODO : in the list, button to reveal the aether
    // TODO : screen dedicated to only one aether
    // TODO : on all screens, activate pattern
}
