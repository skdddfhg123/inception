NAME = inception
DB_DIR	= /home/dongmlee/data

all	: $(NAME)

$(NAME) :
	mkdir -p $(DB_DIR)/mariadb_vol
	mkdir -p $(DB_DIR)/wordpress_vol
	@echo "127.0.0.1	dongmlee.42.fr" > /etc/hosts
	docker-compose -f ./srcs/docker-compose.yml up --build

restart :
	docker-compose -f ./srcs/docker-compose.yml restart

clean	:
	docker-compose -f ./srcs/docker-compose.yml down --rmi "all" --volumes

fclean	:	clean
	rm -rf $(DB_DIR)

re	:	fclean all

.PHONY	:	all clean fclean re
