import QtQuick

Item {
  id: root

  required property int songIndex
  property alias title: titleTxt.text
  property alias author: authorTxt.text
  property alias image: albumImage.color

  visible: playerController.currentIndex === root.songIndex

  Rectangle {
    id: albumImage

    anchors {
      verticalCenter: parent.verticalCenter
      left: parent.left
    }

    width: 150
    height: 150
  }

  Text {
    id: titleTxt

    anchors {
      bottom: parent.verticalCenter
      left: albumImage.right
      margins: 20
      right: parent.right
    }

    color: "white"
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere

    font {
      pixelSize: 20
      bold: true
    }
  }

  Text {
    id: authorTxt

    anchors {
      top: parent.verticalCenter
      left: titleTxt.left
      topMargin: 5
      right: parent.right
    }

    color: "grey"
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere

    font {
      pixelSize: 16
    }
  }
}
