<template>

  <center >
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
    <img alt="Vue logo" src="../assets/logo.jpg">
    <div style="width: 400px;" >
      <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm" label-position="left">
        <el-form-item label="登录身份">
          <el-select v-model="ruleForm.type" style="width: 300px">
            <el-option label="学生" value="student"></el-option>
            <el-option label="教师" value="teacher"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="班级" prop="class" v-show="ruleForm.type==='student'">
          <el-select v-model="ruleForm.class" style="width: 300px">
            <el-option v-for="item in ruleForm.classes"
                       :value="item.classId" :key="item.className" @change="">
              {{item.className}}
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="用户名" prop="uname">
          <el-input v-model.number="ruleForm.uname"></el-input>
        </el-form-item>


        <el-form-item label="密码" prop="pass">
          <el-input type="password" v-model="ruleForm.pass" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="checkPass">
          <el-input type="password" v-model="ruleForm.checkPass" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm()">提交</el-button>
          <el-button @click="resetForm('ruleForm')">重置</el-button>
          <el-button @click="toLogin()">返回登录</el-button>
        </el-form-item>

      </el-form>
    </div>

  </center>
</template>

<script>

import axios from "axios";
import router from "@/router";

export default {
  name: "Register",
  data() {
    var checkClass = (rule, value, callback) => {
      if (value === '') {
        return callback(new Error('班级不能为空'));
      }
      else
        callback();
    };
    var checkUname = (rule, value, callback) => {
      if (value === '') {
        return callback(new Error('用户名不能为空'));
      }
      else if(value === 'isHave'){
        return callback(new Error('改用户已经存在'));
      }
      else
        callback();
    };
    var validatePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'));
      } else {
        if (this.ruleForm.checkPass !== '') {
          this.$refs.ruleForm.validateField('checkPass');
        }
        callback();
      }
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'));
      } else if (value !== this.ruleForm.pass) {
        callback(new Error('两次输入密码不一致!'));
      } else {
        callback();
      }
    };
    return {
      ruleForm: {
        pass: '',
        checkPass: '',
        uname: '',
        type:'',
        class:"",
        classes: []
      },
      //dialog
        dialogVisible:false,
        messsgae:"",
      rules: {
        pass: [
          { validator: validatePass, trigger: 'blur' }
        ],
        checkPass: [
          { validator: validatePass2, trigger: 'blur' }
        ],
        uname: [
          { validator: checkUname, trigger: 'blur' }
        ],
        class: [
          { validator: checkClass, trigger: 'blur' }
        ]
      }
    };
  },
  created() {
    var that=this;
    axios.post('/getAllclasses')
        .then(response=>{
          var data=response.data;
          // console.log(data);
          var getAllClasses=data.getAllClasses;
          // console.log(getAllClasses);
          that.ruleForm.classes=getAllClasses;
        })
        .catch(error=> {
          console.log(error);
          that.showDialog("请联系管理员,服务器已下线！！")
        });
  },
  methods: {
    toLogin(){
      this.$router.push('/');
    },
    submitForm() {
      var that=this;
     if (this.ruleForm.uname===''||this.ruleForm.pass===''){
       this.showDialog("请正确填入账户信息！");
     }
     if (this.ruleForm.class===''&&this.ruleForm.type==='student'){
       this.showDialog("请正确填入账户信息！");
     }
     else{
       axios.post('/register?uname='+this.ruleForm.uname+"&upwd="+this.ruleForm.pass+"&type="+this.ruleForm.type+"&class="+this.ruleForm.class)
           .then(response=>{
             console.log(response);
             console.log(response.data.message);
             if(response.data.message=='true'&&that.ruleForm.type==='student'){
               router.push({ name: 'Student', params: { uname: this.ruleForm.uname }});
             }
             if(response.data.message=='true'&&that.ruleForm.type==='teacher'){
               // that.showDialog("教师端现在还未开发完成。")
               router.push({ name: 'Teacher', params: { uname: this.ruleForm.uname }});
             }
             else if (response.data.message=='false'){
               that.showDialog("该用户已经存在");
             }
           })
           .catch(error=> {
             console.log(error);
             that.showDialog("请联系管理员,服务器已下线！！")
           });
     }



    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    showDialog(msg){
      this.dialogVisible=true;
      this.messsgae=msg;
    }
  }
}
</script>

<style scoped>

</style>
