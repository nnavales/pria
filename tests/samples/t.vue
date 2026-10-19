<template>
  <div class="user-list">
    <div v-if="loading">Loading...</div>
    <div v-else-if="error" class="error">{{ error }}</div>
    <template v-else>
      <UserCard
        v-for="user in users"
        :key="user.id"
        :user="user"
        @delete="handleDelete"
      />
    </template>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import UserCard from './UserCard.vue';

interface User {
  id: number;
  name: string;
  email: string;
}

const users = ref<User[]>([]);
const loading = ref(true);
const error = ref<string | null>(null);

async function fetchUsers() {
  try {
    const res = await fetch('/api/users');
    users.value = await res.json();
  } catch (e) {
    error.value = 'Failed to load users';
  } finally {
    loading.value = false;
  }
}

function handleDelete(id: number) {
  users.value = users.value.filter(u => u.id !== id);
}

onMounted(fetchUsers);
</script>

<style scoped>
.user-list {
  display: grid;
  gap: 1rem;
}

.error {
  color: red;
}
</style>
