import QtQuick

Window {
  id: root

  width: 640
  height: 480

  visible: true

  title: qsTr("Music Player")

  Rectangle {
    id: topBar

    anchors {
      top: parent.top
      left: parent.left
      right: parent.right
    }

    height: 50
    color: "#5F8575"
  }

  Rectangle {
    id: mainSection

    anchors {
      top: topBar.bottom
      bottom:  bottomBar.top
      left: parent.left
      right: parent.right
    }

    color: "#1E1E1E"

    AudioInfoBox {
      id: firstSong

      anchors {
        verticalCenter: parent.verticalCenter
        left: parent.left
        right: parent.right
        margins: 20
      }

      songIndex: 0
      title: "One Kiss"
      author: "Dua Lipa"
      image: "magenta"
    }

    AudioInfoBox {
      id: secondSong

      anchors {
        verticalCenter: parent.verticalCenter
        left: parent.left
        right: parent.right
        margins: 20
      }

      songIndex: 1
      title: "Unstoppable"
      author: "SIA"
      image: "purple"
    }

    AudioInfoBox {
      id: thirdSong

      anchors {
        verticalCenter: parent.verticalCenter
        left: parent.left
        right: parent.right
        margins: 20
      }

      songIndex: 2
      title: "I'm not afraid"
      author: "Eminem"
      image: "blue"
    }
  }

  Rectangle {
    id: bottomBar

    anchors {
      bottom: parent.bottom
      left: parent.left
      right: parent.right
    }

    height: 100
    color: "#333333"

    Row {
      anchors.centerIn: parent

      spacing: 20

      TextButton {
        id: previousBtn

        width: 50
        height: 50

        txt: "<"

        onClicked: playerController.previousSong()
      }

      TextButton {
        id: playPauseBtn

        width: 75
        height: 50

        txt: playerController.playing ? "pause" : "play"

        onClicked: playerController.playPause()
      }

      TextButton {
        id: nextBtn

        width: 50
        height: 50

        txt: ">"

        onClicked: playerController.nextSong()
      }
    }
  }

  QtObject {
    id: playerController

    property int currentIndex: 0
    property int count: 3
    property bool playing: false

    function playPause() {
      playing = !playing
    }

    function previousSong() {
      if(currentIndex > 0) {
        currentIndex--
      } else {
        currentIndex = count - 1
      }
    }

    function nextSong() {
      if (currentIndex +1 >= count) {
        currentIndex = 0
      } else {
        currentIndex++
      }
    }
  }
}
