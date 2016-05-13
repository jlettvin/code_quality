#!/usr/bin/env python

#   pep8 --ignore=E721 Dict.py

"""Dict.py
Author: Jonathan D. Lettvin
LinkedIn: jlettvin
Date: 20141020
"""

from types import (MethodType)


class Dict(dict):
    """
    This derived class adds the ability to view and modify a dictionary
    using the simpler lexical naming convention used for code token names
    rather than the more complex braces and quotes dictionary accessors.
    """

    remove = '-<>'  # Add characters to this string to get them removed.

    @staticmethod
    def _clean(k):
        """
        This private method removes non-token characters from strings.
        Remove all '-' characters from hashable key to make it lexically ok,
        for instance when converting argv command-line dicts.
        https://docs.python.org/2/library/string.html#string.translate
        """
        return k.translate(None, Dict.remove)

    def _method(self, value):
        """
        This private method converts external functions to internal methods.
        https://docs.python.org/2/library/types.html

        Comparing types is considered unidiomatic, but it is necessary here.
        To avoid a pylint error, they are assigned to variables before assert.
        """
        vtype, dtype = type(value), type(Dict._clean)
        assert dtype == vtype
        return MethodType(value, self, Dict)

    def __init__(self, **kw):
        """
        __class__ has a __dict__ member.
        By replacing this __dict__ member with the parent dict builtin
        we may access its members lexically instead of with hashable keys.
        """
        super(Dict, self).__init__()        # NOOP to prevent pylint error
        self.__dict__ = self                # This is the magic line
        self.let(**kw)

    def __call__(self, **kw):
        'Update the instance dictionary'
        self.let(**kw)
        return self

    def let(self, **kw):
        "instance dictionary bulk updater"
        self.update({Dict._clean(k): v for k, v in kw.items()})
        return self

    def method(self, **kw):
        "instance dictionary bulk method attacher"
        self.update({Dict._clean(k): self._method(v) for k, v in kw.items()})
        return self