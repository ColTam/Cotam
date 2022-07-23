import QtQuick 2.0
import QtQuick.Shapes 1.15

Shape {
    layer.enabled: true
    layer.samples: 8

    property var container: parent
    property real leftTopRadius: 0
    property real rightTopRadius: 0
    property real rightBottomRadius: 0
    property real leftBottomRadius: 0
    property color fillColor: "#E8E8E8"
    property color strokeColor: "#E8E8E8"
    ShapePath {
        fillColor: container.fillColor
        strokeColor: container.strokeColor
        fillRule: ShapePath.WindingFill
        startX: container.rightTopRadius
        startY: 0
        PathLine {
            x: container.width - container.rightTopRadius
            y: 0
        }
        PathArc {
            x: container.width
            y: container.rightTopRadius
            radiusX: container.rightTopRadius
            radiusY: container.rightTopRadius
        }
        PathLine {
            x: container.width
            y: container.height - container.rightBottomRadius
        }
        PathArc {
            x: container.width - container.rightBottomRadius
            y: container.height
            radiusX: container.rightBottomRadius
            radiusY: container.rightBottomRadius
        }
        PathLine {
            x: container.leftBottomRadius
            y: container.height
        }
        PathArc {
            x: 0
            y: container.height - container.leftBottomRadius
            radiusX: container.leftBottomRadius
            radiusY: container.leftBottomRadius
        }
        PathLine {
            x: 0
            y: container.leftTopRadius
        }
        PathArc {
            x: container.leftTopRadius
            y: 0
            radiusX: container.leftTopRadius
            radiusY: container.leftTopRadius
        }
    }
}
