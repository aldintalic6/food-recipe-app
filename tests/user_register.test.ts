import { HomePage } from "../core/page-objects/home-page";
import { Builder, By, WebDriver } from "selenium-webdriver";
import { createDriver, quitDriver } from "../core/config/driver-setup";
import { readFileSync } from "fs";
import * as path from "path";
import { RegisterPage } from "../core/page-objects/register-page";

const dataFilePath = path.resolve(__dirname, "../core/data/data.json");
const testData = JSON.parse(readFileSync(dataFilePath, "utf8"));

let driver: WebDriver;
let homePage: HomePage
let registerPage: RegisterPage

beforeAll(async () => {
    driver = await createDriver(testData.urls.site);
    homePage = new HomePage(driver);
    registerPage = new RegisterPage(driver);
}, 50000);

test("register", async () => {
    await homePage.clickOnRegisterKey()
    await registerPage.fillInUsername();
    await registerPage.fillInPassword();
    await registerPage.fillInFirstName();
    await registerPage.fillInLastName();
    await registerPage.fillInEmail();
    await registerPage.clickToRegister();
}, 20000);

afterAll(async () => {
    await quitDriver(driver)
}, 50000)