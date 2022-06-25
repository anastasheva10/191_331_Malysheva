#include "cryptocontroller.h"
#include <QString>
#include <QFile>
#include <QIODevice>
#include <QObject>
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


//функция проверяет введенный в первое окно пин-код
//ПИН: 1568
//вход: ПИН
bool cryptoController::check_password(QString password)
{
    if (password == "1789")
    return true;
    else
    return false;
}




