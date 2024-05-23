import QtQuick

Item {
  id: root

  property color color: "gray"
  property alias txt: btnTxt.text

  signal clicked()

  Rectangle {
    id: backgroundRec

    anchors.fill: parent

    color: if (btnMouseArea.containsPress){
             return Qt.lighter(root.color)
           } else if (btnMouseArea.containsMouse){
             return Qt.darker(root.color)
           } else {
             return root.color
           }
  }

  Text {
    id: btnTxt

    anchors.centerIn: parent
  }

  MouseArea {
    id: btnMouseArea

    anchors.fill: parent

    hoverEnabled: true

    onClicked: {
      root.clicked()
    }
  }
}
