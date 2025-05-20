Download Python from https://www.python.org/downloads/
Create the following directories in C:\ drive: “installers” and “python”. The path will be: C:\installers\python
Place the Python installation executable inside the “python” directory
Run the downloaded executable as administrator
Tick Add Python 3.11 to PATH
Click on Customize Installation
In Optional Features window, please check that all tick boxes are already ticked, if not, tick them all
Click next
Check that Install for all users tick box is UNCHECKED, please DO NOT check it
The PATH shown in Customize install location should be: C:\Users\<your>.<user>\AppData\Local\Programs\Python\Python3.11
Click Install
After installation finishes, click Close
In Windows please open Edit the System Environment Variables and check that Python is located in User Variables, not System Variables
If you want to install Robot Framework system-wide, open the command line as administrator and run: pip install robotframework-seleniumlibrary
If you want to install Robot Framework in a python virtual environment, follow these steps:
1. Create your virtual environment with this command: python -m venv virtualenv
2. Activate your virtual environment with this command: path_to_the_"virtualenv"_folder\Scripts\activate
3. When the virtual environment is activated you will see "(virtualenv)" in green in the command line
Create bin directory in C:\. The path will be C:\bin
Add C:\bin to your PATH (inside Environment Variables > User Variables)
Check your version of Chrome (in your browser click on three vertical dots > Help > About Google Chrome and check your version of Chrome)
Install the Webdriver for Chrome, which must have the same version as your Chrome browser, to do that, go to this link for a Win64 Windows installation: https://storage.googleapis.com/chrome-for-testing-public/132.0.6834.110/win64/chromedriver-win64.zip)
Download the Windows version of the executable
Copy the executable and place it in C:\bin
Download PyCharm Community Edition IDE (follow this link and go to the bottom of the page: https://www.jetbrains.com/pycharm/download/?section=windows)
Run the executable as administrator and proceed with the installation
Click next, leave default location, click next
Check tick box “Create Desktop shortcut”
Check tick box “Create Associations” with .py
Check tick box “Add bin folder to the PATH”
Click next then install
Click Finish
Import settings, if window had to pop-up
Click Plugins
Go to Marketplace tab
Type “intellibot” in search menu
Select the most recent “intellibot” software and click on Install
Click Restart IDE
Click on Customize
Click on All Settings
Click Languages and Frameworks
Click Robot Options
Have the tickbox “Expand adjacent 2 or 3 spaces etc.” ticked
Pycharm is ready to use
If you want, in your C:\ drive create the following directories where to install Robot Framework scripts: “development” and “robot-scripts”. The path will be C:\development\robot-scripts