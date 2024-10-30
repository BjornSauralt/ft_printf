/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mgarsaul <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/30 12:59:21 by mgarsaul          #+#    #+#             */
/*   Updated: 2024/10/30 12:59:24 by mgarsaul         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/libft.h"
#include "../include/ft_printf.h"

int	print_format(const char format, va_list arg)
{
	int	i;

	i = 0;
	if (format == 'c')
		i += ft_printchr(va_arg(arg, int));
	else if (format == 's')
		i += ft_printstr(va_arg(arg, char *));
	else if (format == 'd' || format == 'i')
		i += ft_printnbr(va_arg(arg, int));
	else if (format == 'x')
		i += ft_printhex(va_arg(arg, unsigned int), format);
	else
		i += write (1, &format, 1);
	return (i);
}

int	ft_printf(const char *format, ...)
{
	va_list	arg;
	int		i;

	va_start(arg, format);
	i = 0;
	while (*format != '\0')
	{
		if (*format == '%')
			i += print_format(*(++format), arg);
		else
			i += write (1, format, 1);
		++format;
	}
	va_end(arg);
	return (i);
}

int	main(void)
{
	int	acc;

	acc = ft_printf("Hello %s\n", "John");
	ft_printf("exemple %d\n", acc);
	return (0);
}
