function get_simplify_time(dateTimeStamp){
        if(dateTimeStamp === 0) return '刚刚';
        if(dateTimeStamp.toString().length == 10)  dateTimeStamp = dateTimeStamp * 1000
        var minute = 1000 * 60,hour = minute * 60,day = hour * 24,halfamonth = day * 15,month = day * 30,now = new Date().getTime(),diffValue = now - dateTimeStamp;  
        if(diffValue < 0) return  '刚刚';
        var monthC = diffValue / month,weekC = diffValue / (7 * day),dayC = diffValue / day,hourC = diffValue / hour,minC = diffValue / minute;  
        if(monthC >= 1) {  
            result = "" + parseInt(monthC) + "月前";  
        } else if(weekC >= 1) {  
            result = "" + parseInt(weekC) + "周前";  
        } else if(dayC >= 1) {  
            result = "" + parseInt(dayC) + "天前";  
        } else if(hourC >= 1) {  
            result = "" + parseInt(hourC) + "小时前";  
        } else if(minC >= 1) {  
            result = "" + parseInt(minC) + "分钟前";   
        } else{  
            result = "刚刚";  
        }     
        return result;
}
