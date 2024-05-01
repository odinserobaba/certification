import json
from model import Animal


class AnimalController():

    def __init__(self) -> None:
        self.animal = []

    def add_animal(self, animal):
        if type(animal) is not Animal:
            print(f"Ошибка это не животное {type(animal)}")
        else:
            self.animal.append(animal)

    def save_to_file(self, file_path):
        data = {
            "animal": [a.__dict__ for a in self.animal]
        }
        with open(file_path, "w") as file:
            json.dump(data, file)

    def load_from_file(self, file_path):
        with open(file_path, "r") as file:
            data = json.load(file)
            self.animal = [Animal(**a) for a in data["animal"]]

    def get_command(self, animal_name):
        if self.animal:
            for a in self.animal:
                if a.name == animal_name:
                    return a
            else:
                print("Нет животных в списке")
                return []
