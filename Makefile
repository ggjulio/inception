# This is a minimal set of ANSI/VT100 color codes
_END=$'\x1b[0m
_BOLD=$'\x1b[1m
_UNDER=$'\x1b[4m
_REV=$'\x1b[7m

# Colors
_GREY=$'\x1b[30m
_RED=$'\x1b[31m
_GREEN=$'\x1b[32m
_YELLOW=$'\x1b[33m
_BLUE=$'\x1b[34m
_PURPLE=$'\x1b[35m
_CYAN=$'\x1b[36m
_WHITE=$'\x1b[37m


NAME=inception

all: $(NAME)

$(NAME):
	@
	@echo "$(_GREEN)Building Images ...$(_END)"
	@cd ./srcs && docker-compose build
	@echo "$(_GREEN)Builds completed ! Starting everyting...$(_END)"
	@cd ./srcs && docker-compose up

clean:
	@cd ./srcs && docker-compose down

fclean: clean
	@echo "$(_GREEN)$(NAME) Don't do that !$(_END)"

re: fclean all


.PHONY: clean fclean re all
