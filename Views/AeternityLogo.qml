import QtQuick 2.0

Item {
    clip: true
    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    Image {
        source: "/images/Aeternity.png"
        anchors.centerIn: parent
        width: parent.width > 400 ? 400 : parent.width
        fillMode: Image.PreserveAspectFit
    }
}
