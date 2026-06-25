// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

// https://astro.build/config
export default defineConfig({
  // Wird für korrekte Canonical-URLs und die Sitemap genutzt.
  site: 'https://alexanderengel.de',
  // Statischer Build (Standard) -> Ausgabe nach ./dist, deploybar auf jedem Webserver.
  integrations: [sitemap()],
});
