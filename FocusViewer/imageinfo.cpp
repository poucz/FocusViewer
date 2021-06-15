#include "imageinfo.h"


#include "qdebug.h"

#include <QRegularExpression>
#include <QUrl>

ImageInfo::ImageInfo(QObject *parent) : QObject(parent)
{


}

ImageInfo::~ImageInfo()
{
}



void ImageInfo::loadNewImage(const QString &src){
    QString file;
    const QUrl url(src);
    if (url.isLocalFile()) {
        file=url.toLocalFile();
    } else {
        return;
    }


    //process.start("/usr/bin/exiftool",QStringList()<<"-*AF*Point*Selected*"<<file);
    process.start("/usr/bin/exiftool",QStringList()<<"-*AF*"<<file);
    process.waitForFinished();
    QStringList itms=QString(process.readAll()).split("\n");
    if(itms.count()<0){
        return;
    }


    for(int i=0;i<itms.count();i++){
        if(itms.at(i).contains("AF Point Selected")){
            parserAFPointSelected(itms.at(i));
        }

        if(itms.at(i).contains("AF Areas")){
            parserAFAreas(itms.at(i));
        }
    }



    qInfo()<<"Focus "<<focusPoint<<" "<<focusSize;
    emit infoChange();
}

void ImageInfo::parserAFAreas(const QString &data){
    QRegularExpression rx("(\\d+)");

    QList<int> list;
    QRegularExpressionMatchIterator i = rx.globalMatch(data);//rx.match(txt);
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
}


void ImageInfo::parserAFPointSelected(const QString &data){
    QRegularExpression rx("(\\d+)");

    QList<int> list;
    QRegularExpressionMatchIterator i = rx.globalMatch(data);//rx.match(txt);
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

    focusPointPercent.setX(list.at(0));
    focusPointPercent.setY(list.at(1));
    focusSize.setWidth(list.at(2));
    focusSize.setHeight(list.at(3));
}
