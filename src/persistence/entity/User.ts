import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  Index,
  getRepository,
} from "typeorm";

@Entity({ name: "user" })
export class User {
  @PrimaryGeneratedColumn()
  id: number = 0;

  @Index({ unique: true })
  @Column("varchar", { length: 50 })
  fullName: string = "";

  @Column("varchar", { length: 50 })
  userName: string = "";

  @Column("varchar", { length: 500, nullable: false })
  email: string = "";

  @Column("varchar", { length: 1000, nullable: false })
  hashedPassword: string = "";

  @Column("varchar", { length: 15000, nullable: true })
  photo: string = "";

  @Column("text", { nullable: true })
  about: string = "";

  @Column({ type: "timestamptz", default: "now()" })
  createdAt: Date = new Date();

  @Column({ type: "timestamptz" })
  updatedAt: Date = new Date();

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
