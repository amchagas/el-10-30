# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import numpy as np
import matplotlib.pyplot as pyplot
from scipy import signal
#describe stimulus

#scan frequency
scanFreq = 1e3

#time duration in seconds of each scan line
scanTime = 2.

#number of data points per scan line
scanPoints = scanTime*scanFreq

#number of pixels
pixels = 64.

#pixels necessary for turning points
initTurnPix = 10.
endTurnPix = 10.

#pixel sum
pixSum=initTurnPix+pixels+endTurnPix

#data points per pixel
pixData = scanPoints/pixSum

#create a triangular waveform
triang = signal.triang(M=(2*scanPoints-(initTurnPix+endTurnPix)),sym=False)

#create an array of constant numbers. Will be used for smoothing
conv = np.ones(1*(initTurnPix+endTurnPix+1))/10

#convolve the triangular waveform with the constant array,
#this will smooth the edges of the triangular waveform
conv = np.convolve(a=triang,v=conv,mode="full")


#reshape the smoothed waveform so that the peak is one.
conv = conv/(max(conv))


conv = np.append(conv,conv)
pyplot.plot(conv)