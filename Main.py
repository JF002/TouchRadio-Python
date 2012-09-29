#!/usr/bin/env python
# -*- coding: utf-8 -*-

from PySide import QtCore
from PySide.QtCore import *
from PySide.QtGui import *
from PySide.QtDeclarative import *
from PySide import QtOpenGL
import threading
import sys

import Players
from Media.Media import *
from Media.FileSystemMediaExplorer import *


class MainWindow(QDeclarativeView):
  def __init__(self, parent=None):
    super(MainWindow, self).__init__(parent)
    self.setWindowTitle("Main Window")  
    
    self.player = Players.Player()
    explorer = FileSystemMediaExplorer("d:\\", self.rootContext, self.player)


    
    self.rootContext().setContextProperty('player', self.player)
    self.rootContext().setContextProperty('mediaListModel', explorer.MediaList)
    self.rootContext().setContextProperty('mediaExplorer', explorer)
        
    # Renders 'view.qml'
    self.setSource(QUrl.fromLocalFile('QML/main.qml'))
    # QML resizes to main window
    self.setResizeMode(QDeclarativeView.SizeRootObjectToView)
 
if __name__ == '__main__':
  # Create the Qt Application
  app = QApplication(sys.argv)
  app.setApplicationName("kitchenRadio")
  # Create and show the main window
  
  
  window = MainWindow()
  
  #glw = QtOpenGL.QGLWidget()
  #window.setViewport(glw)
  window.show()
  
  # Run the main Qt loop
  sys.exit(app.exec_())
