/****************************************************************************
**
** Copyright (C) 2020 Luxoft Sweden AB
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Neptune 3 UI.
**
** $QT_BEGIN_LICENSE:GPL-QTAS$
** Commercial License Usage
** Licensees holding valid commercial Qt Automotive Suite licenses may use
** this file in accordance with the commercial license agreement provided
** with the Software or, alternatively, in accordance with the terms
** contained in a written agreement between you and The Qt Company.  For
** licensing terms and conditions see https://www.qt.io/terms-conditions.
** For further information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
** SPDX-License-Identifier: GPL-3.0
**
****************************************************************************/

import QtQuick 2.12
import QtQuick.Layouts 1.3

import shared.animations 1.0
import shared.controls 1.0
import shared.utils 1.0
import shared.Style 1.0
import shared.Sizes 1.0

Item {
    id: root

    property bool bottomWidgetHide: false
    property alias sourceUrl: videoplayer.sourceUrl

    signal fileOpenRequested(url fileURL)
    signal playRequested()
    signal pauseRequested()
    signal stopRequested()
    signal muteRequested(bool muted)
    signal seekRequested(int offset)

    // Top content background
    Image {
        id: topContentBg
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: Sizes.dp(436)
        source: Style.image("app-fullscreen-top-bg")
        visible: root.state === "Maximized"
    }

    ColumnLayout {
        anchors.fill: parent
        VideoPlayerPanel {
            id: videoplayer
            anchors.fill: parent
            onPlayRequested: root.playRequested()
            onPauseRequested: root.pauseRequested()
            onStopRequested: root.stopRequested()
            onSeekRequested: root.seekRequested(offset)
            onMuteRequested: root.muteRequested(muted)
        }
    }
}
