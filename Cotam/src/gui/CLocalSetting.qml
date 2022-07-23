import QtQuick 2.9
import QtQuick.Window 2.3
import Qt.labs.settings 1.1

Settings {
    id: localSettings

    category: "window"
    property alias x: window.x
    property alias y: window.y
}
