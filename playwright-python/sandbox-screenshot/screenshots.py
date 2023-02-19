from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch()
    page = browser.new_page()
    page.goto('https://kakakakakku.hatenablog.com/')

    page.screenshot(path='images/0_default.png')
    page.screenshot(path='images/1_full.png', full_page=True)
    page.screenshot(path='images/2_clip.png', clip={'x': 150, 'y': 150, 'width': 400, 'height': 400})
    page.screenshot(path='images/3_mask.png', mask=[page.locator('#title > a'), page.locator('.entry-title')])

    browser.close()
