# Database Setup Instructions

## Creating the Access Database (compoundly.accdb)

1. **Open Microsoft Access** (2007 or later for .accdb format)

2. **Create a new blank database:**
   - Click "Blank Database"
   - Name it: `compoundly.accdb`
   - Save it in the same folder as your ASP files

3. **Create the Calculations table:**
   - Click "Create" → "Table Design"
   - Add the following fields:

   | Field Name        | Data Type    | Properties                |
   |-------------------|--------------|---------------------------|
   | id                | AutoNumber   | Primary Key               |
   | principal         | Number       | Field Size: Double        |
   | rate              | Number       | Field Size: Double        |
   | duration          | Number       | Field Size: Integer       |
   | duration_type     | Short Text   | Field Size: 10            |
   | frequency         | Number       | Field Size: Integer       |
   | final_amount      | Number       | Field Size: Double        |
   | interest_earned   | Number       | Field Size: Double        |
   | calculation_date  | Date/Time    | Format: General Date      |

4. **Set the Primary Key:**
   - Right-click on the "id" field
   - Select "Primary Key"

5. **Save the table:**
   - Save as: `Calculations`

6. **Close Access** - Your database is ready!

## Important Notes

- The database file must be named `compoundly.accdb`
- Place it in the same folder as your ASP files
- Ensure the database file has read/write permissions for the IIS user account (IUSR)
- Right-click the database file → Properties → Security tab → Edit → Add IUSR with Full Control
- The connection string uses Microsoft.ACE.OLEDB.12.0 provider (for .accdb format)

## Testing the Database

After creating the database, visit `test.asp` to ensure ASP is working, then visit `index.asp` to test the full application.
