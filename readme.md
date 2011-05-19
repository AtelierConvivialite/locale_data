locale_data
===========

A collection of country and language names, translated into hundreds of languages, and stored into YAML files for easy consumption.

locale_data was extracted out from [Web Translate It](https://webtranslateit.com). The data comes from [CLDR](http://cldr.unicode.org).

Update translations
-------------------

Whenever a new version of CLDR comes out, locale_data’s translations can be updated using the provided rake tasks:

    $ rake -T
    (in /Users/edouard/Projects/github/locale_data)
    rake update_languages    # Update language translations
    rake update_territories  # Update territory translations
    rake update_scripts      # Update script translations

License
-------

Copyright (c) 2011 Atelier Convivialité, released under the MIT License.