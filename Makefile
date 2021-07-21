# https://misc.flogisoft.com/bash/tip_colors_and_formatting
_BOLD      =\e[1m
_DIM       =\e[2m
_UNDERLINE =\e[4m
_BLINK     =\e[5m
_REVERSE   =\e[7m
_HIDDEN    =\e[8m

# RESET list
_R          =\e[0m
_RBOLD      =\e[21m
_RDIM       =\e[22m
_RUNDERLINE =\e[24m
_RBLINK     =\e[25m
_RREVERSE   =\e[27m
_RHIDDEN    =\e[28m

# Colors
_RED      =\e[91m
_GREEN    =\e[92m
_YELLOW   =\e[93m
_BLUE     =\e[94m
_MAGENTA  =\e[35m
_CYAN     =\e[96m
_WHITE    =\e[97m

NAME=inception

all: $(NAME)

$(NAME):
	@mkdir -p ~/data/wordpress ~/data/mysql ~/data/adminer ~/data/statiq
	@echo "$(_GREEN)Building Images ...$(_END)"
	@cd ./srcs && docker-compose build
	@echo "$(_GREEN)Builds completed ! Starting everyting...$(_END)"
	@cd ./srcs && docker-compose up

clean:
	@cd ./srcs && docker-compose down

fclean: clean
	@-docker stop $(shell docker ps -qa)
	@-docker rm $(shell docker ps -qa)
	@-docker rmi -f $(shell docker images -qa)
	@-docker network rm $(shell docker network ls -q)
	@-docker volume rm $(shell docker volume ls -q)
	@-docker system prune -f
	@echo "$(_GREEN) Everyting deleted, poor bandwidth ... :( $(_END)"
	@sudo rm -rf ~/data
	@echo "$(_GREEN) Folder ~/data deleted... $(_END)"

re: fclean all


.PHONY: clean fclean re all
