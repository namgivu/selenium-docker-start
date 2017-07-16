#!/usr/bin/env python2.7

from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
browsers = [DesiredCapabilities.CHROME, DesiredCapabilities.FIREFOX]

for browser in browsers:
  ##region init webdriver object
  SELENIUM_HUB = 'http://localhost:4444/wd/hub'

  from selenium import webdriver
  driver = webdriver.Remote(
    command_executor=SELENIUM_HUB,
    desired_capabilities=browser,
  )
  ##endregion init webdriver object


  ##region do we scraping

  #go to the google home page
  driver.get('http://www.google.com')

  #the page is ajax so the title is originally this:
  print(driver.title)

  #find the element that's name attribute is q (the google search box)
  inputElement = driver.find_element_by_name('q')

  #type in the search
  inputElement.send_keys('cheese!')

  #submit the form (although google automatically searches now without submitting)
  inputElement.submit()

  try:
    from selenium.webdriver.support.ui import WebDriverWait
    from selenium.webdriver.support import expected_conditions as EC

    #we have to wait for the page to refresh, the last thing that seems to be updated is the title
    WebDriverWait(driver, 10).until(EC.title_contains('cheese!'))

    #You should see 'cheese! - Google Search'
    print(driver.title)

  finally:
    driver.quit()

  ##endregion do we scraping
