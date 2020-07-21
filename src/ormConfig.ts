import {ConnectionOptions} from "typeorm";
import path from "path";

const isCompiled = path.extname(__filename).includes('js');

export default {
  type: "postgres",
  host: process.env.PG_HOST || "0.0.0.0",
  port: process.env.PG_PORT ? parseInt(process.env.PG_PORT) : 5432,
  username: process.env.POSTGRES_USER || 'postgres',
  password: process.env.POSTGRES_PASSWORD || 'postgres',
  database: process.env.POSTGRES_DB || 'postgres',
  synchronize: !process.env.DB_NO_SYNC,
  logging: !process.env.DB_NO_LOGS,
  autoReconnect: true,
  reconnectTries: Number.MAX_VALUE,
  reconnectInterval: 2000,
  entities: [`src/persistence/entity/**/*.${isCompiled ? "js" : "ts"}`],
  migrations: [`src/persistence/migration/**/*.${isCompiled ? "js" : "ts"}`],
  cli: {
    "entitiesDir": "src/persistence/entity",
    "migrationsDir": "src/persistence/migration",
  },
} as ConnectionOptions;
