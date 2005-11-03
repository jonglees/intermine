<%@ tag body-content="scriptless" %>
<%@ attribute name="viewPaths" type="java.util.Map" required="true" %>
<%@ attribute name="path" required="true" %>
<%@ attribute name="idPrefix" required="true" %>
<%@ attribute name="test" type="java.lang.Boolean" required="false" %>
<%@ attribute name="disabled" type="java.lang.Boolean" required="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--
     Tag that surrounds an element that represents something that could be on
     the view list. It adds a span with the relevant JavaScript to highlight
     all the elements on the page representing the same view path.
     
     viewPaths - map where keys are paths currently on the view list
     path - path represented by enclosed elements
     idPrefix - for all the items on the page representing a single path, each
                idPrefix must be unique and all the idPrefixes must be passed
                to viewablejs (see viewablejs.tag)
--%>

<c:if test="${viewPaths[path] && (empty test || test)}">
  <div class="viewpath" id="${idPrefix}${fn:replace(path,".","")}"
    <c:if test="${empty disabled || !disabled}">
          onmouseover="enterPath('${fn:replace(path,".","")}')"
          onmouseout="exitPath('${fn:replace(path,".","")}')"
    </c:if>
    >
</c:if>
<jsp:doBody/>
<c:if test="${viewPaths[path] && (empty test || test)}">
  </div>
</c:if>
