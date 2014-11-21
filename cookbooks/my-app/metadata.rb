name             'my-app'
maintainer       'Chef'
maintainer_email 'saleseng@getchef.com'
license          'All rights reserved'
description      'Installs/Configures my-app'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.2.0'

depends 'mysql'
depends 'database'
depends 'apache2'
depends 'python'
depends 'libarchive'
depends 'partial_search'
