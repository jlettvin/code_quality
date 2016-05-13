#!/usr/bin/env make

DATETIME=`date +%Y%m%d%H%M%S`

DICT=Dict
TEST=test_Dict
SHOW=example_Dict

SOURCE=$(DICT).py $(TEST).py $(SHOW).py __init__.py README.md Makefile

QCDICT=$(DICT).pep8 $(DICT).pyflakes $(DICT).pylint
QCTEST=$(TEST).pep8 $(TEST).pyflakes $(TEST).pylint
QCSHOW=$(SHOW).pep8 $(SHOW).pyflakes $(SHOW).pylint
RCLINT=$(DICT).pylint.rc $(TEST).pylint.rc $(SHOW).pylint.rc

# main ########################################################################
all:	Initialize $(QCDICT) $(QCTEST) $(QCSHOW) Finalize

# Delete non-sources ##########################################################
.PHONY:
clean:
	@echo make $@
	@rm -f $(QCDICT) $(QCTEST) $(QCSHOW) $(RCLINT)
	@rm -f *.pyc .coverage
	@rm -f Dict.html test_Dict.html
	@rm -fr __pycache__ .cache htmlcov

# Archive #####################################################################
.PHONY:
tar:
	@echo make $@ with timestamp $(DATETIME)
	@mkdir -p tgz
	@tar cvzf tgz/Dict.$(DATETIME).tgz $(SOURCE)

# Makefile start/end report ###################################################
.PHONY:
Initialize: $(DICT).py $(TEST).py $(SHOW).py
	@echo "Starting Code Quality tests on the Dict suite."

.PHONY:
Finalize:
	@echo "\tmake .coverage from $(TEST).py using coverage"
	@coverage run --source=$(TEST).py,$(DICT).py $(TEST).py -crg
	@coverage html
	@echo "\tmake pydoc from $(DICT) and $(TEST).py using coverage"
	@pydoc -w $(DICT) > $(DICT).html
	@pydoc -w $(TEST) > $(TEST).html
	@echo "Finished Code Quality tests on the Dict suite."

# PEP8 section ################################################################
$(DICT).pep8 $(TEST).pep8 $(SHOW).pep8:	$(DICT).py $(TEST).py $(SHOW).py
	@echo "\tmake $@ from $(subst pep8,py,$@) using pep8"
	@pep8 --ignore=E202,E203,E221,E272,E721 $(subst pep8,py,$@) >$@
	@cat $@


# PYFLAKES section ################################################################
$(DICT).pyflakes $(TEST).pyflakes $(SHOW).pyflakes:	$(DICT).py $(TEST).py $(SHOW).py
	@echo "\tmake $@ from $(subst pyflakes,py,$@) using pyflakes"
	@pyflakes $(subst pyflakes,py,$@) >$@
	@cat $@


# PYLINT section ##############################################################
$(DICT).pylint $(TEST).pylint $(SHOW).pylint: $(DICT).py $(TEST).py $(SHOW).py
	@echo "\tmake $@ from $(subst pylint,py,$@) using pylint"
	@-pylint --generate-rcfile > $@.rc 2>/dev/null
	@pylint $(subst pylint,py,$@) --rcfile=$@.rc >$@
	@tail -2 $@ | head -1