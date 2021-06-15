#ifndef IMAGEINFO_H
#define IMAGEINFO_H

#include <QObject>
#include <QPoint>
#include <QSize>

#include <QProcess>
#include <qqml.h>


class ImageInfo : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QPoint   focusPointPercent   MEMBER focusPointPercent NOTIFY infoChange);
    Q_PROPERTY(QSize    focusSize           MEMBER focusSize         NOTIFY infoChange);

    QML_ELEMENT

public:
    explicit ImageInfo(QObject *parent = nullptr);
    ~ImageInfo();

    Q_INVOKABLE void loadNewImage(const QString & src);


private:
    QPoint focusPoint;
    QPoint focusPointPercent;
    QSize focusSize;

    QProcess process;


    void parserAFAreas(const QString & data);
    void parserAFPointSelected(const QString & data);


signals:
    void infoChange();

};

#endif // IMAGEINFO_H
