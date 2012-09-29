#!/usr/bin/env python
# -*- coding: utf-8 -*-

from PySide import QtCore
import platform
import threading

class Player(QtCore.QObject):
  def __init__(self):
    QtCore.QObject.__init__(self)
    self.isPaused = False
    if(platform.system() == "Windows"):
        self.__class__ = PlayerWindows
    else:
        self.__class__ = PlayerRaspberry

class PlayerWindows(QtCore.QObject):
  def __init__(self):
    QtCore.QObject.__init__(self)
    self.isPaused = False
    
  @QtCore.Slot()
  def Play(self):
    print("PlayerWindows::Play()")

  @QtCore.Slot()
  def Stop(self):
    print("PlayerWindows::Stop()")
    
  @QtCore.Slot()
  def Pause(self):
    print("PlayerWindows::Pause()")

  @QtCore.Slot(int)
  def Seek(self, value):
    print("PlayerWindows::Seek()")

  @QtCore.Slot(result=float)
  def GetCurrentPosition(self):
    print("PlayerWindows::GetCurrentPosition()")

  @QtCore.Slot(result=int)
  def GetDuration(self):
    print("PlayerWindows::GetDuration()")
    
class PlayerRaspberry(QtCore.QObject):
  def __init__(self):
    QtCore.QObject.__init__(self)
    self.isPaused = False
    
  @QtCore.Slot()
  def Play(self):
    print("before start thread")
    #threading.Thread(target = omxplayer.Play()).start()
    t = MyThread()
    t.start()
    print("after start thread")
    
  @QtCore.Slot()
  def Stop(self):
    omxplayer.Stop()
    
  @QtCore.Slot()
  def Pause(self):
    if (self.isPaused == True):    
      self.isPaused = False
    else :
      self.isPaused = True
    omxplayer.Pause(self.isPaused)
  
  @QtCore.Slot(int)
  def Seek(self, value):
    omxplayer.Seek(value) 
    print("after seek!")
  
  @QtCore.Slot(result=float)
  def GetCurrentPosition(self):
    return float(omxplayer.GetCurrentPosition())
    
  @QtCore.Slot(result=int)
  def GetDuration(self):
    return int(omxplayer.GetDuration())
          
class MyThread ( threading.Thread ):
  def run ( self ):
    omxplayer.Play()
    