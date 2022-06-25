#ifndef CRYPTOCONTROLLER_H
#define CRYPTOCONTROLLER_H

#include <QObject>
#include <QString>

class cryptoController : public QObject
{
    Q_OBJECT
public:
    explicit cryptoController(QObject *parent = nullptr);
    ~cryptoController() {};

public slots:
    bool check_password(QString password);



};

#endif // CRYPTOCONTROLLER_H
