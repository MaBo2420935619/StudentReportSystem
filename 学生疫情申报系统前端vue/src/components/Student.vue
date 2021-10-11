<template>
  <el-container style="height: 800px; border: 1px solid #eee">
    <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
      <el-menu>
        <el-menu-item index="3">
          <i class="el-icon-setting"></i>
          <span slot="title" style="font-size: 22px">导航栏</span>
        </el-menu-item>
      </el-menu>

      <div>
        <el-button type="primary" style="width: 180px; height: 50px ;margin: 5px" plain
                   @click="showWitch(1);">查看历史数据</el-button>
        <el-button type="primary" style="width: 180px; height: 50px ;margin: 5px" plain
                   @click="showWitch(2)">疫情上报</el-button>
        <el-button type="primary" style="width: 180px; height: 50px ;margin: 5px" plain
                   @click="showWitch(3)">完善个人信息</el-button>
      </div>
    </el-aside>

    <el-container>
      <el-header style="text-align: right; font-size: 25px; height: 60px;">
        <el-dropdown>
          <i class="el-icon-setting" style="margin-right: 15px"></i>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item><el-button type="text" @click="toLogin">注销</el-button></el-dropdown-item>
            <el-dropdown-item><el-button type="text" @click="showDialog('本系统由 mabo 独家创作，翻版必究！！')">关于</el-button></el-dropdown-item>
            <el-dropdown-item><el-button type="text" @click="showDialog('客服邮箱:2420935619@qq.com')">客服</el-button></el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
        <span style="margin-right: 30px"> 账号:{{this.name}}</span>
      </el-header>

      <el-dialog
          title="提示"
          :visible.sync="dialogVisible"
          width="30%"
          :before-close="handleClose">
        <span>{{this.msg}}</span>
          <span slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
        </span>
      </el-dialog>


<!--      显示历史信息-->
      <el-main >

        <el-table
            v-show="this.showTableName===1"
            :data="tableData"
            style="width: 100%">
          <el-table-column label="操作"  width="120">
            <template slot-scope="scope" >
              <el-button
                  size="mini"
                  width="120"
                  @click="handleDelete(scope.$index, scope.row)">删除</el-button>
            </template>
          </el-table-column>
          <el-table-column prop="reportDate" label="上报日期" width="120"></el-table-column>
          <el-table-column prop="bodyTemperature" label="体温" width="120"></el-table-column>
          <el-table-column prop="isConfirm" label="是否确诊新冠" width="120"></el-table-column>
          <el-table-column prop="isArea" label="最近14天是否途经中高风险地区" width="120"></el-table-column>
          <el-table-column prop="address" label="上报地点"></el-table-column>
        </el-table>


        <!--      显示上报内容-->
        <el-form :model="ruleForm"
                 v-show="this.showTableName===2"
                 :rules="rules" ref="ruleForm" label-width="120px" style="width: 500px" class="demo-ruleForm">
          <el-form-item label="是否确诊新冠" >
            否<el-switch v-model="ruleForm.isConfirm2"></el-switch>是
          </el-form-item>
          <el-form-item label="最近14天是否途经中高风险地区" >
            否<el-switch v-model="ruleForm.isArea2"></el-switch>是
          </el-form-item>

          <el-form-item label="当前体温" prop="bodyTemperature2" >
            <el-input v-model="ruleForm.bodyTemperature2" style="width: 200px"></el-input>
          </el-form-item>

          <el-form-item label="上报地点" prop="address2" >
            <el-select v-model="ruleForm.address2" style="width: 200px">
              <el-option v-for="item in this.addresses"
                         :value="item" :key="item">
                {{item}}
              </el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="上报日期" style="width: 200px">
            <el-form-item prop="date2" style="width: 200px ;margin-left: 80px">
              <el-date-picker
                  v-model="ruleForm.date2"
                  type="date"
                  placeholder="选择日期"
                  format="yyyy 年 MM 月 dd 日"
                  value-format="yyyy-MM-dd">
              </el-date-picker>
            </el-form-item>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm('ruleForm')">立即上报</el-button>
            <el-button @click="resetForm('ruleForm')">重置</el-button>
          </el-form-item>
        </el-form>

<!--        完善个人信息-->
        <el-form :model="ruleForm"
                 style="width: 300px;"
                 v-show="this.showTableName===3">
          <el-form-item label="出生日期" >
            <el-date-picker
                v-model="userBase.birthday"
                :disabled="displayUserBase"
                style="width: 220px; "
                type="date"
                placeholder="选择日期"
                format="yyyy 年 MM 月 dd 日"
                value-format="yyyy-MM-dd">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="真实姓名">
            <el-input v-model="userBase.name"
                      :disabled="displayUserBase">
            </el-input>
          </el-form-item >

          <el-form-item label="邮箱">
            <el-input v-model="userBase.email"
                      :disabled="displayUserBase">
            </el-input>
          </el-form-item>
          <el-form-item label="电话">
            <el-input v-model="userBase.phone"
                      :disabled="displayUserBase">
            </el-input>
          </el-form-item>

          <el-form-item label="性别">
            <el-select v-model="userBase.sex"  :disabled="displayUserBase">
              <el-option v-for="item in this.sexs"
                         :value="item" :key="item">
                {{item}}
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="身份证号">
            <el-input v-model="userBase.idCardNumber"
                      :disabled="displayUserBase">
            </el-input>
          </el-form-item>

          <el-form-item :disabled=true>
            <el-button type="primary" v-show="!displayUserBase" @click="submitUserBaseInfo(userBase)">保存</el-button>
            <el-button type="primary" v-show="displayUserBase" @click="displayUserBase=false">编辑</el-button>
          </el-form-item>

        </el-form>

      </el-main>

    </el-container>
  </el-container>

</template>

<script>


import router from "@/router";
import axios from "axios";

export default {
  name:"Student",
  data() {
    return {
      sexs:['男','女'],
      addresses :['北京市','天津市','上海市','重庆市',
        '河北省','山西省','辽宁省','吉林省','黑龙江省','江苏省',
        '浙江省','安徽省','福建省','江西省','山东省','河南省','湖北省',
        '湖南省','广东省','海南省','四川省','贵州省','云南省','陕西省',
        '甘肃省','青海省','台湾省','内蒙古自治区','广西壮族自治区','西藏自治区',
        '宁夏回族自治区','新疆维吾尔自治区','香港特别行政区','澳门特别行政区'],
      tableData:[],
      name:this.$route.params.uname,
      dialogVisible: false,
      msg:"",
      showTableName:1,
      ruleForm: {
        address2: '上海市',
        bodyTemperature2:36.5,
        isConfirm2:false,
        isArea2:false,
        date2:null
      },
      displayUserBase:true,
      userBase: {
        name:'',
        birthday:null ,
        email:'',
        phone:'',
        sex:'',
        idCardNumber:''
      },
      rules: {
        bodyTemperature2: [
          { required: true, message: '请输入体温', trigger: 'blur' }
        ],
        date2: [
          {  required: true, message: '请选择日期', trigger: 'blur' }
        ]
      }
    };

  },
  methods:{
    getUserBaseInfo(){
      var that=this;
      axios.post('/getUserBaseInfo'+
          "?id="+this.name+
          "&type=student")
          .then(response=>{
            console.log(response);
            // console.log(response.data.getUserBaseInfo[0]);
            var s=response.data;
            that.userBase.name=s.name;
            if (s.birthday==="undefined"){
              that.userBase.birthday=null;
            }
            else {
              that.userBase.birthday=s.birthday;
            }
            that.userBase.email=s.email;
            that.userBase.phone=s.phone;
            that.userBase.sex=s.sex;
            that.userBase.idCardNumber=s.idCardNumber;

          })
          .catch(error=> {
            console.log(error);
            that.showDialog("服务器已下线，请求失败")
          });
    },
    submitUserBaseInfo(form){
      var that=this;
      this.displayUserBase=true;
      axios.post('/submitUserBaseInfo'+
          "?id="+this.name+
          "&name="+form.name+
          "&birthday="+form.birthday+
          "&email="+form.email+
          "&phone="+form.phone+
          "&sex="+form.sex+
          "&idCardNumber="+form.idCardNumber+
          "&type=student")
          .then(response=>{
            // console.log(response);
            // console.log(response.data.message);
            if(response.data.message==='true'){
              that.showDialog("保存成功");
            }
            else if (response.data.message==='false'){
              that.showDialog("保存失败");
            }
          })
          .catch(error=> {
            console.log(error);
            that.showDialog("服务器已下线，上报失败")
          });
    },
    showDialog(msg){
      this.dialogVisible=true;
      this.msg=msg;
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          var that=this;
          axios.post('/setReportInfo?reportDate='+this.ruleForm.date2+
              "&bodyTemperature="+this.ruleForm.bodyTemperature2+
              "&isConfirm="+this.ruleForm.isConfirm2+
              "&isArea="+this.ruleForm.isArea2+
              "&address="+this.ruleForm.address2+
              "&uameId="+this.name)
              .then(response=>{
                // console.log(response);
                // console.log(response.data.message);
                if(response.data.message==='true'){
                  that.showDialog("提交成功");
                  this.getStudentReportHistory(this.name);
                }
                else if (response.data.message==='false'){
                  that.showDialog("提交失败");
                }
                else if (response.data.message==='已上报无需重复上报'){
                  that.showDialog("已上报，无需重复上报");
                }
                else if (response.data.message==='不能超期上报'){
                  that.showDialog("请正确填报上报日期");
                }

              })
              .catch(error=> {
                console.log(error);
                that.showDialog("服务器已下线，上报失败")
              });
        } else {
          console.log('error submit!!');
          this.showDialog("请完善提交信息");
          return false;
        }
      });

    },
    handleDelete(index, row) {
      // console.log(index, row);
      var that=this;
      // console.log( row.uameId);
      // console.log( row.reportDate);
      axios.post('/deleteStudentReport?uameId='+row.uameId+"&reportDate="+row.reportDate)
          .then(response=>{
            // console.log(response);
            // console.log(response.data.message);
            if(response.data.message===true){
              that.showDialog("删除成功");
              that.getStudentReportHistory(row.uameId);
            }
            else if (response.data.message===false){
              that.showDialog("删除失败");
              // console.log("删除失败");
            }
          })
          .catch(error=> {
            console.log(error);
            that.showDialog("请联系管理员,服务器已下线！！")
          });


    },
    handleClose(done) {
      this.$confirm('确认关闭？')
          .then(_ => {
            done();
          })
          .catch(_ => {});
    },
    toLogin(){
      this.$router.push('/');
    },
    showWitch(e){
      this.showTableName=e;
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    getStudentReportHistory(name){
      var that=this;
      axios.post('/getStudentReportHistory?uname='+name)
          .then(response=>{
            // console.log(response);
            var a=response.data.getStudentReportHistory;
            that.tableData=a;
          })
          .catch(error=> {
            console.log(error);
            that.showDialog("请联系管理员,服务器已下线！！")
          });
      this.showTableName=1;
    }
  },
  created() {
    if (this.$route.params.uname===undefined){
      this.$router.push('/');
    }
    this.name= this.$route.params.uname;
    this.getStudentReportHistory(this.name);
    this.getUserBaseInfo()
  },

};
</script>


<style scoped>
.el-header {
  background-color: #B3C0D1;
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
}

</style>
