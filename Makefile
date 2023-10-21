NAME = output

INC_DIR = ./inc/

SRC_DIR = ./src/
SRC = main.cpp

SRCS = $(addprefix $(SRC_DIR), $(SRC))
OBJS = $(SRCS:.cpp=.o)

CXX = c++
CXXFLAGS = -std=c++11 #-Wall -Wextra -Werror
CPPFLAGS = -I $(INC_DIR)
LDFLAGS= -framework OpenGL -framework GLUT

RM = rm -rf

all: $(NAME)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c $< -o $@

$(NAME): $(OBJS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $(OBJS) -o $(NAME)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re:
	make fclean
	make all

.PHONY: all clean fclean re
