from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch()
    context = browser.new_context()

    page = context.new_page()
    page.goto('https://kakakakakku.hatenablog.com/')

    # https://kakakakakku.hatenablog.com/
    url = page.locator('h1#title > a').get_attribute('href')
    print(url)

    # https://kakakakakku.hatenablog.com/entry/2023/01/10/081119
    url = page.locator('h1.entry-title > a').nth(0).get_attribute('href')
    print(url)

    context.close()
    browser.close()
