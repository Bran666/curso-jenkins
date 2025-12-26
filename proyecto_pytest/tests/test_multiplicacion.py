import pytest

def multiplicacion(a, b):
    """Function que multiplica dos numeros"""
    return a * b

def multiplicacion_test_ok():
    assert multiplicacion(1, 2) == 2
    assert multiplicacion(-1, 1) == -1
    assert multiplicacion(0, 100) == 0