---
layout: page
title: GeoAI / GIS
permalink: /geoai/
description: Interactive geospatial research layer for GeoAI, WebGIS and embodied spatial intelligence.
nav: true
nav_order: 3
---

# GeoAI / GIS laboratory

This page is the interactive geospatial layer of the portfolio. It will progressively host research maps, PMTiles, GeoJSON, field data, prototypes and reproducible demonstrations.

## GeoAI architecture

```text
Natural language / task
          ↓
   GeoAI Orchestrator
          │
          ├── Intent + spatial semantics
          ├── Planner
          ├── Tool router
          ├── Data provenance
          ├── Spatial validator
          └── Policy / permission layer
          ↓
 GIS engines + databases + sensors + models
          ↓
 Map / report / coordinates / robot action
```

## Research geography

The map below is a **context map**, not a boundary or survey dataset. It highlights the Mekong Delta area that motivates many environmental, GIS and field-technology problems in this research program.

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css">

<div id="research-map" style="height:470px;border-radius:12px;overflow:hidden;margin:1rem 0 1.5rem;"></div>

<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function () {
  var el = document.getElementById("research-map");
  if (!el || typeof L === "undefined") return;
  var map = L.map("research-map", { scrollWheelZoom: false }).setView([10.10, 106.00], 8);
  L.tileLayer("https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png", {
    maxZoom: 19,
    attribution: "&copy; OpenStreetMap contributors &copy; CARTO"
  }).addTo(map);
  [
    [10.25, 105.97, "Vinh Long — GIS / GeoAI / environmental systems"],
    [10.24, 106.38, "Ben Tre — environmental and field research context"],
    [9.93, 106.34, "Tra Vinh — coastal / environmental research context"]
  ].forEach(function (item) {
    L.marker([item[0], item[1]]).addTo(map).bindPopup(item[2]);
  });
});
</script>

## Open geospatial stack

| Layer | Preferred technologies |
| --- | --- |
| Browser map | MapLibre GL JS / Leaflet |
| Large static tiles | PMTiles |
| Vector exchange | GeoJSON / FlatGeobuf / GeoPackage |
| Spatial database | PostGIS |
| Processing | GDAL / PROJ / QGIS |
| Routing | OSRM-compatible services |
| AI tool interface | JSON tool contracts / MCP-style adapters |
| Deployment | GitHub Pages + Actions for static layers; services only where necessary |

The long-term objective is an **open geospatial function repository** in which GIS capabilities can be discovered and invoked by AI agents while remaining inspectable by human users.
