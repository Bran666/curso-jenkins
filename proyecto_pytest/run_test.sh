#!/bin/bash

echo "Activando el entrono virtual"
source ven/bin/activate

echo "Instalando dependencias"
pip install -r requirements.txt

echo "ejecutando pruebas con pytest"
pytest tests/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "pruebas finalizadas resultados en reports"

