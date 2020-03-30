import unittest


class Test(unittest.TestCase):

    def test_module(self):
        from template.module import covered
        return covered()


if __name__ == '__main__':
    unittest.main()
