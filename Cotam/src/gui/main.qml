import QtQml 2.12
import QtQuick 2.9
import QtQuick.Controls 2.5
import Qt.labs.settings 1.1
import QtGraphicalEffects 1.15
import QtQuick.Window 2.15

import ".."

Window {
    id: window
    width: 1366
    height: 768
    visible: true
    flags: Qt.Window | Qt.FramelessWindowHint
//    modality: Qt.ApplicationModal

    color: "transparent"

    Settings {
        id: settings

        category: "window"
        property alias x: window.x
        property alias y: window.y
        property alias width: window.width
        property alias height: window.height

        property int language: 0
        property int theme: 0
    }

    CConfig {
        id: config
    }

    CHomePage {
        id: homePage
        width: window.width - 20
        height: window.height - 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    // 左边缘及上边缘阴影
    DropShadow {
           anchors.fill: homePage
           horizontalOffset: -3
           verticalOffset: -3
           radius: config.radiusL
           samples: config.radiusL * 2 + 1
           color: "#20000000"
           spread: 0.0
           source: homePage
    }

    // 左边缘及下边缘阴影
    DropShadow {
           anchors.fill: homePage
           horizontalOffset: -3
           verticalOffset: 3
           radius: config.radiusL
           samples: config.radiusL * 2 + 1
           color: "#20000000"
           spread: 0.0
           source: homePage
    }

    // 右边缘及下边缘阴影
    DropShadow {
            anchors.fill: homePage
            horizontalOffset: 3
            verticalOffset: 3
            radius: config.radiusL
            samples: config.radiusL * 2 + 1
            color: "#20000000"
            spread: 0.0
            source: homePage
    }

    // 右边缘及上边缘阴影
    DropShadow {
            anchors.fill: homePage
            horizontalOffset: 3
            verticalOffset: -3
            radius: config.radiusL
            samples: config.radiusL * 2 + 1
            color: "#20000000"
            spread: 0.0
            source: homePage
    }

    onXChanged: settings.x = window.x
    onYChanged: settings.y = window.y
    onWidthChanged: settings.width = window.width
    onHeightChanged: settings.height = window.height
}
