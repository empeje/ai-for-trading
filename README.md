# About

AI for Trading is a repository mainly for personal use and secondarily for others who are in the same path trying to learn and use AI/ML for trading.

# Motivation

## Entrepreneurship

Very recently I'm more and more interested in learning and applying more concept of ML to trading, also known as algorithmic trading, as it provides a unique opportunity for technical mind like myself who are interested in entrepreneurship. **Unlike** many other form of entrepreneurship, for example startups or consulting (like I did years ago with [Kulkul][KULKUL]), algorithmic trading

1. doesn't require you to do marketing;

2. doesn't require you to leave your job while building your business; there's always market that is open in 24/7 where you are especially crypto, so it is an opportunity to do it after work;

3. you can focus on what you like, which is a technical stuff;

4. you get an immediate feedback loop when developing your idea and also when deploying your idea.

## Materials

Another very niche reason is because I want to subscribe to AI for Trading from Udacity but I couldn't because somehow my country is not allowed to subscribe, and also I figured I can curate my own version and also see their [open source materials][AI_FOR_TRADING].

## Antifragility

I also want to open-source it because open-source is antifragile, it keeps live in the internet and the heart of people with the same interest once you put it open in the internet.

## Project Structure

```
ai-for-trading/
├── projects/            # Contains the actual trading projects
│   ├── 001-momentum-strategy/      # Momentum trading project (converted from getting-started)
│   │   ├── main.ipynb              # Main project notebook
│   │   ├── data/                   # Project-specific data
│   │   ├── results/                # Generated outputs
│   │   └── config/                 # Configuration files
│   ├── 002-portfolio-optimization/ # Portfolio optimization project
│   ├── 003-risk-analysis/          # Risk management project
│   ├── 004-backtesting/            # Strategy backtesting
│   ├── 005-factor-models/          # Factor analysis
│   ├── 006-ml-strategies/          # Machine learning
│   ├── 007-sentiment-analysis/     # Alternative data
│   └── 008-mean-reversion/         # Mean reversion strategy
├── library/             # Shared utilities and functions
│   ├── data/           # Data handling utilities
│   ├── trading/        # Trading functions
│   ├── risk/           # Risk management
│   └── ...             # Other shared modules
├── Makefile            # Easy project management
└── pyproject.toml      # Project dependencies
```

Each project folder in `projects/` contains a complete, executable trading project with its own code, data, and results.


[KULKUL]: https://kulkul.tech
[AI_FOR_TRADING]: https://github.com/udacity/artificial-intelligence-for-trading