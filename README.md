To start run or review this automation assignment please follow below procedure

# Pre-requisite
1. Install Python v3.x
2. Pycharm
3. Install Git

## On Windows installing 
python -m pip install --upgrade pip
pip install -r dependencies\requirements.txt

# Execute test case please use below any one of cmd
robot --include=Test1  Tests/Scenarios/saucedemo.robot
robot  Tests/Scenarios/saucedemo.robot

#Overview of my project structure

Folder details :
1. Data         =  It is used of xpath,url and data 
2. Library      =  It have one python support file where i used for external code which used in this project
3. Output       =  It is used for screenshot and project output files
4. Tests        =  This is main file where testcases are create using robot 


Main Test case file path is  "Tests/Scenarios/saucedemo.robot"