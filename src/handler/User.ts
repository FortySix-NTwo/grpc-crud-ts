import { getRepository } from "typeorm";

import { User } from "../persistence/entity/User";

export class UserHandler {
  public static async createUser(
    fullName: string,
    userName: string,
    email: string,
    password: string,
    photo?: string
  ) {
    const userRepository = getRepository(User);
    const user = new User();
    user.fullName = fullName;
    user.userName = userName;
    user.email = email;
    user.hashedPassword = password;
    if (photo) {
      user.photo = photo;
    } else {
      user.photo = "";
    }
    await userRepository.save(user);
    return user;
  }
}
