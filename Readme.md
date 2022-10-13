# Movella Assignment

## Prerequisites

Running `Java file` requires:

* Java 18 or higher
* Further need to have `io' and 'util' packages installed

## Coding Guidelines

1. All your Java files reside in root.
2. The SQL file is also located in root.

## Assignment
1. Write a command line program that simulates checking password strength based on certain rules.
2. Write a program that accepts a log file and writes 3 different log files - one
   for each type of log entry ( i.e. INFO log, DEBUG log and ERROR logs) containing those relevant type
   of log entries.
3. SQL QUERIES

## Instructions
1. To Run the Java files
    ```
    $ javac PasswordChecker1.java
    ```
   same procedure for `FileParser2.java`
2. The output files are already in the repository to test the program you can delete output file (DEBUFlog.txt,INFOlog.txt & ERRORlog.txt)
3. You can also use your own log file but it should be copied into the root directory

## Unit Test Cases

### Password checker
    ```
    javac PasswordChecker1.java
    Enter the password
    Bc4
    Password Strength: LOW
    Password length should be atleast 8 characters
    Password should contain atleast 2 special characters
    javac PasswordChecker1.java
    Enter the password
    Bc4@#$
    Password Strength: AVERAGE
    Password length should be atleast 8 characters
    Password should contain atleast 2 numbers
    javac PasswordChecker1.java
    Enter the password
    Bc4@#$567
    Password Strength: VERY GOOD
    
    ```
### File Parsing
    ```
    javac FileParser2.java
    Enter the file name
    abc
    File not found
    javac FileParser2.java
    Enter the file name
    log.txt  // will create file with required data
    Writting Done
    
    ``
### SQL Queries

* Screenshots of solutions of these are in the `SQL Solutions` folder
* The code of which is in `Solution3.sql` file
