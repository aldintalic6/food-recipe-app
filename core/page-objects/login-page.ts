import { By, WebDriver, until } from "selenium-webdriver";
import BasePage from "./base-page";
import { readFileSync } from "fs";
import * as path from "path";

const dataFilePath = path.resolve(__dirname, "../data/data.json");
const testData = JSON.parse(readFileSync(dataFilePath, "utf8"));

export class LoginPage extends BasePage {
    private usernameField = By.id("loginUsername");
    private passwordField = By.id("loginPassword");
    private loginButton = By.xpath('//*[@id="loginForm"]/button');
    private confirmMessage = By.xpath('/html/body/div[2]/div/div[6]/button[1]');
constructor(driver: WebDriver) { 
			super(driver);
}

async fillInUsername() {
    await this.fillInputField(this.usernameField, testData.credentials.username);
}
async fillInPassword() {
    await this.fillInputField(this.passwordField, testData.credentials.password);
}
async clickToLogin() {
    await this.findElementAndClick(this.loginButton);
}
async clickConfirmMessage() {
    await this.findElementAndClick(this.confirmMessage);
}
}