#!/bin/bash
# Skrypt tworzy plik z danymi na temat uzycia cpu (uzyte narzedzie sar)
# Skrypt uruchamia sie w tle


sar 5 100 >> statistics.txt 2>/dev/null &
