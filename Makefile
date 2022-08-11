NAME = my_blockchain

OBJ = obj/main.o\
	obj/parse_save.o\
	obj/helpers.o\
	obj/string_mgmt.o\
	obj/blockchain.o\
	obj/action.o\

CFLAGS += -Iinclude -Wall -Wextra -Werror 

HEADER = include/main.h\
	include/parse_save.h\
	include/blockchain.h\
	include/helpers.h\
	include/string_mgmt.h\
	include/action.h\

BIN = bin/my_blockchain
CC = gcc
RM = rm -rf

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) -o $(BIN) $(OBJ) $(CFLAGS)

obj/main.o: src/main.c
	${CC} ${CFLAGS} -c $< -o $@
obj/parse_save.o: src/parse_save.c
	${CC} ${CFLAGS} -c $< -o $@
obj/blockchain.o: src/blockchain.c
	${CC} ${CFLAGS} -c $< -o $@
obj/helpers.o: src/helpers.c
	${CC} ${CFLAGS} -c $< -o $@
obj/string_mgmt.o: src/string_mgmt.c
	${CC} ${CFLAGS} -c $< -o $@
obj/action.o: src/action.c
	${CC} ${CFLAGS} -c $< -o $@

clean:
	$(RM) bin/my_blockchain bin/*.dSYM obj/*