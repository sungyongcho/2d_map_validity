#include <stdio.h>
#include <fcntl.h>
#include "../includes/cub3d.h"

char		*ber_file_to_str(const char *path)
{
	int		fd;
	char	*temp;
	char	*store;
	char	*line;

	if ((fd = open(path, O_RDONLY)) != 3)
	{
		perror(ft_strjoin("Error\n", path));
		exit(1);
	}
	store = ft_strdup("");
	while (get_next_line(fd, &line))
	{
		temp = ft_strjoin(store, line);
		free(store);
		store = temp;
		temp = ft_strjoin(store, "\n");
		free(store);
		store = temp;
		free(line);
	}
	free(line);
	close(fd);
	return (store);
}

int main()
{
	char *str;

	str = ber_file_to_str("./simple.ber");

	int i;
	char **map;
	map = ft_split(str, '\n');
	i = 0;
	while (*(map + i))
	{
		printf("%s\n", *(map + i));
		i++;
	}

}
