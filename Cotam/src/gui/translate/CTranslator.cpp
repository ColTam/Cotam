#include "CTranslator.h"

CTranslator::CTranslator(QObject *parent) : QObject(parent) {
    QTranslator *english = new QTranslator(this);
    english->load("");

    QTranslator *chinese = new QTranslator(this);
    chinese->load(":/i18n/Cotam_zh_CN");

    m_translator["en"] = english;
    m_translator["cn"] = chinese;
}

void CTranslator::reTranslate(const QString &lan) {
    if (m_translator.contains(lan)) {
        if (!m_lan.isEmpty()) {
            QCoreApplication::removeTranslator(m_translator[m_lan]);
        }

        m_lan = lan;
        qWarning() << m_lan;
        QCoreApplication::installTranslator(m_translator[m_lan]);
        emit retranslateRequest();
    }
}
