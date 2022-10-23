import re

from playwright.sync_api import Page, expect


def test_playwright(page: Page):
    page.goto('https://playwright.dev/')
    expect(page).to_have_title(re.compile('Playwright'))
