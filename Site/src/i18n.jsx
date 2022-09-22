import i18n from "i18next";
import {initReactI18next} from "react-i18next";
import LanguageDetector from "i18next-browser-languagedetector";
import HttpApi from "i18next-http-backend";

i18n.use(initReactI18next).use(LanguageDetector).use(HttpApi).init({
    supportedLngs: ['ru', 'en'],
    fallbackLng: "ru",
    detection: {
        order: ['cookie', 'localStorage'],
        caches: ['cookie', 'localStorage']
    }
}).then()

export default i18n