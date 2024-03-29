<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <%
        def pagetitle = null
        if (content.title) {
            pagetitle = content.title
        } else if (content.type == "tag") {
            pagetitle = "${tag}"

        } else if (content.type == "archive") {
            pagetitle = "Archives"
        }
    %>
    <title>eformat.me<%if (pagetitle) {%> - ${pagetitle}<%}%></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="<%
        if (pagetitle) {
            out << "eformat.me : ${pagetitle}"
        } else {
            out << "eformat.me : This is working out great."
        }
    %>">
    <meta property="og:title" content="<%
        if (pagetitle) {
            out << "eformat.me - ${pagetitle}"
        } else {
            out << "eformat.me"
        }
    %>" />
    <meta property="og:type" content="website" />
    <meta property="og:image" content="${config.site_host}/img/eformat.me.jpg" />
    <meta property="og:url" content="<%
        if (content.type == "archive") {
            out << """${config.site_host}/archive.html"""
        } else if (content.type == "tag") {
            out << """${config.site_host}/tags/${tag}.html"""
        } else {
            out << config.site_host
        }
    %>" />
    <meta property="og:description" content="<%
        if (pagetitle) {
            out << "eformat.me : ${pagetitle}"
        } else {
            out << "eformat.me : This is working out great."
        }
    %>" />
    <meta property="og:locale" content="en_GB" />
    <meta property="og:site_name" content="eformat.me" />

    <!-- Le styles -->
    <link href="<%if (content.rootpath){%>${content.rootpath}<%}else{if (content.type == "tag"){%>../<%}}%>css/lightbox.css" rel="stylesheet">
    <link href="<%if (content.rootpath){%>${content.rootpath}<%}else{if (content.type == "tag"){%>../<%}}%>css/yeti/bootstrap.min.css" rel="stylesheet">
    <link href="<%if (content.rootpath){%>${content.rootpath}<%}else{if (content.type == "tag"){%>../<%}}%>css/base.css" rel="stylesheet">
    <link href="<%if (content.rootpath){%>${content.rootpath}<%}else{if (content.type == "tag"){%>../<%}}%>css/asciidoctor.css" rel="stylesheet">
    <!-- link href="/css/bootstrap-theme.min.css" rel="stylesheet" -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <!--<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">-->
    <link rel="shortcut icon" href="<%if (content.rootpath){%>${content.rootpath}<%}else{if (content.type == "tag"){%>../<%}}%>favicon.ico">

    <!-- WebAnalytics -->
    <script defer data-domain="blog.eformat.me" src="https://plausible.apps.sno.eformat.me/js/script.js"></script>
  </head>
  <body>
    <div id="wrap">
