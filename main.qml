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
                   id: grid
                   anchors.fill: parent

                   rows: 3
                   columns: 3

                   Button {
                        //color: "red"
                       id:a1
                        Layout.fillHeight: true
                        Layout.fillWidth: true
//                        Layout.columnSpan: 1
//                       Layout.rowSpan: 1
                        Layout.row: 1
                        Layout.column: 0


                   }
                     Button {
                        //color: "red"
                          id:a2
                        Layout.fillHeight: true
                        Layout.fillWidth: true
//                        Layout.columnSpan: 2
//                        Layout.rowSpan: 1
                        Layout.row: 1
                        Layout.column: 1
                   }
                     Button {
                        //color: "red"
                          id:a3
                        Layout.fillHeight: true
                        Layout.fillWidth: true
//                        Layout.columnSpan: 2
//                        Layout.rowSpan: 1
                        Layout.row: 1
                        Layout.column: 2
                   }
                   Button {
                        //color: "red"
                        id:a4
                        Layout.fillHeight: true
                        Layout.fillWidth: true
//                        Layout.columnSpan: 2
//                        Layout.rowSpan: 1
                        Layout.row: 2
                        Layout.column: 0
                   }
                     Button {
                        //color: "red"
                          id:a5
                        Layout.fillHeight: true
                        Layout.fillWidth: true
//                        Layout.columnSpan: 2
//                        Layout.rowSpan: 1
                        Layout.row: 2
                        Layout.column: 1
                   }
                     Button {
                       // color: "red"
                          id:a6
                        Layout.fillHeight: true
                        Layout.fillWidth: true
//                        Layout.columnSpan: 2
//                        Layout.rowSpan: 1
                        Layout.row: 2
                        Layout.column: 2
                   }
                     Button {
                       // color: "red"
                          id:a7
                        Layout.fillHeight: true
                        Layout.fillWidth: true
//                        Layout.columnSpan: 2
//                        Layout.rowSpan: 1
                        Layout.row: 3
                        Layout.column: 0
                   }
                     Button {
                        //color: "red"
                          id:a8
                        Layout.fillHeight: true
                        Layout.fillWidth: true
//                        Layout.columnSpan: 2
//                        Layout.rowSpan: 1
                        Layout.row: 3
                        Layout.column: 1
                   }
                     Button {
                       // color: "red"
                          id:a9
                        Layout.fillHeight: true
                        Layout.fillWidth: true
//                        Layout.columnSpan: 2
//                        Layout.rowSpan: 1
                        Layout.row: 3
                        Layout.column: 2
                   }


               }


//            GridLayout {
//                anchors.fill: parent

//                RowLayout {
//                    TextField {
//                        id: edtChange
//                        Layout.column: 0
//    //                    Layout.row: 0
//                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
//                        rightPadding: height
//                        Layout.preferredHeight: 50
//                        Layout.fillWidth: true
//                        background: Item {

//                        }

//                    }


//                }

//                ListView {
//                    id: listView
//                    Layout.preferredWidth: parent.width
//                    Layout.fillHeight: true
//                    Layout.row: 2
//                    height: 200
//                    spacing: 2
//                    clip: true
//                    delegate: Rectangle {
//                        width: listView.width
//                        height: 50
//                        radius: 3
//                        gradient: Gradient {
//                            GradientStop { position: 0.0; color: "white" }
//                            GradientStop { position: 1.0; color: "lightgray" }
//                        }
//                        border.color: "lightgray"
//                        border.width: 1
//                        RowLayout {


//                            anchors.fill: parent
//                            Label {
//                                text: site
//                                Layout.minimumWidth: 150
//                                Layout.leftMargin: 40
//                            }
//                            TextField {
//                                                            id: edtLogin
//                                                            Layout.minimumWidth: 0
//                                                            Layout.maximumWidth: 59
//                                                            Layout.leftMargin: 80
//                                                            Layout.column: 0
//                                                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
//                                                            echoMode: TextField.Password
//                                                            passwordCharacter: "●"
//                                                            text: login
//                                                            readOnly: true
//                                                            background: Item {

//                                                            }
//                                                            MouseArea {
//                                                                anchors.fill: parent
//                                                                onClicked: {
//                                                                    getLogin(edtLogin.text, pin_code)
//                                                                }
//                                                            }
//                                                        }
//                            TextField {
//                                                            id: edtPassword
//                                                            Layout.minimumWidth: 0
//                                                            Layout.maximumWidth: 59
//                                                            Layout.leftMargin: 80
//                                                            Layout.column: 0
//                                                            width: 6
//                                                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
//                                                            echoMode: TextField.Password
//                                                            passwordCharacter: "●"
//                                                            text: password
//                                                            readOnly: true
//                                                            background: Item {

//                                                            }
//                                                            MouseArea {
//                                                                anchors.fill: parent
//                                                                onClicked: {
//                                                                    // Копирует в буфер обмена расшифрованное значение пароля
//                                                                    get_password(edtPassword.text, pin_code)
//                                                                }
//                                                            }
//                                                        }
//                            Item {
//                                Layout.fillWidth: true
//                            }
//                        }
//                    }
//                    model:ListModel {
//                        id: listmodel1
//                        // Items таблицы бд
//                    }
//                }
//            }

        }
    }
}
