from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch()
    page = browser.new_page()
    page.goto('https://developer.mozilla.org/ja/docs/Web/CSS/@media')

    page.pdf(path='pdf/print.pdf', format='A4')

    page.emulate_media(media='screen')
    page.pdf(path='pdf/screen.pdf', format='A4')

    browser.close()
