#!/bin/bash
set -e

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
pip install --upgrade pip
pip install -r requirements.txt

echo "Ejecutando pruebas"
pytest test \
  --junitxml=reports/test-results.xml \
  --html=reports/test-results.html \
  --self-contained-html

echo "Pruebas finalizadas"
