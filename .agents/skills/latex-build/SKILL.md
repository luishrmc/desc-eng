---
name: latex-build
description: Execute non-interactive LaTeX builds via latexmk, isolate artifacts in out/, run audit-build.py integrity checks, render selective PNG pages for visual inspection, and emit actionable remediation patches. Activate after editing .tex files, upon explicit /build commands, or during automated verification loops.
---
# LaTeX Build Validator

An automated verification engine (`v1.1.0`) designed for the Antigravity CLI (`agy`) and multi-agent LaTeX authoring pipelines. Compiles documents non-interactively, isolates generated artifacts, validates structural invariants, and supports selective visual page checks.

## When to Use

Activate this skill when:

- Upstream agents or users edit `.tex`, `.bib`, or `.svg`/`.pdf` figure sources.
- The user issues `/build`, `/compile`, or `/check` in a LaTeX repository.
- Running a global synchronization barrier before `technical-critic-agent` review.
- Inspecting compilation logs or rendered pages to diagnose layout issues.

Do not activate when:

- Authoring prose or editing `.svg` sources directly (`latex-writer` and `svg-figure-pipeline`).

## Core Execution Pipeline

### Phase 1: Pre-Build Linter and Environment Check

1. Run the deterministic style linter first:
   ```bash
   bash .agents/hooks/latex-style-linter.sh secoes/
   ```
2. Ensure `out/` exists and purge stale `out/pages/` or `out/preview_*.png` previews before final validation.

### Phase 2: Clean Non-Interactive Compilation

1. Execute clean rebuild via `latexmk` using project-standard flags:
   ```bash
   latexmk -C -outdir=out main.tex && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=out main.tex
   ```
2. Capture `pdfinfo out/main.pdf` (page count, Letter size, byte size).

### Phase 3: Automated Log, Cross-Ref, and BibTeX Audit

1. Execute the deterministic build auditor:
   ```bash
   python3 .agents/scripts/audit-build.py --strict --json
   ```
2. Verify all strict gates pass:
   - `figure_star_count == 0`
   - `missing_imgs == []`
   - `missing_labels == []`
   - `missing_in_bib == []` and `bib_duplicates == 0`
   - `fatal_errors == 0`, `latex_warnings == 0`, `undefined_count == 0`, `blg_warnings == 0`
   - Report `overfull_hbox_tex` (target `0`), `overfull_gt_15pt` (target `0`), `underfull_hbox`, and `underfull_vbox`.

### Phase 4: Selective Visual Page Rendering (On Demand)

1. Because `exit code 0` cannot catch visual `siunitx` spacing defects or tight equations, render affected pages when figures, tables, or unit macros change:
   ```bash
   mkdir -p out/pages && rm -f out/pages/* && pdftoppm -f <start> -l <end> -png -r 120 out/main.pdf out/pages/page
   ```
2. Inspect rendered `out/pages/page-*.png` via `read_file` and clean up `rm -rf out/pages/` before final commit.

### Phase 5: Feedback Loop Control

1. Track remediation attempts ($N \le 3$ per cycle).
2. If fatal errors, critical warnings, or strict audit checks fail, report exact file, line number, and root cause to `latex-author-agent`.

## Negative Constraints

- Never execute interactive compilation commands that wait for stdin.
- Never place generated `.aux`, `.bbl`, `.fls`, or `.log` files in the source root.
- Never delete `.tex`, `.bib`, or `img/` sources during cleanup.
- Never suppress fatal errors or ignore non-zero exits from `audit-build.py --strict`.
- Never use em-dashes, en-dashes, or semicolons.
