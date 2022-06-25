import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.0
import "MaterialDesign.js" as MD


ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("191_331_Revyakin")

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

    //Поиск
    function finder() {
        listmodel1.clear()
            for(var i = 0; i < listmodel2.count; ++i) {
                if (listmodel2.get(i).site.includes(edtSearch.text)) {
                    listmodel1.append(listmodel2.get(i))
                }
            }
        }

//Проверка пароля и расшифровка второго слоя БД
    function crypt_controller(password) {
            let is_correct_passwd = cryptoController.check_password(password)
            if(is_correct_passwd) {
                pin_code=password
                stackView.push(pageMain)
            } else {
                stackView.push(pageError)
            }
    }


    FontLoader {
        id: iconFont
        source: "../fonts/MaterialIcons-Regular.ttf"
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
                    passwordCharacter: "✱"
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

                                 Layout.fillHeight: true
                                 Layout.fillWidth: true

                                 Layout.row: 1
                                 Layout.column: 1
                            }

                            Button {

                                 Layout.fillHeight: true
                                 Layout.fillWidth: true

                                 Layout.row: 1
                                 Layout.column: 2
                            }

                           Button {

                                 Layout.fillHeight: true
                                 Layout.fillWidth: true

                                 Layout.row: 1
                                 Layout.column: 3
                            }

                            Button {

                                 Layout.fillHeight: true
                                 Layout.fillWidth: true

                                 Layout.row: 2
                                 Layout.column: 1
                            }

                            Button {

                                 Layout.fillHeight: true
                                 Layout.fillWidth: true

                                 Layout.row: 2
                                 Layout.column: 2
                            }
                            Button {

                                 Layout.fillHeight: true
                                 Layout.fillWidth: true

                                 Layout.row: 2
                                 Layout.column: 3
                            }
                            Button {

                                 Layout.fillHeight: true
                                 Layout.fillWidth: true

                                 Layout.row: 3
                                 Layout.column: 1
                            }
                            Button {

                                 Layout.fillHeight: true
                                 Layout.fillWidth: true

                                 Layout.row: 3
                                 Layout.column: 2
                            }
                            Button {

                                 Layout.fillHeight: true
                                 Layout.fillWidth: true

                                 Layout.row: 3
                                 Layout.column: 3
                            }
            }

        }

    }
}
