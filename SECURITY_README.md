# Security Setup with Gitleaks

This repository is protected by [Gitleaks](https://github.com/gitleaks/gitleaks-action), a powerful secret detection tool that automatically scans for sensitive information like API keys, passwords, and credentials.

## 🚀 Quick Start

### 1. Automatic Protection
- **Every commit** is automatically scanned
- **Every PR** gets security validation
- **Daily scans** run automatically at 4 AM UTC
- **Manual scans** can be triggered via GitHub Actions

### 2. What Gets Detected
- 🔴 **Critical**: API keys, database credentials, auth tokens
- 🟠 **High**: Private keys, passwords in code, JWT tokens  
- 🟡 **Medium**: Webhook URLs, email credentials, high-entropy strings

### 3. Local Development
```bash
# Install Gitleaks locally
brew install gitleaks  # macOS
# or
wget -qO- https://raw.githubusercontent.com/gitleaks/gitleaks/master/install.sh | sh  # Linux

# Run scan locally
gitleaks detect --source . --config .gitleaks.toml --verbose
```

## 📁 Files Overview

```
.github/workflows/gitleaks.yml    # GitHub Actions workflow
.gitleaks.toml                    # Gitleaks configuration
.gitignore                        # Excludes sensitive files
SECURITY.md                       # Security guidelines
env.template                      # Environment variables template
.pre-commit-config.yaml          # Pre-commit hooks
```

## 🔧 Configuration

### Custom Rules
The `.gitleaks.toml` file includes:
- **AI Trading specific patterns** (Alpaca, Robinhood, financial APIs)
- **Cloud provider credentials** (AWS, Google Cloud, Azure)
- **Database connection strings**
- **Entropy-based detection** for unknown patterns

### Allowlists
Common false positives are automatically excluded:
- Test files and examples
- Documentation files
- Lock files and dependencies
- Generated code

## 🚨 When Secrets Are Detected

### In Pull Requests
- ❌ **Blocked from merging** until issues are resolved
- 📝 **Detailed comments** with remediation steps
- 🏷️ **Security labels** automatically added
- 📊 **Severity breakdown** (Critical/High/Medium)

### In Commits
- 🚫 **Workflow fails** with detailed error messages
- 📋 **Artifacts uploaded** for review
- 🔍 **Full scan reports** available for download

## 🛠️ Remediation

### 1. Remove Exposed Secrets
```bash
# Remove from git history
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch path/to/file' \
  --prune-empty --tag-name-filter cat -- --all

# Force push to update remote
git push origin --force --all
```

### 2. Use Environment Variables
```python
# ❌ Don't do this
API_KEY = "sk-1234567890abcdef"

# ✅ Do this instead
import os
API_KEY = os.getenv("API_KEY")
```

### 3. Configuration Files
```python
# config.py
config = {
    "api_key": os.getenv("API_KEY", "your-api-key-here"),
    "database_url": os.getenv("DATABASE_URL", "your-database-url-here")
}
```

## 📋 Best Practices

### Before Committing
1. **Never commit real credentials**
2. **Use placeholder values** for examples
3. **Test with environment variables**
4. **Run local Gitleaks scan**

### Environment Management
1. **Create `.env` file** from `env.template`
2. **Add `.env` to `.gitignore`**
3. **Use different files** for different environments
4. **Rotate credentials regularly**

### Code Patterns
```python
# Good patterns
API_KEY = os.getenv("API_KEY")
config = load_config_from_env()

# Avoid these patterns
API_KEY = "sk-1234567890abcdef"
password = "mypassword123"
```

## 🔍 Troubleshooting

### False Positives
If legitimate code is flagged:
1. **Add to allowlist** in `.gitleaks.toml`
2. **Use more specific exclusions**
3. **Refactor code** to avoid triggering rules
4. **Adjust entropy thresholds**

### Common Issues
- **Workflow failing**: Check Gitleaks report for details
- **Missing permissions**: Ensure GitHub token has proper access
- **Configuration errors**: Validate `.gitleaks.toml` syntax

## 📚 Resources

- [Gitleaks Documentation](https://gitleaks.io/)
- [GitHub Security Best Practices](https://docs.github.com/en/github/security)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Secret Management Guide](SECURITY.md)

## 🆘 Support

- **Security issues**: Create a security advisory
- **False positives**: Update `.gitleaks.toml` allowlist
- **Configuration help**: Check the [official docs](https://github.com/gitleaks/gitleaks-action)

---

**Remember**: Security is everyone's responsibility. When in doubt, ask before committing!
