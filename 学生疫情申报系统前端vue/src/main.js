import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from "axios";
import VueAxios from "vue-axios";
import './plugins/element.js'
import 'element-ui/lib/theme-chalk/index.css';
import 'default-passive-events'
Vue.config.productionTip = false;
//可以在vue组件中通过this . axios 使用axios库
Vue.use(VueAxios, axios);


// axios.defaults.baseURL = "http://192.168.1.33:8888"
axios.defaults.baseURL = "http://127.0.0.1:8888"

new Vue({
    router,
    render: h => h(App)
}).$mount('#app')




export default{
    lintOnSave: false,
    devServer: {
        // 设置代理
        proxy: {
            "/api": {
                target: "http://127.0.0.1:8888/api/private/v1", // 域名
                ws: true, // 是否启用websockets
                changOrigin: true, // 开启代理：在本地会创建一个虚假服务器，然后发送请求的数据，并同时接收请求的数据，这样服务端和服务端进行数据的交互就不会有跨域问题
                pathRewrite: {     // 路径重写：将 /api 替换为 /
                    "^/api": "/"
                }
            }
        }
    }
}
// module.exports = {
//
// }



