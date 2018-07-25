import QtQuick 2.0

Item  {
    id: actionBtn
    visible: true
    width: height
    property string text: "?"
    property bool lock: false
    signal activate

    state: "NORMAL"

    states: [
        State {
            name: "NORMAL"
            when: !actionBtn.lock
            PropertyChanges { target: actionRect; color: "white" }
            PropertyChanges { target: actionTxt; color: "black" }
        },
        State {
            name: "HOVER"
            when: !actionBtn.lock
            PropertyChanges { target: actionRect; color: "#33aaff" }
            PropertyChanges { target: actionTxt; color: "white" }
        },
        State {
            name: "ACTIVE"
            when: !actionBtn.lock
            PropertyChanges { target: actionRect; color: "orange" }
            PropertyChanges { target: actionTxt; color: "#33aaff" }
        },
        State {
            name: "LOCKED"
            when: actionBtn.lock
            PropertyChanges { target: actionRect; color: "orange" }
            PropertyChanges { target: actionTxt; color: "white" }
        }

    ]

    Rectangle {
        id: actionRect
        anchors.fill: parent
        color: "white"
        Text {
            id: actionTxt
            anchors.centerIn: parent
            color: "black"
            font.bold: true
            font.pointSize: 18
            text: actionBtn.text
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: if (!actionBtn.lock) actionBtn.state = "HOVER"
            onExited: if (!actionBtn.lock) actionBtn.state = "NORMAL"
            onClicked: {
                if (actionBtn.lock) return
                actionRect.state = "ACTIVE"
                actionBtn.activate()
            }
        }
    }
}
