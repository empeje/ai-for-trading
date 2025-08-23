# Security Guidelines

## Secret Management

This repository uses [Gitleaks](https://github.com/gitleaks/gitleaks-action) to automatically scan for potential secrets and sensitive information. The scanning is integrated into our CI/CD pipeline and runs on every commit, pull request, and daily via scheduled scans.

### What Gets Scanned

Our enhanced Gitleaks configuration detects:

- **🔴 Critical**: API keys, database credentials, authentication tokens
- **🟠 High**: Private keys, passwords in code, JWT tokens
- **🟡 Medium**: Webhook URLs, email credentials, high-entropy strings

### Before Committing

1. **Never commit real credentials** - Use environment variables or secure secret management
2. **Use placeholder values** for examples:
   ```python
   # ❌ Don't do this
   API_KEY = "sk-1234567890abcdef"
   
   # ✅ Do this instead
   API_KEY = os.getenv("API_KEY")
   # or
   API_KEY = "your-api-key-here"  # placeholder
   ```

### Environment Variables

Create a `.env` file (not tracked by git) for local development:

```bash
# .env (not committed)
ALPHA_VANTAGE_API_KEY=your_real_key_here
YAHOO_FINANCE_API_KEY=your_real_key_here
DATABASE_URL=your_database_url_here
OPENAI_API_KEY=sk-your-real-key-here
```

### Configuration Files

Use configuration files with placeholders:

```python
# config.py
import os
from pathlib import Path

# Load from environment or use defaults
config = {
    "api_key": os.getenv("API_KEY", "your-api-key-here"),
    "database_url": os.getenv("DATABASE_URL", "your-database-url-here"),
    "openai_key": os.getenv("OPENAI_API_KEY", "your-openai-key-here")
}

# Validate required keys
required_keys = ["api_key", "database_url"]
for key in required_keys:
    if config[key] == f"your-{key.replace('_', '-')}-here":
        raise ValueError(f"Please set {key} in environment variables")
```

### Running Gitleaks Locally

Install Gitleaks:
```bash
# macOS
brew install gitleaks

# Ubuntu/Debian
wget -qO- https://raw.githubusercontent.com/gitleaks/gitleaks/master/install.sh | sh

# Run scan
gitleaks detect --source . --config .gitleaks.toml --verbose
```

### False Positives

If Gitleaks flags legitimate code as a secret:

1. **Add to allowlist** in `.gitleaks.toml`
2. **Use more specific exclusions**
3. **Refactor code** to avoid triggering rules
4. **Add entropy thresholds** for better accuracy

### Emergency Response

If you accidentally commit a secret:

1. **Immediately revoke/rotate the secret**
2. **Remove from git history**:
   ```bash
   git filter-branch --force --index-filter \
     'git rm --cached --ignore-unmatch path/to/file' \
     --prune-empty --tag-name-filter cat -- --all
   ```
3. **Force push** to update remote
4. **Notify team** about the incident
5. **Document the incident** for future reference

### Security Best Practices

1. **Use secret management services** (AWS Secrets Manager, HashiCorp Vault, etc.)
2. **Implement least privilege access**
3. **Regular credential rotation**
4. **Monitor access logs**
5. **Use temporary credentials** when possible

### Compliance

This setup helps with:
- **SOC 2** compliance
- **GDPR** requirements
- **Financial regulations** (SOX, PCI-DSS)
- **Industry standards** (ISO 27001)

## Contact

For security issues, please contact the repository maintainers or create a security advisory.

## Resources

- [Gitleaks Documentation](https://gitleaks.io/)
- [GitHub Security Best Practices](https://docs.github.com/en/github/security)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
