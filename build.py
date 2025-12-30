#!/usr/bin/env python3
"""
Build script to generate HTML from markdown files.
This creates clean URLs by using directory structure with index.html files.

Usage:
    python build.py

Requirements:
    pip install markdown
"""

import os
import re
from pathlib import Path

try:
    import markdown
    HAS_MARKDOWN = True
except ImportError:
    HAS_MARKDOWN = False
    print("Warning: markdown library not found. Install with: pip install markdown")
    print("Falling back to simple markdown converter.")

# Essay metadata - update this when adding new essays
ESSAYS = [
    {
        "slug": "ai-eng-manager",
        "title": "The AI Engineering Manager",
        "date": "Dec 29, 2025",
        "read_time": "5 min read",
        "markdown": "ai-eng-manager.md"
    },
    {
        "slug": "eng-productivity",
        "title": "Engineering Productivity: What Makes Sense to Measure in GenAI Era",
        "date": "Dec 29, 2025",
        "read_time": "8 min read",
        "markdown": "eng-productivity.md"
    }
]

def simple_markdown_to_html(markdown_text):
    """Simple markdown to HTML converter (fallback)."""
    html = markdown_text
    
    # Headers
    html = re.sub(r'^# (.+)$', r'<h1>\1</h1>', html, flags=re.MULTILINE)
    html = re.sub(r'^## (.+)$', r'<h2>\1</h2>', html, flags=re.MULTILINE)
    html = re.sub(r'^### (.+)$', r'<h3>\1</h3>', html, flags=re.MULTILINE)
    
    # Bold
    html = re.sub(r'\*\*(.+?)\*\*', r'<strong>\1</strong>', html)
    
    # Italic
    html = re.sub(r'(?<!\*)\*([^*]+?)\*(?!\*)', r'<em>\1</em>', html)
    
    # Blockquotes
    html = re.sub(r'^> (.+)$', r'<blockquote>\1</blockquote>', html, flags=re.MULTILINE)
    
    # Lists - process line by line
    lines = html.split('\n')
    result = []
    in_list = False
    
    for line in lines:
        stripped = line.strip()
        if stripped.startswith('- ') or stripped.startswith('* '):
            if not in_list:
                result.append('<ul>')
                in_list = True
            item = stripped[2:]
            result.append(f'<li>{item}</li>')
        else:
            if in_list:
                result.append('</ul>')
                in_list = False
            if stripped and not any(stripped.startswith(tag) for tag in ['<h', '<p', '<blockquote', '<ul', '</ul']):
                if stripped:
                    result.append(f'<p>{line}</p>')
                else:
                    result.append(line)
            else:
                result.append(line)
    
    if in_list:
        result.append('</ul>')
    
    html = '\n'.join(result)
    
    # Clean up empty paragraphs
    html = re.sub(r'<p>\s*</p>', '', html)
    
    return html

def markdown_to_html(markdown_text):
    """Convert markdown to HTML."""
    if HAS_MARKDOWN:
        md = markdown.Markdown(extensions=['extra', 'codehilite'])
        return md.convert(markdown_text)
    else:
        return simple_markdown_to_html(markdown_text)

def read_markdown_file(filepath):
    """Read markdown file and return content."""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            return f.read()
    except FileNotFoundError:
        return None

def generate_essay_html(essay_data, content_html):
    """Generate HTML for an individual essay page."""
    slug = essay_data['slug']
    title = essay_data['title']
    date = essay_data['date']
    read_time = essay_data['read_time']
    
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/svg+xml" href="../../favicon.svg">
    <title>{title} - Vivek Roy</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body>
    <div class="terminal-window">
        <div class="window-header">
            <div class="window-buttons">
                <span class="window-button button-close"></span>
                <span class="window-button button-minimize"></span>
                <span class="window-button button-maximize"></span>
            </div>
            <div class="window-title">vivekroyeng@github: ~/thoughts</div>
        </div>
        <div class="terminal-content">
            <div class="essay-content">
                <h1>{title}</h1>
                <div class="essay-meta">{date} · {read_time}</div>
                <div class="essay-body">
{content_html}
                </div>
            </div>
            <div class="command-line mt-4">
                <span class="prompt">vivekroyeng@github:~/thoughts$</span>
                <span class="command"> cd ..</span>
            </div>
            <a href="../../" class="back-link">← back to home</a>
        </div>
    </div>
    <script src="../../assets/js/main.js"></script>
</body>
</html>"""

def generate_index_html(essays):
    """Generate the main index.html file."""
    essay_links = ""
    for i, essay in enumerate(essays, 1):
        essay_links += f"""                <div class="file-line">
                    <span class="file-number">{i:02d}. </span>
                    <a href="thoughts/{essay['slug']}/" class="file-link">{essay['title']}</a>
                </div>
"""
    
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Thoughts by Vivek Roy - Notes on systems, products, and intelligence">
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
    <title>Vivek Roy - Thoughts and Musings</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="terminal-window">
        <div class="window-header">
            <div class="window-buttons">
                <span class="window-button button-close"></span>
                <span class="window-button button-minimize"></span>
                <span class="window-button button-maximize"></span>
            </div>
            <div class="window-title">vivekroyeng@github: ~/</div>
        </div>
        <div class="terminal-content">
            <div class="command-line">
                <span class="prompt">vivekroyeng@github:~$</span>
                <span class="command"> whoami </span>
            </div>
            <div class="output">
                Thoughts and Musings by Vivek Roy<br/>
                notes on engineering, management, systems, products, and *.*<span class="cursor"></span>
            </div>
            <div class="command-line mt-4">
                <span class="prompt">vivekroyeng@github:~$</span>
                <span class="command"> cd thoughts</span>
            </div>
            <div class="command-line">
                <span class="prompt">vivekroyeng@github:~/thoughts$</span>
                <span class="command"> ls</span>
            </div>
            <div class="output">
{essay_links}           </div>
            <div class="command-line mt-4">
                <span class="prompt">vivekroyeng@github:~/thoughts$</span>
                <span class="command"> cat README</span>
            </div>
            <div class="output">
                My notes from architecting platforms that empower builders and customers<br/>
                some thoughts deconstruct technical systems and architecture<br/>
                others examine the craft of product engineering<br/>
                rest on engineering management and leadership<br/>
                all grounded in real-world execution
            </div>
            <div class="command-line mt-4">
                <span class="prompt">vivekroyeng@github:~/links$</span>
                <span class="command"> open .</span>
            </div>
            <div class="output">
                <div class="link-line">
                    <span class="link-icon">↳ </span>
                    <a href="https://github.com/vivekroyeng" target="_blank" class="external-link">github</a>
                    <span class="link-desc"> code</span>
                </div>
                <div class="link-line">
                    <span class="link-icon">↳ </span>
                    <a href="https://linkedin.com/in/vivekroy" target="_blank" class="external-link">linkedin</a>
                    <span class="link-desc"> connect</span>
                </div>
                <div class="link-line">
                    <span class="link-icon">↳ </span>
                    <a href="mailto:vivekroy@gmail.com" class="external-link">email</a>
                    <span class="link-desc"> chat</span>
                </div>
            </div>
            <div class="copyright">© 2025 Vivek Roy</div>
        </div>
    </div>
    <script src="assets/js/main.js"></script>
</body>
</html>"""

def generate_thoughts_index_html(essays):
    """Generate thoughts/index.html file."""
    essay_links = ""
    for i, essay in enumerate(essays, 1):
        essay_links += f"""                <div class="file-line">
                    <span class="file-number">{i:02d}. </span>
                    <a href="{essay['slug']}/" class="file-link">{essay['title']}</a>
                </div>
"""
    
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Thoughts by Vivek Roy - Notes on systems, products, and intelligence">
    <link rel="icon" type="image/svg+xml" href="../favicon.svg">
    <title>Thoughts - Vivek Roy</title>
    <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>
    <div class="terminal-window">
        <div class="window-header">
            <div class="window-buttons">
                <span class="window-button button-close"></span>
                <span class="window-button button-minimize"></span>
                <span class="window-button button-maximize"></span>
            </div>
            <div class="window-title">vivekroyeng@github: ~/thoughts</div>
        </div>
        <div class="terminal-content">
            <div class="command-line">
                <span class="prompt">vivekroyeng@github:~/thoughts$</span>
                <span class="command"> ls</span>
            </div>
            <div class="output">
{essay_links}           </div>
            <div class="command-line mt-4">
                <span class="prompt">vivekroyeng@github:~/thoughts$</span>
                <span class="command"> cat README</span>
            </div>
            <div class="output">
                My notes from architecting platforms that empower builders and customers<br/>
                some thoughts deconstruct technical systems and architecture<br/>
                others examine the craft of product engineering<br/>
                rest on engineering management and leadership<br/>
                all grounded in real-world execution
            </div>
            <div class="command-line mt-4">
                <span class="prompt">vivekroyeng@github:~/thoughts$</span>
                <span class="command"> cd ..</span>
            </div>
            <a href="../" class="back-link">← back to home</a>
        </div>
    </div>
    <script src="../assets/js/main.js"></script>
</body>
</html>"""

def main():
    """Main build function."""
    base_dir = Path(__file__).parent
    thoughts_dir = base_dir / "thoughts"
    
    print("Building site...")
    print("=" * 50)
    
    # Generate index.html
    print("✓ Generating index.html...")
    index_html = generate_index_html(ESSAYS)
    with open(base_dir / "index.html", 'w', encoding='utf-8') as f:
        f.write(index_html)
    
    # Generate thoughts/index.html
    print("✓ Generating thoughts/index.html...")
    thoughts_index_html = generate_thoughts_index_html(ESSAYS)
    with open(thoughts_dir / "index.html", 'w', encoding='utf-8') as f:
        f.write(thoughts_index_html)
    
    # Generate essay pages
    for essay in ESSAYS:
        slug = essay['slug']
        md_file = thoughts_dir / essay['markdown']
        
        print(f"Processing {slug}...")
        
        # Read markdown
        md_content = read_markdown_file(md_file)
        if not md_content:
            print(f"  ⚠ Warning: No markdown file found for {slug}, skipping HTML generation...")
            print(f"  (HTML file may already exist at thoughts/{slug}/index.html)")
            continue
        
        # Convert to HTML
        content_html = markdown_to_html(md_content)
        
        # Create directory for essay
        essay_dir = thoughts_dir / slug
        essay_dir.mkdir(exist_ok=True)
        
        # Generate HTML
        essay_html = generate_essay_html(essay, content_html)
        
        # Write index.html in essay directory
        with open(essay_dir / "index.html", 'w', encoding='utf-8') as f:
            f.write(essay_html)
        
        print(f"  ✓ Created thoughts/{slug}/index.html")
    
    print("=" * 50)
    print("✓ Build complete!")
    print("\nTo add a new essay:")
    print("1. Create a markdown file in thoughts/ directory (e.g., my-essay.md)")
    print("2. Add entry to ESSAYS list in build.py:")
    print("   {")
    print('     "slug": "my-essay",')
    print('     "title": "My Essay Title",')
    print('     "date": "Jan 1, 2025",')
    print('     "read_time": "5 min read",')
    print('     "markdown": "my-essay.md"')
    print("   },")
    print("3. Run: python build.py")

if __name__ == "__main__":
    main()
