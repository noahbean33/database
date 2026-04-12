# database

A simple SQLite-like database engine written from scratch in C. It implements a persistent, B-tree backed single-table database with an interactive REPL.

## Features

- **B-tree storage engine** — data is indexed using a B-tree with automatic leaf and internal node splitting
- **Persistent to disk** — rows are stored in fixed-size 4096-byte pages and flushed to a file on exit
- **REPL interface** — interactive prompt for executing commands
- **INSERT / SELECT** — insert rows and retrieve all rows from the table

## Table Schema

The database stores a single hardcoded table:

| Column   | Type         |
|----------|--------------|
| id       | uint32       |
| username | varchar(32)  |
| email    | varchar(255) |

## Building

```bash
make
```

Or using the build script:

```bash
bash build.sh
```

## Usage

```bash
./db mydb.db
```

### SQL Commands

```
db > insert 1 alice alice@example.com
Executed.
db > insert 2 bob bob@example.com
Executed.
db > select
(1, alice, alice@example.com)
(2, bob, bob@example.com)
Executed.
```

### Meta-Commands

| Command      | Description                        |
|--------------|------------------------------------|
| `.exit`      | Save the database and exit         |
| `.btree`     | Print the B-tree structure         |
| `.constants` | Print storage layout constants     |

## Testing

Tests are written in Python (translated from the original RSpec suite) and validate the compiled `db` binary end-to-end:

```bash
make test
```

Requires Python 3 and pytest (`pip install pytest`).

## Project Structure

```
├── src/
│   └── db.c           # Complete database implementation
├── tests/
│   └── test_db.py     # End-to-end test suite
├── spec/
│   └── main_spec.rb   # Original RSpec tests (reference)
├── Makefile            # Build and test targets
├── build.sh            # Convenience build script
└── README.md
```

## License

See [LICENSE](LICENSE) for details.
