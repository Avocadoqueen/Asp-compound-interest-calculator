# IIS Setup Instructions

## Installing IIS on Windows

### Windows 10/11:
1. Open **Control Panel** → **Programs** → **Turn Windows features on or off**
2. Check **Internet Information Services**
3. Expand IIS and check:
   - **Web Management Tools** → IIS Management Console
   - **World Wide Web Services** → Application Development Features → **ASP**
4. Click **OK** and wait for installation

## Configuring Your Website

### Step 1: Copy Project Files
1. Copy all project files to: `C:\inetpub\wwwroot\CompoundInterest\`
2. Make sure `calculations.mdb` is in the same folder

### Step 2: Set Folder Permissions
1. Right-click the `CompoundInterest` folder
2. Properties → Security → Edit
3. Add `IIS_IUSRS` and `IUSR` with **Read & Execute** and **Write** permissions

### Step 3: Configure IIS
1. Open **IIS Manager** (search for it in Start menu)
2. Expand **Sites** → **Default Web Site**
3. Right-click **Default Web Site** → **Add Application**
   - Alias: `CompoundInterest`
   - Physical path: `C:\inetpub\wwwroot\CompoundInterest\`
4. Click **OK**

### Step 4: Enable ASP
1. In IIS Manager, click on your site
2. Double-click **ASP** icon
3. Expand **Debugging Properties**
4. Set **Send Errors To Browser** = **True** (for development)
5. Click **Apply**

### Step 5: Test Your Application
1. Open a web browser
2. Navigate to: `http://localhost/CompoundInterest/`
3. You should see the Compound Interest Calculator

## Troubleshooting

### Error: "Active Server Pages error 'ASP 0131'"
- **Solution:** Enable ASP in IIS (see Step 4 above)

### Error: Database connection failed
- **Solution:** Check folder permissions and ensure `calculations.mdb` exists

### Error: "HTTP Error 500.19"
- **Solution:** Run IIS as administrator or check file permissions

### Database write errors
- **Solution:** Give write permissions to `IIS_IUSRS` on the database file

## Default URLs
- **Home Page:** `http://localhost/CompoundInterest/`
- **History:** `http://localhost/CompoundInterest/history.asp`
