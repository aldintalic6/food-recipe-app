import { By, WebDriver, until } from "selenium-webdriver";
import BasePage from "./base-page";
import { readFileSync } from "fs";
import * as path from "path";

const dataFilePath = path.resolve(__dirname, "../data/data.json");
const testData = JSON.parse(readFileSync(dataFilePath, "utf8"));

export class RecipesPage extends BasePage {
    private favorite = By.xpath('//*[@id="recipesRow"]/div[1]/div/div[2]/svg/path');
    private favoritePage = By.xpath('//*[@id="favoritesLink"]/a');
constructor(driver: WebDriver) { 
			super(driver);
}

async clickFavorite() {
    await this.findElementAndClick(this.favorite);
}
async clickFavoritesPage() {
    await this.findElementAndClick(this.favoritePage);
}
}