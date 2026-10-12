import QtQuick 2.15
import org.kde.plasma.core 2.0
import org.kde.plasma.layout 2.0
import org.kde.plasma.utils 2.0

PlasmaCore.IconBlockList {
    id: root
    property int pawAnimationIndex: 0
    property int jumpState: 0
    property real lastJumpTime: 0
    property int animationFrame: 0
    property real lastFrameTime: 0

    // Walking animation - 8 frames
    // Frame order: sit, walk1, walk2, walk3, walk4, walk5, walk6, walk7, walk8
    // Using PPM files with mint pixel art (#88CCAA)

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            jumpState = 1
            lastJumpTime = Date.now()
        }
    }

    // Walking animation timer
    Timer {
        interval: 150
        running: root.jumpState === 0
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            if (root.animationFrame < 8) {
                root.animationFrame++
            } else {
                root.animationFrame = 1
            }
        }
    }

    // Jump timer
    Timer {
        interval: 200
        running: root.jumpState > 0
        repeat: false
        onTriggered: {
            root.jumpState = 0
            root.animationFrame = 0
        }
    }

    Rectangle {
        anchors.centerIn: parent
        width: 64
        height: 64
        color: "transparent"

        // Cat sprite using pixel art - PPM format for mint pixel look
        Image {
            id: catSprite
            anchors.centerIn: parent
            sourcePrefix: "/images"
            source: "cat-sitting.ppm"
            width: 64
            height: 64
            smooth: false
            CacheToTexture: true
            
            // Animate walking frames when not jumping
            SequentialAnimation on animationFrame {
                running: root.animationFrame > 0 && root.jumpState === 0
                loops: 1
                ScriptAction onRunningChanged: {
                    if (root.animationFrame === 1) {
                        catSprite.source = "cat-walk1.ppm"
                    } else if (root.animationFrame === 2) {
                        catSprite.source = "cat-walk2.ppm"
                    } else if (root.animationFrame === 3) {
                        catSprite.source = "cat-walk3.ppm"
                    } else if (root.animationFrame === 4) {
                        catSprite.source = "cat-walk4.ppm"
                    } else if (root.animationFrame === 5) {
                        catSprite.source = "cat-walk5.ppm"
                    } else if (root.animationFrame === 6) {
                        catSprite.source = "cat-walk6.ppm"
                    } else if (root.animationFrame === 7) {
                        catSprite.source = "cat-walk7.ppm"
                    } else if (root.animationFrame === 8) {
                        catSprite.source = "cat-walk8.ppm"
                    } else if (root.animationFrame === 0) {
                        catSprite.source = "cat-sitting.ppm"
                    }
                }
            }
            
            // Jump animation
            Behavior on jumpState {
                NumberAnimation {
                    enabled: jumpState > 0
                    duration: 300
                    fromY: 0
                    toY: -30
                    easing.type: Easing.OutCubic
                }
                NumberAnimation {
                    enabled: jumpState === 0
                    duration: 200
                    fromY: -30
                    toY: 0
                    easing.type: Easing.InCubic
                }
            }
        }
    }
}