# Projects

This folder contains the actual AI trading projects - each subfolder represents a complete trading project with its own code, data, and results.

## Organization

Each subfolder represents a complete trading project with its own structure:

- **001-momentum-strategy/** - Momentum trading project (converted from getting-started)
- **002-portfolio-optimization/** - Portfolio construction and optimization
- **003-risk-analysis/** - Risk management and analysis project
- **004-backtesting/** - Strategy backtesting and validation
- **005-factor-models/** - Factor analysis and modeling project
- **006-ml-strategies/** - Machine learning trading approaches
- **007-sentiment-analysis/** - Alternative data and sentiment analysis
- **008-mean-reversion/** - Mean reversion strategy

## Naming Convention

Use numbered prefixes to maintain order:
- `01-` for foundational concepts and setup
- `02-` for basic trading strategies
- `03-` for intermediate portfolio concepts
- `04+` for advanced analysis and ML approaches

## Best Practices

1. **Keep projects focused** - One complete trading strategy per project folder
2. **Use descriptive names** - Make it clear what each project accomplishes
3. **Include markdown documentation** - Explain your strategy, approach, and findings
4. **Reference shared code** - Import functions from the `library/` folder
5. **Version control** - Commit projects regularly to track progress
6. **Make projects self-contained** - Each project folder should be a complete, runnable analysis

## Getting Started

1. Start with `001-getting-started/` to understand the project structure
2. Create new project folders for each trading strategy
3. Use the `library/` folder for reusable functions and utilities
4. Run `make notebook` to start the Jupyter server
5. Each project folder should be a complete, executable trading analysis
