import {NavLink} from "react-router-dom";
import {useTranslation} from "react-i18next";


const Header = () => {
    const {t} = useTranslation()

    return (
        <>
            <header className="text-gray-600 body-font">
                <div className="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
                    <nav className="flex lg:w-2/5 flex-wrap items-center text-base md:ml-auto">
                        <NavLink className="mr-5 hover:text-gray-900 " to="/home">{t("header.home")}</NavLink>
                        <NavLink className="mr-5 hover:text-gray-900" to="/news">{t("header.news")}</NavLink>
                        <NavLink className="mr-5 hover:text-gray-900" to="/projects">{t("header.projects")}</NavLink>
                        <NavLink className="hover:text-gray-900" to="/contacts">{t("header.contacts")}</NavLink>
                    </nav>
                    <NavLink
                        className="flex order-first lg:order-none lg:w-1/5 title-font font-medium items-center text-gray-900 lg:items-center lg:justify-center mb-4 md:mb-0 hover:text-red-600"
                        to="/home">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-linecap="round"
                             stroke-linejoin="round" stroke-width="2"
                             className="w-10 h-10 text-white p-2 bg-red-500 rounded-full"
                             viewBox="0 0 24 24">
                            <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"></path>
                        </svg>
                        <span className="ml-3 text-xl">Tailblocks</span>
                    </NavLink>
                    <div className="lg:w-2/5 inline-flex lg:justify-end ml-5 lg:ml-0">
                        <NavLink
                            className="mr-5 inline-flex items-center border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-4 md:mt-0"
                            to="/sign-in">{t("header.sign-in")}</NavLink>
                        <NavLink
                            className="inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-4 md:mt-0"
                            to="/sign-up">{t("header.sign-up")}</NavLink>
                    </div>
                </div>
            </header>
        </>
    )
}
export {Header}