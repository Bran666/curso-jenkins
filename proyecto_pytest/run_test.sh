#!/bin/sh

set -e

echo "Preparando entorno"

if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

echo "Instalando dependencias"
venv/bin/pip install --upgrade pip
venv/bin/pip install -r requirements.txt

mkdir -p reports

echo "Ejecutando pruebas"
venv/bin/python -m pytest test/ \
  --junitxml=reports/test-results.xml \
  --html=reports/test-results.html \
  --self-contained-html

echo "Pruebas finalizadas correctamente"
