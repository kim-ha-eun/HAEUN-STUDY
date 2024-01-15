/**
 *
 */

function gfn_isNull(str) {
	if (str == null) return true;
	if (str == "NaN") return true;
	if (new String(str).valueOf() == "undefined") return true;
	var chkStr = new String(str);
	if( chkStr.valueOf() == "undefined" ) return true;
	if (chkStr == null) return true;
	if (chkStr.toString().length == 0 ) return true;
	return false;
}

/**
 * Post-Submit
 * @param formId
 * @param url
 * @returns
 */
function submitPost(formId, url) {
	$('#' + formId).attr({
		action : url,
		method : 'post',
		target : '_self'
	}).submit();
}

/**
 * check empty variable
 */
var isEmpty = function(value) {
	if( value == "" || value == null || value == undefined || (value != null && typeof value == "object" && !Object.keys(value).length)) {
		return true;
	} else {
		return false;
	}
};

/**
 * Ajax Transmission
 */
var AjaxAP = (function() {
	return {
		send : function(url, param, dType, callbackFun, async) {
			var synchronized = ((typeof async == undefined) || (async != true && async != false)) ? true : async;
			$.ajax({
				url      : url,
				data     : param,
				type     : "POST",
				datatype : dType,
				async    : synchronized,
				success  : function(rcvData) {
					if(typeof(callbackFun) == 'function'){
						return callbackFun(rcvData);
					}else if (isEmpty(rcvData) || (typeof rcvData === 'string' && rcvData.startsWith("<!DOCTYPE"))) {
						return false;
					}else {
						var execFunc = new Function("return " + callbackFun + "(" + rcvData + ")");
					 	execFunc();
					}
				}, error : function(rcvData) {
					var execFunc = new Function("return " + callbackFun);
				 	execFunc();
				}
			});
		}
	};
}());

//객체를 파라미터로 넘긴다 - form serializeObject() 한 객체
//컨트롤러의 받는 파라미터에 @RequestBody 를 붙여준다.
var AjaxAPJSON = (function() {
	return {
		send : function(url, param, dType, callbackFun, async) {
			var synchronized = ((typeof async == undefined) || (async != true && async != false)) ? true : async;
			$.ajax({
				url      : url,
				data     : JSON.stringify(param),
				type     : "POST",
				datatype : dType,
				contentType : "application/json; charset=utf-8",
				async    : synchronized,
				success  : function(rcvData) {

					if (isEmpty(rcvData) || (typeof rcvData === 'string' && rcvData.startsWith("<!DOCTYPE"))) {
						return false;
					} else if(typeof(callbackFun) == 'function'){
						return callbackFun(rcvData);
					} else {
						var execFunc = new Function("return " + callbackFun + "(" + rcvData + ")");
					 	execFunc();
					}
				}, error : function(rcvData) {
					var execFunc = new Function("return " + callbackFun);
				 	execFunc();
				}
			});
		}
	};
}());


//function ComSubmit(opt_formId) {
//	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
//	this.url = "";
//
//	if(this.formId == "commonForm"){
//		$("#commonForm")[0].reset();
//	}
//
//	this.setUrl = function setUrl(url){
//		this.url = url;
//	};
//
//	this.addParam = function addParam(key, value){
//		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
//	};
//
//	this.submit = function submit(){
//		var frm = $("#"+this.formId)[0];
//		frm.action = this.setUrl;
//		frm.method = "post";
//		frm.submit();
//	};
//}

