import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.1

import "Components"
import "Views"

Window {
    id: win
    width: 480
    height: 640
    visible: true
    //minimumWidth: 480
    //minimumHeight: 640
    title: "Aeternity"

    property int stacktime: 500
    property bool landscape: (win.height*1.1) < win.width

    Rectangle { // ### TITLE ###
        id: stateTitle
        anchors.top: win.top
        anchors.right: parent.right
        anchors.left: parent.left
        height: 60
        color: "black"
        border.color: "gray"
        border.width: 1
        Text {
            id: textTitle
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#33aaff"
            text: "Aeternity"
            font.pointSize: 16
        }
    }

    StackView { // ### PORTRAIT STACK ###
        id: mainStack
        visible: !win.landscape
        onVisibleChanged: { if (!mainStack.visible) mainStack.pop(null,StackView.Immediate) }
        anchors.top: stateTitle.bottom
        anchors.bottom: actionsZone.top
        anchors.left: parent.left
        anchors.right: parent.right
        initialItem: portraitListView
        Transition {
            id: enterRight
            XAnimator {
                from: (mainStack.mirrored ? -1 : 1)*mainStack.width
                to: 0
                duration: win.stacktime
                easing.type: Easing.OutCubic
            }
        }
        Transition {
            id: enterLeft
            XAnimator {
                from: -(mainStack.mirrored ? -1 : 1)*mainStack.width
                to: 0
                duration: win.stacktime
                easing.type: Easing.OutCubic
            }
        }
        Transition {
            id: goRight
            XAnimator {
                from: 0
                to: (mainStack.mirrored ? -1 : 1)*mainStack.width
                duration: win.stacktime
                easing.type: Easing.OutCubic
            }
        }
        Transition {
            id: goLeft
            XAnimator {
                from: 0
                to: -(mainStack.mirrored ? -1 : 1)*mainStack.width
                duration: win.stacktime
                easing.type: Easing.OutCubic
            }
        }
        pushEnter: enterRight
        pushExit: goLeft
        popEnter: enterLeft
        popExit: goRight

        AetherListView { id: portraitListView }
        AetherInfoView { id: portraitInfoView }
        AetherColorView { id: portraitColorView }
    }

    Item { // ### LANDSCAPE STACK ###
        id: landPanel
        anchors.top: stateTitle.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        visible: win.landscape
        onVisibleChanged: { if (!landPanel.visible) landStack.pop(null,StackView.Immediate) }

        AetherListView {
            id: landListView
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: actionsZone.height
            anchors.left: parent.left
            width: parent.width * 0.4
        }
        StackView {
            id: landStack
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            width: parent.width * 0.6
            initialItem: landLogo

            AeternityLogo { id: landLogo }
            AetherInfoView {
                id: landInfo
                closer: true
                //
                // TODO : configure Info
                //
            }
            AetherColorView {
                id: landColor
                //
                // TODO : configure color
                //
            }
        }
    }

    Rectangle { // ### ACTION BUTTONS ###
        id: actionsZone
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width
        height: 40
        border.color: "gray"
        border.width: 1
        color: "black"
        state: win.landscape ? "LANDSCAPE" : "PORTRAIT"

        states: [
            State {
                name: "LANDSCAPE"
                PropertyChanges { target: actionsZone; width: parent.width * 0.4 }
                PropertyChanges { target: actionRow; state: "LIST" }
            },
            State {
                name: "PORTRAIT"
                PropertyChanges { target: actionsZone; width: parent.width }
                PropertyChanges { target: actionRow; state: "LIST" }
            }
        ]

        Row {
            id: actionRow
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 1
            anchors.bottomMargin: 1
            spacing: 2
            state: "LIST"

            states: [
                State { name: "LIST" },
                State { name: "INFO" },
                State { name: "COLOR" }
            ]

            // ### LIST CONTROLS ###

            ActionButton {
                id: actionListScan
                activeState: "LIST"
                text: "Scan"
                onActivate: {
                    lock = true
                    actionListScan.state = "ACTIVE"
                    //
                    // TODO : lock the list !!!!!!!!!
                    //
                    udpComm.toggleScan()
                    scanTimer.start()
                }

                Timer {
                    id: scanTimer
                    interval: 3000
                    running: false
                    repeat: false
                    onTriggered: {
                        actionListScan.lock = false
                        actionListScan.state = "NORMAL"
                        //
                        // TODO : unlock the list
                        //
                        udpComm.toggleScan()
                    }
                }
            }

            // ### INFO CONTROLS ###

            ActionButton {
                id: actionInfoBack
                activeState: "INFO"
                text: "Back"
                onActivate: {
                    actionRow.state = "LIST"
                    mainStack.pop(portraitListView)
                }
            }

            // ### COLOR CONTROLS ###

            ActionButton {
                id: actionColorApply
                activeState: "COLOR"
                text: "Apply"
                onActivate: {
                    //
                    // TODO : ???
                    //
                }
            }
            ActionButton {
                id: actionColorBack
                activeState: "COLOR"
                text: "Back"
                onActivate: {
                    actionRow.state = "LIST"
                    //
                    // TODO : evolution needed
                    //
                    mainStack.pop(portraitInfoView)
                }
            }
        }
    }

    // TODO : list of detected aether
    // TODO : script to detect and list discovered aether
    // TODO : in the list, button to reveal the aether
    // TODO : screen dedicated to only one aether
    // TODO : on all screens, activate pattern
}
