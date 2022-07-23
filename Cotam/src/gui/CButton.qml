import QtQuick 2.9
import QtQuick.Controls 2.5

Button {
    background: Rectangle {
        radius: config.radiusL

        color: config.controlColor
        border.color: config.controlBorderColor
        border.width: config.borderWidth
    }
}
