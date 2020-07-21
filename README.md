# uppercasefirstletterwordmssql
Microsoft SQL Server function to uppercase first letter of words from user defined string

# Version
* 0.0.1

**Important Note**
* This function was written with SQL Server 2012 methods

### Prerequisite Data Types
* nvarchar
* integer (int)
* char

### Prerequisite Functions
* lower
* len
* substring
* stuff
* upper

### Prerequisite Conditions
* in

# Usage
* `dbo.UppercaseFirstLetterWord('This is a test string.')`
