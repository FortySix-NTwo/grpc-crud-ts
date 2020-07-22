// package: 
// file: user.proto

/* tslint:disable */
/* eslint-disable */

import * as grpc from "grpc";
import * as user_pb from "./user_pb";

interface IAPIService extends grpc.ServiceDefinition<grpc.UntypedServiceImplementation> {
    getUser: IAPIService_IGetUser;
    getUsersList: IAPIService_IGetUsersList;
    updateUser: IAPIService_IUpdateUser;
    createUser: IAPIService_ICreateUser;
    deleteUser: IAPIService_IDeleteUser;
}

interface IAPIService_IGetUser extends grpc.MethodDefinition<user_pb.GetUserRequest, user_pb.GetUserResponse> {
    path: string; // "/.API/GetUser"
    requestStream: false;
    responseStream: false;
    requestSerialize: grpc.serialize<user_pb.GetUserRequest>;
    requestDeserialize: grpc.deserialize<user_pb.GetUserRequest>;
    responseSerialize: grpc.serialize<user_pb.GetUserResponse>;
    responseDeserialize: grpc.deserialize<user_pb.GetUserResponse>;
}
interface IAPIService_IGetUsersList extends grpc.MethodDefinition<user_pb.GetUsersListRequest, user_pb.GetUsersListResponse> {
    path: string; // "/.API/GetUsersList"
    requestStream: false;
    responseStream: true;
    requestSerialize: grpc.serialize<user_pb.GetUsersListRequest>;
    requestDeserialize: grpc.deserialize<user_pb.GetUsersListRequest>;
    responseSerialize: grpc.serialize<user_pb.GetUsersListResponse>;
    responseDeserialize: grpc.deserialize<user_pb.GetUsersListResponse>;
}
interface IAPIService_IUpdateUser extends grpc.MethodDefinition<user_pb.UpdateUserRequest, user_pb.UpdateUserResponse> {
    path: string; // "/.API/UpdateUser"
    requestStream: false;
    responseStream: false;
    requestSerialize: grpc.serialize<user_pb.UpdateUserRequest>;
    requestDeserialize: grpc.deserialize<user_pb.UpdateUserRequest>;
    responseSerialize: grpc.serialize<user_pb.UpdateUserResponse>;
    responseDeserialize: grpc.deserialize<user_pb.UpdateUserResponse>;
}
interface IAPIService_ICreateUser extends grpc.MethodDefinition<user_pb.CreateUserRequest, user_pb.CreateUserResponse> {
    path: string; // "/.API/CreateUser"
    requestStream: false;
    responseStream: false;
    requestSerialize: grpc.serialize<user_pb.CreateUserRequest>;
    requestDeserialize: grpc.deserialize<user_pb.CreateUserRequest>;
    responseSerialize: grpc.serialize<user_pb.CreateUserResponse>;
    responseDeserialize: grpc.deserialize<user_pb.CreateUserResponse>;
}
interface IAPIService_IDeleteUser extends grpc.MethodDefinition<user_pb.DeleteUserRequest, user_pb.DeleteUserResponse> {
    path: string; // "/.API/DeleteUser"
    requestStream: false;
    responseStream: false;
    requestSerialize: grpc.serialize<user_pb.DeleteUserRequest>;
    requestDeserialize: grpc.deserialize<user_pb.DeleteUserRequest>;
    responseSerialize: grpc.serialize<user_pb.DeleteUserResponse>;
    responseDeserialize: grpc.deserialize<user_pb.DeleteUserResponse>;
}

export const APIService: IAPIService;

export interface IAPIServer {
    getUser: grpc.handleUnaryCall<user_pb.GetUserRequest, user_pb.GetUserResponse>;
    getUsersList: grpc.handleServerStreamingCall<user_pb.GetUsersListRequest, user_pb.GetUsersListResponse>;
    updateUser: grpc.handleUnaryCall<user_pb.UpdateUserRequest, user_pb.UpdateUserResponse>;
    createUser: grpc.handleUnaryCall<user_pb.CreateUserRequest, user_pb.CreateUserResponse>;
    deleteUser: grpc.handleUnaryCall<user_pb.DeleteUserRequest, user_pb.DeleteUserResponse>;
}

export interface IAPIClient {
    getUser(request: user_pb.GetUserRequest, callback: (error: grpc.ServiceError | null, response: user_pb.GetUserResponse) => void): grpc.ClientUnaryCall;
    getUser(request: user_pb.GetUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: user_pb.GetUserResponse) => void): grpc.ClientUnaryCall;
    getUser(request: user_pb.GetUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: user_pb.GetUserResponse) => void): grpc.ClientUnaryCall;
    getUsersList(request: user_pb.GetUsersListRequest, options?: Partial<grpc.CallOptions>): grpc.ClientReadableStream<user_pb.GetUsersListResponse>;
    getUsersList(request: user_pb.GetUsersListRequest, metadata?: grpc.Metadata, options?: Partial<grpc.CallOptions>): grpc.ClientReadableStream<user_pb.GetUsersListResponse>;
    updateUser(request: user_pb.UpdateUserRequest, callback: (error: grpc.ServiceError | null, response: user_pb.UpdateUserResponse) => void): grpc.ClientUnaryCall;
    updateUser(request: user_pb.UpdateUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: user_pb.UpdateUserResponse) => void): grpc.ClientUnaryCall;
    updateUser(request: user_pb.UpdateUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: user_pb.UpdateUserResponse) => void): grpc.ClientUnaryCall;
    createUser(request: user_pb.CreateUserRequest, callback: (error: grpc.ServiceError | null, response: user_pb.CreateUserResponse) => void): grpc.ClientUnaryCall;
    createUser(request: user_pb.CreateUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: user_pb.CreateUserResponse) => void): grpc.ClientUnaryCall;
    createUser(request: user_pb.CreateUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: user_pb.CreateUserResponse) => void): grpc.ClientUnaryCall;
    deleteUser(request: user_pb.DeleteUserRequest, callback: (error: grpc.ServiceError | null, response: user_pb.DeleteUserResponse) => void): grpc.ClientUnaryCall;
    deleteUser(request: user_pb.DeleteUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: user_pb.DeleteUserResponse) => void): grpc.ClientUnaryCall;
    deleteUser(request: user_pb.DeleteUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: user_pb.DeleteUserResponse) => void): grpc.ClientUnaryCall;
}

export class APIClient extends grpc.Client implements IAPIClient {
    constructor(address: string, credentials: grpc.ChannelCredentials, options?: object);
    public getUser(request: user_pb.GetUserRequest, callback: (error: grpc.ServiceError | null, response: user_pb.GetUserResponse) => void): grpc.ClientUnaryCall;
    public getUser(request: user_pb.GetUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: user_pb.GetUserResponse) => void): grpc.ClientUnaryCall;
    public getUser(request: user_pb.GetUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: user_pb.GetUserResponse) => void): grpc.ClientUnaryCall;
    public getUsersList(request: user_pb.GetUsersListRequest, options?: Partial<grpc.CallOptions>): grpc.ClientReadableStream<user_pb.GetUsersListResponse>;
    public getUsersList(request: user_pb.GetUsersListRequest, metadata?: grpc.Metadata, options?: Partial<grpc.CallOptions>): grpc.ClientReadableStream<user_pb.GetUsersListResponse>;
    public updateUser(request: user_pb.UpdateUserRequest, callback: (error: grpc.ServiceError | null, response: user_pb.UpdateUserResponse) => void): grpc.ClientUnaryCall;
    public updateUser(request: user_pb.UpdateUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: user_pb.UpdateUserResponse) => void): grpc.ClientUnaryCall;
    public updateUser(request: user_pb.UpdateUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: user_pb.UpdateUserResponse) => void): grpc.ClientUnaryCall;
    public createUser(request: user_pb.CreateUserRequest, callback: (error: grpc.ServiceError | null, response: user_pb.CreateUserResponse) => void): grpc.ClientUnaryCall;
    public createUser(request: user_pb.CreateUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: user_pb.CreateUserResponse) => void): grpc.ClientUnaryCall;
    public createUser(request: user_pb.CreateUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: user_pb.CreateUserResponse) => void): grpc.ClientUnaryCall;
    public deleteUser(request: user_pb.DeleteUserRequest, callback: (error: grpc.ServiceError | null, response: user_pb.DeleteUserResponse) => void): grpc.ClientUnaryCall;
    public deleteUser(request: user_pb.DeleteUserRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: user_pb.DeleteUserResponse) => void): grpc.ClientUnaryCall;
    public deleteUser(request: user_pb.DeleteUserRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: user_pb.DeleteUserResponse) => void): grpc.ClientUnaryCall;
}
