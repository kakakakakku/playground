from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.webkit.launch()
    device = p.devices['iPhone 13 Pro']
    context = browser.new_context(**device)

    page = context.new_page()
    page.goto('https://playwright.dev/python/')
    page.screenshot(path='images/playwright-device-iphone.png')

    context.close()
    browser.close()
