import QtQuick 2.0

Item  {
    id: actionBtn
    height: parent.height
    width: 140
    property string activeState
    visible: parent.state == activeState ? true : false
    property string text: "?"
    property bool lock: false
    signal activate

    state: "NORMAL"

    states: [
        State {
            name: "NORMAL"
            when: !actionBtn.lock
            PropertyChanges { target: actionRect; color: "black" }
            PropertyChanges { target: actionTxt; color: "white" }
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
            name: "DISABLE"
            when: actionBtn.lock
            PropertyChanges { target: actionRect; color: "grey" }
            PropertyChanges { target: actionTxt; color: "grey" }
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
        color: "black"
        Text {
            id: actionTxt
            anchors.centerIn: parent
            color: "White"
            font.bold: true
            font.pointSize: 14
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
