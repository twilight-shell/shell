#!/usr/bin/env python3
"""Fills the table of contents of the READMEs.

    scripts/readme-toc.py README.md i18n/README/*.md

The contents go between `<!-- toc:start -->` and `<!-- toc:end -->`: a list of the
`##` and `###` headings, linked the way GitHub makes the anchors of headings
(lower case, punctuation dropped, spaces to hyphens, a number after a repeat).
The first `##` heading, the one that says "Contents", is left out.
"""
import re
import sys


def slug(text, seen):
    s = re.sub(r"[^\w\- ]", "", text.strip().lower()).replace(" ", "-")
    n = seen.get(s, 0)
    seen[s] = n + 1
    return s if n == 0 else f"{s}-{n}"


def headings(lines):
    fenced = False
    for line in lines:
        if line.startswith("```"):
            fenced = not fenced
        elif not fenced:
            m = re.match(r"(##|###) (.+)$", line)
            if m:
                yield len(m.group(1)) - 2, m.group(2).strip()


def toc(lines):
    seen = {}
    out = []
    first = True
    for level, text in headings(lines):
        anchor = slug(text, seen)
        if first:
            first = False
            continue
        out.append("  " * level + f"- [{text}](#{anchor})")
    return out


def main(paths):
    for path in paths:
        lines = open(path, encoding="utf-8").read().split("\n")
        try:
            a = lines.index("<!-- toc:start -->")
            b = lines.index("<!-- toc:end -->")
        except ValueError:
            print(f"{path}: no toc markers, skipped")
            continue
        entries = toc(lines)
        lines[a + 1:b] = entries
        open(path, "w", encoding="utf-8").write("\n".join(lines))
        print(f"{path}: {len(entries)} entries")


if __name__ == "__main__":
    main(sys.argv[1:])
