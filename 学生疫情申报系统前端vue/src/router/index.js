import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from "@/components/Login";
import Student from "@/components/Student";
import Register from "@/components/Register";
import Teacher from "@/components/Teacher";
import Admin from "@/components/Admin";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Login
  },
  {
    path: '/Student',
    name: 'Student',
    component: Student,
  },
  {
    path: '/Register',
    name: 'Register',
    component: Register,
  }
  ,
  {
    path: '/Teacher',
    name: 'Teacher',
    component: Teacher,
  }
  ,
  {
    path: '/Admin',
    name: 'Admin',
    component: Admin,
  }

]

const router = new VueRouter({
  routes
})



export default router
