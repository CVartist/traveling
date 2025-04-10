Vue.component('my-header', {
    data: function () {
        return {
            user: localStorage.user ? JSON.parse(localStorage.user) : null,
            currentIndex: "",
            wd: ""
        }
    },
    methods: {
        search() {
            if (this.wd.trim() == "") {
                this.$message.error("请输入搜索的内容!");
                return;
            }
            location.href = "/contentList.html?wd=" + this.wd;
        },
        logout() {
            if (confirm("您确定退出登录吗?")) {
                axios.get("/v1/users/logout").then(function () {
                    localStorage.clear();
                    location.href = "/";
                })
            }

        },
        handleSelect(key, keyPath) {
            if (key == 0) {
                location.href = "/";
            } else if (key == 4) {
                location.href = "http://127.0.0.1:5000/static/bigDataView.html";
            } else {
                location.href = "/contentList.html?type=" + key;
            }
        }
    },
    created: function () {
        if (location.search.includes("type")) {//专题页面
            let type = new URLSearchParams(location.search).get("type");
            if (location.pathname != "/postArticle.html") {
                this.currentIndex = type;
            }
        } else {//首页和其它页面
            if (location.pathname == "/" || location.pathname == "/index.html") {
                this.currentIndex = "0";
            }
        }
    },
    template: `
        <el-header height="80px">
            <div class="center">
                <el-row gutter="20">
                    <el-col span="6">
                        <a href="/">
                            <img src="imgs/icon.png" width="196" height="65">
                        </a>
                        
                    </el-col>
                    <el-col span="10">
                        <el-menu :default-active="currentIndex" @select="handleSelect" mode="horizontal" active-text-color="orange">
                            <el-menu-item index="0">首页</el-menu-item>
                            <el-menu-item index="1">景点推荐</el-menu-item>
                            <el-menu-item index="2">美食推荐</el-menu-item>
                            <el-menu-item index="3">游记大全</el-menu-item>
                            <el-menu-item index="4">数据大屏</el-menu-item>
                        </el-menu>
                    </el-col>
                    <el-col span="6">
                        <el-input style="position: relative;top: 15px" @keydown.native.enter="search()" v-model="wd" placeholder="请输入搜索的关键字">
                            <el-button @click="search()" slot="append" icon="el-icon-search"></el-button>
                        </el-input>
                    </el-col>
                    <el-col span="2">
                        <el-popover v-if="user==null"
                                placement="top-start"
                                title="Welcome To Traveling!"
                                width="200"
                                trigger="hover">
                            <div slot="reference">
                                <i style="font-size: 30px;position: relative;top: 20px"
                                   class="el-icon-user"></i>
                            </div>
                            <el-button type="info" @click="location.href='/reg.html'">注册</el-button>
                            <el-button type="warning" @click="location.href='/login.html'">登录</el-button>
                        </el-popover>
                        <el-popover v-else
                                placement="top-start"
                                title="Welcome To Traveling!"
                                width="200"
                                trigger="hover">
                            <div slot="reference">
                                <i style="font-size: 30px;position: relative;top: 20px"
                                   class="el-icon-user"></i>
                            </div>
                            <div style="text-align: center">
                                <a href="/personal.html">
                                    <!--<el-avatar :src="user.imgUrl"></el-avatar>-->
                                    <img :src="user.imgUrl" 
                                    style="width: 50px;height: 50px;border-radius: 50px">
                                </a>
                                <hr>
                                <a href="/personal.html">个人中心</a>
                                <a href="javascript:void(0)" @click="logout()">退出登录</a><br>
                                <a v-if="user.isAdmin==1" href="/admin.html">后台管理页面</a>
                            </div>
                        </el-popover>
                    </el-col>
                </el-row>
            </div>
        </el-header>
    `
})