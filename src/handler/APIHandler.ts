import * as grpc from "grpc";

import {
  APIService,
  IAPIService,
  IAPIService_IGetUser,
  IAPIService_IGetUsersList,
  IAPIService_IUpdateUser,
  IAPIService_ICreateUser,
  IAPIService_IDeleteUser,
} from "../proto/user/users.proto";

class APIHandler implements IAPIService {
  readonly [x: string]: grpc.MethodDefinition<any, any>;
  getUser: IAPIService_IGetUser;
  getUsersList: IAPIService_IGetUsersList;
  updateUser: IAPIService_IUpdateUser;
  createUser: IAPIService_ICreateUser;
  deleteUser: IAPIService_IDeleteUser;
}

export default {
  service: APIService,
  handler: new APIHandler(),
};
