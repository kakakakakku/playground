from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch()
    device = p.devices['Pixel 5']
    context = browser.new_context(**device)

    page = context.new_page()
    page.goto('https://playwright.dev/python/')
    page.screenshot(path='images/playwright-device-pixel.png')

    context.close()
    browser.close()
