import { By, WebDriver, until } from "selenium-webdriver";
import BasePage from "./base-page";
import { readFileSync } from "fs";
import * as path from "path";

const dataFilePath = path.resolve(__dirname, "../data/data.json");
const testData = JSON.parse(readFileSync(dataFilePath, "utf8"));

export class ProfilePage extends BasePage {
    private firstNameField = By.id("firstName");
    private lasttNameField = By.id("lastName");
    private saveButton = By.xpath('//*[@id="profileForm"]/button[1]');

constructor(driver: WebDriver) { 
			super(driver);
}

async fillInFirstName() {
    await this.fillInputField(this.firstNameField, testData.credentials.firstName);
}
async fillInLastName() {
    await this.fillInputField(this.lasttNameField, testData.credentials.lastName);
}
async clickToSave() {
    await this.findElementAndClick(this.saveButton);
}
}