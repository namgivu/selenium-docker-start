#!/usr/bin/env python2.7

SELENIUM_HUB_CH = 'http://localhost:4445/wd/hub'
SELENIUM_HUB_FF = 'http://localhost:4446/wd/hub'

#region webdriver loading
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
driverCH = webdriver.Remote(
  command_executor=SELENIUM_HUB_CH,
  desired_capabilities=DesiredCapabilities.CHROME,
)
driverFF = webdriver.Remote(
  command_executor=SELENIUM_HUB_FF,
  desired_capabilities=DesiredCapabilities.FIREFOX,
)
#endregion webdriver loading

for driver in [driverCH, driverFF]:
  driver.get('http://www.google.com')
  print(driver.title)
