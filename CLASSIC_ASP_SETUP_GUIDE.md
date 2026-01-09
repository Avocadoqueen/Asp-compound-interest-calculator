# Complete Setup Guide for Classic ASP Version

## What You Need
- Windows computer (Windows 10 or 11)
- Microsoft Access (part of Microsoft Office)
- Text editor (Notepad, VS Code, or Cursor)

---

## STEP 1: Install IIS (Internet Information Services)

### 1.1 Enable IIS on Windows

1. Press `Windows Key + R`
2. Type `appwiz.cpl` and press Enter
3. Click "Turn Windows features on or off" (left sidebar)
4. Wait for the window to load, then check these boxes:

   ```
   ✓ Internet Information Services
     ✓ Web Management Tools
       ✓ IIS Management Console
     ✓ World Wide Web Services
       ✓ Application Development Features
         ✓ ASP (VERY IMPORTANT!)
       ✓ Common HTTP Features
         ✓ Default Document
         ✓ Directory Browsing
         ✓ HTTP Errors
         ✓ Static Content
   ```

5. Click OK and wait for installation (may take 5-10 minutes)
6. Restart your computer

### 1.2 Test IIS Installation

1. Open your web browser
2. Go to `http://localhost`
3. You should see the default IIS welcome page
4. If you see this, IIS is working!

---

## STEP 2: Create the Access Database

### 2.1 Open Microsoft Access

1. Open Microsoft Access
2. Click "Blank Database"
3. Name it `compoundly.accdb`
4. Save it to your Desktop (remember this location!)

### 2.2 Create the Table

1. Click "Create" tab → "Table Design"
2. Add these fields EXACTLY as shown:

   | Field Name | Data Type | Field Size |
   |------------|-----------|------------|
   | ID | AutoNumber | Long Integer |
   | principal | Number | Double |
   | rate | Number | Double |
   | duration | Number | Double |
   | durationType | Short Text | 50 |
   | compoundFrequency | Short Text | 50 |
   | finalAmount | Number | Double |
   | interest | Number | Double |
   | calcDate | Date/Time | - |

3. Right-click on "ID" row → "Primary Key"
4. Click Save icon (or Ctrl+S)
5. Name the table: `calculations` (lowercase, plural)
6. Close Access

### 2.3 Move Database to IIS Folder

1. Copy `compoundly.accdb` from Desktop
2. Create folder: `C:\inetpub\wwwroot\CompoundInterest\`
3. Paste the database file there
4. Final location: `C:\inetpub\wwwroot\CompoundInterest\compoundly.accdb`

---

## STEP 3: Set Up the ASP Files

### 3.1 Download Project Files

1. In v0, click the three dots (top right of code window)
2. Select "Download ZIP"
3. Save the ZIP file to your Desktop
4. Right-click the ZIP → "Extract All"

### 3.2 Copy ASP Files to IIS

You need to copy these 8 ASP files:
- `conn.asp`
- `index.asp`
- `save.asp`
- `edit.asp`
- `update.asp`
- `update_success.asp`
- `delete_list.asp`
- `test.asp`

**Steps:**
1. Open the extracted folder
2. Select all `.asp` files
3. Copy them
4. Go to `C:\inetpub\wwwroot\CompoundInterest\`
5. Paste all files there

Your folder should now have:
```
C:\inetpub\wwwroot\CompoundInterest\
  - compoundly.accdb
  - conn.asp
  - index.asp
  - save.asp
  - edit.asp
  - update.asp
  - update_success.asp
  - delete_list.asp
  - test.asp
```

---

## STEP 4: Set Database Permissions

This is CRITICAL or you'll get permission errors!

### 4.1 Set Folder Permissions

1. Go to `C:\inetpub\wwwroot\CompoundInterest\`
2. Right-click the folder → Properties
3. Go to "Security" tab
4. Click "Edit"
5. Click "Add"
6. Type: `IIS_IUSRS`
7. Click "Check Names" → OK
8. Check these boxes for IIS_IUSRS:
   - ✓ Read & Execute
   - ✓ List folder contents
   - ✓ Read
   - ✓ Write
   - ✓ Modify
9. Click Apply → OK

### 4.2 Set Database File Permissions

1. Right-click `compoundly.accdb` → Properties
2. Go to "Security" tab
3. Click "Edit"
4. Click "Add"
5. Type: `IIS_IUSRS`
6. Click "Check Names" → OK
7. Check these boxes for IIS_IUSRS:
   - ✓ Read & Execute
   - ✓ Read
   - ✓ Write
   - ✓ Modify
8. Click Apply → OK

---

## STEP 5: Configure IIS Application

### 5.1 Open IIS Manager

1. Press `Windows Key`
2. Type `IIS`
3. Click "Internet Information Services (IIS) Manager"

### 5.2 Enable ASP

1. In left sidebar, click your computer name
2. Double-click "ASP" icon (in the main panel)
3. Expand "Debugging Properties"
4. Set "Send Errors To Browser" = True
5. Click Apply (top right)

### 5.3 Set Default Document

1. In left sidebar, expand Sites → Default Web Site
2. Right-click "CompoundInterest" → Convert to Application
3. Click OK
4. Click "CompoundInterest"
5. Double-click "Default Document"
6. Check if "index.asp" is in the list
7. If not, click "Add" → type `index.asp` → OK
8. Select `index.asp` and click "Move Up" until it's at the top

---

## STEP 6: Test the Application

### 6.1 Test Database Connection

1. Open browser
2. Go to: `http://localhost/CompoundInterest/test.asp`
3. You should see: "Database connection successful!"
4. If you see an error, go back to STEP 4 (permissions)

### 6.2 Use the Calculator

1. Go to: `http://localhost/CompoundInterest/index.asp`
2. You should see the compound interest calculator form
3. Try entering:
   - Principal: 1000
   - Rate: 5
   - Duration: 2
   - Duration Type: Years
   - Frequency: Annually
4. Click "Calculate"
5. You should see the result and it saves to the history table

### 6.3 Test Edit and Delete

1. In the history table, click "Edit" on a record
2. Change values and update
3. Click "Delete" to remove a record
4. Go to `http://localhost/CompoundInterest/delete_list.asp` to see delete page

---

## STEP 7: Using Cursor (or Any Text Editor)

If you want to edit the code in Cursor:

### 7.1 Open in Cursor

1. Open Cursor application
2. Click File → Open Folder
3. Navigate to `C:\inetpub\wwwroot\CompoundInterest\`
4. Click "Select Folder"
5. You'll see all your ASP files in the sidebar

### 7.2 Edit Files

1. Click any `.asp` file to edit
2. Make changes
3. Press `Ctrl+S` to save
4. Refresh your browser to see changes
5. No need to restart IIS - changes are immediate!

---

## Common Errors and Solutions

### Error: "An error occurred on the server when processing the URL"
**Solution:** ASP is not enabled in IIS. Go back to STEP 1.1

### Error: "Could not find file 'C:\inetpub\wwwroot\CompoundInterest\compoundly.accdb'"
**Solution:** Database file is not in the correct location. Check STEP 2.3

### Error: "Operation must use an updateable query"
**Solution:** Database permissions are wrong. Go back to STEP 4

### Error: "Provider cannot be found"
**Solution:** The connection string might need adjustment for 64-bit systems. Change `conn.asp` line 2 to:
```asp
strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("compoundly.accdb")
```

### Page shows ASP code instead of running
**Solution:** You're opening the file directly. You MUST use `http://localhost/CompoundInterest/index.asp` in the browser

---

## Quick Reference

**View website:** `http://localhost/CompoundInterest/index.asp`

**Test connection:** `http://localhost/CompoundInterest/test.asp`

**File location:** `C:\inetpub\wwwroot\CompoundInterest\`

**Database location:** `C:\inetpub\wwwroot\CompoundInterest\compoundly.accdb`

---

## Project Submission

1. Go to `C:\inetpub\wwwroot\CompoundInterest\`
2. Select all files (ASP files + database)
3. Right-click → Send to → Compressed (zipped) folder
4. Name it: `CompoundInterest.zip`
5. Upload this ZIP file to your course portal

---

**That's it! You now have a working Classic ASP compound interest calculator with database storage.**
