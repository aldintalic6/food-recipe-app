import { By, WebDriver, until } from "selenium-webdriver";
import BasePage from "./base-page";
import { readFileSync } from "fs";
import * as path from "path";

const dataFilePath = path.resolve(__dirname, "../data/data.json");
const testData = JSON.parse(readFileSync(dataFilePath, "utf8"));

export class RegisterPage extends BasePage {
    private usernameField = By.id("registerUsername");
    private passwordField = By.id("registerPassword");
    private firstNameField = By.id("registerFirstName");
    private lastNameField = By.id("registerLastName");
    private email = By.id("registerEmail");
    private registerButton = By.xpath('//*[@id="registerForm"]/button');
constructor(driver: WebDriver) { 
			super(driver);
}

async fillInUsername() {
    await this.fillInputField(this.usernameField, testData.credentials.usernameRegister);
}
async fillInPassword() {
    await this.fillInputField(this.passwordField, testData.credentials.passwordRegister);
}
async fillInFirstName() {
    await this.fillInputField(this.firstNameField, testData.credentials.firstnameRegister);
}
async fillInLastName() {
    await this.fillInputField(this.lastNameField, testData.credentials.lastnameRegister);
}
async fillInEmail() {
    await this.fillInputField(this.email, testData.credentials.emailRegister);
}
async clickToRegister() {
    await this.findElementAndClick(this.registerButton);
}
}