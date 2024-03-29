TEMPLATE = app
TARGET = weatherinfo

QT += core network positioning qml quick
requires(qtConfig(bearermanagement))

SOURCES += main.cpp \
    appmodel.cpp

OTHER_FILES += qml/weatherinfo.qml \
    components/WeatherIcon.qml \
    components/ForecastIcon.qml \
    components/BigForecastIcon.qml \
    icons/*


RESOURCES += weatherinfo.qrc

HEADERS += appmodel.h

target.path = $$[QT_INSTALL_EXAMPLES]/positioning/weatherinfo
INSTALLS += target
