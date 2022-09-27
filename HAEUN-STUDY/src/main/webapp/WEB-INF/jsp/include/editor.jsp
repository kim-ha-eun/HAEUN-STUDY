<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdn.ckeditor.com/ckeditor5/34.1.0/super-build/ckeditor.js"></script>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>
<style>
   .ck-editor__editable[role="textbox"] {
       /* editing area */
       min-height: 600px;
   }
   .ck-content .image {
       /* block images */
       max-width: 80%;
       margin: 20px auto;
   }
</style>
<div id="editor" style=" margin-top:20px;">
	<c:if test = "${not empty map }">
		${map.CONTENTS}
	</c:if>
</div>

<script src="/js/editor.js"></script>
<script>
function editorData() {
	const editorData = editor.getData();

	return editorData;
}
</script>