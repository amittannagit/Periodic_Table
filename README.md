# Periodic Table Database

Welcome to the **Periodic Table Database** project! This project involves creating and managing a PostgreSQL database that contains information about chemical elements. You'll also create a Bash script that interacts with this database to retrieve and display information based on user input.

## Project Structure

1. **Part 1: Fix the Database**
   - You'll begin by making corrections to the database, such as renaming columns, adding constraints, and creating relationships between tables.
   
2. **Part 2: Create Your Git Repository**
   - You'll set up version control for your project by initializing a Git repository, making a series of commits, and organizing your work on a `main` branch.

3. **Part 3: Create the Script**
   - You'll create a Bash script that accepts an atomic number, symbol, or element name as an argument, queries the database, and displays relevant information.

## Getting Started

### Prerequisites

- PostgreSQL installed and running on your system.
- Git installed and configured.
- Familiarity with Bash scripting and SQL.

### Instructions

1. **Connect to the Database**
   - Start by connecting to the `periodic_table` database using the following command:
     ```bash
     psql --username=freecodecamp --dbname=periodic_table
     ```

2. **Fix the Database**
   - Rename and adjust columns in the `elements` and `properties` tables.
   - Set up constraints like `NOT NULL` and `UNIQUE`.
   - Create a `types` table and establish relationships between it and the `properties` table.
   - Make sure to clean up the data by capitalizing symbols and removing trailing zeros in the `atomic_mass` column.
   - Add additional elements to the database as specified.

3. **Create the Git Repository**
   - Initialize a Git repository in the project folder:
     ```bash
     git init
     ```
   - Make at least five commits with appropriate messages starting with `feat:`, `fix:`, `refactor:`, `chore:`, or `test:`.
   - Ensure that your working tree is clean and that you are on the `main` branch by the end of the project.

4. **Develop the Bash Script**
   - Create a Bash script named `element.sh` that queries the database and outputs element information.
   - The script should handle cases where the input is invalid or the element is not found.
   - Make the script executable:
     ```bash
     chmod +x element.sh
     ```

## Usage

- Running the script with no arguments should output:
  ```
  Please provide an element as an argument.
  ```

- Running the script with an atomic number, symbol, or element name should output information about the element:
  ```
  The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
  ```

- If the input does not match any element, the script should output:
  ```
  I could not find that element in the database.
  ```

## Database Dump

- To save your progress, you can create a dump of your database:
  ```bash
  pg_dump -cC --inserts -U freecodecamp periodic_table > periodic_table.sql
  ```
- This dump file can be used to restore the database at any time:
  ```bash
  psql -U postgres < periodic_table.sql
  ```

## Completion

- Ensure that your project is on the `main` branch and that your working tree is clean before considering the project complete.
- Submit the URL to your repository on freeCodeCamp.org after all tests have passed.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
