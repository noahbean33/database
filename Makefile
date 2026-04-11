CC = gcc
CFLAGS = -Wall -Wextra

SRC = src/db.c
TARGET = db

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)

run: $(TARGET)
	./$(TARGET) mydb.db

clean:
	rm -f $(TARGET) $(TARGET).exe *.db

test: $(TARGET)
	python -m pytest tests/test_db.py -v

format:
	clang-format -style=Google -i src/*.c

.PHONY: all run clean test format