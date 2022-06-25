#include "cryptocontroller.h"
#include <QString>
#include <openssl/evp.h>
#include <QFile>
#include <QIODevice>
#include <QObject>
#include <openssl/conf.h>
#include <QQmlContext>
#include <QDebug>
#include <QClipboard>
#include <QGuiApplication>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <QJsonArray>
#include <QByteArray>
#include <QProcess>
#include <QClipboard>
#include <atlstr.h>
#include <Windows.h>
#include <intrin.h>
#include <iostream>
#include <string.h>

using namespace std;

cryptoController::cryptoController(QObject *parent) : QObject(parent)
{

}
//вход: ПИН
bool cryptoController::check_password(QString password) {
    unsigned char plaintext[256] = {0};
    int len = 0, plaintext_len = password.length();

    memcpy(plaintext, password.toStdString().c_str(), password.size());

    QString password_qstring = (char *)plaintext;

    char buffer[256] = {0};
    QFile source_file("C:\\191_331_Malysheva\\191_331_Malysheva\\password_crypt.txt");
    bool is_opened = source_file.open(QIODevice::ReadOnly);
    //source_file.write(password_cipher_qbyte.toBase64());
    source_file.read(buffer, 256);


    source_file.close();
    //возвращается значение считанного и зашифрованного ПИНа с клавиатуры с уже хранящимся зашифрованным ПИНом в .txt файле
    return QString(buffer) == password_qstring;
}
