<script lang="ts">
  export let user;
  export let onDelete: ((id: number) => void) | undefined;

  let expanded = false;

  $: initials = user.name
    .split(' ')
    .map(n => n[0])
    .join('')
    .toUpperCase();

  function toggle() {
    expanded = !expanded;
  }

  function handleDelete(event: MouseEvent) {
    event.stopPropagation(); // evita que haga toggle
    onDelete && onDelete(user.id);
  }
</script>

<div class="user-card" on:click={toggle}>
  <span class="initials">{initials}</span>

  {#if expanded}
    <div class="details">
      <h3>{user.name}</h3>
      <p>{user.email}</p>

      {#if onDelete}
        <button on:click={handleDelete}>Delete</button>
      {/if}
    </div>
  {/if}
</div>

<main>
  {#if loading}
    <p>Loading...</p>
  {:else if error}
    <p class="error">{error}</p>
  {:else}
    <div class="user-grid">
      {#each users as user (user.id)}
        <UserCard {user} onDelete={() => handleDelete(user.id)} />
      {/each}
    </div>
  {/if}
</main>

<style>
  main {
    padding: 1rem;
  }

  .user-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 1rem;
  }

  .error {
    color: red;
  }
</style>
