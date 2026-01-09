# Compound Interest Calculator - Classic ASP Project

A web application for calculating compound interest with full database CRUD operations, built with Classic ASP, HTML, CSS, and Microsoft Access database.

## Features

- **Calculate Compound Interest** with customizable parameters:
  - Principal amount ($)
  - Annual interest rate (%)
  - Duration (in years or months)
  - Compound frequency (annually, semi-annually, quarterly, monthly)

- **Full CRUD Operations:**
  - **Create:** Save calculations to database (`save.asp`)
  - **Read:** View calculation history on main page (`index.asp`)
  - **Update:** Edit existing calculations (`edit.asp` → `update.asp`)
  - **Delete:** Remove calculations from history (`delete_list.asp`)

- **Modern Design** with clean, professional styling and responsive layout

## Technologies Used

- **HTML5** - Structure and forms
- **CSS3** - Styling and layout
- **Classic ASP (VBScript)** - Server-side logic and calculations
- **Microsoft Access (.accdb)** - Database storage
- **IIS (Internet Information Services)** - Web server

## Project Structure

### Core Application Files

```
/
├── index.asp           # Main page - Calculator form + History table
├── save.asp            # CREATE operation - Saves new calculation to database
├── edit.asp            # Edit form - Displays existing calculation for editing
├── update.asp          # UPDATE operation - Updates calculation in database
├── update_success.asp  # Success confirmation page after update
├── delete_list.asp     # DELETE operation - Removes calculation from database
├── conn.asp            # Database connection - Connects to compoundly.accdb
├── test.asp            # Test page - Verifies ASP is working correctly
├── styles.css          # External CSS styling file
├── compoundly.accdb    # Access database (you must create this)
├── DATABASE_SETUP.md   # Step-by-step database creation instructions
├── PROJECT_ANALYSIS.md # Detailed file analysis and recommendations
└── README.md           # This file
```

### File Descriptions

| File | Purpose | Key Functionality |
|------|---------|-------------------|
| **index.asp** | Main application page | Displays calculator form and history table with edit/delete links |
| **conn.asp** | Database connection | Establishes connection to Access database using OLEDB provider |
| **save.asp** | Add new calculation | Calculates compound interest and inserts record into database |
| **edit.asp** | Edit form | Pre-fills form with existing calculation data for modification |
| **update.asp** | Update calculation | Recalculates and updates existing record in database |
| **delete_list.asp** | Delete calculation | Removes calculation record from database by ID |
| **update_success.asp** | Success page | Confirmation message after successful update |
| **test.asp** | Testing utility | Verifies ASP environment is configured correctly |
| **styles.css** | Styling | External stylesheet with modern gradient design |

## Installation & Setup

### Prerequisites
- Windows OS (Windows 7 or later)
- Microsoft Access (2007 or later for .accdb format)
- IIS (Internet Information Services)

### Step 1: Enable IIS on Windows
1. Open **Control Panel** → **Programs** → **Turn Windows features on or off**
2. Check **"Internet Information Services"**
3. Expand **IIS** → **World Wide Web Services** → **Application Development Features**
4. Check **"ASP"** and **"ISAPI Extensions"**
5. Click **OK** and wait for installation to complete

### Step 2: Create the Database
1. Follow detailed instructions in `DATABASE_SETUP.md`
2. Create `compoundly.accdb` with the **Calculations** table
3. Ensure field names match exactly: `id`, `principal`, `rate`, `duration`, `duration_type`, `frequency`, `final_amount`, `interest_earned`, `calculation_date`

### Step 3: Deploy Files
1. Copy all `.asp` files to `C:\inetpub\wwwroot\` (or your IIS root directory)
2. Copy `compoundly.accdb` to the same location
3. Copy `styles.css` to the same location
4. **Set Database Permissions:**
   - Right-click `compoundly.accdb` → **Properties** → **Security** tab
   - Click **Edit** → **Add** → Type `IUSR` → **Check Names** → **OK**
   - Select **IUSR** → Check **Full Control** → **OK**

### Step 4: Test the Application
1. Open browser: `http://localhost/test.asp` (verifies ASP is working)
2. If test page works, go to: `http://localhost/index.asp` (main application)
3. Try creating a calculation to test database connection

## Compound Interest Formula

The application uses the standard compound interest formula:

**A = P(1 + r/n)^(nt)**

Where:
- **A** = Final amount (what you'll have after the duration)
- **P** = Principal (initial investment amount)
- **r** = Annual interest rate (as decimal: rate/100, e.g., 5% = 0.05)
- **n** = Compound frequency per year (1=annually, 2=semi-annually, 4=quarterly, 12=monthly)
- **t** = Time in years (automatically converts months to years if needed)

### Example Calculation
- Principal: $10,000
- Rate: 5% per year
- Duration: 10 years
- Frequency: Monthly (12 times per year)

**A = 10000 × (1 + 0.05/12)^(12×10) = $16,470.09**

**Interest Earned = $16,470.09 - $10,000 = $6,470.09**

## Course Requirements Checklist

| Requirement | Implementation | Status |
|------------|----------------|--------|
| **HTML** | Form structure and markup in `index.asp`, `edit.asp` | ✅ Complete |
| **CSS** | External stylesheet `styles.css` + inline styles | ✅ Complete |
| **IIS Setup** | Web server configuration for Classic ASP | ✅ Required |
| **Classic ASP** | Server-side VBScript in all `.asp` files | ✅ Complete |
| **Database Connection** | `conn.asp` connects to Access using OLEDB | ✅ Complete |
| **Add Data (CREATE)** | `save.asp` inserts new calculations | ✅ Complete |
| **Update Data (UPDATE)** | `update.asp` modifies existing calculations | ✅ Complete |
| **Delete Data (DELETE)** | `delete_list.asp` removes calculations | ✅ Complete |
| **Read Data (READ)** | `index.asp` displays calculation history | ✅ Complete |
| **Compound Interest Calculation** | Formula implemented in `save.asp` and `update.asp` | ✅ Complete |
| **Duration Support** | Years and months with automatic conversion | ✅ Complete |
| **Compound Frequency** | Annually, Semi-annually, Quarterly, Monthly | ✅ Complete |

## How to Use

### Creating a New Calculation
1. Visit `http://localhost/index.asp` in your browser
2. Fill in the calculator form:
   - **Principal Amount:** Enter the initial investment (e.g., 10000)
   - **Interest Rate:** Enter annual rate as percentage (e.g., 5 for 5%)
   - **Duration:** Enter the time period (e.g., 10)
   - **Duration Type:** Select "Years" or "Months"
   - **Compound Frequency:** Select how often interest compounds
3. Click **"Calculate & Save"** to compute and store the result
4. The calculation appears in the history table below

### Viewing History
- All calculations are displayed in a table on `index.asp`
- Shows: Date, Principal, Rate, Duration, Final Amount, Interest Earned
- Sorted by most recent first

### Editing a Calculation
1. Click **"Edit"** link next to any calculation in the history table
2. Modify the values in the form
3. Click **"Update Calculation"** to save changes
4. The calculation is recalculated automatically with new values

### Deleting a Calculation
1. Click **"Delete"** link next to any calculation
2. The calculation is immediately removed from the database
3. You are redirected back to the main page

## Troubleshooting

### Common Issues

**Problem:** "Database connection error"  
**Solution:** 
- Ensure `compoundly.accdb` exists in the same folder as ASP files
- Check database file permissions (IUSR needs Full Control)
- Verify database table name is "Calculations" (case-sensitive)

**Problem:** "ASP not working" or "500 Internal Server Error"  
**Solution:**
- Verify IIS is installed and ASP is enabled
- Check `test.asp` to confirm ASP environment
- Ensure files are in `C:\inetpub\wwwroot\` or configured IIS directory

**Problem:** "Cannot update/delete records"  
**Solution:**
- Check database file is not open in Access
- Verify IUSR account has write permissions
- Ensure database file is not read-only

**Problem:** "Field name errors"  
**Solution:**
- Verify database field names match exactly: `principal`, `rate`, `duration`, `duration_type`, `frequency`, `final_amount`, `interest_earned`, `calculation_date`
- Check `DATABASE_SETUP.md` for correct field definitions

## Project Submission

### Files to Include
1. All `.asp` files (index.asp, save.asp, edit.asp, update.asp, delete_list.asp, conn.asp, test.asp, update_success.asp)
2. `styles.css` (styling file)
3. `DATABASE_SETUP.md` (database instructions)
4. `README.md` (this file)
5. **DO NOT include** `compoundly.accdb` (database file) - create it on the submission server

### Submission Format
1. Export project as `.zip` or `.rar` file
2. Name it: `CompoundInterestCalculator_Group[Number].zip`
3. Only one group member needs to upload

### Submission Checklist
- [ ] All ASP files included
- [ ] CSS file included
- [ ] Documentation files included
- [ ] Database setup instructions clear
- [ ] All CRUD operations working
- [ ] Calculations tested and verified

**Project Title:** Compound Interest Calculator  
**Group Members:** [Add names - maximum 3 students]  
**Date:** [Add submission date]  
**Course:** [Add course name/number]

---

## Additional Resources

- See `PROJECT_ANALYSIS.md` for detailed file analysis and recommendations
- See `DATABASE_SETUP.md` for step-by-step database creation
- See `IIS_SETUP.md` (if exists) for IIS configuration details
