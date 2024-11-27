from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium import webdriver

driver = webdriver.Chrome()
driver.get("http://localhost:64251")

try:
    # Wait for the Flutter canvas or main view to load
    WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.TAG_NAME, "flutter-view"))
    )

    # Validate the page title as a backup
    assert "E-Commerce App" in driver.title
    print("Test passed: Flutter app loaded.")
except Exception as e:
    print("Test failed:", str(e))
finally:
    driver.quit()
