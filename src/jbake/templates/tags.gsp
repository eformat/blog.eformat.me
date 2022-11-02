<%include "header.gsp"%>
	
	<%include "menu.gsp"%>

	<div class="page-header">
            <div class="row">
                <div class="col-xs-4 col-md-2"><img src="../img/eformat.me.jpg"></div>
                <div class="col-xs-12 col-md-8"><h1>Tag: ${tag}</h1></div>
            </div>
	</div>

    <div class="row">

    <div class="col-sm-8">
        <% tag_posts.each { post -> %>
            <%if (post.status == "published") {%>
                <a href="../${post.uri}"><h1>${post.title}</h1></a>
                <p>${post.date.format("dd MMMM yyyy")}</p>

                <p>Tags :
                <%
                        out << post.tags.collect { post_tag ->
                            """<a href="${post_tag}.html">${post_tag}</a>"""
                        } .join(", ")
                %>
                </p>

                <!--a href="https://twitter.com/share" class="twitter-share-button" data-url="http://www.eformat.me/${post.uri}" data-text="${post.title}" data-via="eformat" data-lang="en">Tweeter</a-->
                <!--script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script-->
                <div class="g-plusone" data-size="medium" data-href="http://www.eformat.me/${post.uri}"></div>

                <p>${post.body}</p>
                <p><a href="${post.uri}#disqus_thread">Commentaires</a></p>
            <%}%>

        <%}%>

    </div>

    <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
        <div class="sidebar-module sidebar-module-inset">
            <h4>Mike Hepburn</h4>
            <p>This is really working out great.</p>
            <ul>
                <li><a href="https://twitter.com/eformat">@eformat</a></li>
            </ul>
        </div>


        <div class="sidebar-module">
            <h4>Tags</h4>
            <ol class="list-unstyled" style="margin-left: 0px">
                <%
                    alltags.collect { tag ->
                        [
                                tag,
                                posts.findAll { post ->
                                    post.tags.contains(tag)
                                }.size()
                        ]
                    } .sort { tag ->
                        String.format("%03d%s", 1000 - tag[1], tag[0].toLowerCase())
                    } .each { tagWithCount ->

                %>

                <li><a href="${tagWithCount[0]}.html">${tagWithCount[0]}</a> (${tagWithCount[1]})</li>
                <%}%>
            </ol>
        </div>
    </div>

    </div>

<%include "footer.gsp"%>
