      <!-- Fixed navbar -->
      <div class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%if (content.rootpath){%>${content.rootpath}<%}else{if (content.type == "tag"){%>../<%}}%>index.html">eformat.me</a>
          </div>
          <div class="collapse navbar-collapse" id="navbar-menu">
            <ul class="nav navbar-nav">
              <li><a href="https://github.com/eformat" target="github:eformat">Github</a></li>
              <li><a href="<%if (content.rootpath){%>${content.rootpath}<%}else{if (content.type == "tag"){%>../<%}}%>archive.html">Archives</a></li>
              <li><a href="<%if (content.rootpath){%>${content.rootpath}<%}else{if (content.type == "tag"){%>../<%}}%>${config.feed_file}">Flux RSS</a></li>
              <li><a href="https://plausible.apps.sno.eformat.me/blog.eformat.me" target="eformat:analytics">Analytics</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
      <div class="container">
