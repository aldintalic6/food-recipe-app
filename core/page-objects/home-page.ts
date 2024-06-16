import { By, WebDriver, until } from "selenium-webdriver";
import BasePage from "./base-page";
import { readFileSync } from "fs";
import * as path from "path";

const dataFilePath = path.resolve(__dirname, "../data/data.json");
const testData = JSON.parse(readFileSync(dataFilePath, "utf8"));

export class HomePage extends BasePage {
    private loginKey = By.xpath('//*[@id="loginLink"]/a');
    private profileKey = By.xpath('//*[@id="profileLink"]/a');
    private registerKey = By.xpath('//*[@id="registerLink"]/a');
    private recipesKey = By.xpath('//*[@id="navbarNav"]/ul/li[2]/a');

constructor(driver: WebDriver) { 
			super(driver);
}

async clickOnLoginKey() {
    await this.findElementAndClick(this.loginKey);
}
async clickOnProfileKey() {
    await this.findElementAndClick(this.profileKey);
}
async clickOnRegisterKey() {
    await this.findElementAndClick(this.registerKey);
}
async clickOnRecipesKey() {
    await this.findElementAndClick(this.recipesKey);
}
}