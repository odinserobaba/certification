from model import Animal
from controller import AnimalController


class Counter:
    def __init__(self):
        self.value = 0

    def add(self):
        if self.value > 5:  # Пример условия для генерации исключения
            raise ValueError("Превышено максимальное значение")
        self.value += 1

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        if exc_type is not None:
            print("Исключение произошло:", exc_type, exc_value, traceback)
            return False
        if self.value == 0:
            raise ValueError("Счетчик не был увеличен")


class Menu:
    def __init__(self):
        self.counter = Counter()
        self.controller = AnimalController()

    def start(self):
        while True:
            print("\nMenu:")
            print("1. Добавить животное")
            print("2. Загрузить проект")
            print("3. Сохранить проект")
            print("4. Показать всех животных")
            print("5. Показать список команд животного")
            print("6. Бросить исключение при попытке использовать > 5")
            print("7. Exit")
            choice = input("Enter your choice: ")

            if choice == '1':
                try:
                    name = input("Введите имя животного: ")
                    animal_type = input("Введите тип животного: ")
                    commands = input(
                        "Введите список команд: ").split(',')
                    animal = Animal(name, animal_type, commands)
                    self.counter.add()
                    self.controller.add_animal(
                        Animal(name, animal_type, commands))
                    print("Животное добавлено")

                except ValueError:
                    print("Ошибка")

            elif choice == '2':

                filename = input("Введите имя проекта: ")
                self.controller.load_from_file(filename)

            elif choice == '3':

                filename = input("Введите имя проекта: ")
                self.controller.save_to_file(filename)

            elif choice == '4':

                [print(x.__str__()) for x in self.controller.animal]

            elif choice == '5':

                if self.controller.animal != []:
                    animal_name = input("Введите имя животного: ")
                    animal = self.controller.get_command(animal_name)
                    if animal:
                        print(f"Список команд животного {animal.commands}")
                    else:
                        print("Нет такого животного!")
                else:
                    print("Список пуст")
            elif choice == '6':
                try:
                    self.counter.add()
                    print(f"Счетчик - {self.counter.value}")
                except ValueError:
                    print(f"Ошибка {self.counter.value}")
            elif choice == '7':
                print("Выход...")
                break


if __name__ == "__main__":
    menu = Menu()
    menu.start()
