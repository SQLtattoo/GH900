# 🧾 GitHub Markdown Cheat Sheet

## 🧠 Core Concept
Markdown is a lightweight markup language — you format text using plain symbols instead of rich-text buttons.
Used in:
- `README.md` files
- Issues and Pull Requests
- Wikis, Discussions, Comments

> 💡 Tip: GitHub auto-renders `.md` files and allows preview.

---

## 📌 Headings
# Project Title
## Section
### Subsection


---

## ✍️ Emphasis
*italic*   _also italic_
**bold**   __also bold__
***bold italic***
~~strikethrough~~

---

## 📋 Lists
**Unordered:**
- Item 1
- Item 2
  - Subitem

**Ordered:**
1. Step one
2. Step two

**Checkboxes:**
- [x] Done
- [ ] To do

---

## 🔗 Links
[GitHub](https://github.com)


Or reference style:
```markdown
[GitHub][1]

[1]: https://github.com
```

---

## 🖼️ Images
Remote image: _(raw format needed)_
```markdown
![Alt text](https://raw.githubusercontent.com/SQLtattoo/azd-az104-all-in-one/master/demoguide/images/az104allinone-diagram.png)
```
![Alt text](https://raw.githubusercontent.com/SQLtattoo/azd-az104-all-in-one/master/demoguide/images/az104allinone-diagram.png)


Local example:
```markdown
![Team Orion Logo](./images/team_orion_logo.png)
```
![Team Orion Logo](./images/team_orion_logo.png)

> 💡 Use local `/images/` folder when possible and include descriptive alt text.

---

## 🧱 Code Blocks
Inline: `code`

Multiline:
```python
print("Hello, Mars!")
print("Exploring space with Team Orion.")
```


---

## 📊 Tables
| Planet | Distance (AU) | Discovered |
|--------|----------------|-------------|
| Mercury | 0.39 | Ancient |
| Venus | 0.72 | Ancient |
| Earth | 1.00 | — |


---

## 📎 Blockquotes
```markdown
> “Team Orion explores space, one commit at a time.”
```

---

## ⚙️ Horizontal Rule
```markdown
---
```

---

## 💬 Mentions & Emojis
```markdown
@username  – mentions someone
:rocket:   – 🚀
```
---

## 🧩 GitHub Flavored Markdown (GFM)
Includes extras like:
- Task lists ✅
- Tables
- Strikethrough
- Syntax highlighting
- Mentions (`@user`)
- PR linking (`#123`)

---

## ✅ Best Practices
- Use headings & lists for structure.
- Keep README.md concise & helpful.
- Preview before committing.
- Always update Markdown through branches + PRs.
