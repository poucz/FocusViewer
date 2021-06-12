#include "imageinfo.h"


#include "qdebug.h"

#include <QRegularExpression>

ImageInfo::ImageInfo(QObject *parent) : QObject(parent)
{


}

ImageInfo::~ImageInfo()
{
}



void ImageInfo::loadNewImage(const QString &src){
    process.start("/usr/bin/exiftool",QStringList()<<"-*AF*Point*Selected*"<<src);
    process.waitForFinished();
    QStringList itms=QString(process.readAll()).split("\n");
    if(itms.count()<0){
        return;
    }

    QString txt=itms.at(0);

    QRegularExpression rx("(\\d+)");

    QList<int> list;
    QRegularExpressionMatchIterator i = rx.globalMatch(txt);//rx.match(txt);
    while (i.hasNext()) {
        QRegularExpressionMatch match = i.next();
        if (match.hasMatch()) {
             list << match.captured(0).toInt();
        }
    }

    if(list.count()!=4){
        qWarning()<<"Nepodarilo se rozparsovat..";
        return;
    }

    focusPoint.setX(list.at(0));
    focusPoint.setY(list.at(1));
    focusSize.setWidth(list.at(2));
    focusSize.setHeight(list.at(3));
    qInfo()<<"Focus "<<focusPoint<<" "<<focusSize;
    emit infoChange();
}
