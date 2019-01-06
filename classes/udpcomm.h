#ifndef UDPCOMM_H
#define UDPCOMM_H

#include <QObject>
#include <QtNetwork>
#include <QQmlListProperty>

class AetherConn : public QObject
{
    Q_OBJECT
public:
    explicit AetherConn(QObject *parent = nullptr);
    explicit AetherConn(QString data, QObject *parent = nullptr);
    Q_PROPERTY(QString code READ getCode)
    Q_PROPERTY(QString type READ getType)
    QString getCode();
    QString getDatagram();
    QString getType();
private:
    QString m_code;
    QString m_datagram;
    QString m_ip;
    QString m_type;
};

class UdpComm : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<AetherConn> aethers READ getAethers NOTIFY listChanged)
public:
    explicit UdpComm(QObject *parent = nullptr);
    Q_INVOKABLE void toggleScan();
    QQmlListProperty<AetherConn> getAethers();
signals:
    void listChanged();
public slots:
private slots:
    //void httpFinished(QNetworkReply* reply);
    void processData();
private:
    QUdpSocket m_udpSocket;
    QNetworkAccessManager m_qnam;
    bool m_scanning = false;
    //int m_nbaethers;
    QList<AetherConn *> m_aethersList;
};

#endif // UDPCOMM_H
