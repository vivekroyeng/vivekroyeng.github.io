# Build Instructions

This site uses a build script to generate HTML from markdown files and create clean URLs.

## Setup

1. Install Python dependencies (optional, for better markdown support):
   ```bash
   pip install markdown
   ```
   Note: The script will work without this, but with limited markdown features.

## Building the Site

Run the build script:
```bash
python build.py
```

This will:
- Generate `index.html` from the ESSAYS list
- Generate `thoughts/index.html` for the `/thoughts` route
- Convert markdown files to HTML and create clean URL structure
- Create directories like `thoughts/essay-name/` with `index.html` files

## Adding a New Essay

1. Create a markdown file in the `thoughts/` directory (e.g., `my-essay.md`)

2. Add an entry to the `ESSAYS` list in `build.py`:
   ```python
   {
       "slug": "my-essay",
       "title": "My Essay Title",
       "date": "Jan 1, 2025",
       "read_time": "5 min read",
       "markdown": "my-essay.md"
   },
   ```

3. Run `python build.py` to regenerate the site

## URL Structure

- Home: `/` (serves `index.html`)
- Thoughts list: `/thoughts/` (serves `thoughts/index.html`)
- Individual essay: `/thoughts/essay-name/` (serves `thoughts/essay-name/index.html`)

All URLs are clean (no `.html` extensions) thanks to the directory structure with `index.html` files.

