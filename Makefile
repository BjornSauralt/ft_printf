# ************************************************************************** #
#                                                                            #
#                                                        :::      ::::::::   #
#   Makefile                                           :+:      :+:    :+:   #
#                                                    +:+ +:+         +:+     #
#   By: mgarsaul <mgarsaul@student.42.fr>          #+#  +:+       +#+        #
#                                                +#+#+#+#+#+   +#+           #
#   Created: 2024-10-31 11:28:57 by mgarsaul          #+#    #+#             #
#   Updated: 2024-10-31 11:28:57 by mgarsaul         ###   ########.fr       #
#                                                                            #
# ************************************************************************** #

NAME 		= libftprintf.a
CC 			= gcc
CFLAGS 		= -Wall -Wextra -Werror
LIB 		= libft/libft.a
SRC 		= src/ft_printchr.c\
			  src/ft_printf.c\
			  src/ft_printhex.c\
			  src/ft_printnbr.c\
			  src/ft_printpercent.c\
			  src/ft_printptr.c\
			  src/ft_printstr.c\
			  src/ft_printunsigned.c\

OBJ 		= $(SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ) $(LIB)
	cp $(LIB) $(NAME)
	ar rs $(NAME) $(OBJ)

$(LIB):
	$(MAKE) -C $$(dirname $@)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(MAKE) clean -C $$(dirname $(LIB));
	rm -f $(OBJ)

fclean: clean
	rm -f $(LIB)
	rm -f $(NAME)

re: fclean all

.PHONY:		all clean fclean re