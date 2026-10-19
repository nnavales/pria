import React, { useState, useEffect, useMemo } from 'react';
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';

interface User {
  id: number;
  name: string;
  email: string;
}

interface UserCardProps {
  user: User;
  onDelete?: (id: number) => void;
}

function UserCard({ user, onDelete }: UserCardProps) {
  const [expanded, setExpanded] = useState(false);

  const initials = useMemo(() => {
    return user.name
      .split(' ')
      .map(n => n[0])
      .join('')
      .toUpperCase();
  }, [user.name]);

  return (
    <div className="user-card" onClick={() => setExpanded(!expanded)}>
      <span className="initials">{initials}</span>
      {expanded && (
        <div className="details">
          <h3>{user.name}</h3>
          <p>{user.email}</p>
          {onDelete && (
            <button onClick={() => onDelete(user.id)}>Delete</button>
          )}
        </div>
      )}
    </div>
  );
}

export default function App() {
  const [users, setUsers] = useState<User[]>([]);

  useEffect(() => {
    fetchUsers().then(setUsers);
  }, []);

  return (
    <BrowserRouter>
      <nav>
        <Link to="/">Home</Link>
        <Link to="/users">Users</Link>
      </nav>
      <Routes>
        <Route path="/" element={<h1>Welcome</h1>} />
        <Route
          path="/users"
          element={
            <div className="user-list">
              {users.map(user => (
                <UserCard key={user.id} user={user} />
              ))}
            </div>
          }
        />
      </Routes>
    </BrowserRouter>
  );
}
