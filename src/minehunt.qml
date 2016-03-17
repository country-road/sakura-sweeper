import QtQuick 1.0
import "MinehuntCore"

Item {
    id: field
    property int clickx: 0
    property int clicky: 0

    width: 450; height: 450

    Image { source: "MinehuntCore/pics/background.png"; anchors.fill: parent; fillMode: Image.Tile }

    Grid {
        anchors.horizontalCenter: parent.horizontalCenter
        columns: 9; spacing: 1

        Repeater {
            id: repeater
            model: tiles
            delegate: Tile {}
        }
    }

    Row {
        id: gamedata
        x: 20; spacing: 20
        anchors.bottom: field.bottom; anchors.bottomMargin: 15

        Image {
            source: "MinehuntCore/pics/quit.png"
            scale: quitMouse.pressed ? 0.8 : 1.0
            smooth: quitMouse.pressed
            y: 10
            MouseArea {
                id: quitMouse
                anchors.fill: parent
                anchors.margins: -20
                onClicked: Qt.quit()
            }
        }
        Column {
            spacing: 2
            Image { source: "MinehuntCore/pics/bomb-color.png" }
            Text { anchors.horizontalCenter: parent.horizontalCenter; color: "white"; text: numMines }
        }

        Column {
            spacing: 2
            Image { source: "MinehuntCore/pics/flag-color.png" }
            Text { anchors.horizontalCenter: parent.horizontalCenter; color: "white"; text: numFlags }
        }
    }

    Image {
        anchors.bottom: field.bottom; anchors.bottomMargin: 15
        anchors.right: field.right; anchors.rightMargin: 20
        source: isPlaying ? 'MinehuntCore/pics/face-smile.png' :
        hasWon ? 'MinehuntCore/pics/face-smile-big.png': 'MinehuntCore/pics/face-sad.png'

        MouseArea { anchors.fill: parent; onPressed: reset() }
    }
    Text {
        anchors.centerIn: parent; width: parent.width - 20
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        text: "Minehunt demo has to be compiled to run.\n\nPlease see README."
        color: "white"; font.bold: true; font.pixelSize: 14
        visible: tiles == undefined
    }

}
