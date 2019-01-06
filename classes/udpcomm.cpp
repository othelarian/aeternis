//#include "classes/udpcomm.h"
#include "udpcomm.h"

#include <QDebug>

// ### AETHERCONN METHODS ###

AetherConn::AetherConn(QObject *parent) : QObject (parent)
{}

AetherConn::AetherConn(QString data, QObject *parent) : QObject (parent)
{
    m_datagram = data;
    m_type = data[2];
    m_ip = data.right(12);
    //
    // TODO : code below doesn't work
    m_code = m_ip.remove(2, 4);
    //
    //
    qInfo() << "type : " << m_type;
    qInfo() << "code : " << m_code;
    qInfo() << "iphx : " << m_ip;
    //
}

QString AetherConn::getCode()
{
    return m_code;
}

QString AetherConn::getDatagram()
{
    return m_datagram;
}

QString AetherConn::getType()
{
    return m_type;
}

// ### UDPCOMM METHODS ###

UdpComm::UdpComm(QObject *parent) : QObject(parent)
{
    connect(&m_udpSocket, SIGNAL(readyRead()), this, SLOT(processData()));
}

void UdpComm::toggleScan()
{
    if (!m_scanning) {
        //
        // EVO : do not clear the list, instead test every single aether, and remove the unbeating ones
        //
        /*
        QList<AetherConn*>::iterator i;
        for (i = m_aethersList.begin(); i != m_aethersList.end(); ++i) {
            //
            // test
            //
        }*/
        //
        //
        m_aethersList.clear();
        listChanged();
        m_udpSocket.bind(4210, QUdpSocket::ShareAddress);
    }
    else {
        m_udpSocket.close();
    }
    m_scanning = !m_scanning;
}

QQmlListProperty<AetherConn> UdpComm::getAethers()
{
    return QQmlListProperty<AetherConn>(this, m_aethersList);
}

void UdpComm::processData()
{
    QByteArray datagram;
    QHostAddress addr;
    while (m_udpSocket.hasPendingDatagrams()) {
        datagram.resize(int(m_udpSocket.pendingDatagramSize()));
        m_udpSocket.readDatagram(datagram.data(), datagram.size(), &addr);
        QString tmp = QString::fromLocal8Bit(datagram.constData());
        //
        qInfo() << addr.toString();
        //
        if (tmp[0] == 'A' && tmp[1] == 'E') {
            bool found = false;
            for (int i = 0;i<m_aethersList.length();++i) {
                if (m_aethersList.at(i)->getDatagram() == tmp) {
                    found = true;
                    break;
                }
            }
            if (!found) {
                m_aethersList.append(new AetherConn(tmp));
                listChanged();
            }
        }
    }
}
