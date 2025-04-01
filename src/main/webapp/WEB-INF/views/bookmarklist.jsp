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
        .bookmark-page {
            background-color: #f4f6f8;
            padding: 40px 20px;
            max-width: 1200px;
            margin: 0 auto;
            color: #212529; /* 본문 글자색 */
        }

        .bookmark-card {
            background: white;
            border-radius: 16px;
            padding: 20px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.06);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
            color: inherit;
        }

        .bookmark-card:hover {
            background-color: #7fb2e3;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.12);
        }

        .bookmark-card h3 {
            font-size: 1.2rem;
            font-weight: 700;
            color: #111;
            margin-bottom: 10px;
        }

        .bookmark-card ul {
            padding-left: 0;
            list-style: none;
            font-size: 0.95rem;
            color: #444;
        }

        a.bookmark-link {
            display: block;
            text-decoration: none;
            color: inherit;
            transition: transform 0.2s ease;
        }

        a.bookmark-link:hover {
            transform: scale(1.02);
        }
    </style>
</head>
<body class="bookmark-page">
<h1>북마크 모음</h1>
<section class="memo-board">
    <% for (KeywordSearch v : (List<KeywordSearch>) request.getAttribute("bookmarks")) { %>
    <a href="<%= v.link() %>" target="_blank" class="bookmark-link">
        <div class="bookmark-card">
            <h3><%= v.title() %></h3>
            <ul>
                <li><%= v.description() %></li>
                <li><%= v.date() %></li>
            </ul>
        </div>
    </a>

    <% } %>
</section>


</body>
</html>
