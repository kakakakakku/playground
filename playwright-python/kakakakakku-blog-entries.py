from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch()
    page = browser.new_page()
    page.goto('https://kakakakakku.hatenablog.com/')

    entries = page.locator('ul.entries-access-ranking li')

    for i in range(entries.count()):
        print(entries.nth(i).locator('div > .urllist-title').text_content())

    browser.close()
