// TypeScript example

interface User {
  id: number;
  name: string;
  email: string;
  active?: boolean;
}

type UserCreate = Omit<User, 'id'>;
type UserResponse = User & { createdAt: Date };

class UserService<T extends User> {
  private users = new Map<number, T>();

  async create(data: UserCreate): Promise<T> {
    const user = {
      id: Date.now(),
      ...data,
    } as T;
    this.users.set(user.id, user);
    return user;
  }

  async findById(id: number): Promise<T | undefined> {
    return this.users.get(id);
  }

  async findAll(): Promise<T[]> {
    return Array.from(this.users.values());
  }
}

export type { User, UserCreate, UserResponse };
export default UserService;






