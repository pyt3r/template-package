import unittest
from template.module import covered


class Test(unittest.TestCase):

    def test_module(self):
        assert covered() is not None


if __name__ == '__main__':
    unittest.main()
