# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sucho <sucho@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/02 18:03:49 by sucho             #+#    #+#              #
#    Updated: 2023/05/04 16:19:38 by sucho            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME					=	cub3D
LIBFT					=	libft.a
MINILIBX				=	libmlx.a

CC						=	gcc
CFLAGS					=	-Wall -Wextra -Werror -O3
RM						=	rm -f

INCLUDES_PATH			=	./includes/
LIBFT_PATH				=	./includes/libft/
GET_NEXT_LINE_PATH		=	./includes/get_next_line/
MINILIBX_MMS			=	./includes/minilibx_mms_20200219/
MINILIBX_OPENGL			=	./includes/mlx_openGL/
MINILIBX_LINUX			=	./includes/minilibx_linux/

INCS					=	-I${INCLUDES_PATH} -I${LIBFT_PATH} -I${MINILIBX_MMS}
INCLIB_OPENGL			=	-L${MINILIBX_OPENGL} -lmlx -framework OpenGL -framework Appkit \
							-L${LIBFT_PATH} -lft
INCLIB_MMS				=	-L${MINILIBX_MMS} -lmlx -framework Cocoa -framework Metal \
							-framework MetalKit -framework QuartzCore -L${LIBFT_PATH} -lft

SRCS					=	./includes/get_next_line/get_next_line.c \
							./srcs/main.c \
							./srcs/error_process.c \
							./srcs/map_validity.c

OBJS					=	${SRCS:.c=.o}

.c.o:
							${CC} ${CFLAGS} -c $< -o ${<:.c=.o}

all: 						$(NAME)

${NAME}:					${OBJS}
							make bonus -C ${LIBFT_PATH}
							make -C ${MINILIBX_OPENGL}
							$(CC) $(CFLAGS) ${INCS} ${INCLIB_OPENGL} -o $(NAME) $(OBJS)

clean:
							$(MAKE) -C $(LIBFT_PATH) clean
							$(MAKE) -C $(MINILIBX_OPENGL) clean
							rm -f $(OBJS) $(MINILIBX)

fclean: 					clean
							$(MAKE) -C $(LIBFT_PATH) fclean
							rm -f $(NAME)

re: 						fclean all

.PHONY: 					all clean fclean re
