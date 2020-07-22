import * as grpc from "grpc";

import { protoIndex } from "../proto";

protoIndex();

const port: string | number = process.env.PORT;
const host: string = process.env.HOST;
const server: grpc.Server = new grpc.Server();

type StartServerType = () => Promise<any>;
type StopServerType = () => Promise<any>;

export const startServer: StartServerType = async (): Promise<any> => {
  try {
    server.bindAsync(
      `${host}:${port}`,
      grpc.ServerCredentials.createInsecure(),
      (error: Error, port: number) => {
        if (error) {
          throw new Error(`${error}`);
        }
        console.log(`gRPC Server listening on ${port}`);
      }
    );
    server.start();
  } catch (error) {
    return console.error("Error: ", error);
  }
};

export const stopServer: StopServerType = async (): Promise<any> => {
  server.tryShutdown(() => {
    console.log(`gRPC Server is shouting down`);
  });
};
