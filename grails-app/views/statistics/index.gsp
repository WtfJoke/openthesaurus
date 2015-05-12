<%@page import="com.vionto.vithesaurus.*" %>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="statistics.title" /></title>
        <meta name="description" content="${message(code:'statistics.description')}" />
        <script type="text/javascript" src="${createLinkTo(dir:'js',file:'blockies.min.js')}"></script>
    </head>
    <body>

        <hr />

          <h1 style="margin-left: 4px"><g:message code="statistics.headline" /></h1>
    
          <div style="float:left; margin-right: 30px" class="statistics">

              <table width="315" class="statsTable">

                  <tr>
                      <td><h2><g:message code="statistics.general" /></h2></td>
                  </tr>

                  <tr class="prop">
                      <td width="215" valign="top" align="right" class="statName"><g:message code="statistics.synsets" /></td>
                      <td valign="top" class="value"><g:decimal number="${Synset.countByIsVisible(true)}" /></td>
                  </tr>

                  <tr class="prop2">
                      <td valign="top" align="right" class="statName"><g:message code="statistics.terms" /></td>
                      <td valign="top" class="value"><g:decimal number="${Term.countVisibleTerms()}" /></td>
                  </tr>

                  <tr class="prop">
                      <td valign="top" align="right" class="statName"><g:message code="statistics.terms.unique" /></td>
                      <td valign="top" class="value"><g:decimal number="${Term.countVisibleUniqueTerms()}" /></td>
                  </tr>

                  <tr class="prop2">
                      <td valign="top" align="right" class="statName"><g:link controller="association" action="list"><g:message code="statistics.associations" /></g:link></td>
                      <td valign="top" class="value"><g:decimal number="${associationCount}" /></td>
                  </tr>

                  <tr class="prop">
                      <td valign="top" align="right" class="statName"><g:link controller="term" action="antonyms"><g:message code="statistics.antonyms" /></g:link></td>
                      <td valign="top" class="value"><g:decimal number="${TermLink.countByLinkType(TermLinkType.findByLinkName('Antonym'))}" /></td>
                  </tr>

                  <tr class="prop2">
                      <td valign="top" align="right" class="statName"><g:link controller="tag"><g:message code="statistics.tags" /></g:link></td>
                      <td valign="top" class="value"><g:decimal number="${tagCount}" /></td>
                  </tr>

                  <tr class="prop">
                      <td valign="top" align="right" class="statName"><g:message code="statistics.changes_last_7_days" /></td>
                      <td valign="top" class="value"><g:decimal number="${latestChangesAllSections}" /></td>
                  </tr>
                  <tr>
                      <td colspan="2" align="right" class="metaInfo">Stand: <g:formatDate format="dd.MM.yyyy HH:mm" /></td>
                  </tr>
              </table>

          </div>

          <div style="float:left" class="statistics">

              <table width="315" class="statsTable">
                  <tr>
                      <td colspan="3"><h2><g:message code="statistics.top.users" /></h2></td>
                  </tr>
                  <g:each in="${topUsers}" var="topUser" status="i">
                      <tr>
                          <td class="value"><g:decimal number="${topUser.actions}"/></td>
                          <td>
                              <g:if test="${topUser.displayName}">
                                  <g:link controller="user" action="profile" params="${[uid: topUser.userId]}"><g:render template="/identicon" model="${[user: topUser.userId, count: i]}"/></g:link>
                              </g:if>
                              <g:else>
                                  <g:render template="/identicon" model="${[user: topUser.userId, count: i]}"/>
                              </g:else>
                          </td>
                          <td class="statName">
                              <g:if test="${topUser.displayName}">
                                  <g:link controller="user" action="profile" params="${[uid: topUser.userId]}">${topUser.displayName.encodeAsHTML()}</g:link>
                              </g:if>
                              <g:else>
                                  <span class="metaInfo"><g:message code="statistics.anonymous.user" /></span>
                              </g:else>
                          </td>
                      </tr>
                  </g:each>
                  <tr>
                      <td width="185"></td>
                      <td></td>
                  </tr>
              </table>

          </div>
    
          <div style="clear: both"></div>

        <g:render template="/ads/statistics_bottom"/>
        
    </body>
</html>
