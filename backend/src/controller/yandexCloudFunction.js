import { sendMessage } from "../service/sendMessage.js";

const handleSendMessage = async (event) => {
	const body = JSON.parse(event.body);
	await sendMessage(body.name, body.message);

	return {
		statusCode: 200,
	};
};

export const handler = async (event) => {
	const method = event.httpMethod;
	const [path] = event.url.split("?");

	if (method === "POST" && path === "/api/send-message") {
		return handleSendMessage(event);
	}

	return {
		statusCode: 404,
	};
};
