"""
Schema for repo-tools-data.
"""

from importlib.metadata import PackageNotFoundError, version

try:
    __version__ = version("repo-tools-data-schema")
except PackageNotFoundError:
    __version__ = "unknown"

from .repo_tools_data_schema import validate_orgs as validate_orgs
from .repo_tools_data_schema import validate_salesforce_export as validate_salesforce_export
