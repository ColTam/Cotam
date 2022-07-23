import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Shapes 1.15

Rectangle {
    id: moveItem

    //注意拖动目标不要使用锚布局或者Layout，而是使用相对坐标
    width: parent.width
    height: parent.height
    radius: config.radiusH

    color: "white"
    border.color: "silver"

    CShape {
        id: titleTar
        container: titleTar
        x:1
        y:1
        width: parent.width-2
        height: 100
        leftTopRadius: config.radiusH
        rightTopRadius: config.radiusH

        CMoveArea {
            container: window
            anchors.fill: parent
        }

        Label {
            x: 30
            text: qsTr("Hello")
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    CHomeBorderResize {
        control: window
        anchors.fill: parent
    }

    Rectangle {
        x: 100
        y: 100
        width: 100
        height: 100
        color: "Green"
        CMoveArea {
            container: parent
            anchors.fill: parent
        }
        CHomeBorderResize {
            control: parent
            anchors.fill: parent
        }
    }

//    property point startPoint: Qt.point(0, 0);
//    property point fixedPont: Qt.point(0, 0);
//    MouseArea
//    {
//        id: area2
//        x: 8
//        y: 0
//        width: window.width - 16
//        height: 8
//        hoverEnabled: true

//        onEntered: cursorShape = Qt.SizeVerCursor;
//        onExited: cursorShape = Qt.ArrowCursor;
//        onPressed: startPoint = Qt.point(mouseX, mouseY);
//        onPositionChanged:
//        {
//            if(pressed)
//            {
//                var offsetY = mouseY - startPoint.y;
//                if (offsetY != 0 && (window.height - offsetY) >= window.minimumHeight)
//                {
//                    window.height -= offsetY;
//                    window.y += offsetY;
//                }
//            }
//        }
//    }
    //    CShape {
    //        id: rightTar
    //        container: rightTar
    //        x:parent.width-width-1
    //        y:titleTar.height+1
    //        width: 342
    //        height: parent.height-titleTar.height-2
    //        rightBottomRadius: 24
    //    }

    CButton {
        id: closeButton
        x: parent.width - 100
        y: 20
        width: 68
        height: 68
        text: qsTr("BiuBiuBiu")
        onClicked: {
            Qt.quit()
        }
    }

    CButton {
        id: max
        x: 500
        y: 20
        width: 68
        height: 68
        text: qsTr("BiuBiuBiu")
        onClicked: {
            config.currentTheme = 1
        }
    }

    CButton {
        id: min
        x: 400
        y: 20
        width: 68
        height: 68
        text: qsTr("BiuBiuBiu")
        onClicked: { config.currentTheme = 0 }
    }

    ComboBox {
        id: comboBoxLanguage
        x: 500
        y: 150
        model: [
            qsTr("english"),
            qsTr("chinese")
        ]
        currentIndex: settings.language

        function updateLanguage() {
            switch (currentIndex) {
            case 0:
                m_translator.reTranslate("en");
                currentIndex = 0;
                break;
            case 1:
                m_translator.reTranslate("cn");
                currentIndex = 1;
                break;
            }
        }

        Component.onCompleted: {
            // Load language
            updateLanguage()
        }

        // onActivated
        // onCurrentTextChanged 会初始化多次
        // onCurrentIndexChanged 初始化一次，但currentText未及时更新
        onActivated: {
            updateLanguage()
            settings.language = currentIndex
        }
    }
}

