---
name: miller
description: Use Miller (mlr) for processing CSV, TSV, and tabular data files. Ideal for filtering, transforming, aggregating, joining, and format conversions (CSV↔JSON, TSV↔JSON). For JSON→JSON operations, prefer jq. Use when working with tabular data instead of awk/sed/grep.
---

# Miller (mlr) - Data Processing Tool

Miller is like awk, sed, cut, join, and sort for name-indexed data (CSV, TSV, JSON, etc.). It excels at operations on structured data files.

## Supported Formats

**Input/Output formats** (use `--icsv` for input, `--ocsv` for output):

- `csv` - Comma-separated values
- `tsv` - Tab-separated values
- `json` - JSON array of objects
- `jsonl` - JSON Lines (one object per line)
- `pprint` - Pretty-printed tabular
- `markdown` - Markdown tables
- `xtab` - Transposed tabular
- `dkvp` - Delimited key-value pairs (default)
- `nidx` - Numerically indexed (Unix-style)

**Keystroke-saver shortcuts** (preferred over `--icsv --ojson` etc.):

```bash
mlr --c2j cat data.csv          # CSV to JSON  (--c2j = --icsv --ojson)
mlr --j2c cat data.json         # JSON to CSV  (--j2c = --ijson --ocsv)
mlr --c2p cat data.csv          # CSV to pretty table
mlr --c2m cat data.csv          # CSV to Markdown table
mlr --c2t cat data.csv          # CSV to TSV
mlr --j2p cat data.json         # JSON to pretty table
```

Pattern: `--{from}2{to}` where c=CSV, t=TSV, j=JSON, l=JSONL, d=DKVP, p=PPRINT, m=Markdown, x=XTAB.
Use `--csv` (short for `--icsv --ocsv`) when input and output share the same format.

## Common Operations

### Filter Rows

```bash
# Filter by condition
mlr --csv filter '$age > 30' data.csv
mlr --csv filter '$color == "red"' data.csv
mlr --csv filter '$price > 100 && $category == "electronics"' data.csv
```

### Select/Remove Columns

```bash
# Keep only specific columns
mlr --csv cut -f name,email,age data.csv

# Remove columns
mlr --csv cut -x -f password,ssn data.csv
```

### Sort

```bash
# Sort by field (ascending)
mlr --csv sort -f name data.csv

# Sort by field (descending)
mlr --csv sort -nr price data.csv

# Sort by multiple fields
mlr --csv sort -f category,name data.csv
```

### Add/Modify Columns

```bash
# Add computed column
mlr --csv put '$total = $quantity * $price' data.csv

# Modify existing column
mlr --csv put '$price = $price * 1.1' data.csv

# Add multiple columns
mlr --csv put '$total = $quantity * $price; $tax = $total * 0.08' data.csv
```

### Statistics & Aggregation

```bash
# Basic stats on a field
mlr --csv stats1 -a mean,sum,count -f price data.csv

# Group by category and aggregate
mlr --csv stats1 -a mean,sum,count -f price -g category data.csv

# Multiple aggregations
mlr --csv stats1 -a min,mean,max,count -f quantity,price -g region data.csv
```

### Count & Frequency

```bash
# Count records
mlr --csv count data.csv

# Count distinct values
mlr --csv count-distinct -f category data.csv

# Most frequent values
mlr --csv most-frequent -f status -n 10 data.csv
```

### Join Files

```bash
# Inner join on 'id' field (left file via -f, right file is the main input)
mlr --csv join -f left.csv -j id right.csv

# Left join (inner + unmatched left records)
mlr --csv join -f left.csv -j id --ul right.csv

# Join on different field names (-j = output name, -l = left name, -r = right name)
mlr --csv join -f users.csv -j user_id -r order_id orders.csv
```

### Reshape & Restructure

```bash
# Rename columns
mlr --csv rename old_name,new_name data.csv

# Reorder columns
mlr --csv reorder -f name,email,age data.csv

# Flatten nested JSON
mlr --json flatten data.json

# Unflatten to nested JSON
mlr --json unflatten data.json
```

### Head/Tail

```bash
# First 10 records
mlr --csv head -n 10 data.csv

# Last 10 records
mlr --csv tail -n 10 data.csv
```

### Unique Records

```bash
# Get unique records (deduplicate)
mlr --csv uniq -a data.csv

# Unique by specific fields
mlr --csv uniq -f email data.csv
```

## Chaining Operations

Use `then` to chain multiple operations:

```bash
# Filter, then sort, then limit
mlr --csv filter '$price > 100' then sort -nr price then head -n 10 data.csv

# Compute field, aggregate, then sort
mlr --csv put '$revenue = $quantity * $price' \
  then stats1 -a sum -f revenue -g category \
  then sort -nr revenue_sum output.csv

# Multiple transformations
mlr --icsv --opprint \
  filter '$age >= 18' \
  then put '$age_group = $age >= 65 ? "senior" : "adult"' \
  then stats1 -a count -g age_group \
  data.csv
```

## When to Use Miller

**Use Miller for:**

- CSV/TSV file manipulation and analysis
- Format conversions between different formats (CSV → JSON, JSON → CSV, TSV → JSON, etc.)
- Multi-column operations on CSV/TSV data
- Statistical aggregations and grouping on tabular data
- Joining multiple CSV/TSV files
- Complex filtering on CSV/TSV/tabular data

**Use jq instead when:**

- JSON → JSON transformations (filtering, mapping, transforming JSON data)
- Deep nested JSON navigation and manipulation
- Complex JSON restructuring
- Working exclusively with JSON files (input and output both JSON)

**Miller vs jq for JSON:**

- Miller: Use for **format conversion** (CSV ↔ JSON) and tabular operations
- jq: Use for **JSON manipulation** (JSON → JSON transformations)

**Use awk/grep instead when:**

- Simple pattern matching in unstructured text
- Line-by-line text processing without column awareness

## Examples by Use Case

### Data Exploration

```bash
# Show first few records in pretty format
mlr --c2p head -n 5 data.csv

# Get summary statistics (default: field_type, count, mean, min, max, null_count, distinct_count)
mlr --csv summary data.csv
# All stats including quartiles, skewness, fences: mlr --csv summary --all data.csv
# Transposed output for fewer fields: mlr --csv summary --transpose data.csv

# Count records by category
mlr --csv count-distinct -f category data.csv
```

### Data Cleaning

```bash
# Remove empty columns
mlr --csv remove-empty-columns data.csv

# Clean whitespace
mlr --csv clean-whitespace data.csv

# Fill empty values with default
mlr --csv fill-empty -v "unknown" data.csv

# Fill only specific fields (use put for conditional logic)
mlr --csv put 'if ($status == "") {$status = "pending"}' data.csv
```

### Data Analysis

```bash
# Top 10 customers by revenue
mlr --csv stats1 -a sum -f amount -g customer_id \
  then sort -nr amount_sum \
  then head -n 10 data.csv

# Calculate percentages
mlr --csv stats1 -a count -g status \
  then fraction -f count data.csv
```

## Tips

1. **In-place editing:** Use `-I` flag: `mlr -I --csv sort -f name data.csv`
2. **`--from` for readability:** `mlr --csv --from data.csv filter '$age > 30' then sort -f name`
3. **Compressed input:** Read gzip/bz2/zstd directly: `mlr --csv --gzin cat data.csv.gz`
4. **No header row:** Add `--implicit-csv-header` then refer to columns as `1`, `2`, etc.
5. **Regex filter:** `mlr --csv filter '$name =~ "^A"'` for regex matching

For more info: `mlr help topics` or https://miller.readthedocs.io
