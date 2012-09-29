#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
from PySide import QtCore
from PySide.QtCore import *
from PySide.QtGui import *
from PySide.QtDeclarative import *
from PySide import QtOpenGL

from Media import *

class FileSystemMediaExplorer(QtCore.QObject):
    def __init__(self, path,rootContext, player):
        QObject.__init__(self)
        self.rootContext = rootContext
        self.player = player
        
        self.rootMedia = Media.Media("..")
        self.rootMedia.fileName = ".."
        self.rootMedia.isDirectory = True
        
        self.path = path
        self.currentPath = path
        self.medias = [Media.MediaWrapper(media) for media in self.listDirectory()]
        self.medias.insert(0, Media.MediaWrapper(self.rootMedia))
        self.mediaList = Media.MediaListModel(self.medias)
      
    @QtCore.Signal
    def changed(self): 
        self.rootContext().setContextProperty('mediaListModel', explorer.MediaList)

    def GetMediaList(self):
        return self.mediaList
        
    MediaList = QtCore.Property(str, GetMediaList, notify=changed)   


    def listDirectory(self):
        for file in os.listdir(self.currentPath):
            media = Media.Media(os.path.join(self.currentPath, file))
            yield media

    @QtCore.Slot(QtCore.QObject, QtCore.QObject)      
    def fileOrDirectorySelected(self, file, listModel):
        print(self.mediaList)
        print('User clicked on:', file.name)
        if(file.isDirectory):
            self.currentPath = os.path.join(self.currentPath, file.path)
            self.medias = [Media.MediaWrapper(media) for media in self.listDirectory()]
            self.medias.insert(0, Media.MediaWrapper(self.rootMedia))
            listModel.replaceItems(self.medias)
            self.changed.emit()
            
        extension = os.path.splitext(file.name)[1]
        print(extension)
        if(extension == ".mp3"):
            self.player.Play()    
            
        

    