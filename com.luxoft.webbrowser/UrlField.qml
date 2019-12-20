/****************************************************************************
**
** Copyright (C) 2019 Luxoft Sweden AB
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Neptune 3 IVI UI.
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
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.VirtualKeyboard 2.4

import shared.controls 1.0
import shared.utils 1.0
import shared.Style 1.0
import shared.Sizes 1.0

TextField {
    id: root
    font.family: Style.fontFamily
    font.pixelSize: Sizes.fontSizeM
    color: Style.contrastColor
    selectedTextColor: Style.contrastColor
    leftPadding: Sizes.dp(18)
    rightPadding: Sizes.dp(70)
    horizontalAlignment: TextInput.AlignLeft
    inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhUrlCharactersOnly
    EnterKeyAction.enabled: !!text
    EnterKeyAction.actionId: EnterKeyAction.Go

    property alias busy: searchBusyIndicator.running

    signal urlRequested(string url)

    onActiveFocusChanged: {
        if (activeFocus) selectAll()
    }

    onAccepted: {
        var pattern = /^((http|https|ftp):\/\/)/;
        var result = text;

        if (!pattern.test(result)) {
            result = "http://" + result;
        }

        root.urlRequested(result);
    }

    background: Rectangle {
        border.color: Style.buttonColor
        border.width: Sizes.dp(1)
        color: "transparent"
        radius: height/2
        BusyIndicator {
            id: searchBusyIndicator
            anchors.right: parent.right
            anchors.rightMargin: Sizes.dp(18)
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height
            width: height
            visible: running
        }
    }
}