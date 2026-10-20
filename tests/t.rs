// Rust example

use std::collections::HashMap;

pub struct User {
    pub id: u64,
    pub name: String,
    pub email: String,
    pub active: bool,
}

impl User {
    pub fn new(id: u64, name: impl Into<String>, email: impl Into<String>) -> Self {
        Self {
            id,
            name: name.into(),
            email: email.into(),
            active: true,
        }
    }

    pub fn greet(&self) -> String {
        format!("Hello, I'm {}!", self.name)
    }
}

pub struct UserRepository {
    users: HashMap<u64, User>,
}

impl UserRepository {
    pub fn new() -> Self {
        Self {
            users: HashMap::new(),
        }
    }

    pub fn insert(&mut self, user: User) {
        self.users.insert(user.id, user);
    }

    pub fn find_by_id(&self, id: u64) -> Option<&User> {
        self.users.get(&id)
    }

    pub fn find_all(&self) -> Vec<&User> {
        self.users.values().filter(|u| u.active).collect()
    }
}

fn main() {
    let mut repo = UserRepository::new();
    repo.insert(User::new(1, "John", "john@example.com"));
    println!("{}", repo.find_by_id(1).unwrap().greet());
}
