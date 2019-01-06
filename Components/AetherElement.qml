import QtQuick 2.0
import QtQuick.Controls 2.4

Rectangle {
    id: rectangle
    property string name
    property int size: 40

    height: size
    width: parent.width
    color: "black"
    border.color: "gray"
    border.width: 1

    Text {
        font.pointSize: 10
        text: parent.name
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        color: "white"
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: { parent.color = "#33aaff" }
        onExited: { parent.color = "black" }
        onClicked: {
            if (win.landscape) {
                //
                // TODO : case of the landscape
                //
            }
            else {
                actionRow.state = "INFO"
                mainStack.push(portraitInfoView)
            }
        }
    }
}
