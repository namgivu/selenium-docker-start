#!/usr/bin/env python2.7

SELENIUM_HUB = 'http://localhost:4444/wd/hub'

from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
driver = webdriver.Remote(
  command_executor=SELENIUM_HUB,
  desired_capabilities=DesiredCapabilities.CHROME,
)

driver.get('http://www.google.com')
print(driver.title)
