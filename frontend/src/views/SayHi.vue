<template>
  <form class="flex flex-col gap-4 relative pb-16" @submit.prevent="onSubmit">
    <fieldset class="fieldset">
      <legend class="fieldset-legend">Как вас зовут?</legend>
      <input type="text" v-model="name" placeholder="Артём" class="input w-full" required>
    </fieldset>
    <fieldset class="fieldset">
      <legend class="fieldset-legend">Сообщение</legend>
      <textarea class="textarea w-full" v-model="message" placeholder="Привет!" required></textarea>
    </fieldset>

    <button class="btn btn-soft btn-primary">Отправить</button>

    <div v-if="successMessage" role="alert" class="alert alert-success absolute bottom-0 w-full">
      {{ successMessage }}
    </div>
    <div v-else-if="errorMessage" role="alert" class="alert alert-error absolute bottom-0 w-full">
      {{errorMessage}}
    </div>
  </form>
</template>

<script setup>
import { ref } from "vue";

const sendMessage = async (name, message) => {
	const res = await fetch("/api/send-message", {
		method: "POST",
		headers: {
			"Content-Type": "application/json",
		},
		body: JSON.stringify({ name, message }),
	});
	return res.ok;
};

const name = ref("");
const message = ref("");
const successMessage = ref("");
const errorMessage = ref("");

const onSubmit = async () => {
	const ok = await sendMessage(name.value, message.value);
	if (ok) {
		name.value = "";
		message.value = "";

		errorMessage.value = "";
		successMessage.value = "Сообщение отправлено";
		setTimeout(() => {
			successMessage.value = "";
		}, 10_000);
	} else {
		errorMessage.value = "Ошибка при отправке сообщения";
	}
};
</script>
