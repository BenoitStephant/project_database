import ChoosePage from "@/components/ChoosePage";
import RankingsPage from "@/components/rankings/RankingsPage";
import SubmitPage from "@/components/SubmitPage";
import LoginPage from "@/components/LoginPage";
import ProfilePage from "@/components/ProfilePage";

let routes = [
    {
        path: "/",
        name: "Home",
        component: ChoosePage
    },
    {
        path: "/rankings",
        name: "Rankings",
        component: RankingsPage
    },
    {
        path: "/submit",
        name: "Submit",
        component: SubmitPage
    },
    {
        path: "/login",
        name: "Login",
        component: LoginPage
    },
    {
        path: "/login",
        name: "Login",
        component: LoginPage
    },
    {
        path: "/profile",
        name: "Profile",
        component: ProfilePage
    },
];

export default routes;