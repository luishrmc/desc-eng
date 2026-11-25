---
name: svg-figure-pipeline
description: Designs, validates, and converts single-column SVG technical diagrams into cropped vector PDFs for IEEE two-column LaTeX manuscripts. Activate when creating or splitting figures into \columnwidth diagrams, checking visual legibility via PNG previews, or enforcing zero figure* layout rules.
---
# SVG Figure Pipeline

Engine for producing crisp, legible vector SVG figures tailored to IEEE two-column (`\columnwidth`) manuscripts without relying on Inkscape or verbose TikZ blocks.

## When to Use

Activate this skill when:

- Creating new conceptual, circuit, waveform, flowchart, or comparative diagrams in `img/*.svg`.
- Splitting wide multi-panel figures (`figure*`) into two complementary single-column (`\columnwidth`) figures.
- Converting `.svg` sources into cropped vector `.pdf` assets and inspecting PNG previews visually before compilation.

Do not activate when:

- Editing purely textual prose or BibTeX entries unrelated to figures.
- Running full document `latexmk` builds (`latex-build` responsibility).

## Design Standards for IEEE Two-Column Fit

1. **Single-Column Constraint:** Size the SVG `viewBox` between `460` and `480` px wide (`height` proportional, typically `300` to `520` px) so `\includegraphics[width=\columnwidth]{...}` renders with legible text in an `8.8 cm` IEEE column.
2. **Typography and Hygiene:**
   - Use `font-family="DejaVu Sans, Arial, sans-serif"` with body text `>= 11 px`, titles `12` to `13 px`, and explicit `<tspan baseline-shift="sub" font-size="75%">` for subscripts.
   - Maintain zero semicolons, zero em-dashes, and zero en-dashes inside diagram labels (use colons, commas, or standard hyphens for numeric ranges).
   - Keep strong foreground/background contrast (`#0f172a` or `#334155` on light fills, never faint gray labels).
3. **PMOS Polarity Consistency:** Place `V_{SS}` (`+5 V`) at the top rail and `V_{DD}` (`-10 V`) at the bottom rail in circuit schematics so all figures share a uniform voltage orientation.
4. **Two-Panel Decomposition:** Split wide side-by-side concepts into two separate `.svg` files placed in `\begin{figure}[!t]` environments near their explanatory paragraphs, each with its own `\caption` and `\label{fig:...}` cited via `\cref{fig:...}`.

## Conversion and Visual Inspection Workflow

1. Write the diagram to `img/<name>.svg`.
2. Run the deterministic conversion wrapper:
   ```bash
   bash .agents/scripts/svg2pdf.sh img/<name>.svg
   ```
   This invokes headless Google Chrome (`--print-to-pdf`), crops margins via `pdfcrop` into `img/<name>.pdf`, and renders `out/preview_<name>-1.png` at 150 DPI.
3. Inspect `out/preview_<name>-1.png` via `read_file` to verify:
   - Zero clipped labels or cropped borders.
   - Zero overlapping arrows, wires, or text elements.
   - Readable font proportions when scaled down to a single column.
4. Fix any visual defects in `img/<name>.svg` and re-run Step 2 until clean.
5. Remove temporary preview artifacts before committing:
   ```bash
   bash .agents/scripts/svg2pdf.sh --clean img/<name>.svg
   ```

## Negative Constraints

- Never emit `\begin{figure*}` for diagrams or embed figures wider than `\columnwidth`.
- Never skip reading the rendered `out/preview_*.png` before finalizing a new or edited `.svg`.
- Never leave `out/preview_*.png` or `out/*_raw.pdf` files behind after verification.
- Never use em-dashes, en-dashes, or semicolons in diagram captions or SVG text nodes.
