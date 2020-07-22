import "dotenv/config";

import { startServer, stopServer } from "./server";

(async () => {
  try {
    await startServer();
  } catch (error) {
    await stopServer();
  }
})();
