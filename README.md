## Google Search Scraper

A rake task which scrapes and persists Ad information from Google's search page.

## Installation Instructions

Install [rvm](https://rvm.io/)
```bash
curl -sSL https://get.rvm.io | bash -s stable
```

Clone the repo
```bash
git clone https://github.com/dotnet236/google-search-scraper.git
```

Install ruby if prompted
```bash
rvm install ruby-1.9.3-p386
```

Bundle the project gems
```
bundle --binstubs
```


## Example Usage

```bash
$ VERBOSE=true rake 'google:scrape:ads[email marketing]'
```

# Running Tests
```bash
$ rake spec:all
```

## Code Status

![](https://travis-ci.org/dotnet236/google-search-scraper.png)


## License

Google Search Scraper is released under the MIT License.
