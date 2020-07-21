import { Connection, createConnection, getConnection } from "typeorm";
import ORMConfig from "../ormConfig";

const PORT = process.env.PG_PORT ? parseInt(process.env.PG_PORT, 10) : 5432;

export const connectDB = async () => {
  let connection: Connection | undefined;
  try {
    connection = getConnection();
  } catch (error) {}

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

export const checkDBConnection = async (onError: Function, next?: Function) => {
  try {
    await connectDB();
    if (next) {
      next();
    }
  } catch (error) {
    onError();
  }
};
