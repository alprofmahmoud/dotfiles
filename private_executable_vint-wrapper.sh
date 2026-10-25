#!/bin/bash
PYTHONWARNINGS="ignore" vint "$@" 2>&1 | grep -v "UserWarning"
