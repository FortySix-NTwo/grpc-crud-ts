import "dotenv/config";

import { startServer, stopServer } from "./server/index";

(async () => {
  try {
    startServer();
  } catch (error) {
    await stopServer(error);
  }
})();
