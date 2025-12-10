# 🔎 GitHub Search Cheat Sheet

## 🧱 Repository Search
| Syntax | Example | Description |
|---------|----------|-------------|
| `user:` | `user:bull` | Repos owned by a user |
| `org:` | `org:microsoft` | Repos under an organization |
| `repo:` | `repo:bull/space-explorer` | Search within one repo |
| `in:` | `in:name space` | Search in name, description, or README |
| `stars:` | `stars:>500` | Repos with more than 500 stars |
| `forks:` | `forks:<10` | Fewer than 10 forks |
| `language:` | `language:python` | Filter by language |
| `topic:` | `topic:security` | Match repo topics/tags |

---

## 🧠 Code Search
| Syntax | Example | Description |
|---------|----------|-------------|
| `"exact phrase"` | `"function login"` | Exact match |
| `repo:` | `repo:bull/space-explorer "fetchData"` | Search inside one repo |
| `path:` | `path:/src/` | Search in a folder path |
| `language:` | `language:javascript` | Filter by language |
| `filename:` | `filename:README.md` | Match specific file name |
| `extension:` | `extension:py` | Match file extension |

> 💡 Combine them:
```
repo:bull/space-explorer function OR class extension:py
```

---

## 🧩 Issues & Pull Requests
| Syntax | Example | Description |
|---------|----------|-------------|
| `is:` | `is:issue`, `is:pr`, `is:open`, `is:closed` | Filter type and status |
| `author:` | `author:bull` | Who opened it |
| `assignee:` | `assignee:bull` | Who it’s assigned to |
| `label:` | `label:bug` | Filter by label |
| `mentions:` | `mentions:bull` | You’re mentioned |
| `commenter:` | `commenter:bull` | Who commented |
| `created:` | `created:>2025-01-01` | Date range |
| `updated:` | `updated:<2025-10-01` | Last updated before date |
| `sort:` | `sort:updated-desc` | Sort by latest updates |

Example:
```
is:issue is:open label:enhancement assignee:bull sort:created-desc
```

---

## 🕰️ Commits
| Syntax | Example | Description |
|---------|----------|-------------|
| `author:` | `author:bull` | Commit author |
| `committer:` | `committer:bull` | Who committed it |
| `hash:` | `hash:abc123` | Specific commit |
| `repo:` | `repo:bull/space-explorer` | Scope |

Example:
```
repo:bull/space-explorer author:bull fix README
```

---

## 👥 Users
| Syntax | Example | Description |
|---------|----------|-------------|
| `location:` | `location:greece` | Filter by location |
| `language:` | `language:python` | Main language |
| `followers:` | `followers:>100` | Popular users |
| `repos:` | `repos:>10` | Active developers |

---

## ⚙️ Combine Filters
You can chain multiple filters together:
```
repo:bull/space-explorer language:python path:/scripts/ "mining"
```

---

## 🔗 Search URL Tip
Append your query to:
```
https://github.com/search?q=<your query>
```
Example:
```
https://github.com/search?q=repo:microsoft/sentinel language:kusto
```

---

✅ **Quick Reference Summary**
- `repo:` → Limit search to repo  
- `language:` → Filter by language  
- `is:` → Issues/PRs by state  
- `author:` → Filter by who created  
- `sort:` → Change result order  
- Combine multiple filters with spaces  
