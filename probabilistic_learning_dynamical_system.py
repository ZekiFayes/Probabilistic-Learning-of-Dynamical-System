import numpy as np
import matplotlib.pyplot as plt
import scipy.stats as st
from pandas import DataFrame, Series
import pandas as pd
from PMH import PMH


# data
num = 1000
t = np.linspace(0, 5, num)
y = 0.3*np.sin(2*np.pi*2*t) + np.exp(-20*t) + np.random.rand(num)/100
theta1 = np.random.randn(4)

pmh = PMH()
theta_hat = pmh.pmh(y)
print(theta_hat)

