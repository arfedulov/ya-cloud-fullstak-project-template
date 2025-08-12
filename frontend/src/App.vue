<template>
  <div class="h-screen flex flex-col">
    <header class="navbar bg-base-100 shadow-sm">
      <div class="flex-1">
        <RouterLink class="btn btn-ghost text-xl" to="/">Demo</RouterLink>
      </div>
      <div class="flex-none">
        <ul class="menu menu-horizontal px-1">
          <li><RouterLink to="/say-hi">Отправить сообщение</RouterLink></li>
        </ul>
      </div>
    </header>

    <div class="p-6 grow flex justify-center items-center">
      <main class="w-[440px]">
        <RouterView />
      </main>
    </div>
  </div>
</template>

<script setup>
import { RouterLink } from "vue-router";
</script>
