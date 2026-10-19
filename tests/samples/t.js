// JavaScript example

import { createUser, fetchUsers } from './api.js';

const CONFIG = {
  apiUrl: 'https://api.example.com',
  timeout: 5000,
  retries: 3,
};

class UserService {
  #users = new Map();

  constructor() {
    this.#users = new Map();
  }

  async createUser(data) {
    const user = createUser({
      id: Date.now(),
      ...data,
    });
    this.#users.set(user.id, user);
    return user;
  }

  async findById(id) {
    return this.#users.get(id);
  }

  async findAll() {
    return Array.from(this.#users.values()).filter(u => u.active);
  }

  #validateEmail(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
  }
}

export default UserService;
export { CONFIG };