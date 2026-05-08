---
name: miller
description: Use Miller (mlr) for processing CSV, TSV, and tabular data files. Ideal for filtering, transforming, aggregating, joining, and format conversions (CSV↔JSON, TSV↔JSON). For JSON→JSON operations, prefer jq. Use when working with tabular data instead of awk/sed/grep.
---

# Miller (mlr)

Miller is awk/sed/cut/join/sort for name-indexed data (CSV, TSV, JSON). Prefer it over awk/sed/grep for structured tabular data.

## Format Shortcuts

```bash
mlr --c2j cat data.csv       # CSV → JSON
mlr --j2c cat data.json      # JSON → CSV
mlr --c2p cat data.csv       # CSV → pretty table
mlr --c2m cat data.csv       # CSV → Markdown table
mlr --c2t cat data.csv       # CSV → TSV
mlr --j2p cat data.json      # JSON → pretty table
```

Pattern: `--{from}2{to}` (c=CSV, t=TSV, j=JSON, l=JSONL, p=PPRINT, m=Markdown). Use `--csv` when input and output format are the same.

## Core Operations

```bash
# Filter, select/remove columns, sort, compute
mlr --csv filter '$age > 30' data.csv
mlr --csv cut -f name,email data.csv
mlr --csv cut -x -f password data.csv
mlr --csv sort -nr price data.csv
mlr --csv put '$total = $qty * $price' data.csv

# Aggregation
mlr --csv stats1 -a mean,sum,count -f price -g category data.csv
mlr --csv count-distinct -f status data.csv

# Join (inner join on 'id')
mlr --csv join -f left.csv -j id right.csv

# Chain with then
mlr --csv filter '$price > 100' then sort -nr price then head -n 10 data.csv
```

## Miller vs jq

- **Miller**: CSV/TSV manipulation and CSV↔JSON format conversion
- **jq**: JSON→JSON transformations and deep JSON navigation

## Tips

- In-place edit: `mlr -I --csv sort -f name data.csv`
- Read compressed: `mlr --csv --gzin cat data.csv.gz`
- Summary stats: `mlr --csv summary data.csv`
- For more: `mlr help topics`
