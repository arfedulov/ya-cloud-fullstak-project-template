<template>
  <main class="text-center">
    <p class="mb-6">Это демо веб-сайт, развернутый <span class="whitespace-nowrap">в Yandex Cloud</span></p>
    <p>
      Чтобы отправить сообщение <span class="whitespace-nowrap">в Telegram,</span> пройдите
      <span class="whitespace-nowrap">
        по <RouterLink to="/say-hi" class="link link-primary">ссылке</RouterLink>
      </span>
    </p>
  </main>
</template>

<script setup>
import { RouterLink } from "vue-router";
</script>