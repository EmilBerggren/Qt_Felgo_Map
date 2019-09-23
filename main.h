#ifndef MAIN_H
#define MAIN_H
#include <QDebug>
#include "main.cpp"
#include <QString>

class main : public QObject
{
    Q_OBJECT

public:
    main(QObject *parent = 0)
        : QObject(parent)
    {
        QGeoPositionInfoSource *source = QGeoPositionInfoSource::createDefaultSource(this);
        if (source) {
            connect(source, SIGNAL(positionUpdated(QGeoPositionInfo)),
                    this, SLOT(positionUpdated(QGeoPositionInfo)));
            source->setUpdateInterval(5000);
            source->startUpdates();
        }
    }

public:
    QString GPS_Cords = "69";
    QGeoCoordinate GPS_coords;

signals:
    void positionUpdate(QGeoPositionInfo &info);

public slots:
    void positionUpdated(const QGeoPositionInfo &info)
    {

        qDebug() << "Position updated:" << info;
    }
};

#endif // MAIN_H
