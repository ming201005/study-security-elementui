
/**
 * moxiaoming
 * Shop
 * 封装一些常用的方法，和业务无关，其他项目也可以使用
 * 含private_的方法是提供本类内部调用
 * 其他可通用调用
 */
var Shop =
{
    TYPE_GET    : 'get',
    TYPE_POST   : 'post',
    TYPE_PUT    : 'put',
    TYPE_DELETE : 'delete',

    //api基础访问地址
    BASE_URL    : 'http://localhost:8086/',

    //图片所在地址
    BASE_IMG_URL: "http://localhost:81/images/",

    /**
     * 基础列表形式，无分页 api
     */
    getBaseListApi:function (apiName,returnData) {

        let apiUrl = apiName + "?size=1000";

        axios.get(apiUrl).then(rs=>{
            console.log("getBaseListApi==>",rs);
            if (rs.data.code == 0) {
                rs = rs.data;
                returnData(rs.data.records);
            }else {
                alert(rs.data.msg);
            }
        }).catch(e=>{
            alert(e);
        });
    },

    /**
     * 枚举列表形式 api
     */
    getEnumListApi:function (enumName,returnData) {

        let apiUrl = enumName ;
        axios.get(apiUrl).then(rs=>{
            console.log("getEnumListApi==>",rs);
            if (rs.data.code == 0) {
                rs = rs.data;
                returnData(rs.data);
            }else {
                alert(rs.data.msg);
            }
        }).catch(e=>{
            alert(e);
        });
    },

    /**
     * 通用数据请求方法
     * @param vueObj  
     * @param apiURL
     * @param callback
     * @param params
     * @param calltype
     */
    ajax : function(vueObj,apiURL,callback,params,calltype)
    {
        apiURL = this.BASE_URL+apiURL;
        //根据不同的调用方式
        switch (calltype || this.TYPE_GET)
        {
            //get 方式
            case this.TYPE_GET :
                vueObj.$http.get(apiURL, params,{emulateJSON:true}).then( res => {this.private_docallback(res,callback,this.TYPE_GET)});
                break ;
            //post 方式 ,{emulateJSON:true}解决跨域
            case this.TYPE_POST :
                vueObj.$http.post(apiURL, params,{emulateJSON:true}).then( res => {this.private_docallback(res,callback,this.TYPE_POST)});
                break ;
            //put 方式,{emulateJSON:true}解决跨域
            case this.TYPE_PUT :
                vueObj.$http.put(apiURL, params,{emulateJSON:true}).then( res => {this.private_docallback(res,callback,this.TYPE_PUT)});
                break ;
            //delete方式,{emulateJSON:true}解决跨域
            case this.TYPE_DELETE :
                vueObj.$http.delete(apiURL, params,{emulateJSON:true}).then( res => {this.private_docallback(res,callback,this.TYPE_DELETE)});
                break ;
        };
    },

    /**
     * 通用回调方法
     * @param res
     * @param callback
     * @param calltype
     */
    private_docallback : function(res,callback,calltype) {

        var result = JSON.parse(res.body);

        if(calltype==this.TYPE_GET) {
            //查询返回data，其他的不要
            callback(result);
        }else if( res && (calltype==this.TYPE_POST || calltype==this.TYPE_PUT || calltype==this.TYPE_DELETE)){
            ////增删改，返回整个rs对象
            callback(result);
        }
    },

    /**
     * 取参数
     * @param name
     * @returns {string}
     */
    getParameter:function(name) {
        var query = window.location.search;
        var iLen = name.length;
        var iStart = query.indexOf(name);
        if(iStart == -1)
            return "";
        iStart += iLen + 1;
        var iEnd = query.indexOf("&", iStart);
        if(iEnd == -1)
            return query.substring(iStart);
    },

    /**
     * url 目标url
     * arg 需要替换的参数名称
     * arg_val 替换后的参数的值
     * return url 参数替换后的url
     */
    changeURLArg:function(url,arg,arg_val) {
        var pattern=arg+'=([^&]*)';
        var replaceText=arg+'='+arg_val;
        if(url.match(pattern)){
            var tmp='/('+ arg+'=)([^&]*)/gi';
            tmp=url.replace(eval(tmp),replaceText);
            return tmp;
        }else{
            if(url.match('[\?]')){
                return url+'&'+replaceText;
            }else{
                return url+'?'+replaceText;
            }
        }
        return url+'\n'+arg+'\n'+arg_val;
    },

    /**
     * json转换key1=val1&key2=val2
     * @param json
     * @returns {string}
     */
    jsonToParams:function (json) {
        var str = "";
        var value = "";
        for (var key in json) {
            value = json[key];

            //str = str+ "&" + key + "=" + value;
            if(!value || value=="undefined" || value=="null" ){
                continue;
            }else{
                str = str + "&" + key + "=" + value;
            }
        }
        return str;
    },

    /**
     * 时间戳格式化为正常的时间
     * @param date
     * @param fmt
     * @returns {*}
     */
    formatDate:function (date, fmt) {
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length));
        }
        let o = {
            'M+': date.getMonth() + 1,
            'd+': date.getDate(),
            'h+': date.getHours(),
            'm+': date.getMinutes(),
            's+': date.getSeconds()
        };
        for (let k in o) {
            if (new RegExp(`(${k})`).test(fmt)) {
                let str = o[k] + '';
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? str : this.padLeftZero(str));
            }
        }
        return fmt;
    },

    padLeftZero:function(str) {
        return ('00' + str).substr(str.length);
    },

    //删除选中的图片(唯一id删除)
    delFielById:function(row,list) {
        //从到选中的图片中删除
        for (let itemIndex in list) {
            //通过id查找，找到后删除立马跳出循环
            if (list[itemIndex].id == row.id) {
                //从原来的选中图中删掉
                list.splice(itemIndex, 1);
                break;
            }
        }
    },

    //删除选中的图片（下标删除）
    delFielByIndex:function(index,list) {
        //从到选中的图片中删除
        for (let itemIndex in list) {
            //通过id查找，找到后删除立马跳出循环
            if (itemIndex == index) {
                //从原来的选中图中删掉
                list.splice(itemIndex, 1);
                break;
            }
        }
    }
};