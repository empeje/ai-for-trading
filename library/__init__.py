"""
AI Trading Library

A collection of utilities and functions for AI-powered trading strategies.
"""

__version__ = "0.1.0"
__author__ = "AI Trading Team"

# Import common functions for easy access
try:
    from .data import *
    from .trading import *
    from .risk import *
    from .utils import *
    from .viz import *
    from .models import *
except ImportError:
    # Modules not yet implemented
    pass

__all__ = [
    # Add function names here as they're implemented
]
