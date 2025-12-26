#!/bin/bash

echo "Activando el entorno virtual"

if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
elif [ -f "venv/Scripts/activate" ]; then
    source venv/Scripts/activate
else
    echo "No se pudo activar el VM"
    exit 1
fi

echo "Instalando dependencias"
pip install --upgrade pip --break-system-package
pip install -r requirements.txt --break-system-package

echo "Ejecutando pruebas"
venv/bin/python -m tests \
  --junitxml=reports/test-results.xml \
  --html=reports/test-results.html \
  --self-contained-html

echo "Pruebas finalizadas"
