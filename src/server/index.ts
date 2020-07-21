import fs from "fs";
import "dotenv/config";
import * as grpc from "grpc";

import { protoIndex } from "../proto";
import { checkDBConnection } from "../persistence";

protoIndex();

type StartServerType = () => void;
let server: grpc.Server;

let port = parseInt(process.env.PORT || "");
if (isNaN(port) || port === 0) {
  port = 50052;
}

let host = process.env.PORT || "";
if (host === undefined) {
  host = "127.0.0.1";
}

let credentials = grpc.ServerCredentials.createSsl(
  fs.readFileSync("../certs/ca.crt"),
  [
    {
      cert_chain: fs.readFileSync("../certs/server.crt"),
      private_key: fs.readFileSync("../certs/server.key"),
    },
  ],
  true
);

export const startServer: StartServerType = async () => {
  server = new grpc.Server();
  server.bindAsync(
    `${host}:${port}`,
    credentials,
    (error: Error | null, port: number) => {
      if (error) {
        Stop(error);
      }
      console.log(`gRPC listening on ${port}`);
    }
  );
  await checkDBConnection(() => {
    console.info("Database Connected Successfully");
  });
  //    server.addService();
  server.start();
};

export const stopServer = async (
  databaseError?: Error,
  serverError?: Error
) => {
  server.tryShutdown(() => {
    if (databaseError) {
      return console.error("Error: Shouting Down Server", databaseError);
    }
    return console.error("Error: Shouting Down Server", serverError);
  });
};
