======
scrapy
======

Install the Scrapy Framework.

.. note::

   See the full `Salt Formulas installation and usage instructions
   <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``scrapy``
---------

Include by default ``scrapy.repo``


``scrapy.repo``
---------

Add official Scrapy Debian repo and install base packages.


``scrapy.virtualenv``
---------

Install Scrapy from PyPi via pip on a virtualenv. See ``pillar.example`` to configure this state.
