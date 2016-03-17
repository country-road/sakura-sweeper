#!/usr/bin/env python
# encoding: utf-8

import sys
from PySide.QtCore import QUrl
from PySide.QtGui import QApplication
from PySide.QtDeclarative import QDeclarativeView

if __name__ == '__main__':
    app = QApplication(sys.argv)
    view = QDeclarativeView()
    url = QUrl('minehunt.qml')
    view.setSource(url)
    context = view.rootContext()
    context.setContextProperty("Qt", app)
    #  view.setResizeMode(QDeclarativeView.SizeRootObjectToView)
    view.show()
    sys.exit(app.exec_())
