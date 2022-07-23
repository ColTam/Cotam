#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QLocale>
#include <QTranslator>
#include <QQmlContext>

#include "src/gui/translate/CTranslator.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("Cotam");
    app.setOrganizationDomain("Cotam.cn");
    app.setApplicationName("Cotam");

//    QTranslator translator;
//    const QStringList uiLanguages = QLocale::system().uiLanguages();
//    for (const QString &locale : uiLanguages) {
//        const QString baseName = "Cotam_" + QLocale(locale).name();
//        if (translator.load(":/i18n/" + baseName)) {
//            app.installTranslator(&translator);
//            break;
//        }
//    }

    CTranslator m_translator;
    QQmlApplicationEngine engine;

    QObject::connect(&m_translator, &CTranslator::retranslateRequest, &engine, &QQmlApplicationEngine::retranslate);
    engine.rootContext()->setContextProperty("m_translator", &m_translator);

    const QUrl url("qrc:/Cotam/src/gui/main.qml");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
