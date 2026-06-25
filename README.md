# alexanderengel.de

Persönliche „Über mich"-Website von Alexander Engel – eine schlanke, statische
Visitenkarte im Neumorphismus-Stil. Gebaut mit [Astro](https://astro.build/).
Ohne externe Tracker und ohne externe Schrift-CDNs: Die Schrift **Inter** ist
selbst gehostet, es werden keine Anfragen an Dritte (z. B. Google Fonts) gestellt.

## Entwicklung

```bash
npm install      # Abhängigkeiten installieren (einmalig)
npm run dev      # Dev-Server auf http://localhost:4321
npm run build    # Produktions-Build nach ./dist
npm run preview  # gebauten Stand lokal anschauen
npm run zip      # Build + fertige alexanderengel.de.zip zum Hochladen erzeugen
```

## Inhalte anpassen

| Was | Datei |
| --- | --- |
| Name, Kontaktlinks (Telefon, E-Mail, LinkedIn) | `src/pages/index.astro` |
| Impressum | `src/pages/impressum.astro` |
| Datenschutzerklärung | `src/pages/datenschutz.astro` |
| Farben, Typografie, Layout (Neumorphismus) | `src/styles/global.css` |
| Kopf-/Fußzeile, Meta-Tags | `src/layouts/Layout.astro` |
| Profilfoto | `public/profile.jpg` |

## Deployment (netcup / Webspace)

Die Seite ist vollständig statisch – auf dem Server wird kein Node.js benötigt.

**Einfachster Weg (ZIP):** Die mitgelieferte Datei `alexanderengel.de.zip` auf
den Webspace hochladen und im Webroot (bei Plesk meist `httpdocs`) entpacken.
Der Inhalt liegt auf oberster Ebene (kein Unterordner) und landet damit direkt
im Webroot. Anschließend in Plesk HTTPS (Let's Encrypt) für die Domain aktivieren.

Nach Änderungen das Paket neu erzeugen:

```bash
npm run zip
```

Das baut die Seite und schreibt eine aktualisierte `alexanderengel.de.zip`.
Alternativ lässt sich der Inhalt von `dist/` auch direkt per FTP/SFTP hochladen.

## Was steckt im Deploy-Paket?

Das ZIP (bzw. der Ordner `dist/`) enthält **ausschließlich die fertige Website** –
also nur das, was zur Laufzeit technisch gebraucht wird:

- `index.html`, `impressum/`, `datenschutz/` – die Seiten
- `_astro/*.css` – gebündeltes, minifiziertes CSS
- `fonts/inter-latin-wght-normal.woff2` – die Schrift (siehe unten)
- `profile.jpg` – Profilfoto
- `favicon.svg` – Favicon
- `sitemap-*.xml` – Sitemap für Suchmaschinen

**Nicht enthalten** (wird nur zur Entwicklung/zum Bauen benötigt und gehört nicht
auf den Webspace): Quellcode (`src/`), Abhängigkeiten (`node_modules/`),
Projekt- und Build-Konfiguration (`package.json`, `package-lock.json`,
`astro.config.mjs`, `tsconfig.json`), das Verpackungs-Skript (`scripts/`), diese
`README.md` sowie lokale Tooling-Dateien (`.claude/`).

### Schrift (Inter)

Inter ist selbst gehostet (`public/fonts/`) – kein externer Request. Ausgeliefert
wird bewusst **nur das Latin-Subset**, das deutschen Text vollständig abdeckt
(inkl. Umlauten, `ß`, `§`, `€` sowie typografischen Anführungszeichen und
Gedankenstrich). Nicht benötigte Subsets (Latin-Extended, Kyrillisch, Griechisch,
Vietnamesisch) sind entfernt, um das Paket klein zu halten.

> Sollten künftig Texte oder Namen mit erweiterten lateinischen Zeichen
> vorkommen (z. B. `ł`, `č`, `ā`), das `latin-ext`-`@font-face` in
> `src/styles/global.css` wieder ergänzen und die passende `woff2` unter
> `public/fonts/` ablegen.
