#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

//#include "conf.h"
#include "classes/udpcomm.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QCoreApplication::setApplicationName("Aeternity");
    QCoreApplication::setApplicationVersion("0.1.0");
    QCoreApplication::setOrganizationName("Othy Software");

    qmlRegisterType<AetherConn>("Aethers", 1, 0, "AetherConn");
    UdpComm* udpComm = new UdpComm;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("udpComm", udpComm);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
