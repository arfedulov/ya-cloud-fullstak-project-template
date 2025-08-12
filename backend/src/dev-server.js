import bodyParser from "body-parser";
import express from "express";
import { handler } from "./controller/yandexCloudFunction.js";

const app = express();
app.use(bodyParser.json());

const buildYaEventMock = (req) => {
	return {
		httpMethod: req.method,
		url: req.originalUrl,
		headers: req.headers,
		body: JSON.stringify(req.body),
	};
};
const handleYaResult = (expressResponse, yaResult) => {
	expressResponse.status(yaResult.statusCode).end();
};

app.use(async (req, res) => {
	const event = buildYaEventMock(req);
	const yaResult = await handler(event);
	handleYaResult(res, yaResult);
});

const PORT = 8080;
app.listen(PORT, () => {
	console.log(`listening on port ${PORT}...`);
});
