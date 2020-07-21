import { checkDBConnection } from "./persistence";

let port = parseInt(process.env.PORT || "");
if (isNaN(port) || port === 0) {
  port = 50052;
}

//app.use(async (req: Request, res: Response, next) => {
//  await checkDBConnection(() => {
//    res.json({
//      error: "Database connection error, please try again later",
//    });
//  }, next);
//});
