"""
Sphinx configuration for openedx-webhooks-data-schema documentation.
"""

import os
import sys
from datetime import datetime

# Add the src/ directory to the path for autodoc
sys.path.insert(0, os.path.abspath("../src"))

# -- Project information -----------------------------------------------------

project = "openedx-webhooks-data-schema"
copyright = f"{datetime.now().year}, Axim Collaborative, Inc."
author = "Axim Collaborative, Inc."

# -- General configuration ---------------------------------------------------

extensions = [
    "sphinx.ext.autodoc",
    "sphinx.ext.viewcode",
]

templates_path = ["_templates"]
exclude_patterns = ["_build", "Thumbs.db", ".DS_Store"]

# -- Options for HTML output -------------------------------------------------

html_theme = "sphinx_book_theme"
