<%@ page import="io.github.s0ooo0k.day49.model.vo.KeywordSearch" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>🔥 마이 북마크</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 40px 20px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .search-box {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-bottom: 30px;
        }

        .memo-board {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
            padding: 0 20px;
        }

        .memo-card {
            background: white;
            border-radius: 16px;
            padding: 20px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.06);
            transition: transform 0.2s ease;
        }

        .memo-card:hover {
            transform: translateY(-5px);
        }

        .memo-title {
            font-size: 1.1rem;
            font-weight: bold;
            color: #007BFF;
            text-decoration: none;
        }

        .memo-title:hover {
            text-decoration: underline;
            color: #0056b3;
        }

        .memo-list {
            list-style: none;
            padding-left: 0;
            margin-top: 10px;
            font-size: 0.95rem;
            color: #444;
        }

        .memo-list li {
            margin-bottom: 6px;
            word-break: break-all;
        }

        .save-button {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 16px;
            background-color: #007BFF;
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.1s ease;
        }

        .save-button:hover {
            background-color: #0056b3;
            transform: scale(1.03);
        }

        .save-button:active {
            transform: scale(0.98);
        }
    </style>
</head>
<body>

<h1>북마크를 만들자</h1>


<div class="search-box">
    <form>
        <label>키워드 : <input name="keyword" class="form-control d-inline-block w-auto" placeholder="예: 스프링을 잘 하는 법"></label>
        <input type="submit" value="검색" class="btn btn-primary">
    </form>
    <form action="bookmarkList" method="get">
        <button type="submit" class="btn btn-outline-secondary">북마크 전체보기</button>
    </form>

</div>
<div class="search-box">
    <p>제목을 누르면 새창으로 이동합니다</p>
</div>

<% if (request.getAttribute("message") != null) { %>
<script>
    alert("<%= request.getAttribute("message") %>");
</script>
<% } %>

<% if (request.getAttribute("result") != null) { %>
<section class="memo-board">
    <%
        for (KeywordSearch v : (List<KeywordSearch>) request.getAttribute("result")) {
    %>
    <div class="memo-card">
        <a href="<%= v.link() %>" target="_blank" class="memo-title"><%= v.title() %></a>
        <ul class="memo-list">
            <li><%= v.description() %></li>
            <li><%= v.date() %></li>
        </ul>
        <form action="bookmark" method="post">
            <input type="hidden" name="uuid" value="<%= v.uuid() %>">
            <button type="submit" class="save-button">북마크</button>
        </form>
    </div>
    <%
        }
    %>
</section>
<% } %>

</body>
</html>