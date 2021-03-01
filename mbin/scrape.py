#!/usr/bin/env python3

import argparse
import bs4 as bsoup
import urllib.request
from pathlib import Path

clp = argparse.ArgumentParser(prog='scrape',
                              description='Extract elements of a web page')

clp.add_argument('url', help='Full URL of the web site to scrape')
clp.add_argument('--dryrun', action='store_true', help='Pretend to download files')

args = clp.parse_args()

site = urllib.request.Request(args.url)
web_page = urllib.request.urlopen(site).read()
soup = bsoup.BeautifulSoup(web_page,'lxml')
print(soup.title.string)
for anchor in soup.find_all('a'):
    href = str(anchor.get('href'))
    if href.endswith('.pdf'):
        if href.startswith('http'):
            pdf_url = href
        else:
            pdf_url = site.type + '://' + site.host + href
        print(f'downloading {pdf_url} ...')
        if not args.dryrun:
            with urllib.request.urlopen(pdf_url) as pdf_href:
                with open(Path(href).name,'wb') as pdf_file:
                    pdf_file.write(pdf_href.read())