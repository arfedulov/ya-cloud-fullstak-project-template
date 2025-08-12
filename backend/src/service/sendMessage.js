import { TELEGRAM_BOT_TOKEN, TELEGRAM_CHAT_ID } from "../config.js";

export const sendMessage = async (name, message) => {
	const text = `Message from ${name}: ${message}`.replace(/<[^>]*>/g, "");
	console.log(text);

	await fetch(`https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage`, {
		method: "POST",
		headers: {
			"Content-Type": "application/json",
		},
		body: JSON.stringify({
			chat_id: TELEGRAM_CHAT_ID,
			text,
		}),
	}).then((res) => res.json());
};
