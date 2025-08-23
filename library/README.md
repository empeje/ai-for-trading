# Library

This folder contains shared utilities, functions, and modules that can be imported across multiple notebooks.

## Purpose

The library folder serves as a central location for:
- **Data loading utilities** - Functions to fetch and process financial data
- **Trading functions** - Common trading operations and calculations
- **Risk metrics** - Risk calculation and analysis functions
- **Visualization helpers** - Plotting and charting utilities
- **Data preprocessing** - Data cleaning and feature engineering functions

## Structure

```
library/
├── data/           # Data handling utilities
├── trading/        # Trading strategy functions
├── risk/           # Risk management functions
├── utils/          # General utility functions
├── viz/            # Visualization helpers
└── models/         # Model-related functions
```

## Usage

Import functions from the library in your notebooks:

```python
# Example imports
from library.data import load_stock_data
from library.trading import calculate_returns
from library.risk import sharpe_ratio
from library.viz import plot_returns
```

## Best Practices

1. **Keep functions focused** - Each function should do one thing well
2. **Add docstrings** - Document parameters, returns, and usage
3. **Handle errors gracefully** - Use try-catch blocks for data operations
4. **Make functions reusable** - Avoid hardcoded values
5. **Test functions** - Create unit tests for critical functions

## Adding New Functions

1. Create appropriate subfolder if it doesn't exist
2. Add your function to the relevant module
3. Update this README if adding new categories
4. Test the function in a notebook before committing

## Example Function

```python
def calculate_returns(prices, period=1):
    """
    Calculate period returns from price data.
    
    Args:
        prices (pd.Series): Price series
        period (int): Return period (default: 1)
    
    Returns:
        pd.Series: Returns series
    """
    return prices.pct_change(period)
```
