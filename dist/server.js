"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const http_graceful_shutdown_1 = __importDefault(require("http-graceful-shutdown"));
const app_1 = __importDefault(require("./app"));
const logger_1 = require("./utils/logger");
const StartAllWhatsAppsSessions_1 = require("./services/WbotServices/StartAllWhatsAppsSessions");
const server = app_1.default.listen(process.env.PORT, () => {
    logger_1.logger.info(`Server started on port: ${process.env.PORT}`);
});
//initIO(server);
StartAllWhatsAppsSessions_1.StartAllWhatsAppsSessions();
http_graceful_shutdown_1.default(server);
