//api访问地址，可修改
const global_api_url = "http://localhost:8088/";
//图片所在地址,用nginx配置一个资源服务器，指向资源路径
const BASE_IMG_URL   = "http://localhost:81/images/";
//html所在路径
const htmlPath = "views";

/**
 * mo xiao ming
 * App
 * 封装一些常用的方法，和业务无关，其他项目也可以使用
 * 含private_的方法是提供本类内部调用
 * 其他可通用调用
 */
let App =
{
    TYPE_GET    : 'get',
    TYPE_POST   : 'post',
    TYPE_PUT    : 'put',
    TYPE_DELETE : 'delete',

    /**
     * 基础列表形式，无分页 api
     */
    getBaseListApi (apiName,returnData) {

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
    getEnumListApi (enumName,returnData) {

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
     * 取参数
     * @param name
     * @returns {string}
     */
    getParameter(name) {
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
    changeURLArg(url,arg,arg_val) {
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
    jsonToParams (json) {
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
    formatDate (date, fmt) {
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
    delFileById(row, list) {
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
    delFileByIndex(index, list) {
        //从到选中的图片中删除
        for (let itemIndex in list) {
            //通过id查找，找到后删除立马跳出循环
            if (itemIndex == index) {
                //从原来的选中图中删掉
                list.splice(itemIndex, 1);
                break;
            }
        }
    },

    /**
     * 检查双精度的数字类型（如：销售价）
     */
     isDouble : (rule, value, callback) => {
        let expStr = /^\d+$|^\d+[.]?\d+$/
        if (!expStr.test(value)) {
            callback(new Error('销售价是数字类型。'))
        }else{
            callback()
        }
    },

    /**
     * 左侧高度
     * @returns {number}
     */
    getLeftMenuHeight() {
        //浏览器打开高度
        let clientHeight = document.documentElement.clientHeight;
        //左侧高度
        return clientHeight-60;
    },

    /**
     * 左侧高度
     * @returns {number}
     */
    getIfmAutoHeight() {
        //设置iframe自适高度
        return this.getLeftMenuHeight() - 65;
    }


};