import time
import psutil
import pyautogui

# Check https://youtu.be/OGKQ6krf5O0 for a demo
# https://gist.github.com/cletusw/5be3b7c10ee81e1fd3a9f7cd5608888b
# Modified from https://gist.github.com/sjonkeesse/134494371a361d513ad0d85d8d528fe3
# CPU only

# Required software
# Python 3      (https://www.python.org/downloads/) (with installation: check add to PATH)
# psutil        (pip install psutil)
# pyautogui     (pip install pyautogui)

# Instructions
# 1. Open DaVinci Resolve and open the Color tab
# 2. In the tracker panel, open the Stabilizer
# 3. Make sure you can select the next clip on the timeline with the arrow down button
# 4. Select the first clip for stabilization
# 5. Open Windows Taskmanager (ctrl + alt + del)
# 6. Open Performance tab
# 7. In DaVinci Resolve click on 'Stabilize' and monitor CPU usage (in percentage)
# 8. Define a threshold of the CPU usage for when the Stabilization is in progress vs. idle
# 9. Run this script in the command prompt, preferably next to the DaVinci Resolve window
# 10. Define the Cropping ratio, Smooth and Strength values you want to change. Leave blank for no change.
# 11. When asked, hold your mouse above the input field(s) and Stabilize button.
# 12. Enter the threshold for the CPU you think is appropriate (script will move on after 5s below this threshold)
# 13. Let it do it's thing. You should monitor the first few tries.

print("Make sure DaVinci Resolve Color tab is active with tracker Stabilizer.")

clipCount = input("Amount of clips to stabilize: ")
croppingRatio = input("Cropping ratio (enter for no change): ")
smooth = input("Smooth (enter for no change): ")
strength = input("Strength (enter for no change): ")
cpuIdleThreshold = int(input("CPU idle threshold in percentage: ") or "5") # in percent

# Set default values or leave it to 0 for configuration on each start
posXCroppingRatio = 0
posYCroppingRatio = 0
posXSmooth = 0
posYSmooth = 0
posXStrength = 0
posYStrength = 0
posXStabilize = 0
posYStabilize = 0

# Get position of Cropping Ratio field
if "" != croppingRatio and 0 == posXCroppingRatio and 0 == posYCroppingRatio:
    print("Hold cursor above 'Cropping Ratio' field")
    for x in range(5, 0, -1):
        print("Capturing mouse position (hold above 'Cropping Ratio' field) in", x)
        time.sleep(1);

    posXCroppingRatio, posYCroppingRatio = pyautogui.position()
    print("Position captured! X:", posXCroppingRatio, " Y:", posYCroppingRatio)
    time.sleep(1);

# Get position of Smooth field
if "" != smooth and 0 == posXSmooth and 0 == posYSmooth:
    print("Hold cursor above 'Smooth' field")
    for x in range(5, 0, -1):
        print("Capturing mouse position (hold cursor above 'Smooth' field) in", x)
        time.sleep(1);

    posXSmooth, posYSmooth = pyautogui.position()
    print("Position captured! X:", posXSmooth, " Y:", posYSmooth)
    time.sleep(1);

# Get position of Strength field
if "" != strength and 0 == posXStrength and 0 == posYStrength:
    print("Hold cursor above 'Strength' field")
    for x in range(5, 0, -1):
        print("Capturing mouse position (hold cursor above 'Strength' field) in", x)
        time.sleep(1);

    posXStrength, posYStrength = pyautogui.position()
    print("Position captured! X:", posXStrength, " Y:", posYStrength)
    time.sleep(1);

# Get position of Stabilize button
if 0 == posXStabilize and 0 == posYStabilize:
    print("Hold cursor above 'Stabilize' button")
    for x in range(5, 0, -1):
        print("Capturing mouse position (hold cursor above 'Stabilize' button) in", x)
        time.sleep(1);

    posXStabilize, posYStabilize = pyautogui.position()
    print("Position captured! X:", posXStabilize, " Y:", posYStabilize)
    time.sleep(1);

print("Dont move or resize DaVinci Resolve!")

for x in range(int(clipCount)):
    print("Starting stabilization for clip", x)

    # Entering Cropping ratio value
    if "" != croppingRatio:
        print("Setting cropping ratio to", croppingRatio)
        pyautogui.moveTo(posXCroppingRatio, posYCroppingRatio, duration = 1) # Not necessary, but nice to see what's going on
        pyautogui.click(posXCroppingRatio, posYCroppingRatio, clicks = 2)
        time.sleep(1)
        pyautogui.typewrite(["backspace", "backspace", "backspace", "backspace", "backspace", "backspace"])
        time.sleep(1)
        pyautogui.typewrite(croppingRatio)
        pyautogui.typewrite(["enter"])
        time.sleep(1)

    # Entering Smooth value
    if "" != smooth:
        print("Setting smooth to", smooth)
        pyautogui.moveTo(posXSmooth, posYSmooth, duration = 1) # Not necessary, but nice to see what's going on
        pyautogui.click(posXSmooth, posYSmooth, clicks = 2)
        time.sleep(1)
        pyautogui.typewrite(["backspace", "backspace", "backspace", "backspace", "backspace", "backspace"])
        time.sleep(1)
        pyautogui.typewrite(smooth)
        pyautogui.typewrite(["enter"])
        time.sleep(1)

    # Entering Strength value
    if "" != strength:
        print("Setting strength to", strength)
        pyautogui.moveTo(posXStrength, posYStrength, duration = 1) # Not necessary, but nice to see what's going on
        pyautogui.click(posXStrength, posYStrength, clicks = 2)
        time.sleep(1)
        pyautogui.typewrite(["backspace", "backspace", "backspace", "backspace", "backspace", "backspace"])
        time.sleep(1)
        pyautogui.typewrite(strength)
        pyautogui.typewrite(["enter"])
        time.sleep(1)

    # Start stabilization
    print("Starting stabilization")
    pyautogui.moveTo(posXStabilize, posYStabilize, duration = 1) # Not necessary, but nice to see what's going on
    pyautogui.click(posXStabilize, posYStabilize)

    time.sleep(5)

    # Wait for stabilisation to finisch
    start = time.time()
    load = 1.00
    counter = 0
    stabilizationInProgress = True
    while stabilizationInProgress:
        cpuLoad = psutil.cpu_percent(1)

        if cpuIdleThreshold <= cpuLoad:
            # CPU is working
            print("CPU load:", cpuLoad, "%")

            # Reset counter
            counter = 0
        else:
            # CPU is idle
            print("Idle for", counter, "second(s)")

            if 5 <= counter:
                stabilizationInProgress = False
            else:
                counter = counter + 1

    end = time.time()
    duration = end - start + 5;
    print("It looks like DaVinci is ready with stabilizing. (it took ", duration,"seconds)")

    time.sleep(5)

    # Select next clip in timeline
    print("Selecting next clip on timeline")
    pyautogui.typewrite(["down"])