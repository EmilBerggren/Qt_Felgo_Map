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

public slots:

signals:

};

#endif // MAIN_H
