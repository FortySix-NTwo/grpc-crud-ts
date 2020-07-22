import bcrypt from "bcrypt";

const salt = bcrypt.genSaltSync(10);

export const encrypt = (password: string): string =>
  bcrypt.hashSync(password, salt);

export const compare = (hash: string): boolean =>
  bcrypt.compareSync(hash, encrypt.toString());
