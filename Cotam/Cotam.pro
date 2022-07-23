QT += quick gui qml widgets

SOURCES += \
    main.cpp \
    src/gui/translate/CTranslator.cpp

HEADERS += \
    src/gui/translate/CTranslator.h

TRANSLATIONS += \
    src/i18n/Cotam_zh_CN.ts

resources.files += \
    src/gui/main.qml \
    src/gui/CMoveArea.qml \
    src/gui/CConfig.qml \
    src/gui/CButton.qml \
    src/gui/CHomePage.qml \
    src/gui/CShape.qml \
    src/gui/CHomeDrapRect.qml \
    src/gui/CHomeBorderResize.qml
resources.prefix = /$${TARGET}
RESOURCES += resources

CONFIG += lrelease
CONFIG += embed_translations

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES +=


