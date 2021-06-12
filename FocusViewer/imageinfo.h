#ifndef IMAGEINFO_H
#define IMAGEINFO_H

#include <QObject>
#include <QPoint>
#include <QSize>

#include <QProcess>


class ImageInfo : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QPoint   focusPoint MEMBER focusPoint NOTIFY infoChange);
    Q_PROPERTY(QSize    focusSize  MEMBER focusSize  NOTIFY infoChange);
public:
    explicit ImageInfo(QObject *parent = nullptr);
    ~ImageInfo();

    Q_INVOKABLE void loadNewImage(const QString & src);


private:
    QPoint focusPoint;
    QSize focusSize;

    QProcess process;

signals:
    void infoChange();

};

#endif // IMAGEINFO_H
