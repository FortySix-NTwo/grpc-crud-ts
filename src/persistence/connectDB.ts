import { Connection, createConnection, getConnection } from "typeorm";
import ORMConfig from "../ormConfig";
import { stopServer } from "../server/index";
const PORT = process.env.PG_PORT ? parseInt(process.env.PG_PORT, 10) : 5432;

export const connectDB = async () => {
  let connection: Connection | undefined;
  try {
    connection = getConnection();
  } catch (error) {
    stopServer(error);
  }

  try {
    if (connection) {
      if (!connection.isConnected) {
        await connection.connect();
      }
    } else {
      await createConnection(ORMConfig);
    }
    console.info(`Database Connected Successfully - at port: ${PORT}`);
  } catch (error) {
    console.error(`Error: Database Connection Failed!! with: ${error}`);
    throw error;
  }
};

export const checkDBConnection = async (
  onError: Function,
  stopServer?: Function
) => {
  try {
    await connectDB();
    if (stopServer) {
      stopServer();
    }
  } catch (error) {
    onError();
  }
};
