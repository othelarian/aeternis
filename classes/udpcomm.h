#ifndef UDPCOMM_H
#define UDPCOMM_H

#include <QObject>
#include <QtNetwork>

class UdpComm : public QObject
{
    Q_OBJECT
    //
    // TODO : start udp listening
    // TODO : start udp multicast
    // TODO : set the response list
    //
public:
    explicit UdpComm(QObject *parent = nullptr);
    Q_INVOKABLE void startRequest();

signals:

public slots:

private:
    QUdpSocket udpSocket;
    QHostAddress groupAddress;
};

#endif // UDPCOMM_H
