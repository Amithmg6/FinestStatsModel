"""
# from sqlalchemy import *
from datetime import datetime

from sqlite3 import dbapi2 as sqlite

# create the metadata object & track the tables

metadata = MetaData('sqlite://tutorial.sqlite')

"""
from sqlite3 import dbapi2 as sqlite
e = create_engine('sqlite+pysqlite:///file.db', module=sqlite)