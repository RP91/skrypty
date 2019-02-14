#!/bin/bash
# Skrypt tworzy plik z danymi na temat uzycia cpu (uzyte narzedzie sar)
sar 5 100 >> statistics.txt 2>/dev/null 
