#ifndef UDPCOMM_H
#define UDPCOMM_H

#include <QObject>

class UdpComm : public QObject
{
    Q_OBJECT
public:
    explicit UdpComm(QObject *parent = nullptr);

signals:

public slots:
};

#endif // UDPCOMM_H
