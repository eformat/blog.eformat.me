		</div>
		<div id="push"></div>
    </div>
    
    <div id="footer">
      <div class="container">
        <p class="text-muted credit">Blog posts are published under Creative Commons license by-nc-sa <em>Creative Commons by-nc-sa</em>. <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png"/></a></p>
        <p class="text-muted credit">&copy; 2023 | Baked with <a href="http://jbake.org">JBake ${version}</a><a href="https://github.com/eformat/blog.eformat.me/actions"> | Published ${published_date}</a></p>
      </div>
    </div>
    
    <!-- Javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<%if (content.rootpath){%>${content.rootpath}<%}else{if (content.type == "tag"){%>../<%}}%>js/lightbox.js"></script>

    <!--script type="text/javascript">
        window.___gcfg = {lang: 'en'};

        (function() {
            var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
            po.src = 'https://apis.google.com/js/platform.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();
    </script-->

    <!--script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-', '');
      ga('send', 'pageview');

    </script-->
    
  </body>
</html>
