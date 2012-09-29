#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys, os
 
from PySide import QtCore
from PySide import QtGui
from PySide import QtDeclarative
from PySide import QtOpenGL

class Media():
    def __init__(self, path):
        self.filePath = path
        self.fileName = os.path.split(path)[1]
        self.isDirectory = os.path.isdir(path)

    def __str__(self):
        return "Path : " +self.filePath + " - Name : " + self.fileName + " - directory : " + str(self.isDirectory)


class MediaWrapper(QtCore.QObject):
    def __init__(self, media):
        QtCore.QObject.__init__(self)
        self._media = media
 
    def _name(self):
        return str(self._media.fileName)
      
    def _path(self):
        return self._media.filePath
        
    def _isDirectory(self):
        return self._media.isDirectory
 
    changed = QtCore.Signal()
 
    name = QtCore.Property(str, _name, notify=changed)
    isDirectory = QtCore.Property(bool, _isDirectory, notify=changed)
    path = QtCore.Property(str, _path, notify=changed)

class MediaListModel(QtCore.QAbstractListModel):
    COLUMNS = ('thing',)
 
    def __init__(self, things):
        QtCore.QAbstractListModel.__init__(self)
        self._things = things
        self.setRoleNames(dict(enumerate(MediaListModel.COLUMNS)))
    
    def setItems(self, data):
        self._things = data
    
    def rowCount(self, parent=QtCore.QModelIndex()):
        return len(self._things)
 
    def data(self, index, role):
        if index.isValid() and role == MediaListModel.COLUMNS.index('thing'):
            return self._things[index.row()]
        return None
        
    def removeRows(self,firstRow,rowCount,parent = QtCore.QModelIndex()):
        self.beginRemoveRows(parent, firstRow, firstRow+rowCount-1)
        while rowCount != 0:
            del self._things[firstRow]
            rowCount -= 1
        self.endRemoveRows()        

    def addItem(self, item):
        self.beginInsertRows(QtCore.QModelIndex(), len(self._things), len(self._things))
        self._things.append(item)
        self.endInsertRows()
        
    def replaceItems(self, items):
        self.removeRows(0,len(self._things))        
        self.beginInsertRows(QtCore.QModelIndex(), len(self._things), len(self._things))
        self._things = items
        self.endInsertRows()
