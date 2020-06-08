LEM_IN = lem_in
LIB_PATH = ./libft/
##FLAGS = -Wall -Werror -Wextra

SRC_PATH = ./src/
OBJ_PATH = ./obj/
OBJ_DIR = obj

SRC = $(LEM_IN).c execute.c ft_rooms.c ft_create_rooms.c ft_final_path.c ft_create_links.c ft_display_1.c ft_create_path.c \
empty.c ft_display_2.c ft_int_max.c ft_print.c ft_validate_links.c ft_print_ants.c ft_search_start_end.c ft_validate_path.c \
ft_validate_room_visits.c ft_validate_room.c ft_visit_path.c

LEMC = $(addprefix $(OBJ_PATH), $(SRC))
LEMO = $(patsubst %.c, %.o, $(LEMC))


all: $(LEM_IN)

$(OBJ_DIR):
	@mkdir $(OBJ_DIR)

libft:
	@$(MAKE) -C $(LIB_PATH)/

$(LEM_IN):	$(OBJ_DIR) $(LEMO) libft
	@gcc $(FLAGS) $(LEMO) -L $(LIB_PATH) -lft -o $(LEM_IN)
	@echo "$(LEM_IN) created."

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@gcc $(FLAGS) -c $< -o $@

clean:
	@$(MAKE) -C $(LIB_PATH)/ clean
	@rm -fr $(OBJ_DIR)
	@echo "Object Files Removed"

fclean: clean 
	@rm -fr $(OBJ_DIR)
	@echo "Object Files Removed"
	@$(MAKE) -C $(LIB_PATH)/ fclean
	@rm -f $(LEM_IN)

re: fclean all
.PHONY: all fclean clean re libft
