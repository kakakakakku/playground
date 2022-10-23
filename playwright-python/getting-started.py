from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch()
    page = browser.new_page()
    page.goto('http://playwright.dev/')

    # Fast and reliable end-to-end testing for modern web apps | Playwright
    print(page.title())
    # Playwright enables reliable end-to-end testing for modern web apps.
    print(page.locator('.hero__title').text_content())

    page.screenshot(path='images/playwright-light.png')
    page.locator('.lightToggleIcon_pyhR').click()
    page.screenshot(path='images/playwright-dark.png')

    browser.close()
