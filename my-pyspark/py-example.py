from pyspark.sql import SparkSession
from pyspark import SparkContext
from pyspark.sql.functions import lit, current_date, col, when
from delta import *
from delta.tables import *
from operator import add

print("Hello World")