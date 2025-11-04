## About This Repository

This `.github` repository contains the **organization-wide community and policy files** for the [MonkeyPatchers](https://github.com/MonkeyPatchers) open-source collective.

GitHub automatically uses these files as defaults for any repository in the organization that doesn’t provide its own versions.

### 📄 What's Included

#### Community Health Files
| File | Purpose |
|------|----------|
| `.github/CODE_OF_CONDUCT.md` | Sets expectations for respectful collaboration |
| `.github/CONTRIBUTING.md` | Explains how to propose changes and report issues |
| `.github/SECURITY.md` | Describes how to report security vulnerabilities privately |

#### Legal Files
| File | Purpose |
|------|----------|
| `LICENSE` | Standard MIT License for source code |
| `LICENSE-docs` | CC BY 4.0 for documentation and non-code assets |
| `NOTICE` | Additional disclaimers and trademark information |

#### Development Templates
| File/Directory | Purpose |
|------|----------|
| `.github/pull_request_template.md` | Standard pull request template |
| `.github/ISSUE_TEMPLATE/` | Issue templates for bugs, features, security, and docs |
| `.github/workflows/` | Starter GitHub Actions workflows (CI, security, docs, release) |
| `.github/dependabot.yml` | Automated dependency update configuration |
| `.gitignore` | Comprehensive ignore file for Node.js/TypeScript projects |

#### Documentation
| File | Purpose |
|------|----------|
| `README.md` | This overview file |

### ⚙️ How It Works
- These files act as defaults for all MonkeyPatchers projects when placed under the `.github/` directory of this repository (GitHub requirement).
- Individual repositories can override them by including their own versions.
- The organization uses **MIT** for source code and **CC BY 4.0** for documentation, images, and other non-code materials.
- Note: LICENSE files are not inherited by default; each repository should copy `LICENSE`, `LICENSE-docs`, and `NOTICE` into its project root.

### 🧰 For New Projects

When creating a new MonkeyPatchers repository:

1. **Copy License Files**: Copy `LICENSE`, `LICENSE-docs`, and `NOTICE` from this repo into your project root.

2. **Copy Development Files** (optional but recommended):
   - Copy `.gitignore` if building a Node.js/TypeScript project
   - The PR template, issue templates, and workflows will be inherited automatically from this org repo

3. **Link to Org Policies**: Include a short note in your README linking to the org-wide
   [Code of Conduct](https://github.com/MonkeyPatchers/.github/blob/main/.github/CODE_OF_CONDUCT.md)
   and [Security Policy](https://github.com/MonkeyPatchers/.github/blob/main/.github/SECURITY.md).

4. **Customize as Needed**: 
   - Override any template by creating your own version in your repository
   - Customize workflows by copying and modifying them in your repo's `.github/workflows/` directory
   - Add project-specific contribution guidelines to your own `CONTRIBUTING.md`

5. **Configure Dependabot**: The dependabot configuration will be inherited, but you can override it if needed.

### 🪪 Legal & Trademark Notice
**MonkeyPatchers™** and the MonkeyPatchers logo are claimed marks of the MonkeyPatchers open-source collective (see `NOTICE` file for details).  
Use of these marks must follow community guidelines and may not imply endorsement.

---

## 🧪 Local Development

### Running Lints Locally

Before creating a PR, you can run the same linting checks locally:

#### Using npm scripts (recommended):

```bash
# Install linting tools (one-time setup)
npm run install-tools

# Run all lints
npm run lint

# Or run individual checks
npm run lint:md        # Markdown structure
npm run lint:spell     # Spell checking
npm run lint:format    # Format checking
npm run lint:links     # Link validation

# Auto-fix formatting issues
npm run format
```

#### Using the bash script:

```bash
# Run all checks
./scripts/lint.sh
```

### Manual Tool Installation

If you prefer to install tools individually:

```bash
# Markdown linting
npm install -g markdownlint-cli2

# Spell checking
npm install -g cspell

# Format checking
npm install -g prettier

# Link validation
npm install -g markdown-link-check
```

---

## 📚 Template Details

### Issue Templates

This repository provides the following issue templates:

- **Bug Report**: For reporting bugs and unexpected behavior
- **Feature Request**: For suggesting new features or enhancements
- **Security Vulnerability**: Guidance on privately reporting security issues (redirects to proper channels)
- **Documentation Improvement**: For suggesting documentation updates

### GitHub Actions Workflows

Starter workflows included (customize as needed):

- **`ci.yml`**: Continuous integration (lint, test, build)
- **`security.yml`**: Security scanning (npm audit, Trivy, CodeQL)
- **`docs.yml`**: Documentation checks (markdown lint, spell check, link validation)
- **`release.yml`**: Automated release creation on version tags

### Dependabot Configuration

Automated dependency updates for:
- npm packages (weekly, grouped by type)
- GitHub Actions (weekly)
- Docker images (weekly, if applicable)

---

This structure keeps all projects within the organization consistent, transparent, and easy to contribute to.
