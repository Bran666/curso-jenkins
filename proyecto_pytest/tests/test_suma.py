def suma(a, b):
    """Función que suma dos números"""
    return a + b


def test_suma_ok():
    assert suma(1, 2) == 3
    assert suma(-1, 1) == 0
    assert suma(0, 0) == 0


def test_suma_fail():
    assert suma(1, 2) == 4
