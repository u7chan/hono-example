import { Hono } from "hono";

const app = new Hono();

app.get("/api/hello", (c) => {
	return c.text("OK");
});

export default app;