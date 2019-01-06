import QtQuick 2.0

import "../Components"

Item {
    property bool scanning: false

    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    ListView {
        id: aetherList
        visible: !scanning
        anchors.fill: parent
        clip: true
        spacing: 2
        model: udpComm.aethers
        delegate: AetherElement {
            //
            name: code
            //
        }
    }
}
