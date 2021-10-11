<template >
  <div id="Login">
    <img alt="Vue logo" src="../assets/logo.jpg">
    <center>

      <el-dialog
          title="提示"
          :visible.sync="dialogVisible"
          width="30%"
         >
        <span>{{this.messsgae}}</span>
        <span slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
        </span>
      </el-dialog>

      <div style="width: 400px;" >
        <el-form ref="form" :model="form" label-width="100px">
          <el-form-item label="登录身份">
            <el-select v-model="form.type" style="width: 300px">
              <el-option label="学生" value="student"  ></el-option>
              <el-option label="教师" value="teacher"></el-option>
              <el-option label="管理员" value="admin"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="用户名">
            <el-input v-model="form.uname"></el-input>
          </el-form-item>
          <el-form-item label="密码">
            <el-input  type="password" v-model="form.upwd"></el-input>
          </el-form-item>
          <el-checkbox v-model="pasChecked"  @click="changeChecked()">自动登录</el-checkbox>
          <el-form-item>
            <el-button type="primary" @click="login()">登录</el-button>
            <el-button type="primary" @click="resetForm()">重置</el-button>
            <el-button type="primary" @click="toRegister()">注册</el-button>
          </el-form-item>

        </el-form>
      </div>

    </center>
  </div>

</template>

<script>
import axios from "axios";
import router from "@/router";
export default {
  name: "Login",
  data(){
   return{
     form: {
       type:"student",
       uname:"",
       upwd:""
     },
     pasChecked:true,
     dialogVisible:false,
     messsgae:""
   }
  }
  ,
  mounted() {
   this.form.uname = this.getCookie("uname");
   // console.info( this.form.uname);
    this.form.upwd = this.getCookie("upwd");
    // console.info( this.form.upwd);
  }
  ,
  methods:{
    showDialog(msg){
      this.dialogVisible=true;
      this.messsgae=msg;
    },
    toRegister(){
      this.$router.push('/Register');
    },
    resetForm(){
      this.form.type="";
      this.form.uname="";
      this.form.upwd="";
    },
    login(){
      if (this.pasChecked==true){
        //保存cookie
        let name=this.form.uname;
        //保存的密码
        let pass=this.form.upwd;
        this.setCookie('uname', name,1000*60*24);
        this.setCookie('upwd', pass,1000*60*24);
      }
      else if(this.pasChecked==false){
        //保存cookie
        let name=this.form.uname;
        //保存的密码
        let pass=this.form.upwd;
        this.delCookie('uname');
        this.delCookie('upwd');
      }
      if (this.form.uname===""||this.form.upwd===''){
         this.showDialog("请正确填入账户信息！");
      }
      else {
        var that=this;
        axios.post('/login?uname='+this.form.uname+"&upwd="+this.form.upwd+"&type="+this.form.type,
        )
            .then(response=>{
              // console.log(response);
              // console.log(response.data.message);
              if(response.data.message==='true'&&that.form.type=='student'){
                router.push({ name: 'Student', params: { uname: that.form.uname }});
              }
              if(response.data.message==='true'&&that.form.type=='teacher'){
                router.push({ name: 'Teacher', params: { uname: that.form.uname }});
              }
              if(response.data.message==='true'&&that.form.type=='admin'){
                router.push({ name: 'Admin', params: { uname: that.form.uname }});
              }
              else if (response.data.message=='false'){
                that.showDialog("用户名或密码错误");
              }
            })
            .catch(error=> {
              console.log(error);
              that.showDialog("请联系管理员,服务器已下线！！")
            });
      }

    },
    changeChecked() {
      if (this.pasChecked==true){
        this.pasChecked=false;
      }
      if (this.pasChecked==false){
        this.pasChecked=true;
      }

    },
    /*获取cookie*/
    getCookie(c_name){
      if (document.cookie.length>0){
        let c_start=document.cookie.indexOf(c_name + "=")
        if (c_start!=-1){
          c_start=c_start + c_name.length+1
          let c_end=document.cookie.indexOf(";",c_start)
          if (c_end==-1) c_end=document.cookie.length
          return unescape(document.cookie.substring(c_start,c_end))
        }
      }
      return ""
    },


    /*删除cookie*/
    delCookie(c_name){
      this.setCookie(c_name, "", -1)
    },



    setCookie(c_name,value,expire) {
      var date=new Date()
      date.setSeconds(date.getSeconds()+expire)
      document.cookie=c_name+ "="+escape(value)+"; expires="+date.toGMTString()
      //console.log(document.cookie)
    }
  }
}
</script>

<style scoped>

</style>
