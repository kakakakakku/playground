from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch()
    context = browser.new_context()

    context.tracing.start(screenshots=True, snapshots=True, sources=True)

    page = context.new_page()
    page.goto('https://kakakakakku.hatenablog.com/')

    page.get_by_placeholder('記事を検索').click()
    page.get_by_placeholder('記事を検索').fill('kubernetes')
    page.get_by_role('button', name='検索').click()
    page.wait_for_url('https://kakakakakku.hatenablog.com/search?q=kubernetes')

    context.tracing.stop(path = 'traces/trace.zip')

    context.close()
    browser.close()
