#!/bin/bash
# Script to create the complete website structure
# Run this in an empty directory: bash create-site.sh

echo "Creating vivekroyeng.github.io website..."
echo ""

# Create directory structure
mkdir -p assets/css assets/js assets/images essays

# ============================================
# index.html
# ============================================
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Essays by Vivek Roy - Notes on systems, products, and intelligence">
    <title>Vivek Roy - Essays</title>
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
                <span class="command"> whoami 👋</span>
            </div>
            <div class="output">
                Essays by Vivek Roy<br/>
                notes on systems, products, and intelligence
            </div>
            <div class="command-line mt-4">
                <span class="prompt">vivekroyeng@github:~$</span>
                <span class="command"> cd essays</span>
            </div>
            <div class="command-line">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> ls</span>
            </div>
            <div class="output">
                <div class="file-line">
                    <span class="file-number">01. </span>
                    <a href="essays/the-manager-and-the-machine.html" class="file-link">The Manager and The Machine</a>
                </div>
                <div class="file-line">
                    <span class="file-number">02. </span>
                    <a href="essays/refinement-in-place.html" class="file-link">Refinement in Place</a>
                </div>
                <div class="file-line">
                    <span class="file-number">03. </span>
                    <a href="essays/proof-over-persuasion.html" class="file-link">Proof over Persuasion</a>
                </div>
                <div class="file-line">
                    <span class="file-number">04. </span>
                    <a href="essays/code-highest-resolution.html" class="file-link">Code Is the Highest-Resolution Expression of Intelligence</a>
                </div>
                <div class="file-line">
                    <span class="file-number">05. </span>
                    <a href="essays/work-charts-not-org-charts.html" class="file-link">Work Charts, Not Org Charts</a>
                </div>
                <div class="file-line">
                    <span class="file-number">06. </span>
                    <a href="essays/reflection-as-training-signal.html" class="file-link">Reflection as a Training Signal</a>
                </div>
            </div>
            <div class="command-line mt-4">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> cat README</span>
            </div>
            <div class="output">
                lived notes from making tools that other makers use<br/>
                some essays study the technical<br/>
                others explore the craft of building<br/>
                all are written from practice
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
                    <a href="https://x.com/vivekroyeng" target="_blank" class="external-link">x</a>
                    <span class="link-desc"> posts</span>
                </div>
                <div class="link-line">
                    <span class="link-icon">↳ </span>
                    <a href="mailto:vivek@example.com" class="external-link">email</a>
                    <span class="link-desc"> chat</span>
                </div>
            </div>
            <div class="copyright">© 2025 Vivek Roy</div>
        </div>
    </div>
    <script src="assets/js/main.js"></script>
</body>
</html>
EOF

echo "✓ Created index.html"

# ============================================
# CSS
# ============================================
cat > assets/css/style.css << 'EOF'
* { margin: 0; padding: 0; box-sizing: border-box; }

body {
    font-family: 'Monaco', 'Menlo', 'Consolas', monospace;
    background: #0d1117;
    color: #d4d4d4;
    padding: 2rem;
    line-height: 1.6;
    min-height: 100vh;
}

.terminal-window {
    max-width: 900px;
    margin: 0 auto;
    background: #1e1e1e;
    border-radius: 8px;
    box-shadow: 0 20px 60px rgba(0,0,0,0.5);
    overflow: hidden;
}

.window-header {
    background: #323232;
    padding: 12px 16px;
    display: flex;
    align-items: center;
    position: relative;
}

.window-buttons { display: flex; gap: 8px; }

.window-button {
    width: 12px;
    height: 12px;
    border-radius: 50%;
    display: inline-block;
}

.button-close { background: #ff5f57; }
.button-minimize { background: #ffbd2e; }
.button-maximize { background: #28c840; }

.window-title {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    color: #8b8b8b;
    font-size: 13px;
}

.terminal-content { padding: 24px; font-size: 14px; }

.command-line {
    display: flex;
    gap: 4px;
    margin-bottom: 8px;
    flex-wrap: wrap;
}

.prompt { color: #98c379; white-space: nowrap; }
.command { color: #d4d4d4; }
.output { margin-bottom: 16px; color: #abb2bf; }
.mt-4 { margin-top: 24px; }

.file-line {
    margin: 4px 0;
    display: flex;
    align-items: flex-start;
}

.file-number {
    color: #5c6370;
    margin-right: 8px;
    min-width: 32px;
}

.file-link {
    color: #61afef;
    text-decoration: none;
    transition: all 0.2s;
}

.file-link:hover {
    text-decoration: underline;
    color: #89c0f5;
}

.link-line { margin: 4px 0; }
.link-icon { color: #5c6370; margin-right: 4px; }

.external-link {
    color: #61afef;
    text-decoration: none;
    transition: all 0.2s;
}

.external-link:hover {
    text-decoration: underline;
    color: #89c0f5;
}

.link-desc { color: #abb2bf; }
.copyright { margin-top: 32px; color: #5c6370; font-size: 12px; }

.essay-content {
    margin: 24px 0;
    padding: 24px;
    background: #252525;
    border-radius: 4px;
    border-left: 3px solid #61afef;
}

.essay-content h1 {
    color: #e06c75;
    font-size: 24px;
    margin-bottom: 24px;
    font-weight: 600;
}

.essay-content p {
    color: #d4d4d4;
    margin-bottom: 16px;
    line-height: 1.8;
}

.back-link {
    color: #61afef;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 4px;
    padding: 8px 16px;
    border: 1px solid #61afef;
    border-radius: 4px;
    transition: all 0.2s;
}

.back-link:hover {
    background: #61afef;
    color: #1e1e1e;
}

@media (max-width: 768px) {
    body { padding: 1rem; }
    .terminal-content { padding: 16px; font-size: 13px; }
}
EOF

echo "✓ Created assets/css/style.css"

# ============================================
# JavaScript
# ============================================
cat > assets/js/main.js << 'EOF'
document.addEventListener('DOMContentLoaded', function() {
    console.log('Terminal loaded');
});
EOF

echo "✓ Created assets/js/main.js"

# ============================================
# Essay Template
# ============================================
cat > essays/essay-template.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ESSAY_TITLE - Vivek Roy</title>
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
            <div class="window-title">vivekroyeng@github: ~/essays</div>
        </div>
        <div class="terminal-content">
            <div class="command-line">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> cat ESSAY_FILE.md</span>
            </div>
            <div class="essay-content">
                <h1>ESSAY_TITLE</h1>
                <p>ESSAY_CONTENT</p>
            </div>
            <div class="command-line mt-4">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> cd ..</span>
            </div>
            <a href="../index.html" class="back-link">← back to home</a>
        </div>
    </div>
    <script src="../assets/js/main.js"></script>
</body>
</html>
EOF

# ============================================
# Essay 1
# ============================================
cat > essays/the-manager-and-the-machine.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Manager and The Machine - Vivek Roy</title>
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
            <div class="window-title">vivekroyeng@github: ~/essays</div>
        </div>
        <div class="terminal-content">
            <div class="command-line">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> cat the_manager_and_the_machine.md</span>
            </div>
            <div class="essay-content">
                <h1>The Manager and The Machine</h1>
                <p>This essay explores the evolving relationship between human managers and AI systems in modern organizations.</p>
            </div>
            <div class="command-line mt-4">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> cd ..</span>
            </div>
            <a href="../index.html" class="back-link">← back to home</a>
        </div>
    </div>
    <script src="../assets/js/main.js"></script>
</body>
</html>
EOF

echo "✓ Created essays/the-manager-and-the-machine.html"

# ============================================
# Essay 2
# ============================================
cat > essays/refinement-in-place.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Refinement in Place - Vivek Roy</title>
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
            <div class="window-title">vivekroyeng@github: ~/essays</div>
        </div>
        <div class="terminal-content">
            <div class="command-line">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> cat refinement_in_place.md</span>
            </div>
            <div class="essay-content">
                <h1>Refinement in Place</h1>
                <p>The best work happens through continuous refinement rather than radical reinvention.</p>
            </div>
            <div class="command-line mt-4">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> cd ..</span>
            </div>
            <a href="../index.html" class="back-link">← back to home</a>
        </div>
    </div>
    <script src="../assets/js/main.js"></script>
</body>
</html>
EOF

echo "✓ Created essays/refinement-in-place.html"

# ============================================
# Essay 3
# ============================================
cat > essays/proof-over-persuasion.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proof over Persuasion - Vivek Roy</title>
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
            <div class="window-title">vivekroyeng@github: ~/essays</div>
        </div>
        <div class="terminal-content">
            <div class="command-line">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> cat proof_over_persuasion.md</span>
            </div>
            <div class="essay-content">
                <h1>Proof over Persuasion</h1>
                <p>In a world of rhetoric, demonstration cuts through the noise better than words ever could.</p>
            </div>
            <div class="command-line mt-4">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> cd ..</span>
            </div>
            <a href="../index.html" class="back-link">← back to home</a>
        </div>
    </div>
    <script src="../assets/js/main.js"></script>
</body>
</html>
EOF

echo "✓ Created essays/proof-over-persuasion.html"

# ============================================
# Essay 4
# ============================================
cat > essays/code-highest-resolution.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Code Is the Highest-Resolution Expression of Intelligence - Vivek Roy</title>
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
            <div class="window-title">vivekroyeng@github: ~/essays</div>
        </div>
        <div class="terminal-content">
            <div class="command-line">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> cat code_highest_resolution.md</span>
            </div>
            <div class="essay-content">
                <h1>Code Is the Highest-Resolution Expression of Intelligence</h1>
                <p>Language is ambiguous, but code is precise and forces complete clarity of thought.</p>
            </div>
            <div class="command-line mt-4">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> cd ..</span>
            </div>
            <a href="../index.html" class="back-link">← back to home</a>
        </div>
    </div>
    <script src="../assets/js/main.js"></script>
</body>
</html>
EOF

echo "✓ Created essays/code-highest-resolution.html"

# ============================================
# Essay 5
# ============================================
cat > essays/work-charts-not-org-charts.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Work Charts, Not Org Charts - Vivek Roy</title>
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
            <div class="window-title">vivekroyeng@github: ~/essays</div>
        </div>
        <div class="terminal-content">
            <div class="command-line">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> cat work_charts_not_org_charts.md</span>
            </div>
            <div class="essay-content">
                <h1>Work Charts, Not Org Charts</h1>
                <p>Great teams optimize for information flow, not reporting structure.</p>
            </div>
            <div class="command-line mt-4">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> cd ..</span>
            </div>
            <a href="../index.html" class="back-link">← back to home</a>
        </div>
    </div>
    <script src="../assets/js/main.js"></script>
</body>
</html>
EOF

echo "✓ Created essays/work-charts-not-org-charts.html"

# ============================================
# Essay 6
# ============================================
cat > essays/reflection-as-training-signal.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reflection as a Training Signal - Vivek Roy</title>
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
            <div class="window-title">vivekroyeng@github: ~/essays</div>
        </div>
        <div class="terminal-content">
            <div class="command-line">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> cat reflection_as_training_signal.md</span>
            </div>
            <div class="essay-content">
                <h1>Reflection as a Training Signal</h1>
                <p>We learn not from experience itself, but from reflection on experience.</p>
            </div>
            <div class="command-line mt-4">
                <span class="prompt">vivekroyeng@github:~/essays$</span>
                <span class="command"> cd ..</span>
            </div>
            <a href="../index.html" class="back-link">← back to home</a>
        </div>
    </div>
    <script src="../assets/js/main.js"></script>
</body>
</html>
EOF

echo "✓ Created essays/reflection-as-training-signal.html"

# ============================================
# README
# ============================================
cat > README.md << 'EOF'
# vivekroyeng.github.io

Personal website featuring essays on systems, products, and intelligence.

## Quick Start
```bash
# Open index.html in browser or run:
python -m http.server 8000
```

## Structure
```
├── index.html              # Home page
├── assets/
│   ├── css/style.css      # Styles
│   └── js/main.js         # Scripts
└── essays/                # Essay pages
```

## Deploy to GitHub Pages
1. Create repo: `vivekroyeng.github.io`
2. Push files to main branch
3. Enable Pages in Settings

© 2025 Vivek Roy
EOF

echo "✓ Created README.md"
echo ""
echo "================================================"
echo "✅ Website created successfully!"
echo "================================================"
echo ""
echo "Next steps:"
echo "1. Save this script as 'create-site.sh'"
echo "2. Run: bash create-site.sh"
echo "3. Open index.html in browser to test"
echo "4. Push to GitHub to deploy"
echo ""