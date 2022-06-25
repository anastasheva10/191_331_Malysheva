import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.0



ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Вариант № 1 Малышева А.Р. 191-331")

    property int recordId: -1
    property int isPassword: -1
    property string pin_code: ""


    Connections {
            target: cryptoController
            onSendMessageToQml: {
                dialog.open()
                dialogText.text = message
            }

    }


    ListModel {
        id: listmodel2
        // Items таблицы бд
    }

    function crypt_controller(password) {
            let is_correct_passwd = cryptoController.check_password(password)
            if(is_correct_passwd) {
                pin_code=password

                stackView.push(pageMain)
            } else {
                stackView.push(pageError)
            }
    }

    StackView {
        anchors.fill: parent
        id: stackView

        initialItem: Page {
            id: pageLogin

            GridLayout {
                anchors.fill: parent
                rowSpacing: 10
                rows: 4
                flow: GridLayout.TopToBottom

                Item { // Для заполнения пространства
                    Layout.row: 0
                    Layout.fillHeight: true
                }

                TextField {
                    id: password_code
                    echoMode: TextField.Password
                    passwordCharacter: "●"
                    Layout.row: 1
                    Layout.alignment: Qt.AlignHCenter || Qt.AlignVCenter
                }

                Button {
                    id: login_button
                        text: qsTr("Вход")
                        Layout.row: 2
                        Layout.alignment: Qt.AlignHCenter || Qt.AlignVCenter
                        onClicked:{
                            crypt_controller(password_code.text)
                            password_code.text = ""
                        }
                }

                Item { // Для заполнения пространства
                    Layout.row: 4
                    Layout.fillHeight: true
                }
            }
        }

        Page {
            id: pageError
            visible: false

            GridLayout {
                anchors.fill: parent
                rowSpacing: 10
                rows: 3
                flow: GridLayout.TopToBottom

                Item { // Для заполнения пространства
                    Layout.row: 0
                    Layout.fillHeight: true
                }
                Label {
                    id: error_code
                    text: "Код неверный!"
                    Layout.row: 1
                    Layout.alignment: Qt.AlignHCenter || Qt.AlignVCenter
                }

                Button {
                    id: back_to_login_page
                    text: qsTr("Назад")
                    Layout.row: 2
                    Layout.alignment: Qt.AlignHCenter || Qt.AlignVCenter
                    onClicked:{
                        if( stackView.depth > 1 ) {
                            stackView.pop()
                        }
                    }
                }
                Item { // Для заполнения пространства
                    Layout.row: 3
                    Layout.fillHeight: true
                }
            }
        }

        Page {
            id: pageMain
            visible: false

            GridLayout {
                anchors.fill: parent

                RowLayout {
                    TextField {
                        id: edtChange
                        Layout.column: 0
    //                    Layout.row: 0
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        rightPadding: height
                        Layout.preferredHeight: 50
                        Layout.fillWidth: true
                        background: Item {

                        }
                        RowLayout {
                            Button {
                                id: deleting
                                font.family: iconFont.name
                                font.pixelSize: parent.height - 2
                                Layout.preferredHeight: 45
                                Layout.preferredWidth: 45
                                text: MD.icons.delete_forever
                                onClicked: {
                                    // Удаление
                                }
                            }
                            Button {
                                id: editing
                                font.family: iconFont.name
                                font.pixelSize: parent.height - 2
                                Layout.preferredHeight: 45
                                Layout.preferredWidth: 45
                                text: MD.icons.edit
                                onClicked: {
                                        // Изменение
                                }
                            }
//                            Button {
//                                id: copying
//                                font.family: iconFont.name
//                                font.pixelSize: parent.height - 2
//                                Layout.preferredHeight: 45
//                                Layout.preferredWidth: 45
//                                text: MD.icons.content_copy
//                                onClicked: {
//                                        // Скопировать
//                                }
//                            }
                            Button {
                                id: adding
                                font.family: iconFont.name
                                font.pixelSize: parent.height - 2
                                Layout.preferredHeight: 45
                                Layout.preferredWidth: 45
                                text: MD.icons.add
                                onClicked: {
                                    // Добавление элемента
                                }
                            }
                        }
                    }

                    TextField {
                        id: edtSearch
                        Layout.column: 1
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        rightPadding: height
                        Layout.fillWidth: true
                        placeholderText: "Поиск по сайтам..."

                        Button {
                            anchors.right: parent.right
                            font.family: iconFont.name
                            font.pixelSize: parent.height
                            width: parent.height
                            height: parent.height
                            text: MD.icons.search
                            onClicked: {
                                finder()
                            }
                        }
                    }
                }

                ListView {
                    id: listView
                    Layout.preferredWidth: parent.width
                    Layout.fillHeight: true
                    Layout.row: 2
                    height: 200
                    spacing: 2
                    clip: true
                    delegate: Rectangle {
                        width: listView.width
                        height: 50
                        radius: 3
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "white" }
                            GradientStop { position: 1.0; color: "lightgray" }
                        }
                        border.color: "lightgray"
                        border.width: 1
                        RowLayout {
                            anchors.fill: parent
                            Label {
                                text: site
                                Layout.minimumWidth: 150
                                Layout.leftMargin: 40
                            }
                            TextField {
                                                            id: edtLogin
                                                            Layout.minimumWidth: 0
                                                            Layout.maximumWidth: 59
                                                            Layout.leftMargin: 80
                                                            Layout.column: 0
                                                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                                            echoMode: TextField.Password
                                                            passwordCharacter: "●"
                                                            text: login
                                                            readOnly: true
                                                            background: Item {

                                                            }
                                                            MouseArea {
                                                                anchors.fill: parent
                                                                onClicked: {
                                                                    getLogin(edtLogin.text, pin_code)
                                                                }
                                                            }
                                                        }
                            TextField {
                                                            id: edtPassword
                                                            Layout.minimumWidth: 0
                                                            Layout.maximumWidth: 59
                                                            Layout.leftMargin: 80
                                                            Layout.column: 0
                                                            width: 6
                                                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                                            echoMode: TextField.Password
                                                            passwordCharacter: "●"
                                                            text: password
                                                            readOnly: true
                                                            background: Item {

                                                            }
                                                            MouseArea {
                                                                anchors.fill: parent
                                                                onClicked: {
                                                                    // Копирует в буфер обмена расшифрованное значение пароля
                                                                    get_password(edtPassword.text, pin_code)
                                                                }
                                                            }
                                                        }
                            Item {
                                Layout.fillWidth: true
                            }
                        }
                    }
                    model:ListModel {
                        id: listmodel1
                        // Items таблицы бд
                    }
                }
            }

        }
    }
}
