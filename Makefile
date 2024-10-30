/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   Makefile                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mgarsaul <mgarsaul@student.42.fr>          #+#  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024-10-30 13:07:53 by mgarsaul          #+#    #+#             */
/*   Updated: 2024-10-30 13:07:53 by mgarsaul         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

SRC_FILES =        ft_printf ft_printf_utils ft_print_ptr ft_print_unsigned ft_print_hex


OBJS = $(LIBC:.c=.o)
 
NAME = libftprintf.a

CC = gcc

CFLAGS = -Wall -Werror -Wextra

%.o:        %.c
			$(CC) $(CFLAGS) -c $< -o $@

$(NAME):    $(OBJS)
			ar rsc $(NAME) $(OBJS)

all:        $(NAME)

clean:
			rm -f $(OBJS)

fclean:        clean
			rm -f $(NAME)

re:            fclean all

.PHONY:        all clean fclean re bonus
