# alexanderengel.de

Persönliche „Über mich"-Website von Alexander Engel. Gebaut mit
[Astro](https://astro.build/) als statische Seite – ohne externe Tracker,
mit lokal eingebundenen Schriftarten.

## Entwicklung

```bash
npm install      # Abhängigkeiten installieren (einmalig)
npm run dev      # Dev-Server auf http://localhost:4321
npm run build    # Produktions-Build nach ./dist
npm run preview  # gebauten Stand lokal anschauen
```

## Inhalte anpassen

| Was | Datei |
| --- | --- |
| Name, Untertitel, Über-mich-Text, Schwerpunkte, Kontaktlinks | `src/pages/index.astro` |
| Impressum (rechtlich erforderlich) | `src/pages/impressum.astro` |
| Datenschutzerklärung (Vorlage) | `src/pages/datenschutz.astro` |
| Farben, Typografie, Layout | `src/styles/global.css` |
| Kopf-/Fußzeile, Meta-Tags | `src/layouts/Layout.astro` |

Stellen, die noch ausgefüllt werden müssen, sind mit `TODO` bzw. mit
`[Platzhaltern in eckigen Klammern]` markiert.

## Deployment (eigener Server)

`npm run build` erzeugt eine vollständig statische Seite im Ordner `dist/`.
Den Inhalt von `dist/` einfach in das Webroot des Servers hochladen
(z. B. per FTP/SFTP, rsync oder über die Deployment-Pipeline). Es wird kein
Node.js auf dem Server benötigt.
