# Code Quality (repository under development)

This is the README.md for the Code Quality repository
using the python Dict library as a primary example of
how to apply the principles in practice without undue
burdening of the development process.

In general, if you simply want a style guide for code,
try to follow the style illustrated in Dict.py.

If you want to have a clear understanding of what Dict.py does,
review what is tested in test_Dict.py.

If you want to do TDD (Test Driven Design)
review test_Dict.py and try to follow the example.
For richer unit testing, use "unittest2".

To run the quality control, unit tests, produce docs etc... run:
 $ make clean
 $ make
Makefile output shows the progress and quality metrics.

## Principles applied at a medium high standard:
* code passes pep8, pylint, and pyflakes at 100% compliance (with disables).
* code is designed to be very readable.
* code uses visual cue comments to aid navigating the source code.
* comments carefully document non-obvious concepts.
* comments carefully document variations from accepted practice.
* code uses docopt to make command-line processing simple and readable.
* code uses docstrings everywhere for both compliance and understanding.
* test follows the Agile principle of write-your-own test-suite.
* test fairly rigorously follows TDD.
* test output uses visually distinctive [PASS]/[FAIL] line leader.
* Makefile fully exercises the QC tests
* coverage shows 100% code coverage on Dict.py and 95% on test_Dict.py
* pydoc generates browseable documentation on Dict.py and test_Dict.py

The reason for not reaching 100% on the test_Dict.py file is that
* a bug in coverage forces a global exception handler
* a test for non-python-2.7 never fails
* an exception that isn't necessary for this suite
* a branch that isn't necessary for this suite

## Abstract: Code Concept

The Dict class implements a class which enables use of dictionary keys
without the less readable square-brackets quotes syntax.

With easy (Dict) and hard (dict) objects, here is a tiny sample:

    easy.color = "by"
    hard["color"] = "by"

See example_Dict.py to compare syntax of Dict class with standard practice.

## static checkers

### pep8

### pylint

### pyflakes

## Files:
### Source (source files for module resulting from "make clean")
* README.md This file
* Makefile Traditional makefile (gnumake rules)
* Dict.py The class file
* test_Dict.py The unit test framework and use of the framework (all in 1 file)
* example_Dict.py An example comparing the syntax more simply than test_Dict.py
* __init__.py A file used to identify the directory as a module

### Target (target files for module resulting from "make"))
* .coverage                 File containing raw metrics for "coverage run $<"
* Dict.pep8                 Empty file when no errors
* Dict.pyflakes             Empty file when no errors
* Dict.pylint               Metrics from pylint
* Dict.pylint.rc            Automatically produced configuration file
* Dict.html                 Generated by pydoc
* example_Dict.pep8         Empty file when no errors
* example_Dict.pyflakes     Empty file when no errors
* example_Dict.pylint       Metrics from pylint
* example_Dict.pylint.rc    Automatically produced configuration file
* htmlcov                   Directory produced by "coverage html" command
* test_Dict.pep8            Empty file when no errors
* test_Dict.pyflakes        Empty file when no errors
* test_Dict.pylint          Metrics from pylint
* test_Dict.pylint.rc       Automatically produced configuration file
* test_Dict.html            Generated by pydoc
* tgz                       Directory containing local backups

## Useful links
* [PEP8](https://www.python.org/dev/peps/pep-0008/)
* [PEP20](https://www.python.org/dev/peps/pep-0020/)
* [style guide](https://google.github.io/styleguide/pyguide.html)
* [pytest](http://pytest.org/latest)
* [coverage](https://coverage.readthedocs.io/en/coverage-4.0.3/)

## TODO
Makefile style recommendations include having an 
[INSTALL rule](https://www.gnu.org/prep/standards/html_node/Command-Variables.html#Command-Variables).
This is a good idea if you want a central source directory
and a set of file system targets for distribution of a script.
It prevents "forgetting a step" when re-initializing a system.

It is also useful to have an 'uninstall' and 'clean'.

Currently "Finalize" is used as "info" is intended.
[info](https://www.gnu.org/prep/standards/html_node/Standard-Targets.html#Standard-Targets)
This should be cleaned up.

Latest update has 100% coverage.
