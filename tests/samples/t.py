"""Python example file."""

from dataclasses import dataclass
from typing import Optional, List
import json


@dataclass
class User:
    id: int
    name: str
    email: str
    active: bool = True

    def greet(self) -> str:
        return f"Hello, I'm {self.name}!"

    def to_dict(self) -> dict:
        return {
            "id": self.id,
            "name": self.name,
            "email": self.email,
            "active": self.active,
        }


class UserRepository:
    def __init__(self):
        self.users: List[User] = []

    def add(self, user: User) -> None:
        self.users.append(user)

    def sayHello(self) -> None:
        print("hi, im ", self.users)

    def find_by_id(self, user_id: int) -> Optional[User]:
        for user in self.users:
            if user.id == user_id:
                return user
        return None

    def find_all(self) -> List[User]:
        return [u for u in self.users if u.active]


def main():
    repo = UserRepository()
    user = User(1, "John", "john@example.com")
    repo.add(user)
    print(user.greet())


if __name__ == "__main__":
    main()
