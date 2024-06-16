import { HomePage } from "../core/page-objects/home-page";
import { Builder, By, WebDriver } from "selenium-webdriver";
import { createDriver, quitDriver } from "../core/config/driver-setup";
import { readFileSync } from "fs";
import * as path from "path";
import { LoginPage } from "../core/page-objects/login-page";
import { RecipesPage } from "../core/page-objects/recipes-page";

const dataFilePath = path.resolve(__dirname, "../core/data/data.json");
const testData = JSON.parse(readFileSync(dataFilePath, "utf8"));

let driver: WebDriver;
let homePage: HomePage
let loginPage: LoginPage
let recipesPage: RecipesPage

beforeAll(async () => {
    driver = await createDriver(testData.urls.site);
    homePage = new HomePage(driver);
    loginPage = new LoginPage(driver);
    recipesPage = new RecipesPage(driver);
}, 50000);

test("favorite_recipe", async () => {
    await homePage.clickOnLoginKey()
    await loginPage.fillInUsername();
    await loginPage.fillInPassword();
    await loginPage.clickToLogin();
    await loginPage.clickConfirmMessage();
    await homePage.clickOnRecipesKey();
    await recipesPage.clickFavorite();
    await recipesPage.clickFavoritesPage();
}, 20000);

afterAll(async () => {
    await quitDriver(driver)
}, 50000)