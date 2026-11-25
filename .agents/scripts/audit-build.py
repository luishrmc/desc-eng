#!/usr/bin/env python3
"""Auditoria deterministica pos-compilacao para o artigo IEEE em duas colunas."""

import argparse
import glob
import json
import os
import re
import sys


def strip_comments(tex: str) -> str:
    lines = []
    for line in tex.splitlines():
        cleaned = re.sub(r"(?<!\\)%.*$", "", line)
        lines.append(cleaned)
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser(description="Audita build LaTeX, figuras, rotulos e BibTeX.")
    parser.add_argument("--strict", action="store_true", help="Retorna exit code 1 se houver violacoes.")
    parser.add_argument("--json", action="store_true", help="Emite saida em JSON.")
    args = parser.parse_args()

    tex_files = ["main.tex", "00_config.tex"] + sorted(glob.glob("secoes/*.tex"))
    tex_contents = {}
    for path in tex_files:
        if os.path.exists(path):
            with open(path, encoding="utf-8") as fh:
                tex_contents[path] = strip_comments(fh.read())

    all_tex = "\n".join(tex_contents.values())
    secoes_tex = "\n".join(v for k, v in tex_contents.items() if k.startswith("secoes/"))

    # 1. Checagem de figure*
    figure_stars = []
    for path, content in tex_contents.items():
        if path.startswith("secoes/"):
            for idx, line in enumerate(content.splitlines(), 1):
                if r"\begin{figure*}" in line:
                    figure_stars.append(f"{path}:{idx}")

    # 2. Checagem de \includegraphics em img/
    img_refs = re.findall(r"\\includegraphics(?:\[[^\]]*\])?\{([^}]+)\}", all_tex)
    missing_imgs = []
    for img in img_refs:
        candidates = [img, os.path.join("img", img)]
        if not any(os.path.exists(c) for c in candidates):
            missing_imgs.append(img)

    # 3. Integridade \label{} vs \cref{}/\ref{}
    labels = set(re.findall(r"\\label\{([^}]+)\}", all_tex))
    ref_groups = re.findall(r"\\(?:[cC]ref|ref|eqref)\{([^}]+)\}", all_tex)
    referenced_labels = set()
    for group in ref_groups:
        for item in group.split(","):
            key = item.strip()
            if key:
                referenced_labels.add(key)
    missing_labels = sorted(referenced_labels - labels)

    # 4. Integridade BibTeX
    bib_keys = []
    bib_path = "pos_textuais/01_referencias.bib"
    if os.path.exists(bib_path):
        with open(bib_path, encoding="utf-8") as fh:
            bib_keys = re.findall(r"@\w+\{([^,\s]+)\s*,", fh.read())
    unique_bib = set(bib_keys)
    duplicate_bib = len(bib_keys) - len(unique_bib)

    cite_groups = re.findall(r"\\cite(?:\[[^\]]*\])?\{([^}]+)\}", all_tex)
    cited_keys = set()
    for group in cite_groups:
        for item in group.split(","):
            key = item.strip()
            if key:
                cited_keys.add(key)
    missing_in_bib = sorted(cited_keys - unique_bib)
    unused_in_bib = sorted(unique_bib - cited_keys)

    # 5. Telemetria de out/main.log e out/main.blg
    log_stats = {
        "fatal_errors": 0,
        "latex_warnings": 0,
        "undefined_count": 0,
        "overfull_hbox_tex": 0,
        "overfull_hbox_total": 0,
        "overfull_gt_15pt": 0,
        "underfull_hbox": 0,
        "underfull_vbox": 0,
        "blg_warnings": 0,
    }

    if os.path.exists("out/main.log"):
        with open("out/main.log", encoding="utf-8", errors="replace") as fh:
            log_text = fh.read()
        log_lines = log_text.splitlines()
        log_stats["fatal_errors"] = sum(1 for ln in log_lines if ln.startswith("! "))
        log_stats["latex_warnings"] = sum(1 for ln in log_lines if "LaTeX Warning:" in ln)
        log_stats["undefined_count"] = sum(
            1 for ln in log_lines if "undefined" in ln.lower() and "warning" in ln.lower()
        )
        log_stats["underfull_hbox"] = sum(1 for ln in log_lines if "Underfull \\hbox" in ln)
        log_stats["underfull_vbox"] = sum(1 for ln in log_lines if "Underfull \\vbox" in ln)
        for i, ln in enumerate(log_lines):
            m = re.search(r"Overfull \\hbox \(([0-9.]+)pt too wide\)", ln)
            if m:
                log_stats["overfull_hbox_total"] += 1
                if float(m.group(1)) > 15.0:
                    log_stats["overfull_gt_15pt"] += 1
                context = "\n".join(log_lines[max(0, i - 3) : min(len(log_lines), i + 3)])
                if "main.bbl" not in context:
                    log_stats["overfull_hbox_tex"] += 1

    if os.path.exists("out/main.blg"):
        with open("out/main.blg", encoding="utf-8", errors="replace") as fh:
            for ln in fh:
                m = re.search(r"There (?:were|was) (\d+) warnings?", ln)
                if m:
                    log_stats["blg_warnings"] += int(m.group(1))

    report = {
        "figure_star_count": len(figure_stars),
        "figure_stars": figure_stars,
        "includegraphics_count": len(img_refs),
        "missing_imgs": sorted(set(missing_imgs)),
        "labels_declared": len(labels),
        "labels_referenced": len(referenced_labels),
        "missing_labels": missing_labels,
        "bib_entries_unique": len(unique_bib),
        "bib_duplicates": duplicate_bib,
        "cited_keys_unique": len(cited_keys),
        "missing_in_bib": missing_in_bib,
        "unused_in_bib": unused_in_bib,
        "log": log_stats,
    }

    if args.json:
        print(json.dumps(report, indent=2, ensure_ascii=False))
    else:
        print(f"[AUDIT] figure*: {report['figure_star_count']} | includegraphics: {report['includegraphics_count']} (ausentes: {len(report['missing_imgs'])})")
        print(f"[AUDIT] labels: {report['labels_referenced']}/{report['labels_declared']} (ausentes: {report['missing_labels']})")
        print(f"[AUDIT] bib: {report['cited_keys_unique']}/{report['bib_entries_unique']} (ausentes: {report['missing_in_bib']}, orfas: {report['unused_in_bib']})")
        print(f"[AUDIT] log: {json.dumps(log_stats)}")

    if args.strict:
        failed = (
            report["figure_star_count"] > 0
            or len(report["missing_imgs"]) > 0
            or len(report["missing_labels"]) > 0
            or len(report["missing_in_bib"]) > 0
            or report["bib_duplicates"] > 0
            or log_stats["fatal_errors"] > 0
            or log_stats["latex_warnings"] > 0
            or log_stats["undefined_count"] > 0
            or log_stats["blg_warnings"] > 0
        )
        return 1 if failed else 0
    return 0


if __name__ == "__main__":
    sys.exit(main())
