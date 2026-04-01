# AutoMakefile

A Bash script that automatically generates a `Makefile` from a simple semicolon-separated configuration file.

> Epitech Project — 2024

---

## Usage

```bash
./automakefile <config_file>
```

The script reads the configuration file, extracts project settings and source files, then writes a fully functional `Makefile` to the path defined by `PROJECT_DIR`.

---

## Configuration File Format

Each line follows the pattern:

```
KEY;VALUE
```

### Required fields

| Key           | Description                                         |
|---------------|-----------------------------------------------------|
| `PROJECT_DIR` | Project name and output directory for the Makefile  |

### Optional fields

| Key           | Description                                          |
|---------------|------------------------------------------------------|
| `EXEC`        | Name of the output binary                            |
| `CC`          | Compiler to use (e.g. `gcc`)                         |
| `SOURCES_DIR` | Directory containing source files                    |
| `CFLAGS`      | Compiler flags (e.g. `-Wall -Wextra`)                |
| `HEADERS_DIR` | Directory containing header files                    |
| `LIBS_DIR`    | Directory containing libraries                       |
| `LDFLAGS`     | Linker flags                                         |
| `BCK_DIR`     | Backup/archive output directory                      |
| `ZIP`         | Archive tool (e.g. `tar`)                            |
| `ZIPFLAGS`    | Flags for the archive tool                           |
| `UNZIP`       | Extraction tool (e.g. `tar`)                         |
| `UNZIPFLAGS`  | Flags for the extraction tool                        |

### Source files

Any line whose first field (before `;`) contains `.c` is treated as a source file and added to the `SRC` variable in the Makefile.

### Example configuration file

```
PROJECT_DIR;my_project;./
EXEC;my_binary
CC;gcc
SOURCES_DIR;src
CFLAGS;-Wall -Wextra
HEADERS_DIR;include
LIBS_DIR;lib
LDFLAGS;-lm
BCK_DIR;backup
ZIP;tar
ZIPFLAGS;-czf
UNZIP;tar
UNZIPFLAGS;-xzf
main.c
utils.c
parser.c
```

---

## Generated Makefile Targets

| Target    | Description                                          |
|-----------|------------------------------------------------------|
| `all`     | Builds the project (default target)                  |
| `clean`   | Removes object files and temporary files             |
| `fclean`  | Runs `clean` and removes the binary                  |
| `re`      | Runs `fclean` then `all`                             |
| `archive` | Creates a compressed archive of source files         |
| `revert`  | Extracts the latest archive                          |
| `num`     | Prints the current `make` version                    |
| `delete`  | Deletes all archives from the backup directory       |

---

## Exit Codes

| Code | Meaning                                               |
|------|-------------------------------------------------------|
| `0`  | Success                                               |
| `84` | Error — missing argument, file not found, or missing `PROJECT_DIR` field |

---

## Other Scripts

### `skip-synthesis.sh`

A utility script that filters lines from standard input, keeping only those whose last field starts with the given prefix.

```bash
./skip-synthesis.sh <prefix>
```
