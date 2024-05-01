class Animal:
    def __init__(self, name, animal_type, commands=None):
        self.name = name
        self.animal_type = animal_type
        self.commands = commands or []

    def add_command(self, command):
        self.commands.append(command)

    def show_commands(self):
        print(f"Команды {self.name} {self.animal_type}:")
        for command in self.commands:
            print(command)

    def __repr__(self) -> str:
        return f"Животное {self.name} типа {self.animal_type} и командами {self.commands}"

    def __str__(self) -> str:
        return self.__repr__
