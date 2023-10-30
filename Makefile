# **************************************************
# * TARGET NAME                                    *
# **************************************************
NAME = output

# **************************************************
# * SOURCE/INCLUDE                                 *
# **************************************************
INC_PATH = ./inc
SRC_PATH = ./src
SRC = main.cpp
SRCS = $(addprefix $(SRC_PATH)/, $(SRC))
OBJS = $(SRCS:.cpp=.o)

# **************************************************
# * VARIABLE                                       *
# **************************************************
CXX = c++
CXXFLAGS = -std=c++11 #-Wall -Wextra -Werror
CPPFLAGS = -I $(INC_PATH)
LDFLAGS= -framework OpenGL -framework GLUT

# **************************************************
# * RULE                                           *
# **************************************************
all: $(NAME)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c $< -o $@

$(NAME): $(OBJS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $(OBJS) -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re:
	make fclean
	make all

.PHONY: all clean fclean re
