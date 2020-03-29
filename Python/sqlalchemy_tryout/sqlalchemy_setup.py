"""
Helps in install and setup
installed IN ANACONDA WINDOWS

SQLAlchemy also has an extensive unit test suite that can be downloaded separately
(not via easy_install) from http://sqlalchemy.org if you wish to test the installation more
extensively.

"""

import sqlalchemy
print(sqlalchemy.__version__)

"""
If you are using Windows, you can download the pysqlite binary
module from http://pysqlite.org/ and install it.

The complete list of supported databases and drivers follows:

PostgreSQL
psycopg2 at http://www.initd.org/pub/software/psycopg/

SQLite
pysqlite at http://initd.org/pub/software/pysqlite/ or sqlite3 (included with Python versions 2.5 and greater)

MySQL
MySQLdb at http://sourceforge.net/projects/mysql-python

Oracle
cx_Oracle at http://www.cxtools.net/

SQL Server
Support for Microsoft SQL server is provided by multiple drivers as follows:
• pyodbc at http://pyodbc.sourceforge.net/ (recommended driver)
• adodbapi at http://adodbapi.sourceforge.net/
• pymssql at http://pymssql.sourceforge.net/

Firebird
kinterbasdb at http://kinterbasdb.sourceforge.net/

Informix
informixdb at http://informixdb.sourceforge.net/

"""
