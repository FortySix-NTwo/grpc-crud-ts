// package: UserService
// file: users.proto

/* tslint:disable */
/* eslint-disable */

import * as grpc from "grpc";
import * as users_pb from "./users_pb";

interface IAPIService extends grpc.ServiceDefinition<grpc.UntypedServiceImplementation> {
    getUser: IAPIService_IGetUser;
    getUsersList: IAPIService_IGetUsersList;
    updateUser: IAPIService_IUpdateUser;
    createUser: IAPIService_ICreateUser;
    deleteUser: IAPIService_IDeleteUser;
}

interface IAPIService_IGetUser extends grpc.MethodDefinition<users_pb.GetUserRequest, users_pb.GetUserResponse> {
    path: string; // "/UserService.API/GetUser"
    requestStream: false;
    responseStream: false;
    requestSerialize: grpc.serialize<users_pb.GetUserRequest>;
    requestDeserialize: grpc.deserialize<users_pb.GetUserRequest>;
    responseSerialize: grpc.serialize<users_pb.GetUserResponse>;
    responseDeserialize: grpc.deserialize<users_pb.GetUserResponse>;
}
interface IAPIService_IGetUsersList extends grpc.MethodDefinition<users_pb.GetUsersListRequest, users_pb.GetUsersListResponse> {
    path: string; // "/UserService.API/GetUsersList"
    requestStream: false;
    responseStream: true;
    requestSerialize: grpc.serialize<users_pb.GetUsersListRequest>;
    requestDeserialize: grpc.deserialize<users_pb.GetUsersListRequest>;
    responseSerialize: grpc.serialize<users_pb.GetUsersListResponse>;
    responseDeserialize: grpc.deserialize<users_pb.GetUsersListResponse>;
}
interface IAPIService_IUpdateUser extends grpc.MethodDefinition<users_pb.UpdateUserRequest, users_pb.UpdateUserResponse> {
    path: string; // "/UserService.API/UpdateUser"
    requestStream: false;
    responseStream: false;
    requestSerialize: grpc.serialize<users_pb.UpdateUserRequest>;
    requestDeserialize: grpc.deserialize<users_pb.UpdateUserRequest>;
    responseSerialize: grpc.serialize<users_pb.UpdateUserResponse>;
    responseDeserialize: grpc.deserialize<users_pb.UpdateUserResponse>;
}
interface IAPIService_ICreateUser extends grpc.MethodDefinition<users_pb.CreateUserRequest, users_pb.CreateUserResponse> {
    path: string; // "/UserService.API/CreateUser"
    requestStream: false;
    responseStream: false;
    requestSerialize: grpc.serialize<users_pb.CreateUserRequest>;
    requestDeserialize: grpc.deserialize<users_pb.CreateUserRequest>;
    responseSerialize: grpc.serialize<users_pb.CreateUserResponse>;
    responseDeserialize: grpc.deserialize<users_pb.CreateUserResponse>;
}
interface IAPIService_IDeleteUser extends grpc.MethodDefinition<users_pb.DeleteUserRequest, users_pb.DeleteUserResponse> {
    path: string; // "/UserService.API/DeleteUser"
    requestStream: false;
    responseStream: false;
    requestSerialize: grpc.serialize<users_pb.DeleteUserRequest>;
    requestDeserialize: grpc.deserialize<users_pb.DeleteUserRequest>;
    responseSerialize: grpc.serialize<users_pb.DeleteUserResponse>;
    responseDeserialize: grpc.deserialize<users_pb.DeleteUserResponse>;
}

export const APIService: IAPIService;

export interface IAPIServer {
    getUser: grpc.handleUnaryCall<users_pb.GetUserRequest, users_pb.GetUserResponse>;
    getUsersList: grpc.handleServerStreamingCall<users_pb.GetUsersListRequest, users_pb.GetUsersListResponse>;
    updateUser: grpc.handleUnaryCall<users_pb.UpdateUserRequest, users_pb.UpdateUserResponse>;
    createUser: grpc.handleUnaryCall<users_pb.CreateUserRequest, users_pb.CreateUserResponse>;
    deleteUser: grpc.handleUnaryCall<users_pb.DeleteUserRequest, users_pb.DeleteUserResponse>;
}

export interface IAPIClient {
    getUser(request: users_pb.GetUserRequest, callback: (error: grpc.ServiceError | null, response: users_pb.GetUserResponse) => void): grpc.ClientUnaryCall;
    getUser(request: users_pb.GetUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: users_pb.GetUserResponse) => void): grpc.ClientUnaryCall;
    getUser(request: users_pb.GetUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: users_pb.GetUserResponse) => void): grpc.ClientUnaryCall;
    getUsersList(request: users_pb.GetUsersListRequest, options?: Partial<grpc.CallOptions>): grpc.ClientReadableStream<users_pb.GetUsersListResponse>;
    getUsersList(request: users_pb.GetUsersListRequest, metadata?: grpc.Metadata, options?: Partial<grpc.CallOptions>): grpc.ClientReadableStream<users_pb.GetUsersListResponse>;
    updateUser(request: users_pb.UpdateUserRequest, callback: (error: grpc.ServiceError | null, response: users_pb.UpdateUserResponse) => void): grpc.ClientUnaryCall;
    updateUser(request: users_pb.UpdateUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: users_pb.UpdateUserResponse) => void): grpc.ClientUnaryCall;
    updateUser(request: users_pb.UpdateUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: users_pb.UpdateUserResponse) => void): grpc.ClientUnaryCall;
    createUser(request: users_pb.CreateUserRequest, callback: (error: grpc.ServiceError | null, response: users_pb.CreateUserResponse) => void): grpc.ClientUnaryCall;
    createUser(request: users_pb.CreateUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: users_pb.CreateUserResponse) => void): grpc.ClientUnaryCall;
    createUser(request: users_pb.CreateUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: users_pb.CreateUserResponse) => void): grpc.ClientUnaryCall;
    deleteUser(request: users_pb.DeleteUserRequest, callback: (error: grpc.ServiceError | null, response: users_pb.DeleteUserResponse) => void): grpc.ClientUnaryCall;
    deleteUser(request: users_pb.DeleteUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: users_pb.DeleteUserResponse) => void): grpc.ClientUnaryCall;
    deleteUser(request: users_pb.DeleteUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: users_pb.DeleteUserResponse) => void): grpc.ClientUnaryCall;
}

export class APIClient extends grpc.Client implements IAPIClient {
    constructor(address: string, credentials: grpc.ChannelCredentials, options?: object);
    public getUser(request: users_pb.GetUserRequest, callback: (error: grpc.ServiceError | null, response: users_pb.GetUserResponse) => void): grpc.ClientUnaryCall;
    public getUser(request: users_pb.GetUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: users_pb.GetUserResponse) => void): grpc.ClientUnaryCall;
    public getUser(request: users_pb.GetUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: users_pb.GetUserResponse) => void): grpc.ClientUnaryCall;
    public getUsersList(request: users_pb.GetUsersListRequest, options?: Partial<grpc.CallOptions>): grpc.ClientReadableStream<users_pb.GetUsersListResponse>;
    public getUsersList(request: users_pb.GetUsersListRequest, metadata?: grpc.Metadata, options?: Partial<grpc.CallOptions>): grpc.ClientReadableStream<users_pb.GetUsersListResponse>;
    public updateUser(request: users_pb.UpdateUserRequest, callback: (error: grpc.ServiceError | null, response: users_pb.UpdateUserResponse) => void): grpc.ClientUnaryCall;
    public updateUser(request: users_pb.UpdateUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: users_pb.UpdateUserResponse) => void): grpc.ClientUnaryCall;
    public updateUser(request: users_pb.UpdateUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: users_pb.UpdateUserResponse) => void): grpc.ClientUnaryCall;
    public createUser(request: users_pb.CreateUserRequest, callback: (error: grpc.ServiceError | null, response: users_pb.CreateUserResponse) => void): grpc.ClientUnaryCall;
    public createUser(request: users_pb.CreateUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: users_pb.CreateUserResponse) => void): grpc.ClientUnaryCall;
    public createUser(request: users_pb.CreateUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: users_pb.CreateUserResponse) => void): grpc.ClientUnaryCall;
    public deleteUser(request: users_pb.DeleteUserRequest, callback: (error: grpc.ServiceError | null, response: users_pb.DeleteUserResponse) => void): grpc.ClientUnaryCall;
    public deleteUser(request: users_pb.DeleteUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: users_pb.DeleteUserResponse) => void): grpc.ClientUnaryCall;
    public deleteUser(request: users_pb.DeleteUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: users_pb.DeleteUserResponse) => void): grpc.ClientUnaryCall;
}
