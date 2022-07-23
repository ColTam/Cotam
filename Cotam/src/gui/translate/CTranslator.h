#ifndef CTRANSLATOR_H
#define CTRANSLATOR_H

#pragma once

#include <QObject>
#include <QTranslator>
#include <QMap>
#include <QCoreApplication>
#include <QDebug>
class CTranslator: public QObject{
    Q_OBJECT
public:
    CTranslator(QObject *parent = 0);
    Q_INVOKABLE void reTranslate(const QString &lan);
signals:
    void retranslateRequest();
private:
    QMap<QString, QTranslator *> m_translator;
    QString m_lan;
};

#endif // CTRANSLATOR_H
