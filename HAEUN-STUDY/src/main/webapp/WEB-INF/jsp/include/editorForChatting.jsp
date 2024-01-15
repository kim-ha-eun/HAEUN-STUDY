<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdn.ckeditor.com/ckeditor5/34.1.0/super-build/ckeditor.js"></script>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>
<style>
   .ck-editor__editable[role="textbox"] {
       /* editing area */
       min-height: 400px;
   }
   .ck-content .image {
       /* block images */
       max-width: 80%;
       margin: 20px auto;
   }
</style>
<div id="editor" style=" margin-top:20px;">
		${map.MEMO_CN}
</div>

<script src="<c:url value='/js/editorForChatting.js'/>"></script>
<script>

editor.editing.view.document.on( 'change:isFocused', ( evt, data, isFocused ) => {
	var focouYn = editor.editing.view.document.isFocused;

	if(focouYn == true){
		window.parent.fn_lockMemo();
	}else{
		window.parent.fn_unLockMemo();
	}

} );

function editorData() {
	const editorData = editor.getData();

	return editorData;
}

function fn_updateMemo(message){

	const content = message;
	const viewFragment = editor.data.processor.toView( content );
	const modelFragment = editor.data.toModel( viewFragment );

	editor.setData("");
	editor.model.insertContent( modelFragment );

}

function fn_reset(){

	editor.setData("");

}
</script>