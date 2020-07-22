"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.compare = exports.encrypt = void 0;
const bcrypt_1 = __importDefault(require("bcrypt"));
const salt = bcrypt_1.default.genSaltSync(10);
exports.encrypt = (password) => bcrypt_1.default.hashSync(password, salt);
exports.compare = (hash) => bcrypt_1.default.compareSync(hash, exports.encrypt.toString());
//# sourceMappingURL=bcrypt.js.map