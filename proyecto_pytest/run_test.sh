#!/bin/sh
set -e

echo "Preparando entorno"

if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

echo "Instalando pip en el venv"
venv/bin/python -m ensurepip --upgrade

echo "Instalando dependencias"
venv/bin/python -m pip install --upgrade pip
venv/bin/python -m pip install -r requirements.txt

mkdir -p reports

echo "Ejecutando pruebas"
venv/bin/python -m pytest test/ \
  --junitxml=reports/test-results.xml \
  --html=reports/test-results.html \
  --self-contained-html

echo "Pruebas finalizadas correctamente"
