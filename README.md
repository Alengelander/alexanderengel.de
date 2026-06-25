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
npm run zip      # Build + fertige alexanderengel.de.zip zum Hochladen erzeugen
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

## Deployment (netcup / Webspace)

Die Seite ist vollständig statisch – auf dem Server wird kein Node.js benötigt.

**Einfachster Weg (ZIP):** Die mitgelieferte Datei `alexanderengel.de.zip` auf
den Webspace hochladen und im Webroot entpacken. Der Inhalt liegt auf oberster
Ebene (kein Unterordner) und landet damit direkt im Webroot.

Nach Änderungen das Paket neu erzeugen:

```bash
npm run zip
```

Das baut die Seite und schreibt eine aktualisierte `alexanderengel.de.zip`.
Alternativ lässt sich der Inhalt von `dist/` auch direkt per FTP/SFTP hochladen.
