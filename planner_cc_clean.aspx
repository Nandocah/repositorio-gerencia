<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Planner Comunicação Criativa</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
<style>
/* ============================================================
   PLANNER COMUNICAÇÃO CRIATIVA
   App single-file: HTML + CSS + JS
   Estrutura aberta para futuras alterações.
   ============================================================ */

:root{
  --primary:#1B2A4A;
  --secondary:#C3EBF7;
  --accent:#FF6200;
  --white:#FFFFFF;
  --bg:#F5F5F5;
  --text:#333333;
  --muted:#7a7a7a;
  --border:#e3e3e3;
  --card:#FFFFFF;
  --shadow: 0 2px 8px rgba(27,42,74,.06);
  --shadow-lg: 0 8px 24px rgba(27,42,74,.10);
  --asset:#9EDCEF;
  --private:#000000;
  --ion:#A6CF2E;
  --success:#1f9d55;
  --danger:#d83b3b;
  --warn:#e8a93b;
  --radius:12px;
}
[data-theme="dark"]{
  --primary:#C3EBF7;
  --secondary:#1B2A4A;
  --accent:#FF6200;
  --white:#1a1f2e;
  --bg:#0f1320;
  --text:#e8eaf2;
  --muted:#9aa3b8;
  --border:#2a3147;
  --card:#1a1f2e;
  --shadow: 0 2px 8px rgba(0,0,0,.3);
  --shadow-lg: 0 8px 24px rgba(0,0,0,.4);
}

*{box-sizing:border-box;margin:0;padding:0}
html,body{height:100%}
body{
  font-family:'Segoe UI', system-ui, -apple-system, sans-serif;
  background:var(--bg);
  color:var(--text);
  font-size:14px;
  transition:background .25s,color .25s;
}

/* ===== HEADER ===== */
header{
  background:var(--card);
  border-bottom:1px solid var(--border);
  padding:14px 24px;
  display:flex;align-items:center;justify-content:space-between;
  position:sticky;top:0;z-index:50;
  box-shadow:var(--shadow);
}
.brand{display:flex;align-items:center;gap:12px}
.brand-logo{
  width:38px;height:38px;border-radius:10px;
  background:linear-gradient(135deg,var(--primary),var(--accent));
  display:flex;align-items:center;justify-content:center;
  color:#fff;font-weight:700;font-size:18px;
}
.brand-title{font-size:16px;font-weight:600;color:var(--text)}
.brand-sub{font-size:11px;color:var(--muted)}

.header-actions{display:flex;gap:10px;align-items:center}
.btn{
  border:none;cursor:pointer;font-weight:600;font-size:13px;
  padding:9px 16px;border-radius:8px;
  display:inline-flex;align-items:center;gap:6px;
  transition:transform .1s,box-shadow .15s,background .2s;
}
.btn:hover{transform:translateY(-1px)}
.btn-primary{background:var(--accent);color:#fff}
.btn-primary:hover{background:#e85800}
.btn-ghost{background:transparent;color:var(--text);border:1px solid var(--border)}
.btn-ghost:hover{background:var(--bg)}
.btn-danger{background:var(--danger);color:#fff}
.btn-sm{padding:6px 10px;font-size:12px}
.icon-btn{
  width:38px;height:38px;border-radius:50%;
  border:1px solid var(--border);background:transparent;color:var(--text);
  cursor:pointer;display:inline-flex;align-items:center;justify-content:center;
  transition:background .2s;
}
.icon-btn:hover{background:var(--bg)}

/* ===== TABS ===== */
.tabs{
  background:var(--card);
  border-bottom:1px solid var(--border);
  padding:0 24px;
  display:flex;gap:4px;
  overflow-x:auto;
}
.tab{
  border:none;background:transparent;cursor:pointer;
  padding:14px 18px;font-size:14px;font-weight:500;
  color:var(--muted);
  border-bottom:3px solid transparent;
  transition:color .2s,border-color .2s;
  white-space:nowrap;
}
.tab:hover{color:var(--text)}
.tab.active{color:var(--accent);border-bottom-color:var(--accent);font-weight:600}

/* ===== MAIN ===== */
main{padding:24px;max-width:1600px;margin:0 auto}
.page{display:none;animation:fade .25s ease}
.page.active{display:block}
@keyframes fade{from{opacity:0;transform:translateY(4px)}to{opacity:1;transform:none}}

.page-header{
  display:flex;align-items:center;justify-content:space-between;
  margin-bottom:20px;flex-wrap:wrap;gap:12px;
}
.page-title{font-size:22px;font-weight:700;color:var(--text)}
.page-sub{font-size:13px;color:var(--muted);margin-top:2px}

/* ===== BACKLOG ===== */
.segment-group{margin-bottom:24px}
.segment-header{
  display:flex;align-items:center;gap:10px;
  margin-bottom:10px;padding:8px 12px;border-radius:8px;
  background:var(--card);box-shadow:var(--shadow);
}
.segment-dot{width:10px;height:10px;border-radius:50%}
.segment-name{font-weight:600;font-size:14px}
.segment-count{
  font-size:11px;color:var(--muted);
  background:var(--bg);padding:2px 8px;border-radius:10px;
}
.cards-grid{
  display:grid;
  grid-template-columns:repeat(auto-fill,minmax(280px,1fr));
  gap:12px;
}
.task-card{
  background:var(--card);border-radius:var(--radius);
  padding:14px;box-shadow:var(--shadow);
  border-left:4px solid var(--asset);
  cursor:pointer;
  transition:transform .15s,box-shadow .2s;
  position:relative;
}
.task-card:hover{transform:translateY(-2px);box-shadow:var(--shadow-lg)}
.task-card.seg-asset{border-left-color:var(--asset)}
.task-card.seg-private{border-left-color:var(--private)}
.task-card.seg-ion{border-left-color:var(--ion)}
.task-card.seg-varejo{border-left-color:#9CA3AF}
.task-card.seg-banco{border-left-color:#D1D5DB}
.task-card.seg-gaveta{border-left-color:#6B7280}
.task-title{font-weight:600;font-size:14px;margin-bottom:6px;line-height:1.3}
.task-meta{font-size:11px;color:var(--muted);margin-bottom:8px}
.task-tags{display:flex;flex-wrap:wrap;gap:4px;margin-bottom:10px}
.tag{
  font-size:10px;padding:3px 8px;border-radius:10px;
  background:var(--bg);color:var(--text);font-weight:500;
}
.tag.urgente{background:#ffe1e1;color:#b00020}
.tag.alta{background:#ffe9d6;color:#a04500}
.tag.media{background:#fff5cc;color:#7a5b00}
.tag.baixa{background:#e1f3e1;color:#2a6b2a}
[data-theme="dark"] .tag{background:#2a3147;color:var(--text)}
.task-card-actions{display:flex;gap:6px;justify-content:flex-end;align-items:center;margin-top:8px}
.stars{color:#f0a800;font-size:12px;letter-spacing:1px}

/* ===== PLANNER GANTT ===== */
.planner-controls{
  background:var(--card);border-radius:var(--radius);
  padding:14px;box-shadow:var(--shadow);margin-bottom:16px;
  display:flex;flex-wrap:wrap;gap:10px;align-items:center;
}
.week-nav{display:flex;align-items:center;gap:10px;margin-right:auto}
.week-nav button{
  width:32px;height:32px;border-radius:50%;
  border:1px solid var(--border);background:transparent;
  color:var(--text);cursor:pointer;font-size:14px;
}
.week-nav button:hover{background:var(--bg)}
.week-label{font-weight:600;font-size:13px;min-width:160px;text-align:center}
.filter-select{
  border:1px solid var(--border);background:var(--card);color:var(--text);
  padding:6px 10px;border-radius:6px;font-size:12px;cursor:pointer;
}

.gantt-wrap{
  background:var(--card);border-radius:var(--radius);
  box-shadow:var(--shadow);overflow-x:auto;
}
.gantt{
  min-width:900px;
  display:grid;
  grid-template-columns:200px repeat(5,1fr);
  position:relative;
}
.gantt-header{
  background:var(--bg);
  padding:10px;font-weight:600;font-size:12px;text-align:center;
  border-bottom:1px solid var(--border);
  color:var(--muted);text-transform:uppercase;letter-spacing:.5px;
}
.gantt-header.today{background:var(--secondary);color:var(--primary)}
[data-theme="dark"] .gantt-header.today{background:#2a4a7a;color:#fff}
.gantt-row-label{
  padding:10px;border-bottom:1px solid var(--border);
  font-size:12px;font-weight:500;
  display:flex;align-items:center;gap:6px;
  background:var(--card);
  position:sticky;left:0;z-index:2;
}
.gantt-row-label .resp{font-size:10px;color:var(--muted)}
.gantt-cell{
  border-bottom:1px solid var(--border);
  border-left:1px solid var(--border);
  min-height:48px;position:relative;
}
.gantt-cell.today{background:rgba(195,235,247,.2)}
[data-theme="dark"] .gantt-cell.today{background:rgba(0,163,224,.08)}
.gantt-bar{
  position:absolute;top:10px;height:28px;
  border-radius:6px;color:#fff;font-size:11px;font-weight:600;
  padding:0 10px;display:flex;align-items:center;
  cursor:pointer;
  overflow:hidden;text-overflow:ellipsis;white-space:nowrap;
  box-shadow:0 2px 6px rgba(0,0,0,.15);
  transition:transform .15s,box-shadow .2s;
  z-index:1;
}
.gantt-bar:hover{transform:scale(1.02);box-shadow:0 4px 12px rgba(0,0,0,.25);z-index:3}
.gantt-bar.seg-asset{background:var(--asset)}
.gantt-bar.seg-private{background:var(--private)}
.gantt-bar.seg-ion{background:var(--ion);color:#1F2937}
.gantt-bar.seg-asset{background:var(--asset);color:#1F2937}
.gantt-bar.seg-varejo{background:#9CA3AF}
.gantt-bar.seg-banco{background:#D1D5DB;color:#1F2937}
.gantt-bar.seg-gaveta{background:#6B7280}
.gantt-progress{
  position:absolute;bottom:0;left:0;height:3px;
  background:rgba(255,255,255,.7);
}
.gantt-empty{
  padding:40px;text-align:center;color:var(--muted);
  grid-column:1/-1;
}

.capacity-card{
  background:var(--card);border-radius:var(--radius);
  padding:14px;box-shadow:var(--shadow);margin-top:16px;
}
.capacity-title{font-weight:600;font-size:13px;margin-bottom:10px}
.capacity-row{display:flex;align-items:center;gap:10px;margin-bottom:8px}
.capacity-name{width:90px;font-size:12px;font-weight:500}
.capacity-bar-wrap{flex:1;height:14px;background:var(--bg);border-radius:7px;overflow:hidden}
.capacity-bar-fill{height:100%;background:linear-gradient(90deg,var(--ion),var(--accent));transition:width .3s}
.capacity-count{font-size:11px;color:var(--muted);width:60px;text-align:right}

/* ===== CONCLUÍDOS (TABELA) ===== */
.table-wrap{
  background:var(--card);border-radius:var(--radius);
  box-shadow:var(--shadow);overflow-x:auto;
}
table{width:100%;border-collapse:collapse;font-size:13px}
th,td{padding:10px 12px;text-align:left;border-bottom:1px solid var(--border)}
th{background:var(--bg);font-weight:600;font-size:11px;text-transform:uppercase;color:var(--muted);letter-spacing:.5px}
tr:hover td{background:var(--bg)}

/* ===== DASHBOARD ===== */
.kpi-grid{
  display:grid;
  grid-template-columns:repeat(auto-fit,minmax(180px,1fr));
  gap:12px;margin-bottom:20px;
}
.kpi-card{
  background:var(--card);border-radius:var(--radius);
  padding:16px;box-shadow:var(--shadow);
  border-top:3px solid var(--accent);
}
.kpi-card.blue{border-top-color:var(--asset)}
.kpi-card.orange{border-top-color:var(--accent)}
.kpi-card.cyan{border-top-color:var(--ion)}
.kpi-card.green{border-top-color:var(--success)}
.kpi-card.red{border-top-color:var(--danger)}
.kpi-label{font-size:11px;color:var(--muted);text-transform:uppercase;letter-spacing:.5px}
.kpi-value{font-size:30px;font-weight:700;margin-top:4px}
.kpi-sub{font-size:11px;color:var(--muted);margin-top:4px}

.dash-grid{
  display:grid;
  grid-template-columns:1fr 1fr;
  gap:16px;
}
@media(max-width:900px){.dash-grid{grid-template-columns:1fr}}
.chart-card{
  background:var(--card);border-radius:var(--radius);
  padding:16px;box-shadow:var(--shadow);
}
.chart-title{font-weight:600;font-size:14px;margin-bottom:10px}
.chart-card canvas{max-height:280px}


/* ===== DASHBOARD FILTERS & EXTENDED ===== */
.dash-filters{
  display:flex; flex-wrap:wrap; gap:8px; align-items:center;
  background:var(--card); border-radius:var(--radius); padding:12px 14px;
  box-shadow:var(--shadow); margin-bottom:14px;
}
.dash-filters .group{display:flex; align-items:center; gap:6px}
.dash-filters label{font-size:11px; color:var(--muted); text-transform:uppercase; letter-spacing:.4px; font-weight:600}
.dash-filters select, .dash-filters input{
  font:inherit; font-size:13px; padding:6px 8px; border-radius:6px;
  border:1px solid var(--border); background:var(--bg); color:var(--fg);
}
.dash-filters .preset{
  display:inline-flex; gap:4px; background:var(--bg); border:1px solid var(--border);
  border-radius:8px; padding:2px;
}
.dash-filters .preset button{
  background:transparent; border:none; padding:5px 10px; border-radius:6px;
  font:inherit; font-size:12px; color:var(--fg); cursor:pointer;
}
.dash-filters .preset button.active{background:var(--accent); color:white}
.dash-filters .spacer{flex:1}
.dash-filters .reset{
  background:transparent; border:1px solid var(--border); color:var(--muted);
  padding:6px 12px; border-radius:6px; font-size:12px; cursor:pointer;
}
.dash-filters .reset:hover{color:var(--fg)}

.dash-range-info{
  color:var(--muted); font-size:12px; margin:-6px 0 12px 4px;
}

.dash-grid-3{
  display:grid;
  grid-template-columns:1fr 1fr 1fr;
  gap:16px;
  margin-top:16px;
}
@media(max-width:1100px){.dash-grid-3{grid-template-columns:1fr 1fr}}
@media(max-width:700px){.dash-grid-3{grid-template-columns:1fr}}

.chart-slider{
  display:flex; align-items:center; gap:10px;
  margin-top:10px; padding-top:10px;
  border-top:1px dashed var(--border);
}
.chart-slider label{
  font-size:10.5px; color:var(--muted); font-weight:700;
  letter-spacing:.5px; text-transform:uppercase;
}
.chart-slider input[type="range"]{
  flex:1; max-width:260px; direction:rtl;
}
.chart-slider .val{
  font-size:12px; color:var(--fg); font-weight:600; min-width:64px;
}

.status-split{
  display:grid;
  grid-template-columns: 1fr 130px;
  gap:14px;
  align-items:center;
}
@media(max-width:700px){.status-split{grid-template-columns:1fr}}
.status-chart-wrap{min-width:0}
.status-done{
  background:linear-gradient(135deg, rgba(255,98,0,.10), rgba(255,98,0,.02));
  border:1px solid rgba(255,98,0,.25);
  border-radius:12px;
  padding:14px 12px;
  text-align:center;
}
.status-done-label{
  font-size:10.5px; color:var(--muted); font-weight:700;
  text-transform:uppercase; letter-spacing:.5px;
  margin-bottom:6px;
}
.status-done-value{
  font-size:34px; line-height:1; font-weight:800; color:#FF6200;
}
.status-done-sub{
  font-size:11px; color:var(--muted); margin-top:6px;
}

/* ===== MODAL ===== */
.modal-overlay{
  position:fixed;inset:0;background:rgba(0,0,0,.5);
  display:none;align-items:center;justify-content:center;
  z-index:100;padding:20px;
  animation:fade .2s;
}
.modal-overlay.active{display:flex}
.modal{
  background:var(--card);border-radius:var(--radius);
  width:100%;max-width:700px;max-height:90vh;overflow-y:auto;
  box-shadow:var(--shadow-lg);
  animation:slide .25s ease;
}
@keyframes slide{from{transform:translateY(20px);opacity:0}to{transform:none;opacity:1}}
.modal-header{
  padding:18px 20px;border-bottom:1px solid var(--border);
  display:flex;align-items:center;justify-content:space-between;
}
.modal-title{font-size:16px;font-weight:600}
.modal-body{padding:20px}
.modal-footer{
  padding:14px 20px;border-top:1px solid var(--border);
  display:flex;justify-content:space-between;gap:10px;
}
.form-grid{display:grid;grid-template-columns:1fr 1fr;gap:12px}
.form-grid.full{grid-template-columns:1fr}
.form-field{display:flex;flex-direction:column;gap:4px}
.form-field.span2{grid-column:span 2}
.form-label{font-size:11px;font-weight:600;color:var(--muted);text-transform:uppercase;letter-spacing:.5px}
.form-input, .form-select, .form-textarea{
  border:1px solid var(--border);background:var(--card);color:var(--text);
  padding:8px 10px;border-radius:6px;font-size:13px;font-family:inherit;
  transition:border-color .2s;
}
.form-input:focus, .form-select:focus, .form-textarea:focus{
  outline:none;border-color:var(--accent);
}
.form-textarea{resize:vertical;min-height:60px}
.star-rating{display:flex;gap:2px;font-size:22px;cursor:pointer;color:#ccc}
.star-rating .star.on{color:#f0a800}

/* ===== TOAST ===== */
.toast-stack{
  position:fixed;bottom:20px;right:20px;
  display:flex;flex-direction:column;gap:8px;z-index:200;
}
.toast{
  background:var(--card);color:var(--text);
  padding:12px 18px;border-radius:8px;
  box-shadow:var(--shadow-lg);
  border-left:4px solid var(--success);
  font-size:13px;font-weight:500;
  animation:slideIn .25s ease;
  min-width:240px;
}
.toast.error{border-left-color:var(--danger)}
.toast.info{border-left-color:var(--ion)}
@keyframes slideIn{from{transform:translateX(100%);opacity:0}to{transform:none;opacity:1}}

/* ===== FILTER BAR ===== */
.filter-bar{
  display:flex;gap:8px;flex-wrap:wrap;margin-bottom:16px;
}

/* ===== EMPTY STATE ===== */
.empty{
  text-align:center;padding:60px 20px;color:var(--muted);
  background:var(--card);border-radius:var(--radius);
  box-shadow:var(--shadow);
}
.empty-icon{font-size:48px;margin-bottom:10px;opacity:.4}
.empty-title{font-size:16px;font-weight:600;margin-bottom:4px;color:var(--text)}

/* ===== RESPONSIVE ===== */
@media(max-width:700px){
  header{padding:12px 16px}
  main{padding:16px}
  .brand-title{font-size:14px}
  .brand-sub{display:none}
  .form-grid{grid-template-columns:1fr}
  .form-field.span2{grid-column:auto}
  .week-nav{margin-right:0;width:100%;justify-content:space-between}
}

.kanban-board{
  display:grid;
  grid-template-columns:repeat(5, minmax(240px, 1fr));
  gap:14px;
  align-items:start;
}
@media(max-width:1200px){ .kanban-board{ grid-template-columns:repeat(3, minmax(240px,1fr)); } }
@media(max-width:760px){  .kanban-board{ grid-template-columns:1fr; } }
.kanban-col{
  background:#F3F4F6;
  border:1px solid #E5E7EB;
  border-radius:14px;
  padding:12px 10px 14px;
  min-height:120px;
  display:flex; flex-direction:column; gap:10px;
}
.kanban-col-header{
  display:flex; align-items:center; justify-content:space-between;
  padding:4px 6px 2px;
}
.kanban-col-title{
  display:inline-flex; align-items:center; gap:8px;
  font-weight:700; font-size:13px;
  letter-spacing:.3px;
}
.kanban-col-dot{
  width:10px; height:10px; border-radius:50%;
  display:inline-block;
}
.kanban-col-count{
  background:#FFFFFF;
  color:#4B5563;
  font-size:11px; font-weight:700;
  padding:3px 10px; border-radius:999px;
  border:1px solid #E5E7EB;
}
.kanban-col-body{ display:flex; flex-direction:column; gap:10px; }
.kanban-col-empty{
  font-size:12px; color:#9CA3AF; font-style:italic;
  text-align:center; padding:18px 8px;
}
.kanban-board .task-card{
  padding:12px 12px 10px;
  border-radius:10px;
}
.kanban-board .task-title{ font-size:13.5px; line-height:1.35; }
.kanban-board .task-meta{ font-size:11.5px; }
.kanban-board .task-tags{ gap:5px; flex-wrap:wrap; }
.kanban-board .task-card-actions{ margin-top:8px; }


/* ============================================================
   DESIGN V2 — Sidebar layout, pill badges, modern filters
   ============================================================ */
:root{
  --v2-bg:#F7F8FA;
  --v2-surface:#FFFFFF;
  --v2-border:#E6E8EE;
  --v2-text:#1F2937;
  --v2-muted:#6B7280;
  --v2-sidebar-bg:#FFFFFF;
  --v2-sidebar-active:#FFE8D6;
  --v2-sidebar-active-text:#C24E00;
  --v2-success:#A6CF2E;
  --v2-success-dark:#7FA124;
  --v2-accent:#FF6200;
  --v2-accent-dark:#C24E00;
  --v2-shadow-sm:0 1px 2px rgba(15,23,42,.04), 0 1px 1px rgba(15,23,42,.03);
  --v2-shadow:0 2px 4px rgba(15,23,42,.05), 0 1px 2px rgba(15,23,42,.04);
  --v2-shadow-lg:0 8px 24px rgba(15,23,42,.08);
  --v2-radius-sm:8px;
  --v2-radius:12px;
  --v2-radius-lg:16px;
  --v2-radius-pill:999px;
}
[data-theme="dark"]{
  --v2-bg:#0B1020;
  --v2-surface:#141A2D;
  --v2-border:#22293F;
  --v2-text:#E8EAF2;
  --v2-muted:#9AA3B8;
  --v2-sidebar-bg:#141A2D;
  --v2-sidebar-active:#1B2A4A;
  --v2-sidebar-active-text:#9AE6B4;
}

body{
  background:var(--v2-bg)!important;
  color:var(--v2-text)!important;
  font-family:'Inter','Segoe UI',system-ui,-apple-system,sans-serif;
}

/* ===== Hide old header & old tabs ===== */
body > header.legacy-hidden,
body > .tabs.legacy-hidden{ display:none!important; }

/* ===== App layout (sidebar + content) ===== */
.app-shell{
  display:grid;
  grid-template-columns:240px 1fr;
  min-height:100vh;
}
.sidebar{
  background:var(--v2-sidebar-bg);
  border-right:1px solid var(--v2-border);
  display:flex; flex-direction:column;
  position:sticky; top:0; height:100vh;
  z-index:40;
}
.sidebar-brand{
  display:flex; align-items:center; gap:12px;
  padding:20px 18px 18px;
  border-bottom:1px solid var(--v2-border);
}
.brand-tiles{
  display:grid; grid-template-columns:1fr 1fr; gap:3px;
  width:28px; height:28px;
}
.brand-tiles span{
  border-radius:4px; display:block;
}
.brand-tiles span:nth-child(1){background:#FF6200}
.brand-tiles span:nth-child(2){background:#000000}
.brand-tiles span:nth-child(3){background:#9EDCEF}
.brand-tiles span:nth-child(4){background:#A6CF2E}
.sidebar-brand-text{
  font-weight:700; font-size:15px; color:var(--v2-text); letter-spacing:.2px;
}
.sidebar-brand-sub{
  font-size:10px; color:var(--v2-muted); margin-top:2px; line-height:1.2;
}

.sidebar-nav{
  flex:1; padding:14px 12px; display:flex; flex-direction:column; gap:4px;
  overflow-y:auto;
}
.sidebar-item{
  display:flex; align-items:center; gap:12px;
  padding:10px 12px; border-radius:var(--v2-radius-sm);
  font-size:13.5px; font-weight:500; color:var(--v2-muted);
  cursor:pointer; border:none; background:transparent;
  text-align:left; width:100%;
  transition:background .15s, color .15s;
}
.sidebar-item:hover{ background:var(--v2-bg); color:var(--v2-text); }
.sidebar-item.active{
  background:var(--v2-sidebar-active);
  color:var(--v2-sidebar-active-text);
  font-weight:600;
}
.sidebar-item-icon{
  width:20px; height:20px; display:inline-flex; align-items:center; justify-content:center;
  font-size:16px; flex-shrink:0;
}

.sidebar-footer{
  padding:14px 14px; border-top:1px solid var(--v2-border);
  display:flex; align-items:center; gap:10px;
}
.sidebar-avatar{
  width:32px; height:32px; border-radius:50%;
  background:linear-gradient(135deg,#6B7280,#374151);
  color:#fff; font-weight:700; font-size:13px;
  display:inline-flex; align-items:center; justify-content:center;
  flex-shrink:0;
}
.sidebar-user{font-size:13px; font-weight:600; color:var(--v2-text);}
.sidebar-user-role{font-size:10.5px; color:var(--v2-muted);}

/* ===== Content area ===== */
.content{
  display:flex; flex-direction:column;
  min-width:0;
}
.topbar{
  background:var(--v2-bg);
  padding:18px 28px;
  display:flex; align-items:center; justify-content:space-between;
  gap:14px; border-bottom:1px solid var(--v2-border);
  position:sticky; top:0; z-index:30;
  backdrop-filter:saturate(180%) blur(8px);
}
.topbar-title{
  font-size:20px; font-weight:700; color:var(--v2-text);
  letter-spacing:-.2px;
}
.topbar-sub{
  font-size:12px; color:var(--v2-muted); margin-top:2px;
}
.topbar-actions{display:flex; gap:10px; align-items:center;}

main{
  padding:22px 28px 32px!important;
  max-width:none!important;
  width:100%;
}

/* ===== Pill buttons ===== */
.btn{
  border-radius:var(--v2-radius-pill)!important;
  font-size:13px!important;
  font-weight:600!important;
  padding:9px 18px!important;
  box-shadow:var(--v2-shadow-sm);
  transition:transform .12s, box-shadow .15s, background .15s;
}
.btn-primary{ background:var(--v2-accent)!important; color:#fff!important; }
.btn-primary:hover{ background:var(--v2-accent-dark)!important; transform:translateY(-1px); box-shadow:var(--v2-shadow); }
.btn-success{
  background:var(--v2-success)!important; color:#34430D!important;
  border:none!important; cursor:pointer;
  padding:9px 18px!important; border-radius:var(--v2-radius-pill)!important;
  font-size:13px!important; font-weight:700!important;
  display:inline-flex; align-items:center; gap:6px;
}
.btn-success:hover{ background:var(--v2-success-dark)!important; color:#fff!important; transform:translateY(-1px); }
.btn-ghost{
  background:transparent!important;
  border:1px solid var(--v2-border)!important;
  color:var(--v2-text)!important;
}
.btn-ghost:hover{ background:var(--v2-surface)!important; }
.btn-sm{ padding:6px 12px!important; font-size:12px!important; }

.icon-btn{
  width:38px; height:38px; border-radius:50%;
  border:1px solid var(--v2-border); background:var(--v2-surface); color:var(--v2-text);
}

/* ===== Page header (inside content) ===== */
.page-header{
  margin-bottom:18px!important;
}
.page-title{
  font-size:22px!important; font-weight:700!important; letter-spacing:-.3px!important;
}
.page-sub{ color:var(--v2-muted)!important; }

/* ===== Filter bar (pill selects) ===== */
.filter-bar, .planner-controls, .dash-filters{
  background:var(--v2-surface)!important;
  border:1px solid var(--v2-border);
  border-radius:var(--v2-radius)!important;
  padding:14px!important;
  box-shadow:var(--v2-shadow-sm)!important;
  gap:10px!important;
  margin-bottom:18px!important;
}
.filter-select, .dash-filters select, .dash-filters input,
select.filter-select{
  background:var(--v2-surface)!important;
  border:1px solid var(--v2-border)!important;
  border-radius:var(--v2-radius-pill)!important;
  padding:8px 32px 8px 14px!important;
  font-size:13px!important;
  color:var(--v2-text)!important;
  font-weight:500;
  appearance:none;
  background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%236B7280' stroke-width='2.5' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'/%3E%3C/svg%3E")!important;
  background-repeat:no-repeat!important;
  background-position:right 12px center!important;
  cursor:pointer;
  transition:border-color .15s, box-shadow .15s;
}
.filter-select:hover, .dash-filters select:hover{ border-color:#C7CCD8!important; }
.filter-select:focus, .dash-filters select:focus{
  outline:none!important;
  border-color:var(--v2-accent)!important;
  box-shadow:0 0 0 3px rgba(255,98,0,.12)!important;
}

/* Datepickers should stay rectangular but match style */
.dash-filters input[type="date"], .dash-filters input[type="week"]{
  border-radius:var(--v2-radius-sm)!important;
  background-image:none!important;
  padding:8px 12px!important;
}

.dash-filters .preset{
  background:var(--v2-bg)!important;
  border:1px solid var(--v2-border)!important;
  border-radius:var(--v2-radius-pill)!important;
  padding:3px!important;
}
.dash-filters .preset button{
  border-radius:var(--v2-radius-pill)!important;
  font-size:12px!important;
  padding:6px 14px!important;
  font-weight:600;
}
.dash-filters .preset button.active{
  background:var(--v2-accent)!important;
  color:#fff!important;
  box-shadow:var(--v2-shadow-sm);
}
.dash-filters label{
  font-size:10.5px!important;
  color:var(--v2-muted)!important;
  font-weight:700!important;
  letter-spacing:.5px!important;
}
.dash-filters .reset{
  border-radius:var(--v2-radius-pill)!important;
  padding:8px 14px!important;
  font-size:12px!important;
  font-weight:600!important;
}

/* ===== Cards / surfaces ===== */
.task-card, .chart-card, .kpi-card, .capacity-card, .gantt-wrap, .table-wrap, .segment-header, .empty{
  background:var(--v2-surface)!important;
  border:1px solid var(--v2-border)!important;
  border-radius:var(--v2-radius)!important;
  box-shadow:var(--v2-shadow-sm)!important;
}

/* ===== Backlog segment headers ===== */
.segment-header{
  padding:12px 14px!important;
  margin-bottom:12px!important;
}
.segment-name{ font-size:14px!important; font-weight:700!important; }
.segment-count{
  background:var(--v2-bg)!important;
  color:var(--v2-muted)!important;
  font-weight:600!important;
  padding:3px 10px!important;
}

/* ===== Pill badge style for segment tags ===== */
.seg-badge{
  display:inline-flex; align-items:center;
  padding:5px 14px;
  border-radius:var(--v2-radius-pill);
  font-size:11.5px; font-weight:700;
  letter-spacing:.2px;
  line-height:1;
}
.seg-badge.seg-Asset           { background:#9EDCEF; color:#0E3A47; }
.seg-badge.seg-Private         { background:#000000; color:#FFFFFF; }
.seg-badge.seg-Íon             { background:#A6CF2E; color:#34430D; }
.seg-badge.seg-Varejo          { background:#E5E7EB; color:#374151; }
.seg-badge.seg-Banco-de-Ideias { background:#F3F4F6; color:#4B5563; }
.seg-badge.seg-Gaveta          { background:#D1D5DB; color:#1F2937; }

/* Task card tags — reuse pill look for non-segment tags */
.tag{
  border-radius:var(--v2-radius-pill)!important;
  padding:4px 10px!important;
  font-size:10.5px!important;
  font-weight:600!important;
}

/* ===== Table redesign ===== */
.table-wrap{ overflow:hidden; }
table{ font-size:13px!important; }
th{
  background:var(--v2-bg)!important;
  color:var(--v2-muted)!important;
  font-size:10.5px!important;
  letter-spacing:.6px!important;
  padding:12px 16px!important;
  border-bottom:1px solid var(--v2-border)!important;
}
td{
  padding:14px 16px!important;
  border-bottom:1px solid var(--v2-border)!important;
}
tr:last-child td{ border-bottom:none!important; }
tr:hover td{ background:var(--v2-bg)!important; }

/* ===== KPIs ===== */
.kpi-card{
  padding:18px!important;
  border-top:none!important;
  position:relative;
  overflow:hidden;
}
.kpi-card::before{
  content:""; position:absolute; left:0; top:0; bottom:0; width:4px;
  background:var(--v2-accent);
  border-radius:4px 0 0 4px;
}
.kpi-card.blue::before  { background:#9EDCEF; }
.kpi-card.orange::before{ background:#FF6200; }
.kpi-card.cyan::before  { background:#9EDCEF; }
.kpi-card.green::before { background:#A6CF2E; }
.kpi-card.red::before   { background:#FF6200; }
.kpi-label{ font-size:10.5px!important; font-weight:700!important; letter-spacing:.5px!important; }
.kpi-value{ font-size:28px!important; font-weight:700!important; letter-spacing:-.5px!important; margin-top:6px!important; }

/* ===== Gantt subtle polish ===== */
.gantt-header{
  background:var(--v2-bg)!important;
  font-size:10.5px!important; letter-spacing:.6px!important;
  border-bottom:1px solid var(--v2-border)!important;
  padding:12px!important;
}
.gantt-row-label{
  background:var(--v2-surface)!important;
  border-bottom:1px solid var(--v2-border)!important;
  padding:12px!important;
}
.gantt-cell{ border-color:var(--v2-border)!important; }

/* ===== Range info ===== */
.dash-range-info{
  background:var(--v2-surface);
  border:1px solid var(--v2-border);
  padding:10px 14px;
  border-radius:var(--v2-radius);
  margin-bottom:14px!important;
  font-weight:500;
}

/* ===== Modal polish ===== */
.modal{ border-radius:var(--v2-radius-lg)!important; }
.modal-header{ padding:20px 22px!important; }
.form-input, .form-select, .form-textarea{
  border-radius:var(--v2-radius-sm)!important;
  padding:9px 12px!important;
}

/* ===== Responsive: collapse sidebar on small ===== */
@media(max-width:900px){
  .app-shell{ grid-template-columns:64px 1fr; }
  .sidebar-brand-text, .sidebar-brand-sub, .sidebar-item-label, .sidebar-user, .sidebar-user-role{ display:none; }
  .sidebar-item{ justify-content:center; padding:10px; }
  .sidebar-brand{ justify-content:center; padding:18px 8px; }
  .sidebar-footer{ justify-content:center; }
  main{ padding:18px!important; }
  .topbar{ padding:14px 18px; }
}

/* ===== Indicador de sincronização ===== */
.sync-pill{display:inline-flex;align-items:center;gap:6px;font-size:12px;color:var(--v2-muted);padding:6px 12px;
  border:1px solid var(--v2-border);border-radius:999px;background:var(--v2-surface);white-space:nowrap}
.sync-pill i{width:8px;height:8px;border-radius:50%;background:#9e9e9e;display:inline-block}
.sync-pill.ok i{background:#1f9d55}
.sync-pill.busy i{background:#FF6200;animation:syncpulse 1s infinite}
.sync-pill.err{color:#d83b3b}.sync-pill.err i{background:#d83b3b}
@keyframes syncpulse{50%{opacity:.3}}

/* ============================================================
   DESIGN V4 — Planner / Timeline (apresentação executiva)
   Paleta: #1B2A4A · #C3EBF7 · #FF6200 · #9EDCEF · #000 · #A6CF2E
   ============================================================ */
:root{
  --fg:var(--v2-text);
  --v3-navy:#1B2A4A;
  --v3-sky:#C3EBF7;
  --v3-orange:#FF6200;
  --tl-line:#F0F1F4;
  --tl-line-strong:#E3E6EC;
  --tl-hover:#FAFBFC;
  --tl-ink:#1B2A4A;
}
[data-theme="dark"]{
  --tl-line:#1C2336;
  --tl-line-strong:#29314A;
  --tl-hover:#171E33;
  --tl-ink:#E8EAF2;
}

/* Refinamentos gerais */
.sidebar-item-icon svg, .icon-btn svg{display:block}
.sidebar-item.active .sidebar-item-icon{color:var(--v3-orange)}
.topbar{background:var(--v2-surface)!important}
.topbar-title{font-size:18px!important;letter-spacing:-.3px}
.sidebar-avatar{background:var(--v3-navy)!important;color:var(--v3-sky)!important}

/* ---------- Cabeçalho ---------- */
#page-planner .page-header{display:none!important}
.tl-head{
  display:flex;align-items:flex-end;justify-content:space-between;
  gap:20px;flex-wrap:wrap;margin:6px 0 22px;
}
.tl-eyebrow{
  font-size:11px;font-weight:600;letter-spacing:1.2px;text-transform:uppercase;
  color:var(--v2-muted);margin-bottom:6px;
}
.tl-eyebrow b{color:var(--v3-orange);font-weight:700}
.tl-title{font-size:30px;font-weight:600;letter-spacing:-.8px;line-height:1.1;color:var(--tl-ink)}
.tl-title span{color:var(--v2-muted);font-weight:400}

.tl-controls{display:flex;align-items:center;gap:10px;flex-wrap:wrap}
.tl-seg{
  display:inline-flex;padding:3px;border-radius:10px;
  background:var(--v2-bg);border:1px solid var(--v2-border);
}
.tl-seg button{
  border:none;background:transparent;cursor:pointer;
  font:inherit;font-size:13px;font-weight:500;color:var(--v2-muted);
  padding:6px 14px;border-radius:7px;transition:background .15s,color .15s;
}
.tl-seg button:hover{color:var(--v2-text)}
.tl-seg button.active{background:var(--v2-surface);color:var(--tl-ink);font-weight:600;box-shadow:0 1px 2px rgba(27,42,74,.08),0 0 0 1px var(--v2-border)}

.tl-range{display:none;align-items:center;gap:6px;font-size:12px;color:var(--v2-muted)}
.tl-range.show{display:inline-flex}
.tl-range input{
  font:inherit;font-size:12.5px;color:var(--v2-text);
  border:1px solid var(--v2-border);background:var(--v2-surface);
  border-radius:8px;padding:6px 8px;
}
.tl-range input:focus{outline:none;border-color:var(--v3-navy)}

.tl-nav{display:inline-flex;align-items:center;gap:2px}
.tl-icon{
  width:32px;height:32px;border-radius:8px;border:none;background:transparent;
  color:var(--v2-muted);cursor:pointer;display:inline-flex;align-items:center;justify-content:center;
  transition:background .15s,color .15s;
}
.tl-icon:hover{background:var(--v2-bg);color:var(--v2-text)}
.tl-today{
  height:32px;padding:0 12px;border-radius:8px;border:none;background:transparent;cursor:pointer;
  font:inherit;font-size:13px;font-weight:600;color:var(--v2-text);
}
.tl-today:hover{background:var(--v2-bg)}
.tl-today[disabled]{color:var(--v2-muted);cursor:default;background:transparent}
.tl-present{border:1px solid var(--v2-border)}

/* ---------- Números do período ---------- */
.tl-stats{display:flex;flex-wrap:wrap;gap:12px 44px;margin:0 2px 20px}
.tl-stat-v{font-size:24px;font-weight:600;letter-spacing:-.6px;color:var(--tl-ink);line-height:1}
.tl-stat-l{font-size:12px;color:var(--v2-muted);margin-top:6px}
.tl-stat.alert .tl-stat-v{color:var(--v3-orange)}
.tl-stat + .tl-stat{position:relative}
.tl-stat.main{padding-right:44px;border-right:1px solid var(--v2-border)}

/* ---------- Card da timeline ---------- */
.tl-card{
  background:var(--v2-surface);border:1px solid var(--v2-border);
  border-radius:16px;overflow:hidden;
}
.tl-toolbar{
  display:flex;align-items:center;justify-content:space-between;gap:12px;flex-wrap:wrap;
  padding:14px 16px 14px 24px;border-bottom:1px solid var(--tl-line-strong);
}
.tl-toolbar-title{font-size:14px;font-weight:600;color:var(--v2-text)}
#page-planner .tl-filters{
  display:flex;align-items:center;gap:4px!important;flex-wrap:wrap;
  background:transparent!important;border:none!important;box-shadow:none!important;
  padding:0!important;margin:0!important;
}
#page-planner .tl-filters .filter-select{
  border:1px solid transparent!important;background-color:transparent!important;
  border-radius:8px!important;padding:6px 26px 6px 10px!important;
  font-size:12.5px!important;color:var(--v2-muted)!important;font-weight:500;
  background-position:right 8px center!important;box-shadow:none!important;
}
#page-planner .tl-filters .filter-select:hover{background-color:var(--v2-bg)!important}
#page-planner .tl-filters .filter-select.is-set{
  color:var(--tl-ink)!important;background-color:var(--v2-bg)!important;border-color:var(--v2-border)!important;font-weight:600;
}
.tl-clear{
  display:none;border:none;background:transparent;cursor:pointer;
  font:inherit;font-size:12.5px;color:var(--v3-orange);font-weight:600;padding:6px 8px;
}
.tl-clear.show{display:inline-block}

.gantt-scroll{overflow-x:auto}
.tl-grid{display:grid;grid-template-columns:300px 1fr}

/* Cabeçalho de datas */
.tl-hlabel{
  position:sticky;left:0;z-index:4;background:var(--v2-surface);
  border-bottom:1px solid var(--tl-line-strong);
  display:flex;align-items:flex-end;padding:0 24px 10px;
  font-size:11px;font-weight:600;letter-spacing:1px;text-transform:uppercase;color:var(--v2-muted);
}
.tl-hdays{border-bottom:1px solid var(--tl-line-strong)}
.tl-weeks, .tl-days{display:grid}
.tl-wk{
  padding:12px 10px 4px;font-size:11px;font-weight:600;color:var(--v2-muted);
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;
  border-left:1px solid var(--tl-line-strong);
}
.tl-wk:first-child{border-left-color:transparent}
.tl-wk em{font-style:normal;font-weight:400;margin-left:4px}
.tl-day{
  padding:4px 0 10px;text-align:center;line-height:1.2;
  border-left:1px solid transparent;
}
.tl-day.wk-start{border-left-color:var(--tl-line-strong)}
.tl-day:first-child{border-left-color:transparent}
.tl-day .dn{display:block;font-size:10px;font-weight:600;color:var(--v2-muted);text-transform:uppercase;letter-spacing:.6px}
.tl-day .dd{display:inline-block;margin-top:3px;font-size:13px;font-weight:600;color:var(--v2-text);min-width:24px;height:24px;line-height:24px;border-radius:999px}
.tl-day.past .dd{color:var(--v2-muted);font-weight:500}
.tl-day.today .dn{color:var(--v3-orange)}
.tl-day.today .dd{background:var(--v3-orange);color:#fff}
.tl-grid.wide .tl-day{padding:4px 12px 12px;text-align:left}
.tl-grid.wide .tl-day .dn{display:inline;margin-right:6px}
.tl-grid.wide .tl-day .dd{font-size:15px;padding:0 6px;margin-left:-6px}

/* Grupos (segmentos) */
.tl-glabel{
  position:sticky;left:0;z-index:3;background:var(--v2-surface);
  display:flex;align-items:center;gap:10px;padding:20px 24px 8px;
}
.tl-gdot{width:8px;height:8px;border-radius:2px;flex-shrink:0}
.tl-gname{font-size:11px;font-weight:700;letter-spacing:1.1px;text-transform:uppercase;color:var(--v2-text)}
.tl-gcount{font-size:11.5px;color:var(--v2-muted)}

/* Linhas */
.tl-label{
  position:sticky;left:0;z-index:3;background:var(--v2-surface);
  padding:9px 16px 9px 24px;min-width:0;cursor:pointer;
  display:flex;flex-direction:column;justify-content:center;gap:3px;
}
.tl-name{
  font-size:13px;font-weight:500;color:var(--v2-text);line-height:1.3;
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;
  display:flex;align-items:center;gap:7px;
}
.tl-name > span{overflow:hidden;text-overflow:ellipsis}
.tl-urg{width:6px;height:6px;border-radius:50%;background:var(--v3-orange);flex-shrink:0}
.tl-meta{font-size:11.5px;color:var(--v2-muted);white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.tl-meta .late{color:var(--v3-orange);font-weight:600}
.tl-meta .dot{margin:0 5px;opacity:.5}

.tl-track{position:relative;display:grid;min-height:50px}
.tl-gtrack{position:relative;display:grid}
.tl-c{border-left:1px solid transparent}
.tl-c.wk-start{border-left-color:var(--tl-line)}
.tl-c:first-child{border-left-color:transparent}
.tl-grid.wide .tl-c{border-left-color:var(--tl-line)}
.tl-grid.wide .tl-c:first-child{border-left-color:transparent}
.tl-now{
  position:absolute;top:0;bottom:0;width:0;border-left:1.5px solid var(--v3-orange);
  opacity:.55;pointer-events:none;z-index:1;
}

.tl-label:hover, .tl-label:hover + .tl-track{background-color:var(--tl-hover)}
.tl-row-hover{background-color:var(--tl-hover)}

/* Barras sólidas, com o nome da demanda — leitura imediata */
.tl-bar{
  position:absolute;top:50%;height:26px;margin-top:-13px;
  border-radius:6px;cursor:pointer;z-index:2;overflow:hidden;
  display:flex;align-items:center;
  box-shadow:0 1px 2px rgba(27,42,74,.10);
  transition:box-shadow .15s, transform .15s;
}
.tl-grid.wide .tl-bar{height:30px;margin-top:-15px}
.tl-bar-fill{position:absolute;left:0;top:0;bottom:0;pointer-events:none}
.tl-bar-text{
  position:relative;padding:0 10px;min-width:0;
  font-size:12px;font-weight:600;letter-spacing:.1px;
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;
}
.tl-bar.out{overflow:visible}
.tl-bar.out .tl-bar-text{
  position:absolute;left:100%;margin-left:8px;padding:0;
  color:var(--v2-text);font-weight:500;
}
.tl-bar.out .tl-bar-fill{border-radius:6px 0 0 6px}
.tl-bar.cont-left{border-top-left-radius:0;border-bottom-left-radius:0}
.tl-bar.cont-right{border-top-right-radius:0;border-bottom-right-radius:0}
.tl-bar.is-late{box-shadow:0 0 0 2px var(--v2-surface), 0 0 0 3.5px var(--v3-orange)}
.tl-bar:hover, .tl-label:hover + .tl-track .tl-bar{transform:translateY(-1px);box-shadow:0 4px 12px rgba(27,42,74,.18)}
.tl-bar.is-late:hover, .tl-label:hover + .tl-track .tl-bar.is-late{box-shadow:0 0 0 2px var(--v2-surface), 0 0 0 3.5px var(--v3-orange), 0 4px 12px rgba(27,42,74,.18)}

/* Coluna de hoje */
.tl-c.today{background:rgba(195,235,247,.28)}
[data-theme="dark"] .tl-c.today{background:rgba(195,235,247,.05)}
.tl-now{border-left-width:2px;opacity:.8}
.tl-track{min-height:54px}

/* Status em pílula na coluna de nomes */
.tl-meta{display:flex;align-items:center;gap:0}
.tl-st{
  display:inline-flex;align-items:center;font-size:10.5px;font-weight:600;
  padding:1px 8px;border-radius:999px;margin-right:8px;line-height:1.6;flex-shrink:0;
}
.tl-st.st-and{background:#C3EBF7;color:#1B2A4A}
.tl-st.st-rev{background:#1B2A4A;color:#FFFFFF}
.tl-st.st-cor{background:rgba(255,98,0,.12);color:#C24E00}
[data-theme="dark"] .tl-st.st-and{background:rgba(195,235,247,.16);color:#C3EBF7}
[data-theme="dark"] .tl-st.st-rev{background:#C3EBF7;color:#1B2A4A}
[data-theme="dark"] .tl-st.st-cor{color:#FF9A5C}
.tl-mseg{display:inline-flex;align-items:center;gap:5px}
.tl-mseg i{width:7px;height:7px;border-radius:2px;display:inline-block}
.tl-sdot{width:8px;height:8px;border-radius:50%;display:inline-block;margin-right:6px;vertical-align:1px;flex-shrink:0}
.tl-sdot.st-and{background:#9EDCEF}
.tl-sdot.st-rev{background:#1B2A4A}
.tl-sdot.st-cor{background:#FF6200}
[data-theme="dark"] .tl-sdot.st-rev{background:#C3EBF7}
.tl-gav{
  width:20px;height:20px;border-radius:50%;background:var(--v3-navy);color:var(--v3-sky);
  font-size:9px;font-weight:700;display:inline-flex;align-items:center;justify-content:center;
}
[data-theme="dark"] .tl-gav{background:var(--v3-sky);color:var(--v3-navy)}

/* Agrupar por */
.tl-toolbar-left{display:flex;align-items:center;gap:16px;flex-wrap:wrap}
.tl-seg-sm{padding:2px;border-radius:8px;align-items:center}
.tl-seg-sm button{font-size:12px;padding:4px 10px;border-radius:6px}
.tl-seg-label{font-size:11px;color:var(--v2-muted);padding:0 6px 0 8px}

/* Diálogo próprio */
.ui-dlg-overlay{
  position:fixed;inset:0;z-index:400;background:rgba(15,23,42,.45);
  display:flex;align-items:center;justify-content:center;padding:20px;animation:fade .15s;
}
.ui-dlg{
  background:var(--v2-surface);color:var(--v2-text);width:100%;max-width:420px;
  border-radius:16px;padding:24px;box-shadow:0 20px 50px rgba(15,23,42,.25);
}
.ui-dlg-title{font-size:16px;font-weight:600;margin-bottom:8px}
.ui-dlg-msg{font-size:13px;color:var(--v2-muted);line-height:1.5}
.ui-dlg-field{display:flex;align-items:center;gap:10px;margin-top:16px}
.ui-dlg-field input{flex:1}
.ui-dlg-suffix{font-size:13px;color:var(--v2-muted)}
.ui-dlg-actions{display:flex;justify-content:flex-end;gap:8px;margin-top:22px}

/* Menu lateral recolhível */
.topbar-left{display:flex;align-items:center;gap:14px;min-width:0}
.sb-toggle{width:36px!important;height:36px!important;border-radius:10px!important;flex-shrink:0}
body.sb-collapsed .app-shell{grid-template-columns:1fr!important}
body.sb-collapsed .sidebar{display:none}

.tl-empty{grid-column:1 / -1;padding:72px 20px;text-align:center;color:var(--v2-muted);font-size:13px}
.tl-empty strong{display:block;color:var(--v2-text);font-size:15px;font-weight:600;margin-bottom:4px}

.tl-legend{
  display:flex;flex-wrap:wrap;align-items:center;gap:8px 18px;
  padding:14px 24px;border-top:1px solid var(--tl-line-strong);
  font-size:11.5px;color:var(--v2-muted);
}
.tl-legend span{display:inline-flex;align-items:center;gap:7px}
.tl-legend .sw{width:8px;height:8px;border-radius:2px}
.tl-legend .grow{flex:1}
.tl-legend .lg-bar{width:28px;height:12px;border-radius:4px;background:#9EDCEF;position:relative;overflow:hidden}
.tl-legend .lg-bar::after{content:"";position:absolute;left:0;top:0;bottom:0;width:55%;background:rgba(0,0,0,.16)}
.tl-legend .lg-late{width:22px;height:12px;border-radius:4px;background:var(--v2-bg);box-shadow:0 0 0 2px var(--v3-orange)}
.tl-legend .lg-now{width:14px;height:14px;background:rgba(195,235,247,.6);border-left:2px solid var(--v3-orange)}

/* ---------- Cards inferiores ---------- */
.pl-bottom{display:grid;grid-template-columns:1fr 1fr;gap:16px;margin-top:16px}
@media(max-width:1000px){.pl-bottom{grid-template-columns:1fr}}
#page-planner .capacity-card{margin-top:0!important;padding:22px 24px!important;box-shadow:none!important;border-radius:16px!important}
.pl-card-head{display:flex;align-items:baseline;justify-content:space-between;gap:10px;margin-bottom:16px}
#page-planner .capacity-title{font-size:14px;font-weight:600;margin:0;color:var(--v2-text)}
.pl-card-sub{font-size:11.5px;color:var(--v2-muted)}

#page-planner .capacity-row{display:flex;align-items:center;gap:12px;margin-bottom:12px}
#page-planner .capacity-row:last-child{margin-bottom:0}
.cap-avatar{
  width:26px;height:26px;border-radius:50%;flex-shrink:0;
  background:var(--v2-bg);color:var(--v2-text);border:1px solid var(--v2-border);
  font-size:10.5px;font-weight:600;display:inline-flex;align-items:center;justify-content:center;
}
#page-planner .capacity-name{width:84px;font-size:13px;font-weight:500;color:var(--v2-text)}
#page-planner .capacity-bar-wrap{height:6px;border-radius:999px;background:var(--tl-line);border:none}
#page-planner .capacity-bar-fill{background:var(--v3-navy);border-radius:999px}
[data-theme="dark"] #page-planner .capacity-bar-fill{background:var(--v3-sky)}
#page-planner .capacity-row.is-peak .capacity-bar-fill{background:var(--v3-orange)}
#page-planner .capacity-count{width:30px;font-size:13px;font-weight:600;color:var(--v2-text);text-align:right}

.dl-row{
  display:grid;grid-template-columns:44px 1fr auto;gap:14px;align-items:center;
  padding:10px 0;border-top:1px solid var(--tl-line);cursor:pointer;
}
.dl-row:first-child{border-top:none;padding-top:0}
.dl-date{text-align:center;line-height:1.15}
.dl-date .d1{font-size:10px;font-weight:600;letter-spacing:.6px;text-transform:uppercase;color:var(--v2-muted)}
.dl-date .d2{font-size:15px;font-weight:600;color:var(--v2-text)}
.dl-date.today .d1, .dl-date.today .d2, .dl-date.late .d1, .dl-date.late .d2{color:var(--v3-orange)}
.dl-name{font-size:13px;font-weight:500;color:var(--v2-text);white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.dl-meta{font-size:11.5px;color:var(--v2-muted);display:flex;align-items:center;gap:6px;margin-top:2px}
.dl-meta i{width:7px;height:7px;border-radius:2px;display:inline-block}
.dl-meta .dot{opacity:.5}
.dl-status{font-size:11.5px;color:var(--v2-muted);white-space:nowrap}
.dl-more{font-size:12px;color:var(--v2-muted);padding-top:10px;border-top:1px solid var(--tl-line)}
.dl-empty{font-size:13px;color:var(--v2-muted);padding:18px 0;text-align:center}

/* ---------- Modo apresentação ---------- */
body.present .app-shell{grid-template-columns:1fr}
body.present .sidebar, body.present .topbar{display:none}
body.present main{padding:36px 48px!important}
body.present .tl-present{border-color:var(--v3-orange);color:var(--v3-orange)}

@media(max-width:700px){
  .tl-title{font-size:24px}
  .tl-stats{gap:12px 28px}
  .tl-stat.main{padding-right:28px}
  .tl-grid{grid-template-columns:200px 1fr}
}

/* ============================================================
   V6 — Marca, menu recolhível, fotos da equipe, modo escuro
   ============================================================ */

/* Ícone da marca (contorno, segue a cor do texto no claro/escuro) */
.brand-icon{
  width:34px;height:34px;border-radius:10px;flex-shrink:0;
  display:inline-flex;align-items:center;justify-content:center;
  color:var(--v2-text);border:1px solid var(--v2-border);background:var(--v2-surface);
}
.brand-icon svg{display:block}
.sidebar-brand{gap:10px!important}
.sidebar-brand > div:nth-child(2){flex:1;min-width:0}
.sb-collapse{
  width:30px;height:30px;border-radius:8px;border:none;background:transparent;cursor:pointer;
  color:var(--v2-muted);display:inline-flex;align-items:center;justify-content:center;flex-shrink:0;
  transition:background .15s,color .15s;
}
.sb-collapse:hover{background:var(--v2-bg);color:var(--v2-text)}
/* O botão do topo só aparece quando o menu está escondido */
.topbar .sb-toggle{display:none!important}
body.sb-collapsed .topbar .sb-toggle{display:inline-flex!important}
@media(max-width:900px){
  .sb-collapse{display:none}
  .topbar .sb-toggle{display:inline-flex!important}
}

/* Fotos da equipe */
.avatar{
  position:relative;display:inline-flex;align-items:center;justify-content:center;flex-shrink:0;
  border-radius:50%;overflow:hidden;font-weight:700;line-height:1;
  background:var(--v3-navy);color:var(--v3-sky);
}
[data-theme="dark"] .avatar{background:#2A3A5E;color:var(--v3-sky)}
.avatar img{position:absolute;inset:0;width:100%;height:100%;object-fit:cover}
.avatar.sz-18{width:18px;height:18px;font-size:8px}
.avatar.sz-20{width:20px;height:20px;font-size:8.5px}
.avatar.sz-26{width:26px;height:26px;font-size:10px}
.avatar.sz-30{width:30px;height:30px;font-size:11px}
.avatar.sz-32{width:32px;height:32px;font-size:12px}
.tl-meta .avatar{margin-right:6px}
.tl-resp{display:inline-flex;align-items:center}
.task-meta{display:flex;align-items:center;gap:6px}

/* ---------- Modo escuro: backlog ---------- */
[data-theme="dark"] .kanban-col{background:#10162A;border-color:var(--v2-border)}
[data-theme="dark"] .kanban-col-title{color:var(--v2-text)}
[data-theme="dark"] .kanban-col-count{background:var(--v2-surface);color:var(--v2-muted);border-color:var(--v2-border)}
[data-theme="dark"] .kanban-col-empty{color:var(--v2-muted)}
[data-theme="dark"] .kanban-col-dot{box-shadow:0 0 0 1px rgba(255,255,255,.25)}
[data-theme="dark"] .task-card{background:var(--v2-surface)!important;border-color:var(--v2-border)!important}
[data-theme="dark"] .task-card.seg-private{border-left-color:#E5E7EB!important}
[data-theme="dark"] .task-card.seg-banco{border-left-color:#6B7280!important}
[data-theme="dark"] .task-card.seg-gaveta{border-left-color:#4B5563!important}
[data-theme="dark"] .task-title{color:var(--v2-text)}
[data-theme="dark"] .task-meta{color:var(--v2-muted)}

[data-theme="dark"] .seg-badge.seg-Asset{background:rgba(158,220,239,.16);color:#9EDCEF}
[data-theme="dark"] .seg-badge.seg-Private{background:#E5E7EB;color:#0B1020}
[data-theme="dark"] .seg-badge.seg-Íon{background:rgba(166,207,46,.16);color:#C6E47A}
[data-theme="dark"] .seg-badge.seg-Varejo,
[data-theme="dark"] .seg-badge.seg-Banco-de-Ideias,
[data-theme="dark"] .seg-badge.seg-Gaveta{background:rgba(255,255,255,.07);color:#C9CED8}

[data-theme="dark"] .tag{background:rgba(255,255,255,.06)!important;color:#C9CED8!important}
[data-theme="dark"] .tag.urgente{background:rgba(255,98,0,.20)!important;color:#FF9A5C!important}
[data-theme="dark"] .tag.alta{background:rgba(255,98,0,.12)!important;color:#FFB585!important}
[data-theme="dark"] .tag.media{background:rgba(232,169,59,.14)!important;color:#E8C27A!important}
[data-theme="dark"] .tag.baixa{background:rgba(166,207,46,.14)!important;color:#C6E47A!important}
[data-theme="dark"] .stars{color:#D9A21B}

/* ---------- Modo escuro: geral ---------- */
[data-theme="dark"] .sidebar-item.active{background:rgba(255,98,0,.12);color:#FF9A5C}
[data-theme="dark"] .sidebar-item:hover{background:rgba(255,255,255,.04)}
[data-theme="dark"] .btn-ghost:hover{background:rgba(255,255,255,.05)!important}
[data-theme="dark"] .icon-btn{background:var(--v2-surface)}
[data-theme="dark"] .modal{background:var(--v2-surface);color:var(--v2-text)}
[data-theme="dark"] .modal-header, [data-theme="dark"] .modal-footer{border-color:var(--v2-border)}
[data-theme="dark"] .form-input, [data-theme="dark"] .form-select, [data-theme="dark"] .form-textarea{
  background:#0F1528;border-color:var(--v2-border);color:var(--v2-text);color-scheme:dark;
}
[data-theme="dark"] input[type="date"], [data-theme="dark"] input[type="week"]{color-scheme:dark}
[data-theme="dark"] .toast{background:var(--v2-surface);color:var(--v2-text)}
[data-theme="dark"] .empty{color:var(--v2-muted)}
[data-theme="dark"] .status-done{background:rgba(255,98,0,.08);border-color:rgba(255,98,0,.25)}
[data-theme="dark"] .filter-select, [data-theme="dark"] .dash-filters select, [data-theme="dark"] .dash-filters input{color-scheme:dark}
[data-theme="dark"] select option{background:#141A2D;color:#E8EAF2}

/* Botão PDF */
#page-dashboard .page-header{justify-content:flex-end!important}
.btn-pdf svg{display:block}

/* Captura do PDF: esconde controles interativos dos gráficos */
body.pdf-capture .chart-slider{display:none!important}
body.pdf-capture .chart-card{box-shadow:none!important}
body.pdf-capture #page-dashboard{width:1320px!important;max-width:none!important}
body.pdf-capture #kpiGrid{grid-template-columns:repeat(6,1fr)!important}
body.pdf-capture #page-dashboard .dash-grid, body.pdf-capture #page-dashboard .dash-grid-3{grid-template-columns:1fr 1fr!important}
body.pdf-capture .chart-card canvas{max-height:300px!important}

/* Impressão (alternativa ao PDF, se o download estiver bloqueado) */
@media print{
  body.print-dashboard .sidebar, body.print-dashboard .topbar,
  body.print-dashboard .dash-filters, body.print-dashboard .chart-slider,
  body.print-dashboard .page-header .btn, body.print-dashboard .toast-stack{display:none!important}
  body.print-dashboard .app-shell{display:block}
  body.print-dashboard main{padding:0!important}
  body.print-dashboard .chart-card, body.print-dashboard .kpi-card{break-inside:avoid}
}

/* ============================================================
   V7 — Backlog limpo
   ============================================================ */
#page-backlog .page-header{display:none!important}
.bl-summary{font-size:13px;color:var(--v2-muted);margin:2px 2px 20px;display:flex;align-items:center;gap:8px}
.bl-summary b{color:var(--v2-text);font-weight:600}
.bl-sep{opacity:.45}
.bl-urg-count{display:inline-flex;align-items:center;gap:6px;color:var(--v3-orange);font-weight:500}
.bl-urg-count i{width:6px;height:6px;border-radius:50%;background:var(--v3-orange)}

.bl-board{
  display:grid;grid-template-columns:repeat(5,minmax(0,1fr));
  gap:20px;align-items:start;
}
@media(max-width:1150px){.bl-board{grid-template-columns:repeat(3,minmax(0,1fr))}}
@media(max-width:800px){.bl-board{grid-template-columns:1fr}}

.bl-col-head{
  display:flex;align-items:center;gap:10px;
  padding:11px 12px 11px 14px;margin-bottom:12px;
  background:var(--v2-surface);border:1px solid var(--v2-border);border-radius:12px;
}
.bl-col-swatch{display:inline-flex;gap:3px;flex-shrink:0}
.bl-col-swatch i{
  width:10px;height:10px;border-radius:3px;display:block;
  box-shadow:inset 0 0 0 1px rgba(0,0,0,.06);
}
.bl-col-name{
  font-size:13.5px;font-weight:600;color:var(--v2-text);letter-spacing:-.1px;
  line-height:1.25;min-width:0;
}
.bl-col-count{
  margin-left:auto;flex-shrink:0;
  min-width:26px;height:22px;padding:0 8px;border-radius:999px;
  display:inline-flex;align-items:center;justify-content:center;
  background:var(--v2-bg);color:var(--v2-muted);
  font-size:12px;font-weight:600;font-variant-numeric:tabular-nums;
}
[data-theme="dark"] .bl-col-count{background:rgba(255,255,255,.06)}
[data-theme="dark"] .bl-col-swatch i{box-shadow:inset 0 0 0 1px rgba(255,255,255,.12)}
.bl-col-body{display:flex;flex-direction:column;gap:10px}
.bl-col-empty{font-size:12.5px;color:var(--v2-muted);padding:14px 2px}

.bl-card{
  position:relative;cursor:pointer;
  background:var(--v2-surface);border:1px solid var(--v2-border);border-radius:12px;
  padding:14px 14px 13px;
  transition:border-color .15s, box-shadow .15s, transform .15s;
}
.bl-card:hover{border-color:#CBD2DE;box-shadow:0 6px 18px rgba(27,42,74,.08);transform:translateY(-1px)}
[data-theme="dark"] .bl-card:hover{border-color:#34405E;box-shadow:0 6px 18px rgba(0,0,0,.3)}

.bl-title{
  display:flex;align-items:flex-start;gap:8px;
  font-size:13.5px;font-weight:500;line-height:1.4;color:var(--v2-text);
}
.bl-title span{display:-webkit-box;-webkit-line-clamp:3;-webkit-box-orient:vertical;overflow:hidden}
.bl-prio{width:7px;height:7px;border-radius:50%;flex-shrink:0;margin-top:6px}
.bl-prio.urg{background:var(--v3-orange)}
.bl-prio.alta{box-shadow:inset 0 0 0 1.5px var(--v3-orange)}

.bl-meta{display:flex;align-items:center;gap:6px;margin-top:12px;font-size:12px;color:var(--v2-muted);min-width:0}
.bl-meta .avatar{margin-right:2px}
.bl-who{color:var(--v2-text);opacity:.85;white-space:nowrap}
.bl-type{white-space:nowrap;overflow:hidden;text-overflow:ellipsis;min-width:0}
.bl-due{margin-left:auto;white-space:nowrap;font-variant-numeric:tabular-nums;padding-left:8px}
.bl-due.late{color:var(--v3-orange)}

.bl-foot{margin-top:8px}
.bl-seg{display:inline-flex;align-items:center;gap:6px;font-size:11.5px;color:var(--v2-muted)}
.bl-seg i{width:7px;height:7px;border-radius:2px}

/* Ações aparecem só ao passar o mouse */
.bl-actions{
  position:absolute;top:8px;right:8px;display:flex;align-items:center;gap:4px;
  padding:3px;border-radius:10px;background:var(--v2-surface);
  box-shadow:0 0 0 1px var(--v2-border), 0 4px 12px rgba(27,42,74,.10);
  opacity:0;pointer-events:none;transform:translateY(-2px);
  transition:opacity .15s, transform .15s;
}
.bl-card:hover .bl-actions, .bl-card:focus-within .bl-actions{opacity:1;pointer-events:auto;transform:none}
@media(hover:none){.bl-actions{opacity:1;pointer-events:auto;transform:none}}
.bl-icon{
  width:28px;height:28px;border-radius:7px;border:none;background:transparent;cursor:pointer;
  color:var(--v2-muted);display:inline-flex;align-items:center;justify-content:center;
}
.bl-icon:hover{background:var(--v2-bg);color:#d83b3b}
.bl-start{
  height:28px;padding:0 10px 0 12px;border-radius:7px;border:none;cursor:pointer;
  background:var(--v3-orange);color:#fff;font:inherit;font-size:12px;font-weight:600;
  display:inline-flex;align-items:center;gap:5px;
}
.bl-start:hover{background:#E85800}

.bl-empty-all{text-align:center;padding:80px 20px;color:var(--v2-muted);font-size:13px}
.bl-empty-all strong{display:block;color:var(--v2-text);font-size:15px;font-weight:600;margin-bottom:4px}
</style>
</head>
<body>

<!-- ============= HEADER ============= -->
<div class="app-shell">
<aside class="sidebar">
  <div class="sidebar-brand">
    <span class="brand-icon" aria-hidden="true">
      <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><rect x="3.5" y="5" width="17" height="15.5" rx="2.5"/><path d="M8 3v4M16 3v4M3.5 10h17"/><path d="M8.5 15l2.2 2.2L15.5 13"/></svg>
    </span>
    <div>
      <div class="sidebar-brand-text">Planner CC</div>
      <div class="sidebar-brand-sub">Comunicação Criativa</div>
    </div>
    <button class="sb-collapse" onclick="toggleSidebar(true)" title="Esconder menu" aria-label="Esconder menu lateral">
      <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="16" rx="2"/><path d="M9 4v16M15 10l-2 2 2 2"/></svg>
    </button>
  </div>
  <nav class="sidebar-nav">
    <button class="sidebar-item active" data-tab="backlog" onclick="switchTab('backlog')">
      <span class="sidebar-item-icon"><svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="16" rx="2"/><path d="M8 9h8M8 13h8M8 17h5"/></svg></span><span class="sidebar-item-label">Backlog</span>
    </button>
    <button class="sidebar-item" data-tab="planner" onclick="switchTab('planner')">
      <span class="sidebar-item-icon"><svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="5" width="18" height="16" rx="2"/><path d="M16 3v4M8 3v4M3 10h18M7 14h6M10 17h7"/></svg></span><span class="sidebar-item-label">Planner</span>
    </button>
    <button class="sidebar-item" data-tab="concluidos" onclick="switchTab('concluidos')">
      <span class="sidebar-item-icon"><svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="9"/><path d="M8 12.5l2.5 2.5L16 9.5"/></svg></span><span class="sidebar-item-label">Concluídos</span>
    </button>
    <button class="sidebar-item" data-tab="dashboard" onclick="switchTab('dashboard')">
      <span class="sidebar-item-icon"><svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M4 20V10M10 20V4M16 20v-7M22 20H2"/></svg></span><span class="sidebar-item-label">Dashboard</span>
    </button>
  </nav>
  <div class="sidebar-footer">
    <div class="sidebar-avatar">E</div>
    <div>
      <div class="sidebar-user">Eder</div>
      <div class="sidebar-user-role">Coord. Comunicação</div>
    </div>
  </div>
</aside>
<div class="content">
  <div class="topbar">
    <div class="topbar-left">
      <button class="icon-btn sb-toggle" id="sbToggle" onclick="toggleSidebar(false)" title="Mostrar menu" aria-label="Mostrar menu lateral">
        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="16" rx="2"/><path d="M9 4v16"/></svg>
      </button>
      <div>
      <div class="topbar-title" id="topbarTitle">Backlog</div>
      <div class="topbar-sub" id="topbarSub">Demandas aguardando início</div>
      </div>
    </div>
    <div class="topbar-actions">
      <span class="sync-pill" id="syncPill"><i></i><span id="syncText">Conectando…</span></span>
      <a class="btn btn-ghost" href="https://planner.cloud.microsoft/webui/plan/NpyOGC7pZ0KcpCTpDcZxlGQAFXqj/view/board?tid=591669a0-183f-49a5-98f4-9aa0d0b63d81" target="_blank" style="text-decoration:none">Planner Microsoft ↗</a>
    <button class="btn btn-primary" onclick="openTaskModal()">+ Nova Tarefa</button>
    <button class="icon-btn" title="Exportar JSON" onclick="exportJSON()"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M12 4v11M7 10l5 5 5-5M5 20h14"/></svg></button>
    <button class="icon-btn" title="Importar JSON" onclick="document.getElementById('fileImport').click()"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M12 15V4M7 9l5-5 5 5M5 20h14"/></svg></button>
    <input type="file" id="fileImport" accept="application/json" style="display:none" onchange="importJSON(event)" />
    <button class="icon-btn" id="themeBtn" title="Alternar tema" onclick="toggleTheme()">🌙</button>
    </div>
  </div>


<!-- ============= MAIN ============= -->
<main>

  <!-- BACKLOG -->
  <section class="page active" id="page-backlog">
    <div class="page-header">
      <div>
        <div class="page-title">Backlog</div>
        <div class="page-sub">Demandas aguardando início, agrupadas por segmento</div>
      </div>
    </div>
    <div id="backlogContent"></div>
  </section>

  <!-- PLANNER (GANTT) -->
  <section class="page" id="page-planner">
    <div class="page-header">
      <div>
        <div class="page-title">Planner — Timeline</div>
        <div class="page-sub">Linha do tempo das demandas em produção</div>
      </div>
    </div>

    <div class="tl-head">
      <div>
        <div class="tl-eyebrow" id="tlEyebrow">—</div>
        <div class="tl-title" id="tlTitle">—</div>
      </div>
      <div class="tl-controls">
        <div class="tl-seg" id="tlViewSeg" role="tablist" aria-label="Período">
          <button data-view="week" onclick="setTlView('week')">Semana</button>
          <button data-view="fortnight" onclick="setTlView('fortnight')">Quinzena</button>
          <button data-view="month" onclick="setTlView('month')">Mês</button>
          <button data-view="custom" onclick="setTlView('custom')">Período</button>
        </div>
        <div class="tl-range" id="tlRange">
          <input type="date" id="tlFrom" onchange="setCustomRange()" aria-label="Data inicial">
          <span>até</span>
          <input type="date" id="tlTo" onchange="setCustomRange()" aria-label="Data final">
        </div>
        <div class="tl-nav">
          <button class="tl-icon" onclick="shiftTl(-1)" title="Período anterior" aria-label="Período anterior">
            <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"/></svg>
          </button>
          <button class="tl-today" id="tlTodayBtn" onclick="resetTl()">Hoje</button>
          <button class="tl-icon" onclick="shiftTl(1)" title="Próximo período" aria-label="Próximo período">
            <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"/></svg>
          </button>
        </div>
        <button class="tl-icon tl-present" onclick="togglePresentation()" title="Modo apresentação (tela cheia)" aria-label="Modo apresentação">
          <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M8 3H5a2 2 0 0 0-2 2v3M21 8V5a2 2 0 0 0-2-2h-3M3 16v3a2 2 0 0 0 2 2h3M16 21h3a2 2 0 0 0 2-2v-3"/></svg>
        </button>
      </div>
    </div>

    <div class="tl-stats" id="tlStats"></div>

    <div class="tl-card">
      <div class="tl-toolbar">
        <div class="tl-toolbar-left">
          <div class="tl-toolbar-title">Demandas em produção</div>
          <div class="tl-seg tl-seg-sm" id="tlGroupSeg" aria-label="Agrupar por">
            <span class="tl-seg-label">Agrupar</span>
            <button data-group="segmento" onclick="setTlGroup('segmento')">Segmento</button>
            <button data-group="status" onclick="setTlGroup('status')">Status</button>
            <button data-group="responsavel" onclick="setTlGroup('responsavel')">Responsável</button>
          </div>
        </div>
        <div class="tl-filters planner-controls">
          <select class="filter-select" id="filterSegmento" onchange="renderPlanner()">
            <option value="">Segmento</option>
            <option value="Asset">Asset</option>
            <option value="Private">Private</option>
            <option value="Íon">Íon</option>
            <option value="Varejo">Varejo</option>
            <option value="Banco de Ideias">Banco de Ideias</option>
            <option value="Gaveta">Gaveta</option>
          </select>
          <select class="filter-select" id="filterResponsavel" onchange="renderPlanner()">
            <option value="">Todos responsáveis</option>
          </select>
          <select class="filter-select" id="filterStatus" onchange="renderPlanner()">
            <option value="">Status</option>
            <option value="Em andamento">Em andamento</option>
            <option value="Em revisão">Em revisão</option>
            <option value="Correção">Correção</option>
          </select>
          <select class="filter-select" id="filterPrioridade" onchange="renderPlanner()">
            <option value="">Prioridade</option>
            <option value="Urgente">Urgente</option>
            <option value="Alta">Alta</option>
            <option value="Média">Média</option>
            <option value="Baixa">Baixa</option>
          </select>
          <button class="tl-clear" id="tlClear" onclick="clearTlFilters()">Limpar</button>
        </div>
      </div>
      <div class="gantt-scroll"><div class="tl-grid" id="ganttGrid"></div></div>
      <div class="tl-legend" id="plLegend"></div>
    </div>

    <div class="pl-bottom">
      <div class="capacity-card">
        <div class="pl-card-head">
          <div class="capacity-title">Carga por responsável</div>
          <div class="pl-card-sub" id="capacitySub">Demandas ativas no período</div>
        </div>
        <div id="capacityList"></div>
      </div>
      <div class="capacity-card">
        <div class="pl-card-head">
          <div class="capacity-title">Entregas previstas</div>
          <div class="pl-card-sub" id="deliveriesSub">Prazo dentro do período</div>
        </div>
        <div id="deliveriesList"></div>
      </div>
    </div>
  </section>

  <!-- CONCLUÍDOS -->
  <section class="page" id="page-concluidos">
    <div class="page-header">
      <div>
        <div class="page-title">Concluídos</div>
        <div class="page-sub">Histórico de tarefas finalizadas</div>
      </div>
      <button class="btn btn-ghost" onclick="exportCSV()">⬇ Exportar CSV</button>
    </div>
    <div class="filter-bar">
      <select class="filter-select" id="cFilterSegmento" onchange="renderConcluidos()">
        <option value="">Todos segmentos</option>
        <option value="Asset">Asset</option>
        <option value="Private">Private</option>
        <option value="Íon">Íon</option>
        <option value="Varejo">Varejo</option>
        <option value="Banco de Ideias">Banco de Ideias</option>
        <option value="Gaveta">Gaveta</option>
      </select>
      <select class="filter-select" id="cFilterResponsavel" onchange="renderConcluidos()">
        <option value="">Todos responsáveis</option>
      </select>
      <select class="filter-select" id="cFilterTipo" onchange="renderConcluidos()">
        <option value="">Todos tipos</option>
      </select>
    </div>
    <div class="table-wrap">
      <table id="concluidosTable">
        <thead>
          <tr>
            <th>Tarefa</th>
            <th>Segmento</th>
            <th>Responsável</th>
            <th>Tipo</th>
            <th>Início</th>
            <th>Entrega</th>
            <th>Tempo (dias)</th>
            <th>Retrabalhos</th>
            <th></th>
          </tr>
        </thead>
        <tbody id="concluidosBody"></tbody>
      </table>
    </div>
  </section>

  <!-- DASHBOARD -->
  <section class="page" id="page-dashboard">
    <div class="page-header">
      <div>
        <div class="page-title">Dashboard de Produção</div>
        <div class="page-sub">Volume e ritmo do que a coordenação entrega</div>
      </div>
      <button class="btn btn-ghost btn-pdf" id="btnDashPdf" onclick="exportDashboardPDF()" title="Baixar o dashboard (com os filtros atuais) em PDF">
        <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M14 3H7a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V8z"/><path d="M14 3v5h5M12 11v6M9 14l3 3 3-3"/></svg>
        <span>Baixar PDF</span>
      </button>
    </div>

    <div class="dash-filters" id="dashFilters">
      <div class="group">
        <label>Período</label>
        <div class="preset" id="dashPreset">
          <button data-preset="all">Tudo</button>
          <button data-preset="year">Ano</button>
          <button data-preset="month">Mês</button>
          <button data-preset="week">Semana</button>
          <button data-preset="day">Dia</button>
        </div>
      </div>
      <div class="group" id="grpAno">
        <label>Ano</label>
        <select id="dashAno"></select>
      </div>
      <div class="group" id="grpMes" style="display:none">
        <label>Mês</label>
        <select id="dashMes"></select>
      </div>
      <div class="group" id="grpSemana" style="display:none">
        <label>Semana</label>
        <input type="week" id="dashSemana">
      </div>
      <div class="group" id="grpDia" style="display:none">
        <label>Dia</label>
        <input type="date" id="dashDia">
      </div>
      <div class="group">
        <label>Segmento</label>
        <select id="dashSeg"><option value="">Todos</option></select>
      </div>
      <div class="group">
        <label>Responsável</label>
        <select id="dashResp"><option value="">Todos</option></select>
      </div>
      <div class="group">
        <label>Tipo</label>
        <select id="dashTipo"><option value="">Todos</option></select>
      </div>
      <div class="spacer"></div>
      <button class="reset" onclick="resetDashFilters()">Limpar filtros</button>
    </div>
    <div class="dash-range-info" id="dashRangeInfo"></div>

    <div class="kpi-grid" id="kpiGrid"></div>

    <div class="dash-grid">
      <div class="chart-card">
        <div class="chart-title">Demandas concluídas — por mês</div>
        <canvas id="chartProducaoMensal"></canvas>
        <div class="chart-slider">
          <label>Janela</label>
          <input type="range" id="sliderProd" min="1" max="12" value="12">
          <span class="val" id="sliderProdLabel">12 meses</span>
        </div>
      </div>
      <div class="chart-card">
        <div class="chart-title">Demandas criadas (Backlog) — por mês</div>
        <canvas id="chartBacklogMensal"></canvas>
        <div class="chart-slider">
          <label>Janela</label>
          <input type="range" id="sliderBacklog" min="1" max="12" value="12">
          <span class="val" id="sliderBacklogLabel">12 meses</span>
        </div>
      </div>
      <div class="chart-card">
        <div class="chart-title">Fluxo semanal — produção & saldo</div>
        <canvas id="chartEvolucao"></canvas>
        <div class="chart-slider">
          <label>Janela</label>
          <input type="range" id="sliderSemanas" min="1" max="8" value="8">
          <span class="val" id="sliderSemanasLabel">8 semanas</span>
        </div>
      </div>
      <div class="chart-card">
        <div class="chart-title">Produção por dia da semana</div>
        <canvas id="chartDiaSemana"></canvas>
      </div>
    </div>

    <div class="dash-grid-3">
      <div class="chart-card">
        <div class="chart-title">Por Segmento</div>
        <canvas id="chartSegmento"></canvas>
      </div>
      <div class="chart-card">
        <div class="chart-title">Por Responsável</div>
        <canvas id="chartResponsavel"></canvas>
      </div>
      <div class="chart-card">
        <div class="chart-title">Por Tipo de demanda</div>
        <canvas id="chartTipo"></canvas>
      </div>
      <div class="chart-card">
        <div class="chart-title">Status × Idade (ativas)</div>
        <div class="status-split">
          <div class="status-chart-wrap"><canvas id="chartStatus"></canvas></div>
          <div class="status-done" id="statusDone">
            <div class="status-done-label">Concluídas no período</div>
            <div class="status-done-value" id="statusDoneValue">0</div>
            <div class="status-done-sub" id="statusDoneSub">entregas finalizadas</div>
          </div>
        </div>
        <div class="chart-slider">
          <label>Janela</label>
          <input type="range" id="sliderStatus" min="1" max="12" value="12">
          <span class="val" id="sliderStatusLabel">12 meses</span>
        </div>
      </div>
      <div class="chart-card">
        <div class="chart-title">Tempo médio por tipo (dias)</div>
        <canvas id="chartTempo"></canvas>
      </div>
      <div class="chart-card">
        <div class="chart-title">Horas trabalhadas por responsável</div>
        <canvas id="chartHorasResp"></canvas>
      </div>
      <div class="chart-card">
        <div class="chart-title">Estimado × Realizado por tipo (horas)</div>
        <canvas id="chartHorasTipo"></canvas>
      </div>
    </div>
  </section>

</main>
</div></div>

<!-- ============= MODAL TAREFA ============= -->
<div class="modal-overlay" id="taskModal">
  <div class="modal">
    <div class="modal-header">
      <div class="modal-title" id="taskModalTitle">Nova Tarefa</div>
      <button class="icon-btn" onclick="closeTaskModal()">✕</button>
    </div>
    <div class="modal-body">
      <form id="taskForm" onsubmit="event.preventDefault();saveTask()">
        <div class="form-grid">
          <div class="form-field span2">
            <label class="form-label">Nome da Tarefa *</label>
            <input class="form-input" name="nome" required />
          </div>
          <div class="form-field">
            <label class="form-label">Segmento *</label>
            <select class="form-select" name="segmento" required>
              <option value="Asset">Asset</option>
              <option value="Private">Private</option>
              <option value="Íon">Íon</option>
        <option value="Varejo">Varejo</option>
        <option value="Banco de Ideias">Banco de Ideias</option>
        <option value="Gaveta">Gaveta</option>
            </select>
          </div>
          <div class="form-field">
            <label class="form-label">Tipo *</label>
            <select class="form-select" name="tipo" required>
              <option>Design</option>
              <option>Vídeo</option>
              <option>Apresentação</option>
              <option>Social Media</option>
              <option>E-mail Marketing</option>
              <option>Evento</option>
              <option>Outros</option>
            </select>
          </div>
          <div class="form-field">
            <label class="form-label">Solicitante</label>
            <input class="form-input" name="solicitante" />
          </div>
          <div class="form-field">
            <label class="form-label">Responsável *</label>
            <select class="form-select" name="responsavel" id="modalResponsavel"></select>
          </div>
          <div class="form-field">
            <label class="form-label">Data do Pedido</label>
            <input class="form-input" type="date" name="dataPedido" />
          </div>
          <div class="form-field">
            <label class="form-label">Duração estimada (dias úteis)</label>
            <input class="form-input" type="number" name="duracao" min="1" value="1" />
          </div>
          <div class="form-field">
            <label class="form-label">Horas reais trabalhadas</label>
            <input class="form-input" type="number" name="horasReais" min="0" step="0.5" placeholder="Preencher ao concluir" />
          </div>
          <div class="form-field">
            <label class="form-label">Data de Início *</label>
            <input class="form-input" type="date" name="dataInicio" required />
          </div>
          <div class="form-field">
            <label class="form-label">Data de Entrega *</label>
            <input class="form-input" type="date" name="dataEntrega" required />
          </div>
          <div class="form-field">
            <label class="form-label">Status</label>
            <select class="form-select" name="status">
              <option>Aguardando</option>
              <option>Em andamento</option>
              <option>Em revisão</option>
              <option>Correção</option>
              <option>Concluída</option>
            </select>
          </div>
          <div class="form-field">
            <label class="form-label">Prioridade</label>
            <select class="form-select" name="prioridade">
              <option>Baixa</option>
              <option selected>Média</option>
              <option>Alta</option>
              <option>Urgente</option>
            </select>
          </div>
          <div class="form-field">
            <label class="form-label">Grau de Dificuldade</label>
            <div class="star-rating" id="starRating" data-value="3">
              <span class="star" data-v="1">★</span>
              <span class="star" data-v="2">★</span>
              <span class="star" data-v="3">★</span>
              <span class="star" data-v="4">★</span>
              <span class="star" data-v="5">★</span>
            </div>
          </div>
          <div class="form-field">
            <label class="form-label">Retrabalhos / Correções</label>
            <input class="form-input" type="number" name="retrabalhos" min="0" value="0" />
          </div>
          <div class="form-field span2">
            <label class="form-label">Observações</label>
            <textarea class="form-textarea" name="observacoes"></textarea>
          </div>
        </div>
      </form>
    </div>
    <div class="modal-footer">
      <div>
        <button class="btn btn-danger btn-sm" id="deleteBtn" onclick="deleteTask()" style="display:none">🗑 Deletar</button>
      </div>
      <div style="display:flex;gap:8px">
        <button class="btn btn-ghost" onclick="closeTaskModal()">Cancelar</button>
        <button class="btn btn-success" id="concluirBtn" onclick="concluirTask(state.editingId,event)" style="display:none">✓ Concluir</button>
        <button class="btn btn-primary" onclick="saveTask()">Salvar</button>
      </div>
    </div>
  </div>
</div>

<!-- ============= TOAST STACK ============= -->
<div class="toast-stack" id="toastStack"></div>

<script>
/* ============================================================
   ESTADO E PERSISTÊNCIA
   ============================================================ */
const STORAGE_KEY = 'planner_comunicacao_criativa_v_20260518';
const TEAM_MEMBERS = ['Eder','Fabiano','Pabu','Reginaldo','Karol','Fernanda'];
const SEG_CLASS = {'Asset':'seg-asset','Private':'seg-private','Íon':'seg-ion','Varejo':'seg-varejo','Banco de Ideias':'seg-banco','Gaveta':'seg-gaveta'};
const SEG_COLOR = {'Asset':'#9EDCEF','Private':'#000000','Íon':'#A6CF2E','Varejo':'#9CA3AF','Banco de Ideias':'#D1D5DB','Gaveta':'#6B7280'};

/* ============================================================
   FOTOS DA EQUIPE
   Cole entre as aspas o link (URL) da foto de cada pessoa.
   Dica (SharePoint): a foto do perfil Microsoft 365 pode ser usada assim:
   https://iconectados.sharepoint.com/_layouts/15/userphoto.aspx?size=M&accountname=EMAIL_DA_PESSOA
   Se o link ficar vazio ou não carregar, aparecem as iniciais.
   ============================================================ */
const TEAM_PHOTOS = {
  'Eder':      '',
  'Fabiano':   '',
  'Pabu':      '',
  'Reginaldo': '',
  'Karol':     '',
  'Fernanda':  ''
};
function avatarHTML(name, size){
  const n = String(name || '').trim();
  const parts = n.split(/\s+/).filter(Boolean);
  const ini = !parts.length ? '—' : (parts.length > 1 ? parts[0][0] + parts[1][0] : n.slice(0,2)).toUpperCase();
  const url = TEAM_PHOTOS[n];
  const img = url ? `<img src="${escapeHtml(url)}" alt="" loading="lazy" onerror="this.remove()">` : '';
  return `<span class="avatar sz-${size||26}" title="${escapeHtml(n)}">${escapeHtml(ini)}${img}</span>`;
}
(function initSidebarUser(){
  const el = document.querySelector('.sidebar-avatar');
  const nameEl = document.querySelector('.sidebar-user');
  if(el && nameEl){ el.outerHTML = avatarHTML(nameEl.textContent, 32); }
})();

/* ============================================================
   DASHBOARD → PDF (para enviar por e-mail)
   Gera um A4 paisagem com cabeçalho, indicadores e gráficos,
   respeitando os filtros aplicados no dashboard.
   ============================================================ */
function loadScriptOnce(src){
  return new Promise((resolve, reject)=>{
    if(document.querySelector(`script[data-src="${src}"]`)) return resolve();
    const s = document.createElement('script');
    s.src = src; s.dataset.src = src; s.async = true;
    s.onload = ()=>resolve(); s.onerror = ()=>reject(new Error('Não foi possível carregar ' + src));
    document.head.appendChild(s);
  });
}

async function exportDashboardPDF(){
  const btn = document.getElementById('btnDashPdf');
  const label = btn ? btn.querySelector('span') : null;
  if(btn){ btn.disabled = true; if(label) label.textContent = 'Gerando PDF…'; }
  const prevTheme = state.theme;
  const prevAnim = Chart.defaults.animation;
  try{
    await loadScriptOnce('https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js');
    await loadScriptOnce('https://cdn.jsdelivr.net/npm/jspdf@2.5.1/dist/jspdf.umd.min.js');

    // PDF sempre no tema claro e sem animação dos gráficos
    Chart.defaults.animation = false;
    if(prevTheme === 'dark'){ state.theme = 'light'; applyTheme(); }
    document.body.classList.add('pdf-capture');
    renderDashboard();
    await new Promise(r=>setTimeout(r, 120));
    Object.values(charts).forEach(c=>{ try{ c && c.resize && c.resize(); }catch(e){} });
    await new Promise(r=>setTimeout(r, 350));

    const snap = el => html2canvas(el, {scale:1.7, backgroundColor:'#FFFFFF', logging:false, useCORS:true});
    const kpiCanvas = await snap(document.getElementById('kpiGrid'));
    const cards = [...document.querySelectorAll('#page-dashboard .chart-card')].filter(c=>c.offsetParent !== null);
    const cardCanvases = [];
    for(const c of cards) cardCanvases.push(await snap(c));

    const { jsPDF } = window.jspdf;
    const pdf = new jsPDF({orientation:'landscape', unit:'mm', format:'a4', compress:true});
    const W = 297, H = 210, M = 14, GAP = 6;
    const NAVY = [27,42,74], ORANGE = [255,98,0], MUTED = [107,114,128];
    const now = new Date();
    const stamp = now.toLocaleDateString('pt-BR') + ' às ' + now.toLocaleTimeString('pt-BR',{hour:'2-digit',minute:'2-digit'});
    const rangeTxt = (document.getElementById('dashRangeInfo').textContent || '').replace(/\s+/g,' ').replace(/—/g,'-').trim();

    const header = (first)=>{
      pdf.setFillColor(...ORANGE); pdf.rect(M, M, 18, 1.2, 'F');
      pdf.setTextColor(...NAVY); pdf.setFont('helvetica','bold');
      pdf.setFontSize(first ? 18 : 12);
      pdf.text('Dashboard de Produção - Comunicação Criativa', M, M + (first ? 9 : 7));
      pdf.setFont('helvetica','normal'); pdf.setTextColor(...MUTED); pdf.setFontSize(9);
      if(first){
        const lines = pdf.splitTextToSize(rangeTxt, W - 2*M);
        pdf.text(lines, M, M + 15);
        return M + 15 + lines.length*4 + 4;
      }
      return M + 12;
    };

    let y = header(true);
    // Indicadores
    const kw = W - 2*M, kh = kpiCanvas.height * kw / kpiCanvas.width;
    const kScale = Math.min(1, (H - y - M - 10) / kh);
    pdf.addImage(kpiCanvas.toDataURL('image/jpeg', 0.88), 'JPEG', M, y, kw*kScale, kh*kScale);
    y += kh*kScale + GAP;

    // Gráficos: 2 por linha
    const cw = (W - 2*M - GAP) / 2;
    const rowMax = (H - 2*M - 18 - GAP) / 2; // até 2 linhas por página
    for(let i = 0; i < cardCanvases.length; i += 2){
      const row = cardCanvases.slice(i, i+2).map(cv=>{
        let w = cw, h = cv.height * cw / cv.width;
        if(h > rowMax){ h = rowMax; w = cv.width * h / cv.height; }
        return {cv, w, h};
      });
      const rh = Math.max(...row.map(r=>r.h));
      if(y + rh > H - M - 6){ pdf.addPage(); y = header(false); }
      row.forEach((r, k)=>{
        pdf.addImage(r.cv.toDataURL('image/jpeg', 0.88), 'JPEG', M + k*(cw + GAP), y, r.w, r.h);
      });
      y += rh + GAP;
    }

    // Rodapé
    const total = pdf.getNumberOfPages();
    for(let p = 1; p <= total; p++){
      pdf.setPage(p);
      pdf.setFontSize(8); pdf.setTextColor(...MUTED);
      pdf.text('Planner CC · Comunicação Criativa · gerado em ' + stamp, M, H - 7);
      pdf.text(`Página ${p} de ${total}`, W - M, H - 7, {align:'right'});
    }
    const fname = 'Dashboard_Producao_' + todayTag() + '.pdf';
    pdf.save(fname);
    toast('PDF gerado: ' + fname);
  }catch(err){
    console.error(err);
    toast('Não foi possível gerar o PDF direto. Abrindo a impressão — escolha "Salvar como PDF".', 'error');
    document.body.classList.add('print-dashboard');
    setTimeout(()=>{ window.print(); document.body.classList.remove('print-dashboard'); }, 300);
  }finally{
    document.body.classList.remove('pdf-capture');
    Chart.defaults.animation = prevAnim;
    if(state.theme !== prevTheme){ state.theme = prevTheme; applyTheme(); }
    if(state.currentTab === 'dashboard') renderDashboard();
    if(btn){ btn.disabled = false; if(label) label.textContent = 'Baixar PDF'; }
  }
}

let state = {
  tasks: [],
  currentTab:'backlog',
  editingId:null,
  weekOffset:0, // 0 = semana atual
  theme:'light'
};

/* ============================================================
   CONEXÃO COM A LISTA DO SHAREPOINT (DemandasPlanner)
   Para trocar de site/lista, altere apenas estas constantes.
   ============================================================ */
const SITE_URL    = 'https://iconectados.sharepoint.com/sites/PortfolioComunicaoCriativa';
const LIST_TITLE  = 'DemandasPlanner';
const PLANNER_TAG = 'planner_cc';   // gravado na coluna "Coluna" — separa os itens deste planner dos itens do outro
const AUTO_REFRESH_SECONDS = 30;
const THEME_KEY   = 'planner_cc_theme';
const ON_SHAREPOINT = /sharepoint\.com$/i.test(location.hostname);
// Campos sem coluna própria na lista: vão em JSON na coluna "Checklist"
const EXTRA_KEYS = ['id','tipo','dataPedido','duracao','horasReais','dataInicio','dificuldade','retrabalhos','createdAt','updatedAt','dataConclusao','startedAt'];

function lsGet(k){ try{ return localStorage.getItem(k); }catch(e){ return null; } }
function lsSet(k,v){ try{ localStorage.setItem(k,v); }catch(e){} }
function stripSp(t){ const c = {...t}; delete c._spId; return c; }

/* ---------- SharePoint REST ---------- */
const SP = (function(){
  const listApi = SITE_URL + "/_api/web/lists/getbytitle('" + LIST_TITLE + "')";
  const WANTED = {coluna:'col', segmento:'seg', fase:'status', prioridade:'prio', responsavel:'resp',
                  solicitante:'req', prazo:'due', observacoes:'notes', checklist:'extra'};
  const F = {};
  let entityType = null, digest = null, digestExp = 0;
  const norm = s => String(s||'').normalize('NFD').replace(/[\u0300-\u036f]/g,'').toLowerCase().replace(/[^a-z0-9]/g,'');

  function req(url, opts){
    opts = opts || {};
    opts.credentials = 'same-origin';
    opts.headers = Object.assign({'Accept':'application/json;odata=nometadata'}, opts.headers || {});
    return fetch(url, opts).then(r=>{
      if(!r.ok) return r.text().then(t=>{
        let msg = t; try{ const j = JSON.parse(t); msg = (j['odata.error']||j.error||{}).message; msg = msg && (msg.value||msg); }catch(e){}
        throw new Error('HTTP ' + r.status + (msg ? ' — ' + msg : ''));
      });
      return r.text().then(t=> t ? JSON.parse(t) : null);
    });
  }
  function getDigest(){
    if(digest && Date.now() < digestExp) return Promise.resolve(digest);
    return req(SITE_URL + '/_api/contextinfo', {method:'POST'}).then(d=>{
      digest = d.FormDigestValue;
      digestExp = Date.now() + (d.FormDigestTimeoutSeconds - 60) * 1000;
      return digest;
    });
  }
  function write(url, method, body){
    return getDigest().then(dg=>{
      const h = {'X-RequestDigest':dg, 'Content-Type':'application/json;odata=verbose'};
      if(method !== 'POST'){ h['X-HTTP-Method'] = method; h['IF-MATCH'] = '*'; }
      return req(url, {method:'POST', headers:h, body: body ? JSON.stringify(body) : undefined});
    });
  }
  async function init(){
    const [info, fields] = await Promise.all([
      req(listApi + '?$select=ListItemEntityTypeFullName'),
      req(listApi + '/fields?$select=Title,InternalName,ReadOnlyField')
    ]);
    entityType = info.ListItemEntityTypeFullName;
    (fields.value || []).forEach(f=>{
      const key = WANTED[norm(f.Title)];
      if(key && !f.ReadOnlyField && !F[key]) F[key] = f.InternalName;
    });
    const missing = Object.keys(WANTED).filter(k=>!F[WANTED[k]]);
    if(missing.length) throw new Error('Colunas não encontradas na lista: ' + missing.join(', '));
  }
  function toItem(t){
    const o = {'__metadata':{type:entityType}, Title: String(t.nome || '(sem título)').slice(0,255)};
    o[F.col]    = PLANNER_TAG;
    o[F.seg]    = t.segmento || '';
    o[F.status] = t.status || '';
    o[F.prio]   = t.prioridade || '';
    o[F.resp]   = t.responsavel || '';
    o[F.req]    = String(t.solicitante || '').slice(0,255);
    o[F.due]    = t.dataEntrega ? t.dataEntrega + 'T12:00:00Z' : null;
    o[F.notes]  = t.observacoes || '';
    const extra = {};
    EXTRA_KEYS.forEach(k=>{ if(t[k] !== undefined) extra[k] = t[k]; });
    o[F.extra]  = JSON.stringify(extra);
    return o;
  }
  function fromItem(it){
    let extra = {};
    try{ extra = JSON.parse(it[F.extra] || '{}') || {}; }catch(e){ extra = {}; }
    if(Array.isArray(extra)) extra = {};
    return Object.assign({}, extra, {
      id: extra.id || ('sp_' + it.Id),
      _spId: String(it.Id),
      nome: it.Title || '',
      segmento: it[F.seg] || 'Asset',
      status: it[F.status] || 'Aguardando',
      prioridade: it[F.prio] || 'Média',
      responsavel: it[F.resp] || '',
      solicitante: it[F.req] || '',
      dataEntrega: it[F.due] ? String(it[F.due]).slice(0,10) : '',
      observacoes: it[F.notes] || ''
    });
  }
  async function load(){
    const sel = ['Id','Title'].concat(Object.values(WANTED).map(k=>F[k])).join(',');
    let url = listApi + "/items?$top=2000&$select=" + sel + "&$filter=" + F.col + " eq '" + PLANNER_TAG + "'";
    const all = [];
    while(url){
      const d = await req(url);
      (d.value || []).forEach(it=>all.push(fromItem(it)));
      url = d['odata.nextLink'] || null;
    }
    return all;
  }
  return {
    init, load,
    create: t => write(listApi + '/items', 'POST', toItem(t)).then(r=>String(r.Id || (r.d && r.d.Id))),
    update: t => write(listApi + '/items(' + t._spId + ')', 'MERGE', toItem(t)),
    remove: id => write(listApi + '/items(' + id + ')', 'DELETE')
  };
})();

/* ---------- Indicador de sincronização ---------- */
function setSync(kind, text){
  const p = document.getElementById('syncPill'); if(!p) return;
  p.className = 'sync-pill ' + (kind||'');
  document.getElementById('syncText').textContent = text;
}
function okStatus(){
  const h = new Date().toLocaleTimeString('pt-BR',{hour:'2-digit',minute:'2-digit'});
  setSync('ok', ON_SHAREPOINT ? 'Sincronizado · ' + h : 'Modo local');
}

/* ---------- Sincronização (diferença entre tela e lista) ---------- */
let synced = {};            // spId -> assinatura do que está gravado na lista
let flushing = false, dirty = false, saveTimer = null, lastServerSig = '';
function sig(t){ return JSON.stringify(Object.keys(t).filter(k=>k!=='_spId').sort().map(k=>[k,t[k]])); }
async function pool(items, n, fn){
  let i = 0;
  const workers = Array.from({length: Math.min(n, items.length)}, async ()=>{
    while(i < items.length){ const it = items[i++]; await fn(it); }
  });
  await Promise.all(workers);
}

function saveState(){
  lsSet(THEME_KEY, state.theme);
  if(!ON_SHAREPOINT){
    lsSet(STORAGE_KEY, JSON.stringify({tasks:state.tasks, theme:state.theme}));
    return;
  }
  dirty = true;
  clearTimeout(saveTimer);
  saveTimer = setTimeout(flush, 250);
}

async function flush(){
  if(flushing) return;
  flushing = true; dirty = false;
  try{
    const present = new Set(), toCreate = [], toUpdate = [];
    state.tasks.forEach(t=>{
      if(t._spId){ present.add(t._spId); if(synced[t._spId] !== sig(t)) toUpdate.push(t); }
      else toCreate.push(t);
    });
    const toDelete = Object.keys(synced).filter(id=>!present.has(id));
    const total = toCreate.length + toUpdate.length + toDelete.length;
    if(total){
      let done = 0;
      const tick = ()=>{ done++; setSync('busy', total > 3 ? `Salvando ${done}/${total}…` : 'Salvando…'); };
      setSync('busy', 'Salvando…');
      await pool(toDelete, 4, async id=>{ await SP.remove(id); delete synced[id]; tick(); });
      await pool(toUpdate, 4, async t=>{ const s = sig(t); await SP.update(t); synced[t._spId] = s; tick(); });
      await pool(toCreate, 4, async t=>{
        const s = sig(t);
        const spId = await SP.create(t);
        t._spId = spId; synced[spId] = s;
        // se a tarefa foi editada enquanto era criada, liga a versão nova ao mesmo item
        const cur = state.tasks.find(x=>x.id===t.id);
        if(cur && !cur._spId){ cur._spId = spId; dirty = true; }
        tick();
      });
    }
    okStatus();
  }catch(err){
    console.error(err);
    setSync('err', 'Erro ao salvar');
    toast('Não foi possível salvar na lista: ' + err.message, 'error');
    flushing = false; dirty = false;
    await refreshFromServer(true).catch(()=>{});
    return;
  }
  flushing = false;
  if(dirty) flush();
}

async function refreshFromServer(force){
  if(!ON_SHAREPOINT) return;
  const modalOpen = document.getElementById('taskModal').classList.contains('active') || !!document.querySelector('.ui-dlg-overlay');
  if(!force && (flushing || dirty || modalOpen)) return;
  const tasks = await SP.load();
  const s = JSON.stringify(tasks.map(sig).sort());
  synced = {};
  tasks.forEach(t=>{ synced[t._spId] = sig(t); });
  if(force || s !== lastServerSig){
    lastServerSig = s;
    state.tasks = tasks;
    renderCurrent();
  }
  okStatus();
}

function loadLocal(){
  try{
    const raw = lsGet(STORAGE_KEY);
    if(raw){
      const d = JSON.parse(raw);
      state.tasks = d.tasks || [];
      state.theme = d.theme || state.theme;
    }
  }catch(e){ console.error(e); }
  if(state.tasks.length===0){ state.tasks = seedData(); saveState(); }
}

async function boot(){
  const th = lsGet(THEME_KEY); if(th) state.theme = th;
  applyTheme();
  if(!ON_SHAREPOINT){
    loadLocal(); applyTheme(); renderCurrent(); okStatus();
    toast('Modo local: abra pela página publicada no SharePoint para usar a lista ' + LIST_TITLE, 'info');
    return;
  }
  setSync('busy', 'Conectando…');
  try{
    await SP.init();
    await refreshFromServer(true);
    if(state.tasks.length === 0){
      const n = seedData().length;
      if(await uiDialog({title:'Carregar histórico', message:'A lista ' + LIST_TITLE + ' ainda não tem demandas deste planner. Deseja carregar o histórico com ' + n + ' demandas? Leva alguns minutos — mantenha a página aberta até o indicador ficar verde.', okText:'Carregar'})){
        state.tasks = seedData();
        renderCurrent();
        saveState();
      }
    }
    setInterval(()=>{
      refreshFromServer(false).catch(e=>{ console.error(e); setSync('err','Sem conexão com a lista'); });
    }, AUTO_REFRESH_SECONDS * 1000);
  }catch(err){
    console.error(err);
    setSync('err', 'Sem conexão com a lista');
    toast('Não foi possível conectar à lista ' + LIST_TITLE + ': ' + err.message, 'error');
  }
}

window.addEventListener('beforeunload', e=>{
  if(flushing || dirty){ e.preventDefault(); e.returnValue = ''; }
});

/* Tarefas de exemplo (apenas na 1ª abertura) */
function seedData(){
  return [{"id": "plan_j_ac7SKOfUy93a", "nome": "Ajustes post serie Petroleo", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-05-19", "status": "Em andamento", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção", "createdAt": "2026-05-20T10:49:35.169684"}, {"id": "plan_Gcigkycd2Uarut", "nome": "Gíro íon - social íon -22/5", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 4, "dataInicio": "2026-05-18", "dataEntrega": "2026-05-22", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo", "createdAt": "2026-05-20T10:49:35.169704"}, {"id": "plan_KUODdPWZdUm00U", "nome": "Semana em Revista - Wapp IP 22/5", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 4, "dataInicio": "2026-05-18", "dataEntrega": "2026-05-22", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo", "createdAt": "2026-05-20T10:49:35.169713"}, {"id": "plan_W_uoZdjRx0-0x9", "nome": "Cartas mensais - Jun/26", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo", "createdAt": "2026-05-20T10:49:35.169727"}, {"id": "plan_8r1kxySzWkmPsk", "nome": "Thumbs live cenario macro", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Em andamento", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção", "createdAt": "2026-05-20T10:49:35.169735"}, {"id": "plan_OJlCSv38jUCiWG", "nome": "Post parceria desafio quant/Bloomberg.", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Em revisão", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Validação", "createdAt": "2026-05-20T10:49:35.169742"}, {"id": "plan_3d251u77mUiqiR", "nome": "thumb Desafio quant", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 4, "dataInicio": "2026-05-18", "dataEntrega": "2026-05-22", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído", "createdAt": "2026-05-20T10:49:35.169749"}, {"id": "plan_ANlt3DJV5kie86", "nome": "Apresentação Itaú Optimus", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Em andamento", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção", "createdAt": "2026-05-20T10:49:35.169755"}, {"id": "plan_SFZZGZcUUkS8tv", "nome": "Ajustar relatorio ESG 2025", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Em revisão", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Validação", "createdAt": "2026-05-20T10:49:35.169760"}, {"id": "plan_ymN-CeO0QEiYZt", "nome": "ajustar thumb Haj, grafismo", "segmento": "Private", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Private", "createdAt": "2026-05-20T10:49:35.169766"}, {"id": "plan_4ATQTtr38UWVJI", "nome": "thumb Hub", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído", "createdAt": "2026-05-20T10:49:35.169772"}, {"id": "plan_DCXlVGI33Uemu2", "nome": "Relatório ESG Anual Asset 2025", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Asset", "createdAt": "2026-05-20T10:49:35.169778"}, {"id": "plan_hgH6CqIPz0qZh8", "nome": "saiu na mídia thumb", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Em revisão", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Validação", "createdAt": "2026-05-20T10:49:35.169784"}, {"id": "plan_PhAPd73HIEGkGL", "nome": "série de conteúdos pro Private,Petróleo,", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-05-18", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído", "createdAt": "2026-05-20T10:49:35.169789"}, {"id": "plan_obIDsUn5-kim7z", "nome": "Cards CDIB11 no itnow", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído", "createdAt": "2026-05-20T10:49:35.169795"}, {"id": "plan_GKHW7bvaN0inEk", "nome": "Vídeo - WP Insights", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-05-08", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído", "createdAt": "2026-05-20T10:49:35.169802"}, {"id": "plan_o7mWV2V2wU2_Vg", "nome": "Curso ETFs - Caíque", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Pabu", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Em andamento", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção", "createdAt": "2026-05-20T10:49:35.169808"}, {"id": "plan_UIiBbzEngk-FZ9", "nome": "Cartas da Gestão", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Fabiano", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído", "createdAt": "2026-05-20T10:49:35.169814"}, {"id": "plan_one-H3IQokqsFk", "nome": "Email dividendos mensais", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-05-05", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído", "createdAt": "2026-05-20T10:49:35.169820"}, {"id": "plan_grcsA1dZrEihMp", "nome": "Institucional ENG (verificar e aprovar)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Em andamento", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção", "createdAt": "2026-05-20T10:49:35.169826"}, {"id": "plan_q0R0Eo-Hq0uUJd", "nome": "Edição Vídeos - ETFs", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Pabu", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-24", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído", "createdAt": "2026-05-20T10:49:35.169832"}, {"id": "plan_GttWyNjPw0G15G", "nome": "Decalration of Trusty - WP", "segmento": "Private", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Private", "createdAt": "2026-05-20T10:49:35.169838"}, {"id": "plan_X3X9XYuA2ki9FO", "nome": "Apresentação Arlindo - PODs", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído", "createdAt": "2026-05-20T10:49:35.169843"}, {"id": "plan_DbfujksHKEiGm8", "nome": "Atualização conteudo site da Asset", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-24", "status": "Em andamento", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção", "createdAt": "2026-05-20T10:49:35.169849"}, {"id": "plan_z7CZJ1cZhECFIy", "nome": "Folder Safra Invest (evento acontece 21/05)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Em andamento", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção", "createdAt": "2026-05-20T10:49:35.169856"}, {"id": "plan_uIC_nHKez0-POI", "nome": "Backlog", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Asset", "createdAt": "2026-05-20T10:49:35.169863"}, {"id": "plan_HWk85OiunkWiSb", "nome": "Vídeo Institucional", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Asset", "createdAt": "2026-05-20T10:49:35.169868"}, {"id": "plan_HTSRM5S29EWvUq", "nome": "Motion - TVs e totem da FL sobre o prêmio Outliers", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Em andamento", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção", "createdAt": "2026-05-20T10:49:35.169874"}, {"id": "plan_0Y70XDWpxEKRlE", "nome": "Post Globe", "segmento": "Private", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Private", "createdAt": "2026-05-20T10:49:35.169879"}, {"id": "plan_w_Nyql7RokyDfv", "nome": "Workshop - Design", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Em andamento", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção", "createdAt": "2026-05-20T10:49:35.169884"}, {"id": "plan_NjbspV5oIkCti5", "nome": "Trailer do Youtube Private", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-02-02", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído", "createdAt": "2026-05-20T10:49:35.169890"}, {"id": "plan_eOrHxWUNd0m0OD", "nome": "Investment Club", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe", "createdAt": "2026-05-20T10:49:35.169896"}, {"id": "plan__3Qq0HgdwkeE43", "nome": "Apresentação Nizan", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe", "createdAt": "2026-05-20T10:49:35.169901"}, {"id": "plan_KwgnXBBX1EqegI", "nome": "EDUCA Asset sobre Quant. entrevista com Victor", "segmento": "Banco de Ideias", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Banco de Ideias", "createdAt": "2026-05-20T10:49:35.169907"}, {"id": "plan_j2NKHJxQeUSDyI", "nome": "Great resignation (e o futuro do trabalho/geração millennial)", "segmento": "Asset", "tipo": "Social Media", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Drops", "createdAt": "2026-05-20T10:49:35.169913"}, {"id": "plan_M0Z4kLhtYUidSw", "nome": "Canal aberto para sugestão de ideias (forms que pode ser divulgado no e-mail de destaques)", "segmento": "Banco de Ideias", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Banco de Ideias", "createdAt": "2026-05-20T10:49:35.169920"}, {"id": "plan_qx4607TBNUqV1y", "nome": "Previdência privada", "segmento": "Asset", "tipo": "Social Media", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Drops", "createdAt": "2026-05-20T10:49:35.169925"}, {"id": "plan_A3nDmU1Zj0yl3Y", "nome": "[Instagram] #IAMquiz sobre a asset", "segmento": "Banco de Ideias", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Banco de Ideias", "createdAt": "2026-05-20T10:49:35.169930"}, {"id": "plan_WntYa46kjk-Juv", "nome": "[Instagram] #IAMquiz investidores B3", "segmento": "Banco de Ideias", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Banco de Ideias", "createdAt": "2026-05-20T10:49:35.169935"}, {"id": "plan_K1tFQZJyL0OTIW", "nome": "Investimentos Alternativos", "segmento": "Asset", "tipo": "Social Media", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Drops", "createdAt": "2026-05-20T10:49:35.169940"}, {"id": "plan_uMy7HkCvZ0WWXj", "nome": "Investimentos no Exterior", "segmento": "Asset", "tipo": "Social Media", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Drops", "createdAt": "2026-05-20T10:49:35.169945"}, {"id": "plan_cIAx_SkPZk2Btu", "nome": "Infraestutura", "segmento": "Asset", "tipo": "Social Media", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Drops", "createdAt": "2026-05-20T10:49:35.169950"}, {"id": "plan_8sQ00Yc510Kha9", "nome": "Mercados Emergentes", "segmento": "Asset", "tipo": "Social Media", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Drops", "createdAt": "2026-05-20T10:49:35.169954"}, {"id": "plan_6FGyw2Z4vU-hSH", "nome": "Finanças Comportamentais", "segmento": "Asset", "tipo": "Social Media", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Drops", "createdAt": "2026-05-20T10:49:35.169959"}, {"id": "plan_BDomAp-2vkKctk", "nome": "Crypto", "segmento": "Asset", "tipo": "Social Media", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Drops", "createdAt": "2026-05-20T10:49:35.169964"}, {"id": "plan_C0aGXwpOwE29P6", "nome": "Inflação Brasil, EUA e Global", "segmento": "Asset", "tipo": "Social Media", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Drops", "createdAt": "2026-05-20T10:49:35.169971"}, {"id": "plan_IfOreMsfPkykPW", "nome": "Agronegócio", "segmento": "Asset", "tipo": "Social Media", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 47, "dataInicio": "2022-03-14", "dataEntrega": "2022-04-30", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Drops", "createdAt": "2026-05-20T10:49:35.169977"}, {"id": "plan_HRC9xXAgakyi1z", "nome": "Semana da Renda Fixa", "segmento": "Banco de Ideias", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Banco de Ideias", "createdAt": "2026-05-20T10:49:35.169983"}, {"id": "plan_7jAd6bdXzEm_e5", "nome": "Post Slide ETF RF", "segmento": "Banco de Ideias", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Banco de Ideias", "createdAt": "2026-05-20T10:49:35.169988"}, {"id": "plan_xSfm0yr8SkeI3l", "nome": "PodCast  sobre Rising Stars", "segmento": "Banco de Ideias", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-29", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Banco de Ideias", "createdAt": "2026-05-20T10:49:35.169993"}, {"id": "plan_wLbAurhX10GbjX", "nome": "Vídeo - Conhecendo a Itaú Asset- Mostrando o escritório", "segmento": "Banco de Ideias", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 14, "dataInicio": "2026-05-18", "dataEntrega": "2026-06-01", "status": "Aguardando", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Banco de Ideias", "createdAt": "2026-05-20T10:49:35.169999"}, {"id": "plan_oZ75PAuRl0-pdc", "nome": "Gíro íon - social íon", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-15", "dataEntrega": "2026-05-15", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170007", "dataConclusao": "2026-05-15T21:50:01.7129757Z"}, {"id": "plan_Ucu65oMDAESFwZ", "nome": "Semana em Revista - Wapp IP", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-15", "dataEntrega": "2026-05-15", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170014", "dataConclusao": "2026-05-15T21:50:00.5431858Z"}, {"id": "plan_OWpeez5bVUSPs8", "nome": "Cartas mensais - Mai/26", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-05-15", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170020", "dataConclusao": "2026-05-15T21:48:07.6456413Z"}, {"id": "plan_KRdNtYybb0ypPG", "nome": "Vídeos para o Evento Safra Invest Day", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-05-10", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Asset · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170027", "dataConclusao": "2026-05-11T11:28:05.5912685Z"}, {"id": "plan_uzlKq9yNbUSgQ7", "nome": "Gíro íon - social íon", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 14, "dataInicio": "2026-04-24", "dataEntrega": "2026-05-08", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170034", "dataConclusao": "2026-05-09T00:32:25.4212378Z"}, {"id": "plan_vxUc2a42B0y3ZL", "nome": "Semana em Revista - Wapp IP", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-08", "dataEntrega": "2026-05-08", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170041", "dataConclusao": "2026-05-09T00:32:22.1076517Z"}, {"id": "plan_mUN9AJNhE0C2eA", "nome": "vídeos do Tech Trends", "segmento": "Private", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-05-08", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Private · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170047", "dataConclusao": "2026-05-08T12:43:12.131805Z"}, {"id": "plan_5Md0RbZA6EGBPH", "nome": "Novo folder Imersão (6 paginas)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-05-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170053", "dataConclusao": "2026-05-04T13:32:35.2817788Z"}, {"id": "plan_DCSK08zYZ0OOP1", "nome": "Apresentação Beyruti - Next Gen + Pvt Talks", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-05-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170059", "dataConclusao": "2026-05-04T13:32:33.3155823Z"}, {"id": "plan_HLbc0_BRLUmp2B", "nome": "Slide artes recorrentes", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-24", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170065", "dataConclusao": "2026-05-04T13:32:30.2317234Z"}, {"id": "plan_cff6HHZmxkuXUr", "nome": "One page Hub de Conteúdo- comercial e clientes", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-22", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170071", "dataConclusao": "2026-05-04T13:32:27.1162325Z"}, {"id": "plan_XBMNLSSvzkq3y8", "nome": "Slides evolução desafio quant", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-05-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170077", "dataConclusao": "2026-05-04T13:32:24.6135698Z"}, {"id": "plan_OAb2tFTKgU6C4n", "nome": "Cortes da live de Cenário Macro", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-05-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170082", "dataConclusao": "2026-05-04T13:32:18.9870613Z"}, {"id": "plan_tsRZ6vlk30uqr0", "nome": "Slides big numbers Private", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-28", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170088", "dataConclusao": "2026-05-04T13:30:49.8466827Z"}, {"id": "plan_DzI6RdhaXE-ATY", "nome": "ajustes one page hub de conteúdo", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-27", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170098", "dataConclusao": "2026-05-04T13:30:45.7540501Z"}, {"id": "plan__DLLDn2YTkKQ8n", "nome": "post linkedin site wp", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-05-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170103", "dataConclusao": "2026-05-04T13:30:42.7196298Z"}, {"id": "plan_rxf0gq5eSUiaco", "nome": "Thumb áudio do Anton", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-30", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170109", "dataConclusao": "2026-05-04T13:30:39.1127679Z"}, {"id": "plan_U-4iY8ISzkSE0D", "nome": "Semana em Revista - Wapp IP", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 7, "dataInicio": "2026-04-10", "dataEntrega": "2026-04-17", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170115", "dataConclusao": "2026-04-22T18:06:00.8602044Z"}, {"id": "plan_gqmfzME2ekqruq", "nome": "Gíro íon - social íon", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 7, "dataInicio": "2026-04-10", "dataEntrega": "2026-04-17", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170121", "dataConclusao": "2026-04-22T18:05:31.7298233Z"}, {"id": "plan_cWrQG2HY9UC-vs", "nome": "Cartas mensais - Abr/26", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-22", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170127", "dataConclusao": "2026-04-22T18:05:04.6990923Z"}, {"id": "plan_NFLxRKoxWUC9e5", "nome": "Curso de IR 2026", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-22", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170132", "dataConclusao": "2026-04-22T18:04:26.3039666Z"}, {"id": "plan_HflwD2zIbESQXw", "nome": "Peças esafio quant 2026", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-14", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170138", "dataConclusao": "2026-04-15T17:09:48.4353247Z"}, {"id": "plan_aPght57sgk6xv_", "nome": "Enxoval de peças | Live Especial", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-13", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170144", "dataConclusao": "2026-04-15T17:09:40.1660171Z"}, {"id": "plan_YmZPm7-Mr0WhFN", "nome": "Peças desafio quant 2026/ proposta", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Fabiano", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-27", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170150", "dataConclusao": "2026-04-15T17:09:34.1512819Z"}, {"id": "plan_rUVp_N42VEaQPF", "nome": "Gravação do Cava - Gerar Avatar (nova roupagem)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-14", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170156", "dataConclusao": "2026-04-14T12:13:53.3585162Z"}, {"id": "plan_RNhvkMjzD0CYbo", "nome": "Carta Itaú Janeiro", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-06", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170162", "dataConclusao": "2026-04-13T13:16:22.5852077Z"}, {"id": "plan_bHy_VyYKfEmZ05", "nome": "Carta Artax", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-06", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170168", "dataConclusao": "2026-04-13T13:16:21.5246255Z"}, {"id": "plan_0mmtGbrZFU63pQ", "nome": "peças live cenário Macro", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-08", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170175", "dataConclusao": "2026-04-13T13:16:20.5154638Z"}, {"id": "plan_QWdIUzROcE-eJi", "nome": "Propostas Thumbs", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170181", "dataConclusao": "2026-04-13T13:16:19.4020629Z"}, {"id": "plan_cHCPSYr2fkeZ9D", "nome": "Gravações do vídeos Listados", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-07", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170186", "dataConclusao": "2026-04-07T17:22:47.0246213Z"}, {"id": "plan_HAlRB8uXCUWB0e", "nome": "Gravação Caique novos ETFs", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-07", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170192", "dataConclusao": "2026-04-07T17:22:43.6385963Z"}, {"id": "plan_wD7Qs8GRhk63j1", "nome": "Finance Academy - Trailer Redes sociais", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Pabu", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-02", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170198", "dataConclusao": "2026-04-07T17:22:37.2469719Z"}, {"id": "plan_YGXELmDgJUqOVv", "nome": "KV Curso de IR 2026", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-06", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170203", "dataConclusao": "2026-04-06T17:12:01.7826084Z"}, {"id": "plan_yryItyf51U2KW2", "nome": "Vídeo de Crédito (Fayga)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-06", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170210", "dataConclusao": "2026-04-06T17:05:27.8769846Z"}, {"id": "plan_iwHrzOBAQEKk1G", "nome": "Regravação vídeo Fayga", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-06", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170216", "dataConclusao": "2026-04-06T17:04:28.7444485Z"}, {"id": "plan_GFY7O5qGZUaqtG", "nome": "Relatório Petróleo (Thomas)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-16", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170222", "dataConclusao": "2026-04-06T17:03:16.2390214Z"}, {"id": "plan_rCyWYywtfkiNbB", "nome": "Atulização apresentação ESG inglês", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-06", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170227", "dataConclusao": "2026-04-06T17:03:13.7228508Z"}, {"id": "plan_1BZoYbKWRk6IUi", "nome": "Thumb one credit Brasil", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-17", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170233", "dataConclusao": "2026-04-06T17:03:09.1791184Z"}, {"id": "plan_dkqJcMlZZkuCms", "nome": "Série FED", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170238", "dataConclusao": "2026-04-06T17:02:45.9154044Z"}, {"id": "plan_JcYOR9Ecf0OwOh", "nome": "Thumbs WP e International Markets", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-10", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170244", "dataConclusao": "2026-04-06T17:01:49.6863533Z"}, {"id": "plan_l-gS_ZfQ5EKBLU", "nome": "Apresentação ESG Itaú Asset - Atualização", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-06", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170249", "dataConclusao": "2026-04-06T17:01:48.8140072Z"}, {"id": "plan_TsXQALLtYU6Ly_", "nome": "Atualização Institucional (apresentação)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-06", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170254", "dataConclusao": "2026-04-06T17:01:05.6518719Z"}, {"id": "plan_fFPB2dCnIUmwkz", "nome": "trocar imagem do blog na carta mensal", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-04-06", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170260", "dataConclusao": "2026-04-06T17:01:00.8832628Z"}, {"id": "plan_nGL757nVsEu3LF", "nome": "Agenda Imerssão (mesa)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-16", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170267", "dataConclusao": "2026-03-23T13:17:59.1510261Z"}, {"id": "plan_UHqoSVY79kW04p", "nome": "Cartas mensais - Abr/26", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-23", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170273", "dataConclusao": "2026-03-23T13:17:35.9558788Z"}, {"id": "plan_3ilWc4Tdy0SWZ3", "nome": "Semana em Revista - Wapp IP", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 3, "dataInicio": "2026-03-20", "dataEntrega": "2026-03-23", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170279", "dataConclusao": "2026-03-23T13:17:12.7362726Z"}, {"id": "plan_UduFkeZLBk2Y7W", "nome": "Gíro íon - social íon", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 3, "dataInicio": "2026-03-20", "dataEntrega": "2026-03-23", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170284", "dataConclusao": "2026-03-23T13:16:54.1397664Z"}, {"id": "plan_hlR8Ougy_EStY0", "nome": "Template sight seller Criptoativos", "segmento": "Varejo", "tipo": "Outros", "solicitante": "", "responsavel": "Reginaldo", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-23", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Varejo · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170289", "dataConclusao": "2026-03-23T13:15:56.4053606Z"}, {"id": "plan_ueXNPkeZhk2HaV", "nome": "Convite - Governança Next Gen", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Fabiano", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-17", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170294", "dataConclusao": "2026-03-17T17:16:44.7677518Z"}, {"id": "plan_j3L81PCiUUG_yI", "nome": "Posts serie China", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-17", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170300", "dataConclusao": "2026-03-17T17:16:02.3117283Z"}, {"id": "plan_iqZHJv3i8kC6lU", "nome": "Live Cenário Macro", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-05", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170305", "dataConclusao": "2026-03-17T17:16:00.0956514Z"}, {"id": "plan_WKC3KG7XfkOETG", "nome": "Thumb resumo semanal", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-05", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170311", "dataConclusao": "2026-03-17T17:14:31.6635418Z"}, {"id": "plan_NR7b3WogUUakzG", "nome": "Video Itaú Summit", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170317", "dataConclusao": "2026-03-17T17:14:30.1656626Z"}, {"id": "plan_VbhJFulvWUKFm2", "nome": "Ajuste one page Private", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-17", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170322", "dataConclusao": "2026-03-17T17:14:25.9680694Z"}, {"id": "plan_yzJHC9V1nkCHSo", "nome": "Video Weath Planning", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-05", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170329", "dataConclusao": "2026-03-17T17:14:21.9421545Z"}, {"id": "plan_wxYTMI71p0i-gF", "nome": "Folder SmartInvest", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170335", "dataConclusao": "2026-03-17T17:14:19.9748338Z"}, {"id": "plan_W9h83-_tbEKaXc", "nome": "thumb international markets no youtube", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2026-03-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170341", "dataConclusao": "2026-03-17T17:14:16.320239Z"}, {"id": "plan_P4I_f_rlB0OGcL", "nome": "Thumb extra- international markets", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170347", "dataConclusao": "2025-09-12T21:50:40.5502838Z"}, {"id": "plan_2bFTZOq-VE-ws7", "nome": "Globe da semana", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-06", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170353", "dataConclusao": "2025-09-12T21:50:37.8875395Z"}, {"id": "plan_dt9Z6RycMk2-Vu", "nome": "thumb cenario macro", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170360", "dataConclusao": "2025-09-12T21:50:35.6339296Z"}, {"id": "plan_zMhA1A53Dki90h", "nome": "Convite PDF + Thumb Special", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170365", "dataConclusao": "2025-09-12T21:50:34.1129628Z"}, {"id": "plan_ljjXsLjdD0eII4", "nome": "One Page ESG", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170370", "dataConclusao": "2025-09-12T21:50:32.9132883Z"}, {"id": "plan_MtpAMEkX0UKpLK", "nome": "Thumb Tour Cluadio Tozzi", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170376", "dataConclusao": "2025-09-12T21:50:30.5959178Z"}, {"id": "plan_UJHIiQfGIkS62d", "nome": "Cortes EP01 - Private Talks", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170382", "dataConclusao": "2025-09-12T21:50:29.1757588Z"}, {"id": "plan_WbnFZeWYAE66kD", "nome": "Impressão One Pages RF, RV", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170388", "dataConclusao": "2025-09-12T21:50:24.0974693Z"}, {"id": "plan_teMWBdHTBUy1qF", "nome": "Globe da semana", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170394", "dataConclusao": "2025-09-12T21:50:18.4186117Z"}, {"id": "plan_TSnmB49o7UWqnK", "nome": "Radar ESG - Nova Identidade", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170399", "dataConclusao": "2025-09-12T21:50:15.5949325Z"}, {"id": "plan_6nRVZfqfmUeDGT", "nome": "Criação: capas e destaques novos para o Cenário Macro, Boletim Galaxy e Copom", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170405", "dataConclusao": "2025-09-12T21:50:13.4684037Z"}, {"id": "plan_q4AylvR4LUegq6", "nome": "Ajuste Layout Flyer GOAT11", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170410", "dataConclusao": "2025-09-12T21:50:12.2661809Z"}, {"id": "plan_TooUgcix5UGROh", "nome": "Áudio(Andrea) - Fundos e Destaques", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170416", "dataConclusao": "2025-09-12T21:49:49.9135874Z"}, {"id": "plan_QC6vRyhcR0md0c", "nome": "Cartas do Gestor", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170422", "dataConclusao": "2025-09-12T21:49:48.5723411Z"}, {"id": "plan_0yYdgpAFN0aGg8", "nome": "Thumb Vídeo Carteiras Administradas", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170427", "dataConclusao": "2025-09-12T21:49:47.1891034Z"}, {"id": "plan_joPZ1k3CKUuaBf", "nome": "Dicas de livro(Manduca)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-26", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170433", "dataConclusao": "2025-09-12T21:49:45.9320169Z"}, {"id": "plan_QFMW_Wr80kKWI1", "nome": "Ajustes thumbs do blog (Malu)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170438", "dataConclusao": "2025-09-12T21:49:43.6047112Z"}, {"id": "plan_HtUwOjEZ10i0zR", "nome": "Piloto Radares ESG + Beta", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170445", "dataConclusao": "2025-09-12T21:49:41.8635943Z"}, {"id": "plan_RVlwfVv5k02sp3", "nome": "\" Logo\" Visão Global - série sobre diversificação internacional", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170451", "dataConclusao": "2025-09-12T21:49:31.9530512Z"}, {"id": "plan_E5OHtW9q10iDSa", "nome": "Mercados em Foco - Cava Avatar", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170456", "dataConclusao": "2025-09-12T21:49:26.2126581Z"}, {"id": "plan_WVx41rWi10KTzc", "nome": "Projeto Blog Private - Novas imagens", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170461", "dataConclusao": "2025-09-12T21:49:17.9058372Z"}, {"id": "plan_2ymonO6AzU2ZRp", "nome": "Thumb 2 anos de youtube", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-18", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170467", "dataConclusao": "2025-09-12T21:49:15.9237564Z"}, {"id": "plan_zc0JA7dWBE-0AH", "nome": "Projeto Blog Asset - Novas Imagens", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170473", "dataConclusao": "2025-09-12T21:49:14.2789254Z"}, {"id": "plan_nVaSK-m64EmglJ", "nome": "Market Update", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170478", "dataConclusao": "2025-09-12T21:49:01.5391Z"}, {"id": "plan_czcerqyon02SOw", "nome": "One page fundos listados", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170484", "dataConclusao": "2025-09-12T21:48:59.197868Z"}, {"id": "plan_MvxKLD7BWkKcFN", "nome": "Thumb Feitosa/private bank", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-19", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170490", "dataConclusao": "2025-09-12T21:48:57.8509Z"}, {"id": "plan_47gxdq9U30GRTo", "nome": "Globe da semana", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-19", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170496", "dataConclusao": "2025-09-12T21:48:55.3063004Z"}, {"id": "plan_CO_x_2WqkkODX3", "nome": "Sócios em ação", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170502", "dataConclusao": "2025-09-12T21:48:46.6156482Z"}, {"id": "plan_Tl85PrDK0EmFyF", "nome": "thumb Milhazes", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-19", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170508", "dataConclusao": "2025-09-12T21:48:33.0153458Z"}, {"id": "plan_ryanH9sStkuu3u", "nome": "Agenda/Programação Workshop IA DGIG", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-25", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170513", "dataConclusao": "2025-09-12T21:48:29.6250666Z"}, {"id": "plan_RG1ZlrqyNkqqnO", "nome": "thumb desafio quant youtube", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170545", "dataConclusao": "2025-09-12T21:48:12.3246356Z"}, {"id": "plan_tuSKkE3YZE66mO", "nome": "Globe da semana", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-26", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170551", "dataConclusao": "2025-09-12T21:48:09.8189812Z"}, {"id": "plan_YlZxM7epQkCCbB", "nome": "post ultimos dias desafio quant", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170556", "dataConclusao": "2025-09-12T21:48:08.1568719Z"}, {"id": "plan_vuhzRdwFD0eMQs", "nome": "diagramação globe", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170564", "dataConclusao": "2025-09-12T21:48:06.2006304Z"}, {"id": "plan_0Z56ncZThU-Yys", "nome": "Wealth Planning Newsletter -Blog", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170569", "dataConclusao": "2025-09-12T21:48:02.8364357Z"}, {"id": "plan_1YhBk-3TC02WZ5", "nome": "Thumbs visão global", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170575", "dataConclusao": "2025-09-12T21:48:01.1314623Z"}, {"id": "plan_y0X8uo2WGEOOgL", "nome": "Cortes Private Talks (EP Fernanda Feitosa)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170580", "dataConclusao": "2025-09-12T21:47:44.0579833Z"}, {"id": "plan_YLrxH3zvmEKJfQ", "nome": "Thumbs visão global", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-27", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170587", "dataConclusao": "2025-09-12T21:45:35.800348Z"}, {"id": "plan_c2U0vnIicEymgX", "nome": "Wealth Planning Insights (Letterings)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170593", "dataConclusao": "2025-09-12T21:45:34.1464364Z"}, {"id": "plan_qYBhMM20EEae6d", "nome": "Vídeo Obras Fernanda Feitosa - Private Talks", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170598", "dataConclusao": "2025-09-12T21:45:31.6586323Z"}, {"id": "plan__r9-InBKCUyCnY", "nome": "Gravar Vídeo GD com Leticia", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170604", "dataConclusao": "2025-09-12T21:45:29.4242298Z"}, {"id": "plan_uIBxclO3jEKM1A", "nome": "Globe da semana", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-02", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170610", "dataConclusao": "2025-09-12T21:45:27.6289711Z"}, {"id": "plan_033ZD5QmdEuWGD", "nome": "cenario macro", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-09", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170616", "dataConclusao": "2025-09-12T21:45:25.7882535Z"}, {"id": "plan_Ld_X9LAA_0iqJL", "nome": "Corte / Thumb - Aula 1 Desafio Quant", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170622", "dataConclusao": "2025-09-12T21:45:24.1405813Z"}, {"id": "plan_raMPBf-VJUaGKX", "nome": "International markets", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170627", "dataConclusao": "2025-09-12T21:45:22.5096021Z"}, {"id": "plan_S5vwPk3fl0WwSI", "nome": "Gravar video Simulador", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170633", "dataConclusao": "2025-09-12T21:45:20.9933238Z"}, {"id": "plan_-tE64Z8-x0CLfE", "nome": "Carta Artax", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170638", "dataConclusao": "2025-09-12T21:45:19.0514451Z"}, {"id": "plan_f21geNYHN02A6Z", "nome": "Carta Aurora", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170644", "dataConclusao": "2025-09-12T21:45:17.1862322Z"}, {"id": "plan_My9hp3myDUyX-R", "nome": "Thumb/ Como nasceu a feira de arte que transformou o Brasil?", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-02", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170651", "dataConclusao": "2025-09-12T21:45:14.9470936Z"}, {"id": "plan__bqaApZWO0SDxt", "nome": "Thumb/ As obras de arte preferidas de Fernanda Feitosa, criadora da SP-Arte", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170658", "dataConclusao": "2025-09-12T21:45:13.7037151Z"}, {"id": "plan_H2zLnBbldkW-Ka", "nome": "Thumb/ O papel da SP-Arte no ecossistema global de arte", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-02", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170664", "dataConclusao": "2025-09-12T21:45:12.0870674Z"}, {"id": "plan_e02ahAFmUEmAZA", "nome": "Private Talks (EP Beatriz Milhazes) Adicionar imagens das obras", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170669", "dataConclusao": "2025-09-12T21:45:10.2621471Z"}, {"id": "plan_unag4or0UUyUnZ", "nome": "Thumb On Credit / Internacional  / Brasil -Blog/youtube", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170675", "dataConclusao": "2025-09-12T21:45:07.6072007Z"}, {"id": "plan_XQAnuO8DIkmbqA", "nome": "Thumb 3° episodio- Visão global", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170680", "dataConclusao": "2025-09-12T21:44:59.5980795Z"}, {"id": "plan_vV5JMafMTkyb0m", "nome": "Ajuste Thumb international markets", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170685", "dataConclusao": "2025-09-12T21:44:58.6649844Z"}, {"id": "plan_hPYgxDsaE0WxEY", "nome": "Cartão de visita CAS", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170690", "dataConclusao": "2025-09-12T21:44:36.7636368Z"}, {"id": "plan_jDBNKGW76US3Ao", "nome": "Pack Sócios em Ação", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170697", "dataConclusao": "2025-09-12T21:44:33.3108705Z"}, {"id": "plan_9X2Wce42CUiiZb", "nome": "Thumb visão global episodio 5", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170703", "dataConclusao": "2025-09-12T21:44:30.586004Z"}, {"id": "plan_qfmETQwIUE2KZ7", "nome": "Decisões do Comitê", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170717", "dataConclusao": "2025-09-12T21:44:29.473504Z"}, {"id": "plan_arKM9DYhS0WneJ", "nome": "Live desafio quant", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-10", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170723", "dataConclusao": "2025-09-12T21:44:26.925759Z"}, {"id": "plan_-V7zsp7tKkW5hp", "nome": "Globe da semana", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-10", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170728", "dataConclusao": "2025-09-12T21:44:24.3576112Z"}, {"id": "plan_0bWQrzWtp0edSe", "nome": "Revisão Apresentação GOAT11", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-08", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170735", "dataConclusao": "2025-09-12T21:44:22.2820059Z"}, {"id": "plan_CbHu_v-E60eOfk", "nome": "Live desafio Quant", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-19", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170740", "dataConclusao": "2025-09-12T21:44:17.9230909Z"}, {"id": "plan_OirxYgYl4EeK4k", "nome": "Thumb cenario macro", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170746", "dataConclusao": "2025-09-12T21:44:16.0865844Z"}, {"id": "plan_YYxX6SP53EmLRB", "nome": "Ajuste thumb, wealph planning newsletter", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170751", "dataConclusao": "2025-09-12T21:44:10.742888Z"}, {"id": "plan_775U_ew7lkmlYg", "nome": "Corte cenario macro", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Pabu", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170758", "dataConclusao": "2025-09-12T21:44:08.3139801Z"}, {"id": "plan_hzEwQorYLkWexV", "nome": "Carta Optimus - Set 25", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Fabiano", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170764", "dataConclusao": "2025-09-12T20:41:15.2101165Z"}, {"id": "plan_C4x8zAG1v0uCaN", "nome": "Post com equipe", "segmento": "Banco de Ideias", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-05", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Banco de Ideias · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170770", "dataConclusao": "2025-09-05T13:48:54.9733507Z"}, {"id": "plan_8eZyPslU0Umsi7", "nome": "Site: Newsletter", "segmento": "Asset", "tipo": "Design", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2020-05-07", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Site · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170776", "dataConclusao": "2025-09-05T12:11:39.5921568Z"}, {"id": "plan_4xAT8DSzSUKwF5", "nome": "One Page GDRF Institucionais", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170782", "dataConclusao": "2025-09-01T18:20:06.9279988Z"}, {"id": "plan_Fbzvj1nFkU2Hlh", "nome": "Boletim Redesign", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170787", "dataConclusao": "2025-09-01T18:20:00.2881525Z"}, {"id": "plan_JKzKk6Omm0qCC3", "nome": "Thumb Análise mensal/Fechamento do mês -Blog/youtube", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170792", "dataConclusao": "2025-09-01T18:19:58.4738484Z"}, {"id": "plan_0m9MIdKM6kiVwy", "nome": "Thumb ecisões do Comitê de Investimentos -blog/youtube", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-09-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170798", "dataConclusao": "2025-09-01T18:19:57.2968719Z"}, {"id": "plan_EV8EhSu6KkaM1J", "nome": "thumbs saiu na midia", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-21", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170803", "dataConclusao": "2025-08-25T18:11:21.2092167Z"}, {"id": "plan_u0wyx3FKsU2Yh3", "nome": "Desafio Quant AI (arte para as ligas)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-21", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170809", "dataConclusao": "2025-08-25T18:11:18.5527885Z"}, {"id": "plan_-kL9OUmZ_0K1jz", "nome": "seleção de imagens para os radares ESG, Beta e Pílula de ETFs (geral)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-18", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170815", "dataConclusao": "2025-08-18T17:53:25.0911752Z"}, {"id": "plan_O9fxSRbxm0uaX1", "nome": "EP02 - Private Talks", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-18", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170820", "dataConclusao": "2025-08-18T17:53:21.8962271Z"}, {"id": "plan_Tk9Bq5UdLk-aAJ", "nome": "Post do dia é o Um Dia com Vanessa Muller", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-18", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170827", "dataConclusao": "2025-08-18T17:53:19.6079457Z"}, {"id": "plan_PvVx36nuckKeD7", "nome": "GOAT11 (Material do Caique)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-18", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170832", "dataConclusao": "2025-08-18T17:53:16.8081035Z"}, {"id": "plan_XHMUty-vo0K926", "nome": "Áudio - Fechamento do mês", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170837", "dataConclusao": "2025-08-11T17:10:46.5115047Z"}, {"id": "plan_5AszbAOoV0GVJp", "nome": "Thumb International Markets", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170842", "dataConclusao": "2025-08-11T17:10:36.8631039Z"}, {"id": "plan_TBCjoLN7p0md9a", "nome": "PPT CC", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170848", "dataConclusao": "2025-08-11T17:10:33.4993637Z"}, {"id": "plan_MSC1HJvIzkuGlj", "nome": "WP Insights", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170854", "dataConclusao": "2025-08-04T17:00:03.862888Z"}, {"id": "plan_A53IXlSVsEun6Q", "nome": "Ring the Bell", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-07-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170859", "dataConclusao": "2025-08-04T16:51:07.912101Z"}, {"id": "plan_-XE0I4FLGEqPXu", "nome": "Thumb Intl Mkts", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170864", "dataConclusao": "2025-08-04T16:51:03.1069472Z"}, {"id": "plan_LbwFQclXVUixhX", "nome": "capa pro blog da live de Cenário Macro", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-07-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170871", "dataConclusao": "2025-08-04T16:51:00.7503682Z"}, {"id": "plan_6y38A0EfvUK8YM", "nome": "Carta Janeiro", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170877", "dataConclusao": "2025-08-04T16:50:58.2365778Z"}, {"id": "plan_ZbGfAYT9GEiVeW", "nome": "Áudio destaques offshore", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170883", "dataConclusao": "2025-08-04T16:50:51.4236788Z"}, {"id": "plan_QOQ9gN0MXkS1by", "nome": "Thumb 1a temporada Private Talks - Email", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170888", "dataConclusao": "2025-08-04T16:50:47.6049143Z"}, {"id": "plan_Bj7YiNb71U2EAj", "nome": "thumbs_wealth Planing", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Fabiano", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170893", "dataConclusao": "2025-08-04T16:50:45.577689Z"}, {"id": "plan_kEgJM8ZDnEqhaL", "nome": "Cenario macro thumbs", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170898", "dataConclusao": "2025-08-04T16:50:43.3623818Z"}, {"id": "plan_nrP5Filye0yXTD", "nome": "mapa Expert", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-07-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170904", "dataConclusao": "2025-08-04T16:50:15.4241273Z"}, {"id": "plan_Qynin4pmu0G9LI", "nome": "Apresentação agro", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-07-07", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170910", "dataConclusao": "2025-08-04T16:50:13.2374752Z"}, {"id": "plan_2_AIxkYvZkOvj6", "nome": "dicas de leitura", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-07-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170916", "dataConclusao": "2025-08-04T16:50:12.110547Z"}, {"id": "plan_QaztxD4sUkaeH0", "nome": "Post Globe", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Karol", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-07-16", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170922", "dataConclusao": "2025-08-04T16:50:10.9757547Z"}, {"id": "plan_2-A8T-fsckeoO9", "nome": "Globe dea semana", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-07-10", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170928", "dataConclusao": "2025-08-04T16:50:09.6804948Z"}, {"id": "plan_kCqNMoRuD0ytxy", "nome": "radar Esg, Radar Beta e pilula de ETF- capas para blog", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170933", "dataConclusao": "2025-08-04T16:50:08.0216573Z"}, {"id": "plan_bOEucaydvkO50j", "nome": "Agenda palestrantes Expert", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170940", "dataConclusao": "2025-08-04T16:50:05.7829184Z"}, {"id": "plan_avMXFPIjTUCLiu", "nome": "Tenis vesting", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-07-17", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170946", "dataConclusao": "2025-08-04T16:50:01.7155535Z"}, {"id": "plan_kwaYNJLVhEiT1E", "nome": "Arte lona Expert", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2025-08-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170951", "dataConclusao": "2025-08-04T16:50:00.261072Z"}, {"id": "plan_LJ7nN3Q_v06axF", "nome": "Imagem Blog - áudio Alejandro", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170957", "dataConclusao": "2024-11-11T14:07:00.5984711Z"}, {"id": "plan_WO2z6n-p-EeTaD", "nome": "Market Update", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-08", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170963", "dataConclusao": "2024-11-11T14:06:59.2876729Z"}, {"id": "plan_qTdnrZv4SkOXL9", "nome": "Convite Michaael Saylor", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170968", "dataConclusao": "2024-11-11T14:06:58.0852523Z"}, {"id": "plan_Zz7fC52MGkS_I0", "nome": "Pack Imagens e-mail Private", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170974", "dataConclusao": "2024-11-11T14:06:55.9903336Z"}, {"id": "plan_v9l2CCEFM0CUX6", "nome": "Material Publicitário DIVD", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170979", "dataConclusao": "2024-11-11T14:06:53.5601554Z"}, {"id": "plan_hJ3LZUxaDkCuxk", "nome": "Gemba", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-24", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170985", "dataConclusao": "2024-11-11T14:06:51.8184244Z"}, {"id": "plan_Gl3_ty6KnkS9Ak", "nome": "ICRI11 | Relatório Parcial", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170990", "dataConclusao": "2024-11-11T14:06:49.798092Z"}, {"id": "plan_Zpfy0i0hPE-zYD", "nome": "Weekly Globe", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-18", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.170999", "dataConclusao": "2024-11-11T14:06:48.5585527Z"}, {"id": "plan_SepDRIvwCUWmBU", "nome": "Post Dicas de Livros", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171005", "dataConclusao": "2024-11-11T14:06:47.2590921Z"}, {"id": "plan_kGphidPXI02cTW", "nome": "Apresentação GenAi Zucco", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-17", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171011", "dataConclusao": "2024-11-11T14:06:45.6122955Z"}, {"id": "plan_s8ytiX9OkU2Pqz", "nome": "Flyer - Active Fix ESG", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171016", "dataConclusao": "2024-11-11T14:06:42.5839964Z"}, {"id": "plan_hvj-jrziGkOLEX", "nome": "Vídeo Vanessa e Ricardinho Pvt", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171021", "dataConclusao": "2024-11-11T14:06:41.1105097Z"}, {"id": "plan_clJ6P2-MCE6vli", "nome": "Peças WhatsApp Asset", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-24", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171028", "dataConclusao": "2024-11-11T14:06:38.5089992Z"}, {"id": "plan_LfDkyEUYX0O6rE", "nome": "Atualização Apresentação Institucional Asset", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171033", "dataConclusao": "2024-11-11T14:06:35.0565002Z"}, {"id": "plan_dy8PdwrZC0SVrO", "nome": "pack de Market Update", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-08", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171039", "dataConclusao": "2024-11-11T14:06:12.2319678Z"}, {"id": "plan_3Ri3GWxxh0u9o_", "nome": "Vídeo Camilla - Mulheres", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171044", "dataConclusao": "2024-11-11T14:06:04.9122015Z"}, {"id": "plan_ZzG4I-o8IU2pPV", "nome": "Áudio Rodrigo Lopes", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-06", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171050", "dataConclusao": "2024-11-11T14:06:02.6728957Z"}, {"id": "plan_eJqoakoEBEOdbC", "nome": "Selo 20 anos ETF", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171056", "dataConclusao": "2024-11-11T14:06:00.589243Z"}, {"id": "plan_lRaaFQwMPkCTxp", "nome": "Finance Academy - Convite", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171062", "dataConclusao": "2024-11-11T14:05:57.4095299Z"}, {"id": "plan_OCBkQoalQEK1Yv", "nome": "Vídeo Shibata - Mulheres", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171067", "dataConclusao": "2024-11-11T14:05:53.3902159Z"}, {"id": "plan_s585-3o_akCgP8", "nome": "Carta do Gestor- Artax", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171072", "dataConclusao": "2024-11-11T14:05:49.9540211Z"}, {"id": "plan_N9Auj7h6ukCFfL", "nome": "Carta do Gestor - Optimus", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171079", "dataConclusao": "2024-11-11T14:05:46.0511595Z"}, {"id": "plan_lPvaNSYX9kyAX7", "nome": "Post Whats", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-24", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171085", "dataConclusao": "2024-11-11T14:05:37.0329996Z"}, {"id": "plan_Htu6XjIc_kqvIQ", "nome": "IAM ETFs (Luiz Gustavo)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171090", "dataConclusao": "2024-11-11T14:05:34.5525555Z"}, {"id": "plan_xsPNfu2eT0iOxU", "nome": "Video Wealth Planning - Abril", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-25", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171096", "dataConclusao": "2024-11-11T14:05:33.5810642Z"}, {"id": "plan_DuDt-8LxQkmanq", "nome": "Post Selo 20 anos ETFs", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-22", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171102", "dataConclusao": "2024-11-11T14:05:14.0242548Z"}, {"id": "plan_2mMlmEMji0qvST", "nome": "Material da Cyrela (Equities Data Teams - EDT)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-23", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171107", "dataConclusao": "2024-11-11T14:05:04.9377183Z"}, {"id": "plan_Clhu1jQW00mhKk", "nome": "RMR - Asset", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-29", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171114", "dataConclusao": "2024-11-11T14:04:56.5547339Z"}, {"id": "plan_u-13Q3uFzEimur", "nome": "Material B3", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-05-02", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171121", "dataConclusao": "2024-11-11T14:04:53.9062969Z"}, {"id": "plan_dCnw6qVJoUi1M8", "nome": "banner e-mail agenda da semana - lives", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171126", "dataConclusao": "2024-11-11T14:04:49.4067491Z"}, {"id": "plan_L9qBZKxAFkuvDq", "nome": "Planning RTA", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-05-02", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171132", "dataConclusao": "2024-11-11T14:04:45.3129316Z"}, {"id": "plan_d-XfeR-eVEakm9", "nome": "Dicas de Leitura", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-05-10", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171138", "dataConclusao": "2024-11-11T14:04:29.9805642Z"}, {"id": "plan_TFDP3-uxFkaroC", "nome": "One Page Active ESG", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171143", "dataConclusao": "2024-11-11T14:04:23.2644027Z"}, {"id": "plan_wNhUuXbbnU6qcu", "nome": "Imagem do Focus - Ppt editável", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171148", "dataConclusao": "2024-11-11T14:04:19.3965585Z"}, {"id": "plan_jrlTznC6pE-MQJ", "nome": "Plaquinha QR Code Whats Private", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171154", "dataConclusao": "2024-11-11T14:04:17.0205509Z"}, {"id": "plan_DQOb8rUfXkqKQY", "nome": "Grade Itnow (Matheus)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-05-22", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171159", "dataConclusao": "2024-11-11T13:58:20.6471887Z"}, {"id": "plan_uUwn3MegekGZ9_", "nome": "Template Private Bank - Nova id visual", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171164", "dataConclusao": "2024-11-11T13:58:19.019079Z"}, {"id": "plan_5kWISktUCkir1Y", "nome": "Credito Estruturado - Carteira (Jair)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171170", "dataConclusao": "2024-11-11T13:58:16.8539831Z"}, {"id": "plan_WAr4vAotZkiP9B", "nome": "Banner Selo e-mail de destaques", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171176", "dataConclusao": "2024-11-11T13:58:12.7498295Z"}, {"id": "plan_SX2AsnYamE6ioV", "nome": "Itaú Asset - Insurance Conference 2024", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-11-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171181", "dataConclusao": "2024-11-11T13:58:10.4158232Z"}, {"id": "plan_GfM5-wh2MEC2Or", "nome": "Apresentação Hunter", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-10", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171187", "dataConclusao": "2024-11-11T13:58:07.9002782Z"}, {"id": "plan_VqtYmQvON0an3y", "nome": "Apresentação Asgard", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171193", "dataConclusao": "2024-11-11T13:58:04.6424129Z"}, {"id": "plan_KdI-7ggq9UKfAj", "nome": "Cronograma - Finance Academy Arte", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-20", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171199", "dataConclusao": "2024-04-10T15:02:30.7418846Z"}, {"id": "plan_gEhjnnajBUucIr", "nome": "Ajuste Selo 20 anos de ETFs", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-21", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171204", "dataConclusao": "2024-04-10T15:02:16.3886962Z"}, {"id": "plan_iBu9R-V4JEG2tM", "nome": "Vídeo - Finance Academy Mulheres", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-26", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171211", "dataConclusao": "2024-04-10T15:02:13.9366212Z"}, {"id": "plan_sewFGW3zrEGyiX", "nome": "Post 100 vídeo YouTube", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-05", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171217", "dataConclusao": "2024-04-10T15:02:01.0066404Z"}, {"id": "plan_80fisp8B4EOftV", "nome": "Carta Janeiro (template)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171223", "dataConclusao": "2024-04-10T15:01:56.2252208Z"}, {"id": "plan_brfpxGIuR0C6fN", "nome": "Vídeo Finance Economia da Arte", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-10", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171229", "dataConclusao": "2024-04-10T14:58:04.8768033Z"}, {"id": "plan_yxjZdQR8hUCAjZ", "nome": "Banners Expert - Janeiro", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171235", "dataConclusao": "2024-04-10T14:58:02.9547495Z"}, {"id": "plan_DutjqEyNnEG3TL", "nome": "Thumb Tech Trends", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-10", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171240", "dataConclusao": "2024-04-10T14:58:01.4589172Z"}, {"id": "plan_56egGRrPG0WRz7", "nome": "Thumb International Markets", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-10", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171245", "dataConclusao": "2024-04-10T14:57:59.4030133Z"}, {"id": "plan_CINl-fwAOUSy45", "nome": "Carta RK Credit - Semestral", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171251", "dataConclusao": "2024-03-04T10:57:39.1427074Z"}, {"id": "plan_aoIEANspc02BJ3", "nome": "Carta Algarve - Semestral", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171256", "dataConclusao": "2024-03-04T10:57:35.8901097Z"}, {"id": "plan_uWt1cISxZk-5n4", "nome": "Book de Prospecção - Pvt - Ana Beatriz Bernardi Tavares", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171261", "dataConclusao": "2024-03-01T15:09:20.4977146Z"}, {"id": "plan_dFUASnJOCEKyyE", "nome": "One page Lumina Plus", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171266", "dataConclusao": "2024-03-01T15:09:16.8367159Z"}, {"id": "plan_KEw3G8RdjUeftp", "nome": "Apresentação Familia Smart Beta (Luiz)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-02-09", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171272", "dataConclusao": "2024-03-01T15:09:14.4947954Z"}, {"id": "plan_VTuVfEn-kUiToL", "nome": "Lançamento Blog Internacional", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171277", "dataConclusao": "2024-03-01T15:09:12.2134831Z"}, {"id": "plan_2Q9a1YxbEk-Sws", "nome": "Vídeo Wealth PLanning (Will)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-01-30", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171287", "dataConclusao": "2024-03-01T15:09:10.5259477Z"}, {"id": "plan_3BSWjKl7Qkej0A", "nome": "Folder Summit BTG 2024", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-02-02", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171292", "dataConclusao": "2024-03-01T15:09:09.0444599Z"}, {"id": "plan_PK7z97-Wh06XSI", "nome": "Cenário Macro - Itaú Private", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171298", "dataConclusao": "2024-03-01T15:09:06.7541472Z"}, {"id": "plan_jybbAJRxyES1Xk", "nome": "Manual DCBE 2024", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-02-19", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171305", "dataConclusao": "2024-03-01T15:09:04.2944049Z"}, {"id": "plan_OXQsZTMCHEKEP1", "nome": "Vídeo IMP3 2024", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171310", "dataConclusao": "2024-03-01T15:09:02.4925669Z"}, {"id": "plan_CSFPTj5_MUGiPg", "nome": "Post Dicas de leitura - Private", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-02-26", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171316", "dataConclusao": "2024-03-01T15:09:00.6662513Z"}, {"id": "plan_BABbuxRNYEeFzb", "nome": "Home Broker -  Itop - UI Changes", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171321", "dataConclusao": "2024-03-01T15:08:59.1937029Z"}, {"id": "plan_0kiAcggaIEqXu9", "nome": "Corte Live Private", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171326", "dataConclusao": "2024-03-01T15:08:57.6643049Z"}, {"id": "plan_DoV6fTuGh0yTqu", "nome": "Atualização de Quantidade de Clientes Asset", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 15, "dataInicio": "2021-05-31", "dataEntrega": "2021-06-15", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Geral · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171332", "dataConclusao": "2024-03-01T12:30:37.4880432Z"}, {"id": "plan_kqYUpbVAQkqG5a", "nome": "Podcasts do mes", "segmento": "Asset", "tipo": "Social Media", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-30", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Telegram · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171338", "dataConclusao": "2024-03-01T12:30:31.9153107Z"}, {"id": "plan_MEGjpA_jsUOhnK", "nome": "Post Escritório / equipe", "segmento": "Asset", "tipo": "Social Media", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Instagram · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171345", "dataConclusao": "2024-03-01T12:30:26.0245532Z"}, {"id": "plan_62Ej0uFbREqua1", "nome": "Post Hidrôgenio", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-30", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171350", "dataConclusao": "2024-03-01T12:30:19.9619005Z"}, {"id": "plan_OUVrHvy4y0OH0F", "nome": "Post BITI11", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171356", "dataConclusao": "2024-03-01T12:30:16.0399376Z"}, {"id": "plan_rszgLX7E90qY-m", "nome": "Post Weekly Globe - \"Quote\" - Só Port.", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-02-21", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171362", "dataConclusao": "2024-02-22T12:19:46.3829366Z"}, {"id": "plan_TgsDKuZgk0up8U", "nome": "Motion Pedra + Private - Internacional", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-02-19", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171367", "dataConclusao": "2024-02-19T14:07:00.1306729Z"}, {"id": "plan_Hueg_F-Zl0ubJl", "nome": "Apresentação Private - Estrutura e Veículos", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-02-19", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171372", "dataConclusao": "2024-02-19T14:06:55.224679Z"}, {"id": "plan_RZwCle9N8kCDya", "nome": "apresentação CDI RF (Geson)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-02-14", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171377", "dataConclusao": "2024-02-14T20:45:30.6594858Z"}, {"id": "plan_ZhwitegcBkCFNX", "nome": "IFRI11 (Jair)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-02-02", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171384", "dataConclusao": "2024-02-07T12:56:26.5542031Z"}, {"id": "plan_WKdwPqhWj0Gksh", "nome": "One page Conteúdos Private ppt", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-02-05", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171389", "dataConclusao": "2024-02-05T12:47:34.662596Z"}, {"id": "plan_wMOnsvwkSkW5wT", "nome": "Revisão Paginas Itnow", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-02-05", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171396", "dataConclusao": "2024-02-05T12:47:04.068211Z"}, {"id": "plan_T7xkUzrQYky5-f", "nome": "Header e-mail (whats) Renato", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-01-29", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171403", "dataConclusao": "2024-02-05T12:46:54.6787114Z"}, {"id": "plan_ufco_jEIzk21g6", "nome": "slide Whats RMR Private - adicionar QR Code", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-01-29", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171409", "dataConclusao": "2024-01-29T14:38:22.0425408Z"}, {"id": "plan_wRV0N_d8dkOL-S", "nome": "Camiseta ICRI11", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-01-22", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171414", "dataConclusao": "2024-01-29T14:38:15.1782711Z"}, {"id": "plan_o_47i0YNmU6gZ8", "nome": "Slides Time Crédito - Fayga", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-01-22", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171420", "dataConclusao": "2024-01-22T12:18:14.0456137Z"}, {"id": "plan_mpNtgMyl502Ciq", "nome": "Apresentação Algarve II", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-01-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171425", "dataConclusao": "2024-01-17T14:01:25.1132828Z"}, {"id": "plan_227yFp9oi0C6yd", "nome": "Post Dicas de livros - Rodrigo Ribeiro", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-01-17", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171430", "dataConclusao": "2024-01-17T12:50:11.1397767Z"}, {"id": "plan_i2V_g9e1Cky49f", "nome": "Carta do Gestor Artax", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-01-11", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171436", "dataConclusao": "2024-01-11T19:36:02.1496522Z"}, {"id": "plan_ev73Hc6J9keCIv", "nome": "Carta do Gestor Artax", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-06-04", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171441", "dataConclusao": "2024-01-11T19:35:50.8191493Z"}, {"id": "plan_hCyXI77XGUGITs", "nome": "Trailer Pvt", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-01-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171446", "dataConclusao": "2024-01-11T19:35:46.9711992Z"}, {"id": "plan_Q0qy8moo70q_Fl", "nome": "ITRI - Jair", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-01-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171451", "dataConclusao": "2024-01-11T19:35:43.5652264Z"}, {"id": "plan_Xb_T1XvZfk2_0m", "nome": "Carta do Gestor Optimus", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-01-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171458", "dataConclusao": "2024-01-11T19:35:40.9767569Z"}, {"id": "plan_awricDeIkECDIg", "nome": "Carta do Gestor Artax", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-05-04", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171463", "dataConclusao": "2024-01-11T19:35:35.1746358Z"}, {"id": "plan_tczMLkqFp0OIAo", "nome": "Carta do Gestor Artax", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-04-04", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171469", "dataConclusao": "2024-01-11T19:35:31.2888899Z"}, {"id": "plan_3BMXxByohE27pc", "nome": "Carta do Gestor Artax", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-03-04", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171475", "dataConclusao": "2024-01-11T19:35:28.252239Z"}, {"id": "plan_hHOG3bv1AUKdZW", "nome": "Carta do Gestor Artax", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-02-04", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171482", "dataConclusao": "2024-01-11T19:35:24.99144Z"}, {"id": "plan_piIAqRBfPkKDSy", "nome": "Carta do Gestor Artax Ultra", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-01-04", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171488", "dataConclusao": "2024-01-11T19:35:24.1322965Z"}, {"id": "plan_2dQ4kg3lu0Cnsn", "nome": "Carta do Gestor Artax", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2024-01-04", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Concluído · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171493", "dataConclusao": "2024-01-11T19:35:22.9604666Z"}, {"id": "plan_c6tQrKu7b0KqfM", "nome": "Guia de ETFs", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-16", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171499", "dataConclusao": "2022-09-20T13:15:31.0361049Z"}, {"id": "plan_JUIwL1frJEmsBR", "nome": "Moldura Vídeo Private", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-20", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171505", "dataConclusao": "2022-09-20T13:10:59.5173829Z"}, {"id": "plan_98_rWMURR0Ojhz", "nome": "Proposta Fundo Exclusivo (Marilia)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-21", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171510", "dataConclusao": "2022-09-20T13:10:35.7716415Z"}, {"id": "plan_k0l1uEA2YUKFXX", "nome": "Grade Distribuidores", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-08", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171535", "dataConclusao": "2022-09-19T13:55:14.6695503Z"}, {"id": "plan_SF4TsPu0-kWHQI", "nome": "Apresentação FLHY (Gerson)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-19", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171541", "dataConclusao": "2022-09-19T13:04:52.0709579Z"}, {"id": "plan_BJn-FYFrNky7hV", "nome": "Cartas de gestão", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-13", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171547", "dataConclusao": "2022-09-16T18:42:53.8632034Z"}, {"id": "plan_NiZmp7mAqkC2u1", "nome": "Inflation Strategy - Inflação Multiestratégia", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-08", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171553", "dataConclusao": "2022-09-16T14:48:56.1798742Z"}, {"id": "plan_kY4TmmZgv0WDmz", "nome": "Carta Sniper", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-13", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171559", "dataConclusao": "2022-09-16T14:48:43.2509481Z"}, {"id": "plan_lUTKwJlPYESEK0", "nome": "Post dia do Cliente", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-15", "status": "Concluída", "prioridade": "Urgente", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171565", "dataConclusao": "2022-09-15T21:48:08.5066326Z"}, {"id": "plan_bSZXPj6AuEKMNh", "nome": "Live Cenário Macro", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-15", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171571", "dataConclusao": "2022-09-15T12:26:20.6371635Z"}, {"id": "plan_JY_Qc6dxV0mh0x", "nome": "Video Morgado", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-14", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171577", "dataConclusao": "2022-09-15T12:26:17.2676608Z"}, {"id": "plan_m25OdTFa0kilMy", "nome": "Vídeo Destaques de Mercado - Morgado", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-13", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171582", "dataConclusao": "2022-09-14T22:16:32.4790856Z"}, {"id": "plan_4P78XSX5a0iiwZ", "nome": "Landing Page", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-13", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171588", "dataConclusao": "2022-09-14T22:16:30.018246Z"}, {"id": "plan_mDjlicLeMkm7AG", "nome": "Post Dicas de Leitura", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-14", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171598", "dataConclusao": "2022-09-14T22:16:20.9632071Z"}, {"id": "plan_bOQGKDCNw0ugMQ", "nome": "Kit Redes sociais", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-13", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171603", "dataConclusao": "2022-09-13T14:51:51.5538268Z"}, {"id": "plan_6NcK4k-R80ClFM", "nome": "Ativos Nossa Equipe", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2022-09-12", "dataEntrega": "2022-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171609", "dataConclusao": "2022-09-13T12:54:24.5361313Z"}, {"id": "plan_xU8tlr7ko0uTMS", "nome": "Vídeo Plataformas", "segmento": "Banco de Ideias", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-13", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Banco de Ideias · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171615", "dataConclusao": "2022-09-13T10:46:13.2219658Z"}, {"id": "plan_3GuS48rhXUyyip", "nome": "Slide de escopos Mkt, Comunicação , Equipe Estratégia PVT", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171620", "dataConclusao": "2022-09-12T14:09:10.4440573Z"}, {"id": "plan_HL0dvfrqI0GU96", "nome": "Carta do Gestor - Optimus", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-08", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171626", "dataConclusao": "2022-09-12T13:55:52.9142033Z"}, {"id": "plan_ZPf3TdwAA0qm9A", "nome": "Apresentação GD íon", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-09", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171631", "dataConclusao": "2022-09-12T12:55:13.3809004Z"}, {"id": "plan_hBh82GEfDkaNoa", "nome": "Atualizar Guia dos ETFs", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-09", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171637", "dataConclusao": "2022-09-09T20:50:39.3458478Z"}, {"id": "plan_yCNl_ClLr0Wlj3", "nome": "Figma página Preferencias", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-08", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171642", "dataConclusao": "2022-09-08T11:47:05.163713Z"}, {"id": "plan_Tz9oWzGm-ke2bR", "nome": "Invite Imersão Itaú Asset", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-08", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171647", "dataConclusao": "2022-09-08T11:45:50.0221382Z"}, {"id": "plan_46eGLzr-MkOo68", "nome": "Proposta Comercial (Zanchetta) Nova Identidade", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-06", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171654", "dataConclusao": "2022-09-06T13:41:16.6620278Z"}, {"id": "plan_0R_SZuk8z0mqb-", "nome": "Dia do blog", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171660", "dataConclusao": "2022-09-05T13:38:37.7310342Z"}, {"id": "plan_LJ_pQN3kbkypFA", "nome": "Plano de fundo Teams - RMR", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-02", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171666", "dataConclusao": "2022-09-02T20:04:51.1866182Z"}, {"id": "plan_wy0GQ1OVeUiXmi", "nome": "Relatório RURA11 - Nova Id", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-25", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171671", "dataConclusao": "2022-09-02T16:03:06.8338678Z"}, {"id": "plan_t3iAhDPwVkeyMj", "nome": "Portal de Comunicação", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-25", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171677", "dataConclusao": "2022-09-02T15:45:14.891584Z"}, {"id": "plan_VbvqTIu8e0iOZs", "nome": "Mind Asset: Perspectivas para renda fixa com Fernanda Lattari", "segmento": "Asset", "tipo": "Vídeo", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-30", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Podcast · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171684", "dataConclusao": "2022-09-02T12:17:18.7027006Z"}, {"id": "plan_k3oSEwIpVEW8X_", "nome": "Dividendos RURA11 e IFRA11", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-31", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171689", "dataConclusao": "2022-09-02T12:17:13.1379287Z"}, {"id": "plan_o2i_KwoeY0ujkS", "nome": "Índices e Mercado", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-09-02", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171695", "dataConclusao": "2022-09-02T12:09:30.9931317Z"}, {"id": "plan__xmkjqGCBUGUaJ", "nome": "ITAÚ ALGARVE - Apresentação", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-31", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171700", "dataConclusao": "2022-09-01T19:13:08.7298479Z"}, {"id": "plan_NApcQbwvskO-AM", "nome": "Fundos de crédito em plataformas", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-26", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171706", "dataConclusao": "2022-08-31T19:19:48.3643082Z"}, {"id": "plan_nZ3gKHC6QE-aPL", "nome": "Mind Asset com Fernanda Lattari", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-30", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171713", "dataConclusao": "2022-08-31T19:19:47.1812157Z"}, {"id": "plan_BFKROFjkhEG8TG", "nome": "Relatorio Proxy Voting", "segmento": "Asset", "tipo": "Design", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 322, "dataInicio": "2021-10-13", "dataEntrega": "2022-08-31", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Site · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171719", "dataConclusao": "2022-08-31T18:42:48.1083429Z"}, {"id": "plan_T6oOtLwDEUS0I8", "nome": "Portal Itaú Asset \"Comunica\"", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-31", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Geral · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171724", "dataConclusao": "2022-08-31T18:42:46.8114411Z"}, {"id": "plan_Yk749dOj8kKsGI", "nome": "Podcast com Andrea - a Comunicação da Itaú Asset", "segmento": "Banco de Ideias", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-31", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Banco de Ideias · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171729", "dataConclusao": "2022-08-31T18:42:45.8822489Z"}, {"id": "plan_25N9BAKs7ESk-M", "nome": "E-mails + Peças de ativação HTML", "segmento": "Asset", "tipo": "E-mail Marketing", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-31", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: EMAILS · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171735", "dataConclusao": "2022-08-31T18:42:45.3222746Z"}, {"id": "plan_KmQOPBKVbkGCu3", "nome": "Mind Asset: Papo de time com Stefano", "segmento": "Asset", "tipo": "Vídeo", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-23", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Podcast · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171740", "dataConclusao": "2022-08-30T13:49:28.1115107Z"}, {"id": "plan_JzpA00bFwki0XX", "nome": "RMR Apresentação nova id", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-25", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171746", "dataConclusao": "2022-08-30T13:16:57.1876517Z"}, {"id": "plan_n_zTLvTFpU2_Cb", "nome": "Post 100 bi", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-25", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171752", "dataConclusao": "2022-08-30T13:16:54.9348222Z"}, {"id": "plan_PdJrco27KUWUsV", "nome": "Mockups - RMR", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-29", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171757", "dataConclusao": "2022-08-30T13:15:31.9007189Z"}, {"id": "plan_q70X9sTbjUaa_e", "nome": "Slide Portal - RMR", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-29", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171763", "dataConclusao": "2022-08-30T13:15:29.8299192Z"}, {"id": "plan_frdJxIWMTUG3zz", "nome": "IFRA11 LinkedIn", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-30", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171769", "dataConclusao": "2022-08-30T13:08:03.8397705Z"}, {"id": "plan_DcLdcq8RG06Xzt", "nome": "PDC", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-29", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171776", "dataConclusao": "2022-08-29T17:36:00.8310628Z"}, {"id": "plan_oVuiSC85I0yQwr", "nome": "100 Bi Multimesas", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-25", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171782", "dataConclusao": "2022-08-29T13:18:15.3893545Z"}, {"id": "plan_0u_sSkJHJkmmJR", "nome": "IFRA11: Oferta Post#3", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-24", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171788", "dataConclusao": "2022-08-25T11:31:40.3671787Z"}, {"id": "plan_Zfy2dFL3REyaZ7", "nome": "Mind Asset com Stefano", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-23", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171793", "dataConclusao": "2022-08-25T11:31:29.5020062Z"}, {"id": "plan_HwIQLZaBpUC-zU", "nome": "Vídeo Optimus Reels", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-24", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171799", "dataConclusao": "2022-08-25T11:27:34.6773906Z"}, {"id": "plan_o4FKDJ3vEk-dQl", "nome": "Itaú Flexprev Inflation Equity Opportunities", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-19", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171805", "dataConclusao": "2022-08-25T11:26:30.7517681Z"}, {"id": "plan_TezhF_oRXEqWOP", "nome": "Flyers Layout novo", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-24", "status": "Concluída", "prioridade": "Urgente", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171810", "dataConclusao": "2022-08-25T11:26:08.8285947Z"}, {"id": "plan_mv2rB57p_UGFgH", "nome": "Apresentação CGN", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-23", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171816", "dataConclusao": "2022-08-25T11:24:36.6216936Z"}, {"id": "plan_rLvo3e-TX0mKDG", "nome": "Post Finance Academy Agosto/22", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-24", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171822", "dataConclusao": "2022-08-25T11:24:32.4479605Z"}, {"id": "plan_0NKxRl3oFkKg0y", "nome": "e-mail 100 Bi", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-16", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171829", "dataConclusao": "2022-08-22T14:49:11.0686077Z"}, {"id": "plan_KgbiNu_WqEqJVa", "nome": "Atualizar Org Economia", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-22", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171836", "dataConclusao": "2022-08-22T14:49:02.5554428Z"}, {"id": "plan_t-1SSLZ3U0uvw7", "nome": "Post Escritório de Zurich", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-17", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171842", "dataConclusao": "2022-08-19T17:18:30.5519827Z"}, {"id": "plan_5qVy9IisqEGOUG", "nome": "PDC e-mail Nova Id", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-17", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171848", "dataConclusao": "2022-08-19T17:15:57.7823287Z"}, {"id": "plan_3qWzAcDXH02QK7", "nome": "Apresentação Optimus Long Bias", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-16", "status": "Concluída", "prioridade": "Urgente", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171853", "dataConclusao": "2022-08-19T17:15:52.9132561Z"}, {"id": "plan_Na1aGZBdkUCjh_", "nome": "IFRA11: Post 2", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-18", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171859", "dataConclusao": "2022-08-19T12:57:46.4826019Z"}, {"id": "plan_8qVAOFJ9NUK7MS", "nome": "Vídeo Optimus Leticia", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-16", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171865", "dataConclusao": "2022-08-18T21:46:15.1756895Z"}, {"id": "plan_U4e1uQr-okeWg8", "nome": "Mind Asset: Equice macro economia", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-16", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171871", "dataConclusao": "2022-08-17T20:39:10.959601Z"}, {"id": "plan_CtNXKMOMHESLCx", "nome": "Mind Asset: Equipe econômica Mateus Hachul", "segmento": "Asset", "tipo": "Vídeo", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-17", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Podcast · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171877", "dataConclusao": "2022-08-17T20:38:18.4019406Z"}, {"id": "plan_urASbah_o0WMDM", "nome": "PDC", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-15", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171882", "dataConclusao": "2022-08-17T12:54:16.0873109Z"}, {"id": "plan_u69C6-7fMkuo3l", "nome": "PDC Nova Id (relatório)", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-19", "status": "Concluída", "prioridade": "Alta", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171890", "dataConclusao": "2022-08-16T18:55:45.1883205Z"}, {"id": "plan_vN49mXjhAUOzEJ", "nome": "Evento GD - Material - Identidade íon", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-15", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171896", "dataConclusao": "2022-08-16T12:23:01.0678171Z"}, {"id": "plan_orGtmPwMFEGnEk", "nome": "E-mail Expert XP", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-15", "status": "Concluída", "prioridade": "Urgente", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171902", "dataConclusao": "2022-08-16T12:22:50.7988908Z"}, {"id": "plan_f28HjIL4Ukuvr_", "nome": "Post Roberto Setubal", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-15", "status": "Concluída", "prioridade": "Urgente", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171908", "dataConclusao": "2022-08-15T20:54:50.2112995Z"}, {"id": "plan_MLPhs6vXOkWdl9", "nome": "Material (Gazzotti) Active Fix ESG para clientes", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-15", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171914", "dataConclusao": "2022-08-15T15:12:49.4798922Z"}, {"id": "plan_9Mq5knqpAUuUyU", "nome": "Página Campanha Global Dinâmico", "segmento": "Asset", "tipo": "Design", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-06-30", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Site · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171920", "dataConclusao": "2022-08-15T13:20:51.6784356Z"}, {"id": "plan_WwPlz_cwY0SpdY", "nome": "Papo de time com Edu", "segmento": "Asset", "tipo": "Vídeo", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-15", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Podcast · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171925", "dataConclusao": "2022-08-15T13:20:46.3711367Z"}, {"id": "plan_tMk4EhSchkmLzu", "nome": "Vídeo Morgado", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-09", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171930", "dataConclusao": "2022-08-15T13:20:20.9566507Z"}, {"id": "plan_ojWtqhAQS0ekl2", "nome": "Corte da Live", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-15", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171936", "dataConclusao": "2022-08-15T12:22:23.0301906Z"}, {"id": "plan_WPvfVEcF3Eil_V", "nome": "Recomendação de leitura", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-09", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171941", "dataConclusao": "2022-08-15T12:21:02.4715098Z"}, {"id": "plan_3jlMNTJpGUuPz6", "nome": "Vídeo Morgado", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-11", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171948", "dataConclusao": "2022-08-12T21:48:36.4415136Z"}, {"id": "plan_wY9OONzkqkajCj", "nome": "Optimus Long Bias", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-12", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171954", "dataConclusao": "2022-08-12T21:48:34.7130824Z"}, {"id": "plan_niAZ7TVqCkWpBk", "nome": "Mind Asset Live Cenario", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-09", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171959", "dataConclusao": "2022-08-11T19:20:33.6355148Z"}, {"id": "plan_g5JIe0_0HE2mfF", "nome": "Performance em destaque", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-10", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171966", "dataConclusao": "2022-08-11T19:20:31.2308456Z"}, {"id": "plan_p-8sB1l9fEGEzJ", "nome": "PDC", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-08", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171971", "dataConclusao": "2022-08-09T13:20:45.0964463Z"}, {"id": "plan_Baridh6wEUql1v", "nome": "WP BEN", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-28", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171977", "dataConclusao": "2022-08-09T12:34:08.9208199Z"}, {"id": "plan_hMmfqhK9vUGJtq", "nome": "XP Expert - Material Sacola", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-09", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171982", "dataConclusao": "2022-08-09T12:34:05.3498167Z"}, {"id": "plan_J2DpkgZQbEiepd", "nome": "Live com Thomas", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171988", "dataConclusao": "2022-08-07T19:56:00.4820603Z"}, {"id": "plan_isroYSwsg0GcS9", "nome": "Recap Expert", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-05", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171993", "dataConclusao": "2022-08-07T19:55:53.5854355Z"}, {"id": "plan_OyT8oiiDqk2-MC", "nome": "Paper Ben", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-28", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.171999", "dataConclusao": "2022-08-07T19:55:48.6165698Z"}, {"id": "plan_PHEx5MSMy06567", "nome": "E-mail GD ppt - Distribuidores", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-02", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172006", "dataConclusao": "2022-08-05T20:33:42.8809761Z"}, {"id": "plan_L28ZUUkmg0qDfQ", "nome": "Post Torneio Protea", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172012", "dataConclusao": "2022-08-05T11:34:22.2731439Z"}, {"id": "plan_G4gI5Nv4qUSpwz", "nome": "Mind Asset: Papo de time com Edu T", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-02", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172018", "dataConclusao": "2022-08-04T14:46:59.0514261Z"}, {"id": "plan_cXCx06ScdUirh_", "nome": "IFRA11 Oferta : Post 1", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-03", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172024", "dataConclusao": "2022-08-04T12:07:06.8263339Z"}, {"id": "plan_36-J54U6qECMwV", "nome": "Carta Dunamis", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-05", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172029", "dataConclusao": "2022-08-03T20:39:26.8696597Z"}, {"id": "plan_DutRCwZLUECVA8", "nome": "Apresentação IFRA11", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172035", "dataConclusao": "2022-08-02T13:01:21.6425689Z"}, {"id": "plan_CXPUifwJIk2TZO", "nome": "PDC", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-08-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172041", "dataConclusao": "2022-08-01T13:27:19.7495297Z"}, {"id": "plan_ZGKjJXou3kmxEV", "nome": "Dividendos RURA11 e IFRA11", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-29", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172046", "dataConclusao": "2022-08-01T11:45:58.0940478Z"}, {"id": "plan_mLBE8rz7e0m2Ns", "nome": "XP Expert", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-28", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172052", "dataConclusao": "2022-08-01T11:45:56.094002Z"}, {"id": "plan_ZdlMJUD08kiPG_", "nome": "RURA11", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-27", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172059", "dataConclusao": "2022-07-28T12:49:57.586425Z"}, {"id": "plan_mAmBZnDb20u3Pv", "nome": "Vídeo Marin", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-26", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172066", "dataConclusao": "2022-07-28T12:49:21.6924749Z"}, {"id": "plan_OilOnYA2pESL5Q", "nome": "Paper Inflação Ben", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Fabiano", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-25", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172071", "dataConclusao": "2022-07-25T16:42:23.6402931Z"}, {"id": "plan_tp8l576v40mvXm", "nome": "Motion GD Países investidos", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-06-30", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172077", "dataConclusao": "2022-07-25T13:22:16.1532721Z"}, {"id": "plan_2QVDbOCw4UCa7H", "nome": "slides Institucional - Estrutura, Multimesas, Carteira", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-19", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172082", "dataConclusao": "2022-07-19T13:36:55.5268046Z"}, {"id": "plan_CfuHwLHXTUeG-q", "nome": "Vídeo IFRA11", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Eder", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-19", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172087", "dataConclusao": "2022-07-19T13:36:47.104754Z"}, {"id": "plan_DS1QyoHj2USSZP", "nome": "Post Finance Academy", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Fabiano", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-07", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172093", "dataConclusao": "2022-07-19T13:35:56.4550157Z"}, {"id": "plan_x6q1UcO3Q0OXnS", "nome": "Video live Nicholas", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Fabiano", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-06", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172098", "dataConclusao": "2022-07-19T13:35:55.3060371Z"}, {"id": "plan_4T_MRGSDwUqW5s", "nome": "Renda fixa, não tão fixa", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-14", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172104", "dataConclusao": "2022-07-15T20:38:01.6199836Z"}, {"id": "plan_eT6REKtVTUKHbN", "nome": "Performance em destaque", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-07", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172110", "dataConclusao": "2022-07-14T19:58:24.2995739Z"}, {"id": "plan_J3G2TQ7Wt0WYIo", "nome": "Mind Asset: Especialistas íon com Leticia", "segmento": "Asset", "tipo": "Vídeo", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-05", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Podcast · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172115", "dataConclusao": "2022-07-12T12:59:36.9358665Z"}, {"id": "plan_Gzg-hN4lYUK_ca", "nome": "Reels primeiro semestre", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-08", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172122", "dataConclusao": "2022-07-12T12:59:27.7168736Z"}, {"id": "plan_bTHNhG4HW0qLmq", "nome": "Desafio Quantamental", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "Fabiano", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-07", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172129", "dataConclusao": "2022-07-12T12:59:22.6054543Z"}, {"id": "plan_nWt561qDZ0ay5u", "nome": "Audio Live", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-06", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172134", "dataConclusao": "2022-07-12T12:59:19.4893655Z"}, {"id": "plan_K5RYB8UyCUiIOz", "nome": "Produtos: inflação", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-05", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172140", "dataConclusao": "2022-07-12T12:59:17.5361959Z"}, {"id": "plan_fDNw-kA6nEWU5b", "nome": "Post Live Ibiuna", "segmento": "Asset", "tipo": "Outros", "solicitante": "", "responsavel": "Fabiano", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-06-29", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Produção · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172145", "dataConclusao": "2022-07-05T11:39:20.5621003Z"}, {"id": "plan_kbxIM6-zH0GIul", "nome": "Dividendos RURA/IFRA", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-06-30", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172152", "dataConclusao": "2022-07-05T11:36:53.2046896Z"}, {"id": "plan_MwruNNSGoEuqEy", "nome": "Live Economia", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-01", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172157", "dataConclusao": "2022-07-05T11:36:51.4008066Z"}, {"id": "plan_lr4kdtE6i0q4f2", "nome": "PDC", "segmento": "Gaveta", "tipo": "Outros", "solicitante": "", "responsavel": "", "dataPedido": "", "duracao": 1, "dataInicio": "2026-05-18", "dataEntrega": "2022-07-04", "status": "Concluída", "prioridade": "Média", "dificuldade": 3, "retrabalhos": 0, "observacoes": "Bucket Planner: Pipe · Progresso: 100%", "createdAt": "2026-05-20T10:49:35.172163", "dataConclusao": "2022-07-05T11:36:51.0811095Z"}];
}

function uid(){return 't_'+Math.random().toString(36).slice(2,10)+Date.now().toString(36)}

/* ============================================================
   THEME
   ============================================================ */
function applyTheme(){
  document.documentElement.setAttribute('data-theme', state.theme);
  document.getElementById('themeBtn').innerHTML = state.theme==='dark'
    ? '<svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"><circle cx="12" cy="12" r="4"/><path d="M12 2v2M12 20v2M4.9 4.9l1.4 1.4M17.7 17.7l1.4 1.4M2 12h2M20 12h2M4.9 19.1l1.4-1.4M17.7 6.3l1.4-1.4"/></svg>'
    : '<svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M21 12.8A9 9 0 1 1 11.2 3a7 7 0 0 0 9.8 9.8z"/></svg>';
}
function toggleTheme(){
  state.theme = state.theme==='dark' ? 'light' : 'dark';
  applyTheme();saveState();
  // Re-renderiza gráficos (cores podem mudar)
  if(state.currentTab==='dashboard') renderDashboard();
  if(state.currentTab==='planner') renderPlanner();
  if(state.currentTab==='backlog') renderBacklog();
}

/* ============================================================
   TABS
   ============================================================ */
function switchTab(tab){
  state.currentTab=tab;
  document.querySelectorAll('.tab').forEach(t=>t.classList.toggle('active', t.dataset.tab===tab));
  document.querySelectorAll('.page').forEach(p=>p.classList.remove('active'));
  document.getElementById('page-'+tab).classList.add('active');
  renderCurrent();
}
function renderCurrent(){
  if(state.currentTab==='backlog') renderBacklog();
  if(state.currentTab==='planner') renderPlanner();
  if(state.currentTab==='concluidos') renderConcluidos();
  if(state.currentTab==='dashboard') renderDashboard();
}

/* ============================================================
   MODAL DE TAREFA
   ============================================================ */
function populateResponsavelSelect(){
  const sels = [
    document.getElementById('modalResponsavel'),
    document.getElementById('filterResponsavel'),
    document.getElementById('cFilterResponsavel')
  ];
  sels.forEach((sel,i)=>{
    if(!sel) return;
    const placeholder = i===0 ? '<option value="">Sem responsável</option>' : (i===1 ? '<option value="">Responsável</option>' : '<option value="">Todos responsáveis</option>');
    sel.innerHTML = placeholder + TEAM_MEMBERS.map(m=>`<option value="${m}">${m}</option>`).join('');
  });
  // tipos no filtro de concluídos
  const tipos = ['Design','Vídeo','Apresentação','Social Media','E-mail Marketing','Evento','Outros'];
  const cTipo = document.getElementById('cFilterTipo');
  cTipo.innerHTML = '<option value="">Todos tipos</option>' + tipos.map(t=>`<option>${t}</option>`).join('');
}

function openTaskModal(id=null){
  state.editingId = id;
  const form = document.getElementById('taskForm');
  form.querySelectorAll('option[data-extra]').forEach(o=>o.remove());
  form.reset();
  document.getElementById('taskModalTitle').textContent = id ? 'Editar Tarefa' : 'Nova Tarefa';
  document.getElementById('deleteBtn').style.display = id ? 'inline-flex' : 'none';
  const concluirBtn = document.getElementById('concluirBtn');
  if(concluirBtn){
    const tEdit = id ? state.tasks.find(x=>x.id===id) : null;
    concluirBtn.style.display = (tEdit && tEdit.status!=='Concluída') ? 'inline-flex' : 'none';
  }
  // padrão de data
  const today = todayTag();
  form.dataInicio.value = today;
  form.dataPedido.value = today;
  // duração default 1 dia
  setStars(3);
  if(id){
    const t = state.tasks.find(x=>x.id===id);
    if(t){
      form.nome.value=t.nome||'';
      setSelectValue(form.segmento, t.segmento||'Asset');
      setSelectValue(form.tipo, t.tipo||'Outros');
      form.solicitante.value=t.solicitante||'';
      setSelectValue(form.responsavel, t.responsavel||'');
      form.dataPedido.value=t.dataPedido||'';
      form.duracao.value=t.duracao||1;
      form.horasReais.value = (t.horasReais!=null && t.horasReais!=='') ? t.horasReais : '';
      form.dataInicio.value=t.dataInicio||'';
      form.dataEntrega.value=t.dataEntrega||'';
      setSelectValue(form.status, t.status||'Aguardando');
      setSelectValue(form.prioridade, t.prioridade||'Média');
      form.retrabalhos.value=t.retrabalhos||0;
      form.observacoes.value=t.observacoes||'';
      setStars(t.dificuldade||3);
    }
  }
  document.getElementById('taskModal').classList.add('active');
}
// Seleciona um valor no <select>; se ele não existir na lista, adiciona (evita trocar dados sem aviso)
function setSelectValue(sel, value){
  if(!sel) return;
  const v = value == null ? '' : String(value);
  if(![...sel.options].some(o=>o.value === v)){
    const o = document.createElement('option');
    o.value = v; o.textContent = v || 'Sem responsável'; o.dataset.extra = '1';
    sel.appendChild(o);
  }
  sel.value = v;
}
function closeTaskModal(){
  document.getElementById('taskModal').classList.remove('active');
  state.editingId=null;
}
// Lê e valida o formulário; retorna null se faltar algo obrigatório
function readTaskForm(){
  const form = document.getElementById('taskForm');
  if(!form.nome.value.trim()){toast('Informe o nome da tarefa','error');return null}
  if(!form.dataInicio.value){toast('Informe a data de início','error');return null}
  if(!form.dataEntrega.value){toast('Informe a data de entrega','error');return null}
  if(form.dataEntrega.value < form.dataInicio.value){toast('A data de entrega não pode ser anterior ao início','error');return null}
  return {
    nome:form.nome.value.trim(),
    segmento:form.segmento.value,
    tipo:form.tipo.value,
    solicitante:form.solicitante.value.trim(),
    responsavel:form.responsavel.value,
    dataPedido:form.dataPedido.value,
    duracao:parseInt(form.duracao.value)||1,
    horasReais: form.horasReais.value === '' ? null : (parseFloat(form.horasReais.value) || 0),
    dataInicio:form.dataInicio.value,
    dataEntrega:form.dataEntrega.value,
    status:form.status.value,
    prioridade:form.prioridade.value,
    dificuldade:parseInt(document.getElementById('starRating').dataset.value)||3,
    retrabalhos:parseInt(form.retrabalhos.value)||0,
    observacoes:form.observacoes.value.trim()
  };
}
// Mantém dataConclusao/startedAt coerentes com o status
function syncStatusDates(t){
  const nowIso = new Date().toISOString();
  if(t.status === 'Concluída'){ if(!t.dataConclusao) t.dataConclusao = nowIso; }
  else if(t.dataConclusao){ delete t.dataConclusao; }
  if(['Em andamento','Em revisão','Correção'].includes(t.status) && !t.startedAt) t.startedAt = nowIso;
  return t;
}
function saveTask(){
  const data = readTaskForm();
  if(!data) return;
  if(state.editingId){
    const idx = state.tasks.findIndex(x=>x.id===state.editingId);
    if(idx>=0){
      state.tasks[idx] = syncStatusDates({...state.tasks[idx], ...data, updatedAt:new Date().toISOString()});
    }
    toast('Tarefa atualizada');
  }else{
    state.tasks.push(syncStatusDates({id:uid(), ...data, createdAt:new Date().toISOString()}));
    toast('Tarefa criada');
  }
  saveState();
  closeTaskModal();
  renderCurrent();
}
async function deleteTask(){
  if(!state.editingId) return;
  if(!await uiDialog({title:'Deletar tarefa', message:'Esta ação não pode ser desfeita.', okText:'Deletar', danger:true})) return;
  state.tasks = state.tasks.filter(t=>t.id!==state.editingId);
  saveState();
  closeTaskModal();
  renderCurrent();
  toast('Tarefa removida');
}
async function deleteTaskById(id, e){
  e && e.stopPropagation();
  if(!await uiDialog({title:'Deletar tarefa', message:'Esta ação não pode ser desfeita.', okText:'Deletar', danger:true})) return;
  state.tasks = state.tasks.filter(t=>t.id!==id);
  saveState();
  renderCurrent();
  toast('Tarefa removida');
}

/* Star rating */
function setStars(v){
  const sr = document.getElementById('starRating');
  sr.dataset.value = v;
  sr.querySelectorAll('.star').forEach(s=>{
    s.classList.toggle('on', parseInt(s.dataset.v)<=v);
  });
}
document.addEventListener('click', e=>{
  if(e.target.classList.contains('star')){
    const v = parseInt(e.target.dataset.v);
    setStars(v);
  }
});

/* ============================================================
   BACKLOG
   ============================================================ */
function renderBacklog(){
  const cont = document.getElementById('backlogContent');
  const items = state.tasks.filter(t=>t.status==='Aguardando');
  const dark = state.theme === 'dark';
  const segColor = s => (dark && s === 'Private') ? '#E5E7EB' : (SEG_COLOR[s] || '#9CA3AF');
  if(items.length===0){
    cont.innerHTML = `<div class="bl-empty-all">
      <strong>Nenhuma demanda no backlog</strong>
      Clique em <b>+ Nova Tarefa</b> para começar.
    </div>`;
    return;
  }
  // Colunas (Íon e Varejo dividem a mesma coluna)
  const COLUMNS = [
    {key:'Asset',       label:'Asset',           match:['Asset']},
    {key:'Private',     label:'Private',         match:['Private']},
    {key:'IonVarejo',   label:'Íon / Varejo',    match:['Íon','Varejo']},
    {key:'BancoIdeias', label:'Banco de Ideias', match:['Banco de Ideias']},
    {key:'Gaveta',      label:'Gaveta',          match:['Gaveta']},
  ];
  const urg = items.filter(t=>t.prioridade==='Urgente').length;
  let html = `<div class="bl-summary"><b>${items.length}</b> demanda${items.length!==1?'s':''} aguardando início` +
    (urg ? `<span class="bl-sep">·</span><span class="bl-urg-count"><i></i>${urg} urgente${urg!==1?'s':''}</span>` : '') + `</div>`;
  html += `<div class="bl-board">` + COLUMNS.map(col=>{
    const cards = items
      .filter(t=>col.match.includes(t.segmento))
      .sort((a,b)=> (a.dataEntrega||'9999').localeCompare(b.dataEntrega||'9999'));
    const mixed = col.match.length > 1;
    const body = cards.length
      ? cards.map(t=>renderBacklogCard(t, mixed, segColor)).join('')
      : `<div class="bl-col-empty">Nenhuma demanda</div>`;
    return `
      <section class="bl-col">
        <header class="bl-col-head" style="--seg:${segColor(col.match[0])}">
          <span class="bl-col-swatch">${col.match.map(s=>`<i style="background:${segColor(s)}"></i>`).join('')}</span>
          <span class="bl-col-name">${col.label}</span>
          <span class="bl-col-count">${cards.length}</span>
        </header>
        <div class="bl-col-body">${body}</div>
      </section>`;
  }).join('') + `</div>`;
  cont.innerHTML = html;
}

function renderBacklogCard(t, mixed, segColor){
  segColor = segColor || (s => SEG_COLOR[s] || '#9CA3AF');
  const today = new Date(); today.setHours(0,0,0,0);
  let due = '';
  if(t.dataEntrega){
    const d = parseISO(t.dataEntrega);
    const MES = ['jan','fev','mar','abr','mai','jun','jul','ago','set','out','nov','dez'];
    const late = d < today;
    due = `<span class="bl-due ${late?'late':''}" title="${late?'Prazo vencido':'Entrega'}: ${formatDate(t.dataEntrega)}">${d.getDate()} ${MES[d.getMonth()]}</span>`;
  }
  const prio = t.prioridade==='Urgente' ? '<i class="bl-prio urg" title="Urgente"></i>'
             : t.prioridade==='Alta' ? '<i class="bl-prio alta" title="Prioridade alta"></i>' : '';
  const seg = mixed ? `<span class="bl-seg"><i style="background:${segColor(t.segmento)}"></i>${escapeHtml(t.segmento)}</span>` : '';
  return `
    <article class="bl-card" onclick="openTaskModal('${t.id}')">
      <div class="bl-title">${prio}<span>${escapeHtml(t.nome)}</span></div>
      <div class="bl-meta">
        ${avatarHTML(t.responsavel, 20)}
        <span class="bl-who">${escapeHtml(t.responsavel || 'Sem responsável')}</span>
        ${t.tipo ? `<span class="bl-sep">·</span><span class="bl-type">${escapeHtml(t.tipo)}</span>` : ''}
        ${due}
      </div>
      ${seg ? `<div class="bl-foot">${seg}</div>` : ''}
      <div class="bl-actions" onclick="event.stopPropagation()">
        <button class="bl-icon" title="Deletar" aria-label="Deletar" onclick="deleteTaskById('${t.id}',event)">
          <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M4 7h16M10 11v6M14 11v6M6 7l1 12a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2l1-12M9 7V4h6v3"/></svg>
        </button>
        <button class="bl-start" onclick="startTask('${t.id}',event)">Iniciar
          <svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14M13 6l6 6-6 6"/></svg>
        </button>
      </div>
    </article>`;
}
async function concluirTask(id,e){
  e && e.stopPropagation();
  if(!state.tasks.some(x=>x.id===id)) return;
  // Se o formulário está aberto, aproveita o que foi editado nele
  let horas = null, formData = null;
  const form = document.getElementById('taskForm');
  const modalOpen = document.getElementById('taskModal').classList.contains('active');
  if(modalOpen && state.editingId === id && form){
    formData = readTaskForm();
    if(!formData) return;
    if(formData.horasReais != null) horas = formData.horasReais;
  }
  const nome = (formData && formData.nome) || state.tasks.find(x=>x.id===id).nome;
  if(horas === null){
    const resp = await uiDialog({
      title: 'Concluir demanda',
      message: `Quantas horas foram trabalhadas em "${nome}"? Deixe em branco se não quiser registrar.`,
      input: {type:'text', value: '', placeholder:'Ex.: 6', suffix:'horas'},
      okText: 'Concluir'
    });
    if(resp === null) return; // cancelou
    if(String(resp).trim() !== '') horas = parseFloat(String(resp).replace(',', '.')) || 0;
  }
  // Busca de novo: a lista pode ter sido atualizada enquanto a caixa estava aberta
  const t = state.tasks.find(x=>x.id===id);
  if(!t){ toast('A demanda não foi encontrada (pode ter sido removida).','error'); return; }
  if(formData) Object.assign(t, formData, {updatedAt:new Date().toISOString()});
  t.status = 'Concluída';
  t.dataConclusao = new Date().toISOString();
  if(horas != null) t.horasReais = horas;
  saveState();
  toast(`"${t.nome}" marcada como concluída${horas!=null ? ' · '+horas+'h' : ''}`);
  closeTaskModal();
  renderCurrent();
}

function startTask(id,e){
  e && e.stopPropagation();
  const t = state.tasks.find(x=>x.id===id);
  if(!t) return;
  t.status = 'Em andamento';
  t.startedAt = new Date().toISOString();
  if(!t.dataInicio) t.dataInicio = todayTag();
  if(!t.dataEntrega || t.dataEntrega < t.dataInicio) t.dataEntrega = t.dataInicio;
  saveState();
  toast(`"${t.nome}" movida para o Planner`);
  renderCurrent();
}

/* ============================================================
   PLANNER — TIMELINE POR PERÍODO (Semana · Quinzena · Mês · Período)
   Mostra apenas dias úteis (seg–sex).
   ============================================================ */
const TL_VIEW_KEY = 'planner_cc_tl_view';
const TL_MESES = ['jan','fev','mar','abr','mai','jun','jul','ago','set','out','nov','dez'];
const TL_MESES_LONGOS = ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'];
const TL_DOW = ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb'];
const TL_STARTED = ['Em andamento','Em revisão','Correção'];

state.tl = { view: lsGet(TL_VIEW_KEY) || 'month', offset: 0, from: '', to: '' };

function tlToday(){ const d = new Date(); d.setHours(0,0,0,0); return d; }
function tlAddDays(d, n){ const x = new Date(d); x.setDate(x.getDate() + n); return x; }
function tlISO(d){ return d.getFullYear() + '-' + String(d.getMonth()+1).padStart(2,'0') + '-' + String(d.getDate()).padStart(2,'0'); }
function tlMonday(d){ const day = d.getDay(); return tlAddDays(d, day === 0 ? -6 : 1 - day); }
function tlDM(d){ return String(d.getDate()).padStart(2,'0') + '/' + String(d.getMonth()+1).padStart(2,'0'); }

function getTlRange(){
  const t = tlToday(), v = state.tl.view, o = state.tl.offset;
  let start, end;
  if(v === 'week'){ start = tlAddDays(tlMonday(t), o*7); end = tlAddDays(start, 4); }
  else if(v === 'fortnight'){ start = tlAddDays(tlMonday(t), o*14); end = tlAddDays(start, 11); }
  else if(v === 'custom'){
    if(!state.tl.from || !state.tl.to){
      state.tl.from = tlISO(tlMonday(t));
      state.tl.to = tlISO(tlAddDays(tlMonday(t), 25));
    }
    start = parseISO(state.tl.from); end = parseISO(state.tl.to);
    if(end < start){ const x = start; start = end; end = x; }
  }
  else { start = new Date(t.getFullYear(), t.getMonth() + o, 1); end = new Date(t.getFullYear(), t.getMonth() + o + 1, 0); }
  const days = [];
  for(let d = new Date(start); d <= end && days.length < 200; d = tlAddDays(d, 1)){
    if(d.getDay() !== 0 && d.getDay() !== 6) days.push(new Date(d));
  }
  return {start, end, days};
}

// Compat: outras partes do app ainda podem chamar estas funções
function getWeekDays(offset=0){ const m = tlAddDays(tlMonday(tlToday()), offset*7); return [0,1,2,3,4].map(i=>tlAddDays(m,i)); }
function changeWeek(delta){ shiftTl(delta); }
function goToCurrentWeek(){ resetTl(); }

function setTlView(v){
  state.tl.view = v; state.tl.offset = 0;
  lsSet(TL_VIEW_KEY, v);
  renderPlanner();
}
function shiftTl(delta){
  if(state.tl.view === 'custom'){
    const r = getTlRange();
    const len = Math.round((r.end - r.start)/86400000) + 1;
    state.tl.from = tlISO(tlAddDays(r.start, delta*len));
    state.tl.to = tlISO(tlAddDays(r.end, delta*len));
  } else state.tl.offset += delta;
  renderPlanner();
}
function resetTl(){
  if(state.tl.view === 'custom'){ state.tl.from = ''; state.tl.to = ''; }
  state.tl.offset = 0;
  renderPlanner();
}
function setCustomRange(){
  const f = document.getElementById('tlFrom').value, t = document.getElementById('tlTo').value;
  if(f) state.tl.from = f;
  if(t) state.tl.to = t;
  renderPlanner();
}
function clearTlFilters(){
  ['filterSegmento','filterResponsavel','filterStatus','filterPrioridade'].forEach(id=>{ document.getElementById(id).value = ''; });
  renderPlanner();
}

function isoWeekNumber(d){
  const t = new Date(Date.UTC(d.getFullYear(), d.getMonth(), d.getDate()));
  const dayNum = t.getUTCDay() || 7;
  t.setUTCDate(t.getUTCDate() + 4 - dayNum);
  const yearStart = new Date(Date.UTC(t.getUTCFullYear(),0,1));
  return Math.ceil((((t - yearStart) / 86400000) + 1) / 7);
}

const TL_GROUP_KEY = 'planner_cc_tl_group';
state.tl.group = lsGet(TL_GROUP_KEY) || 'segmento';
function setTlGroup(g){ state.tl.group = g; lsSet(TL_GROUP_KEY, g); renderPlanner(); }

// Cor do texto sobre a barra (contraste com a cor do segmento)
const TL_SEG_INK = {'Asset':'#0E3A47','Private':'#FFFFFF','Íon':'#2B3A0A','Varejo':'#1F2937','Banco de Ideias':'#1F2937','Gaveta':'#FFFFFF'};
const TL_STATUS_CLS = {'Em andamento':'st-and','Em revisão':'st-rev','Correção':'st-cor'};

function renderPlanner(){
  const {start, end, days} = getTlRange();
  const N = days.length;
  const v = state.tl.view;
  const today = tlToday();
  const dark = state.theme === 'dark';
  const segColor = s => (dark && s === 'Private') ? '#E5E7EB' : (SEG_COLOR[s] || '#9CA3AF');
  const segInk = s => (dark && s === 'Private') ? '#111827' : (TL_SEG_INK[s] || '#1F2937');
  const segShade = s => (s === 'Private' && !dark) ? 'rgba(255,255,255,.22)' : 'rgba(0,0,0,.16)';

  // ---------- Cabeçalho ----------
  const sameYear = start.getFullYear() === end.getFullYear();
  let title;
  if(v === 'month') title = `${TL_MESES_LONGOS[start.getMonth()]} <span>${start.getFullYear()}</span>`;
  else if(start.getMonth() === end.getMonth() && sameYear) title = `${start.getDate()} – ${end.getDate()} ${TL_MESES[end.getMonth()]} <span>${end.getFullYear()}</span>`;
  else title = `${start.getDate()} ${TL_MESES[start.getMonth()]}${sameYear?'':' '+start.getFullYear()} – ${end.getDate()} ${TL_MESES[end.getMonth()]} <span>${end.getFullYear()}</span>`;
  document.getElementById('tlTitle').innerHTML = title;

  const isCurrent = v !== 'custom' && state.tl.offset === 0;
  const viewName = {week:'Semana ' + isoWeekNumber(start), fortnight:'Quinzena', month:'Mês', custom:'Período'}[v];
  document.getElementById('tlEyebrow').innerHTML =
    `${viewName} · ${N} dia${N!==1?'s':''} útei${N!==1?'s':''}` + (isCurrent ? ` · <b>${v==='month'?'mês atual':v==='week'?'semana atual':'atual'}</b>` : '');

  document.querySelectorAll('#tlViewSeg button').forEach(b=>b.classList.toggle('active', b.dataset.view === v));
  document.querySelectorAll('#tlGroupSeg button').forEach(b=>b.classList.toggle('active', b.dataset.group === state.tl.group));
  document.getElementById('tlRange').classList.toggle('show', v === 'custom');
  if(v === 'custom'){
    document.getElementById('tlFrom').value = tlISO(start);
    document.getElementById('tlTo').value = tlISO(end);
  }
  document.getElementById('tlTodayBtn').disabled = isCurrent;

  // ---------- Filtros ----------
  const fSeg = document.getElementById('filterSegmento').value;
  const fResp = document.getElementById('filterResponsavel').value;
  const fStatus = document.getElementById('filterStatus').value;
  const fPrio = document.getElementById('filterPrioridade').value;
  let anySet = false;
  ['filterSegmento','filterResponsavel','filterStatus','filterPrioridade'].forEach(id=>{
    const el = document.getElementById(id); el.classList.toggle('is-set', !!el.value); anySet = anySet || !!el.value;
  });
  document.getElementById('tlClear').classList.toggle('show', anySet);

  const visible = state.tasks.filter(t=>{
    if(!TL_STARTED.includes(t.status)) return false;
    if(fSeg && t.segmento!==fSeg) return false;
    if(fResp && t.responsavel!==fResp) return false;
    if(fStatus && t.status!==fStatus) return false;
    if(fPrio && t.prioridade!==fPrio) return false;
    if(!t.dataInicio || !t.dataEntrega) return false;
    return overlapsWeek(t.dataInicio, t.dataEntrega, start, end);
  });
  const isLate = t => parseISO(t.dataEntrega) < today;
  const dueInRange = visible.filter(t=>{ const e = parseISO(t.dataEntrega); return e >= start && e <= end; });

  // ---------- Números ----------
  const count = s => visible.filter(t=>t.status===s).length;
  const late = visible.filter(isLate).length;
  const stats = [
    {l:'Em produção no período', v:visible.length, cls:'main'},
    {l:'Em andamento', v:count('Em andamento'), dot:'st-and'},
    {l:'Em revisão', v:count('Em revisão'), dot:'st-rev'},
    {l:'Em correção', v:count('Correção'), dot:'st-cor'},
    {l:'Entregas previstas', v:dueInRange.length},
    {l:'Atrasadas', v:late, cls: late ? 'alert' : ''}
  ];
  document.getElementById('tlStats').innerHTML = stats.map(s=>
    `<div class="tl-stat ${s.cls||''}"><div class="tl-stat-v">${s.v}</div><div class="tl-stat-l">${s.dot?`<i class="tl-sdot ${s.dot}"></i>`:''}${s.l}</div></div>`).join('');

  // ---------- Timeline ----------
  const grid = document.getElementById('ganttGrid');
  const wide = N <= 10;
  grid.classList.toggle('wide', wide);
  const colMin = N <= 5 ? 110 : N <= 10 ? 70 : 40;
  grid.style.minWidth = (300 + N*colMin) + 'px';
  const cols = `grid-template-columns:repeat(${N},1fr)`;

  const todayIdx = days.findIndex(d=>d.getTime()===today.getTime());
  const nowLine = todayIdx >= 0 ? `<div class="tl-now" style="left:${((todayIdx+.5)/N*100).toFixed(3)}%"></div>` : '';
  const isWkStart = (d,i) => i > 0 && d.getDay() === 1;
  const cells = days.map((d,i)=>`<div class="tl-c ${isWkStart(d,i)?'wk-start':''} ${i===todayIdx?'today':''}"></div>`).join('') + nowLine;

  const weeks = [];
  days.forEach(d=>{
    const w = isoWeekNumber(d);
    if(!weeks.length || weeks[weeks.length-1].w !== w) weeks.push({w, first:d, n:0});
    weeks[weeks.length-1].n++;
  });
  let html = `<div class="tl-hlabel">Demanda</div><div class="tl-hdays">`;
  html += `<div class="tl-weeks" style="${cols}">` + weeks.map(wk=>
    `<div class="tl-wk" style="grid-column:span ${wk.n}" title="Semana ${wk.w}">${wk.n>=3 || wide ? 'Semana '+wk.w : 'S'+wk.w}${wk.n>=4 || wide ? `<em>${wk.first.getDate()} ${TL_MESES[wk.first.getMonth()]}</em>` : ''}</div>`
  ).join('') + `</div>`;
  html += `<div class="tl-days" style="${cols}">` + days.map((d,i)=>{
    const cls = [isWkStart(d,i)?'wk-start':'', i===todayIdx?'today':(d<today?'past':'')].join(' ');
    const dn = wide ? TL_DOW[d.getDay()] : TL_DOW[d.getDay()][0];
    return `<div class="tl-day ${cls}" title="${TL_DOW[d.getDay()]} ${tlDM(d)}"><span class="dn">${dn}</span><span class="dd">${d.getDate()}</span></div>`;
  }).join('') + `</div></div>`;

  const startCol = d => { const i = days.findIndex(x=>x>=d); return i < 0 ? N : i; };
  const endCol = d => { let i = -1; days.forEach((x,k)=>{ if(x<=d) i = k; }); return i; };

  // ---------- Agrupamento ----------
  const G = state.tl.group;
  const keyOf = t => G === 'responsavel' ? (t.responsavel || '—') : G === 'status' ? t.status : (t.segmento || 'Outros');
  const baseOrder = G === 'responsavel' ? TEAM_MEMBERS : G === 'status' ? TL_STARTED : ['Asset','Private','Íon','Varejo','Banco de Ideias','Gaveta'];
  const groupHead = (k, n) => {
    let mark;
    if(G === 'responsavel') mark = avatarHTML(k, 20);
    else if(G === 'status') mark = `<i class="tl-sdot ${TL_STATUS_CLS[k]||''}"></i>`;
    else mark = `<span class="tl-gdot" style="background:${segColor(k)}"></span>`;
    return `<div class="tl-glabel">${mark}<span class="tl-gname">${escapeHtml(k)}</span><span class="tl-gcount">${n}</span></div>`;
  };

  const segsPresent = [...new Set(visible.map(t=>t.segmento || 'Outros'))];
  if(N === 0 || visible.length === 0){
    html += `<div class="tl-empty"><strong>Nenhuma demanda em produção neste período</strong>Ajuste os filtros ou navegue para outro período.</div>`;
  } else {
    const grouped = {};
    visible.forEach(t=>{ const k = keyOf(t); (grouped[k] = grouped[k] || []).push(t); });
    const keys = baseOrder.filter(k=>grouped[k]);
    Object.keys(grouped).forEach(k=>{ if(!keys.includes(k)) keys.push(k); });

    keys.forEach(k=>{
      const list = grouped[k].slice().sort((a,b)=> a.dataInicio.localeCompare(b.dataInicio) || a.dataEntrega.localeCompare(b.dataEntrega));
      html += groupHead(k, list.length);
      html += `<div class="tl-gtrack" style="${cols}">${cells}</div>`;

      list.forEach(t=>{
        const seg = t.segmento;
        const c = segColor(seg);
        const tStart = parseISO(t.dataInicio), tEnd = parseISO(t.dataEntrega);
        let a = startCol(tStart < start ? start : tStart);
        let b = endCol(tEnd > end ? end : tEnd);
        if(a >= N) a = N-1;
        if(b < a) b = a;
        const contL = tStart < start, contR = tEnd > end;
        const totalAll = Math.max(1, Math.round((tEnd - tStart)/86400000) + 1);
        const doneAll = today < tStart ? 0 : Math.min(totalAll, Math.round((today - tStart)/86400000) + 1);
        const pct = Math.round(doneAll/totalAll*100);

        const visStart = days[a], visEnd = days[b];
        let fill = 0;
        if(today > visEnd) fill = 100;
        else if(today >= visStart){ const cut = endCol(today); fill = Math.round((cut - a + 1)/(b - a + 1)*100); }

        const lateT = isLate(t);
        const leftPct = a/N*100, widthPct = (b-a+1)/N*100;
        const padL = contL ? 0 : 3, padR = contR ? 0 : 3;
        const dueTxt = lateT ? `<span class="late">venceu ${tlDM(tEnd)}</span>` : `entrega ${tlDM(tEnd)}`;
        const segTxt = G === 'segmento' ? '' : `<span class="tl-mseg"><i style="background:${c}"></i>${escapeHtml(seg||'')}</span><span class="dot">·</span>`;
        const respTxt = G === 'responsavel' ? '' : `<span class="tl-resp">${avatarHTML(t.responsavel, 18)}${escapeHtml(t.responsavel || '—')}</span><span class="dot">·</span>`;

        html += `<div class="tl-label" onclick="openTaskModal('${t.id}')" title="${escapeHtml(t.nome)}">
          <div class="tl-name">${t.prioridade==='Urgente'?'<i class="tl-urg" title="Urgente"></i>':''}<span>${escapeHtml(t.nome)}</span></div>
          <div class="tl-meta">${G === 'status' ? '' : `<span class="tl-st ${TL_STATUS_CLS[t.status]||''}">${escapeHtml(t.status)}</span>`}${segTxt}${respTxt}${dueTxt}</div>
        </div>`;
        html += `<div class="tl-track" style="${cols}">${cells}
          <div class="tl-bar ${contL?'cont-left':''} ${contR?'cont-right':''} ${lateT?'is-late':''}"
               style="left:calc(${leftPct.toFixed(3)}% + ${padL}px);width:calc(${widthPct.toFixed(3)}% - ${padL+padR}px);background:${c};color:${segInk(seg)}"
               onclick="openTaskModal('${t.id}')"
               title="${escapeHtml(t.nome)}&#10;${escapeHtml(t.responsavel||'—')} · ${escapeHtml(t.status)} · ${escapeHtml(t.prioridade||'')}&#10;${tlDM(tStart)} → ${tlDM(tEnd)} · ${pct}% do prazo decorrido">
            <span class="tl-bar-fill" style="width:${fill}%;background:${segShade(seg)}"></span>
            <span class="tl-bar-text">${contL?'← ':''}${escapeHtml(t.nome)}</span>
          </div>
        </div>`;
      });
    });
  }
  grid.innerHTML = html;

  // Nome que não cabe na barra vai para o lado de fora (quando há espaço à direita)
  grid.querySelectorAll('.tl-bar').forEach(bar=>{
    const txt = bar.querySelector('.tl-bar-text');
    if(txt.scrollWidth <= txt.clientWidth + 1) return;
    const track = bar.parentElement;
    const room = track.clientWidth - (bar.offsetLeft + bar.offsetWidth);
    if(room > 140){ bar.classList.add('out'); txt.style.maxWidth = (room - 16) + 'px'; }
  });

  // ---------- Legenda ----------
  const order = ['Asset','Private','Íon','Varejo','Banco de Ideias','Gaveta'];
  const legSegs = (segsPresent.length ? order.filter(s=>segsPresent.includes(s)) : order.slice(0,3));
  document.getElementById('plLegend').innerHTML =
    legSegs.map(s=>`<span><i class="sw" style="background:${segColor(s)}"></i>${escapeHtml(s)}</span>`).join('') +
    `<span class="grow"></span>
     <span><i class="lg-bar"></i>Trecho escuro = prazo já decorrido</span>
     <span><i class="lg-late"></i>Atrasada</span>
     ${todayIdx>=0 ? '<span><i class="lg-now"></i>Hoje</span>' : ''}`;

  renderCapacity();
  renderDeliveries(dueInRange, segColor);
}

/* ---------- Diálogo próprio (substitui prompt/confirm, que são bloqueados no SharePoint/Teams) ---------- */
function uiDialog(opts){
  const o = Object.assign({title:'', message:'', input:null, okText:'Confirmar', cancelText:'Cancelar', danger:false}, opts||{});
  return new Promise(resolve=>{
    const ov = document.createElement('div');
    ov.className = 'ui-dlg-overlay';
    ov.innerHTML = `<div class="ui-dlg" role="dialog" aria-modal="true">
      <div class="ui-dlg-title"></div>
      <div class="ui-dlg-msg"></div>
      ${o.input ? `<div class="ui-dlg-field"><input class="form-input" ${o.input.type?`type="${o.input.type}"`:''} ${o.input.step?`step="${o.input.step}"`:''} min="0"><span class="ui-dlg-suffix"></span></div>` : ''}
      <div class="ui-dlg-actions">
        <button class="btn btn-ghost" data-act="cancel"></button>
        <button class="btn ${o.danger?'btn-danger':'btn-primary'}" data-act="ok"></button>
      </div>
    </div>`;
    ov.querySelector('.ui-dlg-title').textContent = o.title;
    ov.querySelector('.ui-dlg-msg').textContent = o.message;
    ov.querySelector('[data-act=cancel]').textContent = o.cancelText;
    ov.querySelector('[data-act=ok]').textContent = o.okText;
    const inp = ov.querySelector('input');
    if(inp){ inp.value = o.input.value != null ? o.input.value : ''; inp.placeholder = o.input.placeholder || ''; ov.querySelector('.ui-dlg-suffix').textContent = o.input.suffix || ''; }
    const done = ok => {
      ov.remove();
      resolve(o.input ? (ok ? inp.value : null) : ok);
    };
    ov.addEventListener('click', e=>{
      if(e.target === ov) done(false);
      const act = e.target.closest('[data-act]');
      if(act) done(act.dataset.act === 'ok');
    });
    ov.addEventListener('keydown', e=>{
      if(e.key === 'Escape'){ e.stopPropagation(); done(false); }
      if(e.key === 'Enter' && !(e.target.dataset && e.target.dataset.act === 'cancel')){ e.preventDefault(); done(true); }
    });
    document.body.appendChild(ov);
    setTimeout(()=>{ (inp || ov.querySelector('[data-act=ok]')).focus(); }, 30);
  });
}

/* ---------- Menu lateral recolhível ---------- */
const SIDEBAR_KEY = 'planner_cc_sidebar';
function toggleSidebar(force){
  const on = typeof force === 'boolean' ? force : !document.body.classList.contains('sb-collapsed');
  document.body.classList.toggle('sb-collapsed', on);
  lsSet(SIDEBAR_KEY, on ? '1' : '0');
  if(state.currentTab === 'planner') renderPlanner();
}
if(lsGet(SIDEBAR_KEY) === '1') document.body.classList.add('sb-collapsed');

function overlapsWeek(startStr, endStr, wkStart, wkEnd){
  const s = parseISO(startStr), e = parseISO(endStr);
  return e >= wkStart && s <= wkEnd;
}
function parseISO(s){
  // 'AAAA-MM-DD' (data pura) → meia-noite local; timestamps completos → dia local correspondente
  if(!s) return new Date(NaN);
  const str = String(s);
  const d = /^\d{4}-\d{2}-\d{2}$/.test(str) ? new Date(str + 'T00:00:00') : new Date(str);
  d.setHours(0,0,0,0);
  return d;
}
function progressPercent(t, days){
  const start = parseISO(t.dataInicio);
  const end = parseISO(t.dataEntrega);
  const today = new Date();today.setHours(0,0,0,0);
  if(t.status==='Concluída') return 100;
  if(today<start) return 0;
  if(today>end) return 100;
  const total = (end-start)||1;
  return Math.round(((today-start)/total)*100);
}

function renderCapacity(){
  const cont = document.getElementById('capacityList');
  const {start, end} = getTlRange();
  const counts = {};
  TEAM_MEMBERS.forEach(m=>counts[m]=0);
  state.tasks.forEach(t=>{
    if(!TL_STARTED.includes(t.status)) return;
    if(!t.dataInicio||!t.dataEntrega) return;
    if(overlapsWeek(t.dataInicio,t.dataEntrega,start,end) && counts.hasOwnProperty(t.responsavel)) counts[t.responsavel]++;
  });
  const max = Math.max(1, ...Object.values(counts));
  cont.innerHTML = TEAM_MEMBERS.slice().sort((a,b)=>counts[b]-counts[a]).map(m=>{
    const n = counts[m];
    return `<div class="capacity-row ${n===max && n>0 ? 'is-peak' : ''}">
      ${avatarHTML(m, 30)}
      <div class="capacity-name">${escapeHtml(m)}</div>
      <div class="capacity-bar-wrap"><div class="capacity-bar-fill" style="width:${Math.round(n/max*100)}%"></div></div>
      <div class="capacity-count" title="${n} demanda${n!==1?'s':''}">${n}</div>
    </div>`;
  }).join('');
}

function renderDeliveries(list, segColor){
  const cont = document.getElementById('deliveriesList');
  const today = tlToday();
  const sorted = list.slice().sort((a,b)=>a.dataEntrega.localeCompare(b.dataEntrega));
  document.getElementById('deliveriesSub').textContent = `${sorted.length} no período`;
  if(!sorted.length){ cont.innerHTML = `<div class="dl-empty">Nenhuma entrega prevista neste período.</div>`; return; }
  const LIMIT = 8;
  cont.innerHTML = sorted.slice(0,LIMIT).map(t=>{
    const d = parseISO(t.dataEntrega);
    const cls = d.getTime()===today.getTime() ? 'today' : (d < today ? 'late' : '');
    return `<div class="dl-row" onclick="openTaskModal('${t.id}')">
      <div class="dl-date ${cls}"><div class="d1">${TL_DOW[d.getDay()]}</div><div class="d2">${tlDM(d)}</div></div>
      <div style="min-width:0">
        <div class="dl-name" title="${escapeHtml(t.nome)}">${escapeHtml(t.nome)}</div>
        <div class="dl-meta"><i style="background:${segColor(t.segmento)}"></i>${escapeHtml(t.segmento||'')}<span class="dot">·</span>${escapeHtml(t.responsavel||'—')}</div>
      </div>
      <span class="dl-status">${escapeHtml(t.status)}</span>
    </div>`;
  }).join('') + (sorted.length>LIMIT ? `<div class="dl-more">+ ${sorted.length-LIMIT} outras entregas no período</div>` : '');
}

/* ---------- Modo apresentação (tela cheia, sem menus) ---------- */
function togglePresentation(force){
  const on = typeof force === 'boolean' ? force : !document.body.classList.contains('present');
  document.body.classList.toggle('present', on);
  try{
    if(on && !document.fullscreenElement && document.documentElement.requestFullscreen) document.documentElement.requestFullscreen().catch(()=>{});
    if(!on && document.fullscreenElement && document.exitFullscreen) document.exitFullscreen().catch(()=>{});
  }catch(e){}
}
let tlResizeT = null;
window.addEventListener('resize', ()=>{ clearTimeout(tlResizeT); tlResizeT = setTimeout(()=>{ if(state.currentTab==='planner') renderPlanner(); }, 150); });
document.addEventListener('fullscreenchange', ()=>{
  if(!document.fullscreenElement && document.body.classList.contains('present')) togglePresentation(false);
});

/* ============================================================
   CONCLUÍDOS
   ============================================================ */
function renderConcluidos(){
  const fSeg = document.getElementById('cFilterSegmento').value;
  const fResp = document.getElementById('cFilterResponsavel').value;
  const fTipo = document.getElementById('cFilterTipo').value;
  const items = state.tasks.filter(t=>{
    if(t.status!=='Concluída') return false;
    if(fSeg && t.segmento!==fSeg) return false;
    if(fResp && t.responsavel!==fResp) return false;
    if(fTipo && t.tipo!==fTipo) return false;
    return true;
  }).sort((a,b)=>(b.dataConclusao||'').localeCompare(a.dataConclusao||''));

  const body = document.getElementById('concluidosBody');
  if(items.length===0){
    body.innerHTML = `<tr><td colspan="9" style="text-align:center;padding:30px;color:var(--muted)">Nenhuma tarefa concluída ainda.</td></tr>`;
    return;
  }
  body.innerHTML = items.map(t=>{
    const dias = daysBetween(t.dataInicio, t.dataConclusao || t.dataEntrega);
    return `<tr onclick="openTaskModal('${t.id}')" style="cursor:pointer">
      <td><strong>${escapeHtml(t.nome)}</strong></td>
      <td><span class="${segBadgeClass(t.segmento)}">${escapeHtml(t.segmento)}</span></td>
      <td>${escapeHtml(t.responsavel||'')}</td>
      <td>${escapeHtml(t.tipo||'')}</td>
      <td>${formatDate(t.dataInicio)}</td>
      <td>${formatDate(t.dataEntrega)}</td>
      <td>${dias}</td>
      <td>${t.retrabalhos||0}</td>
      <td onclick="event.stopPropagation()"><button class="btn btn-sm btn-ghost" onclick="deleteTaskById('${t.id}',event)">🗑</button></td>
    </tr>`;
  }).join('');
}
function daysBetween(s,e){
  if(!s||!e) return '—';
  const a = parseISO(s), b = parseISO(e);
  return Math.max(1, Math.round((b-a)/(1000*60*60*24)));
}
function exportCSV(){
  const items = state.tasks.filter(t=>t.status==='Concluída');
  if(items.length===0){toast('Sem tarefas concluídas para exportar','info');return}
  const header = ['Nome','Segmento','Solicitante','Responsável','Tipo','Data Pedido','Data Início','Data Entrega','Duração','Prioridade','Dificuldade','Retrabalhos','Observações'];
  const rows = items.map(t=>[
    t.nome, t.segmento, t.solicitante||'', t.responsavel||'', t.tipo||'',
    t.dataPedido||'', t.dataInicio||'', t.dataEntrega||'', t.duracao||'',
    t.prioridade||'', t.dificuldade||'', t.retrabalhos||0, (t.observacoes||'').replace(/\n/g,' ')
  ]);
  const csv = [header, ...rows].map(r=>r.map(c=>`"${String(c).replace(/"/g,'""')}"`).join(',')).join('\n');
  downloadFile('concluidos_'+todayTag()+'.csv', csv, 'text/csv;charset=utf-8');
  toast('CSV exportado');
}

/* ============================================================
   DASHBOARD
   ============================================================ */
let charts = {};
const MESES_PT = ['jan','fev','mar','abr','mai','jun','jul','ago','set','out','nov','dez'];
const MESES_FULL_PT = ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'];
const DOWS_PT = ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb'];

function ensureDashFilters(){
  if(state.dashFilters) return;
  const now = new Date();
  const isoWeek = (function(d){
    const t = new Date(Date.UTC(d.getFullYear(), d.getMonth(), d.getDate()));
    const dn = t.getUTCDay() || 7;
    t.setUTCDate(t.getUTCDate() + 4 - dn);
    const yr = t.getUTCFullYear();
    const wk = Math.ceil((((t - new Date(Date.UTC(yr,0,1))) / 86400000) + 1)/7);
    return yr + '-W' + String(wk).padStart(2,'0');
  })(now);
  state.dashFilters = {
    periodo: 'year',
    ano: now.getFullYear(),
    mes: now.getMonth(),
    semana: isoWeek,
    dia: tlISO(now),
    segmento: '',
    responsavel: '',
    tipo: '',
    mesesJanelaProd: 12,
    mesesJanelaBacklog: 12,
    semanasJanela: 8,
    mesesJanelaStatus: 12
  };
}

function buildDashFilterOptions(){
  ensureDashFilters();
  const f = state.dashFilters;
  const all = state.tasks;

  // Anos a partir dos dados
  const years = new Set([new Date().getFullYear()]);
  all.forEach(t=>{
    ['createdAt','dataConclusao','dataEntrega','dataInicio'].forEach(k=>{
      const v = t[k];
      const d = parseTaskDate(v);
      if(d) years.add(d.getFullYear());
    });
  });
  const yArr = [...years].sort((a,b)=>b-a);
  const yEl = document.getElementById('dashAno');
  yEl.innerHTML = yArr.map(y=>`<option value="${y}">${y}</option>`).join('');
  yEl.value = String(f.ano);

  const mEl = document.getElementById('dashMes');
  mEl.innerHTML = MESES_FULL_PT.map((m,i)=>`<option value="${i}">${m}</option>`).join('');
  mEl.value = String(f.mes);

  document.getElementById('dashSemana').value = f.semana;
  document.getElementById('dashDia').value = f.dia;

  // Segmento, Responsável, Tipo
  const segs = [...new Set(all.map(t=>t.segmento).filter(Boolean))].sort();
  document.getElementById('dashSeg').innerHTML =
    '<option value="">Todos</option>' +
    segs.map(s=>`<option value="${s}">${s}</option>`).join('');
  document.getElementById('dashSeg').value = f.segmento;

  const resps = [...new Set(all.map(t=>t.responsavel).filter(Boolean))].sort();
  document.getElementById('dashResp').innerHTML =
    '<option value="">Todos</option>' +
    resps.map(s=>`<option value="${s}">${s}</option>`).join('');
  document.getElementById('dashResp').value = f.responsavel;

  const tipos = [...new Set(all.map(t=>t.tipo).filter(Boolean))].sort();
  document.getElementById('dashTipo').innerHTML =
    '<option value="">Todos</option>' +
    tipos.map(s=>`<option value="${s}">${s}</option>`).join('');
  document.getElementById('dashTipo').value = f.tipo;

  // Sliders por gráfico
  const sP = document.getElementById('sliderProd');
  const sPL = document.getElementById('sliderProdLabel');
  if(sP){ sP.value = String(f.mesesJanelaProd || 12); if(sPL) sPL.textContent = (f.mesesJanelaProd||12) + ' mes' + ((f.mesesJanelaProd||12)===1?'':'es'); }
  const sB = document.getElementById('sliderBacklog');
  const sBL = document.getElementById('sliderBacklogLabel');
  if(sB){ sB.value = String(f.mesesJanelaBacklog || 12); if(sBL) sBL.textContent = (f.mesesJanelaBacklog||12) + ' mes' + ((f.mesesJanelaBacklog||12)===1?'':'es'); }
  const sS = document.getElementById('sliderSemanas');
  const sSL = document.getElementById('sliderSemanasLabel');
  if(sS){ sS.value = String(f.semanasJanela || 8); if(sSL) sSL.textContent = (f.semanasJanela||8) + ' semana' + ((f.semanasJanela||8)===1?'':'s'); }
  const sSt = document.getElementById('sliderStatus');
  const sStL = document.getElementById('sliderStatusLabel');
  if(sSt){ sSt.value = String(f.mesesJanelaStatus || 12); if(sStL) sStL.textContent = (f.mesesJanelaStatus||12) + ' mes' + ((f.mesesJanelaStatus||12)===1?'':'es'); }

  // Preset ativo + visibilidade dos grupos
  document.querySelectorAll('#dashPreset button').forEach(b=>{
    b.classList.toggle('active', b.dataset.preset === f.periodo);
  });
  document.getElementById('grpAno').style.display    = (f.periodo==='all') ? 'none' : 'flex';
  document.getElementById('grpMes').style.display    = (f.periodo==='month') ? 'flex' : 'none';
  document.getElementById('grpSemana').style.display = (f.periodo==='week') ? 'flex' : 'none';
  document.getElementById('grpDia').style.display    = (f.periodo==='day') ? 'flex' : 'none';
}

function bindDashFilterEvents(){
  document.querySelectorAll('#dashPreset button').forEach(b=>{
    b.onclick = ()=>{
      state.dashFilters.periodo = b.dataset.preset;
      renderDashboard();
    };
  });
  document.getElementById('dashAno').onchange    = e=>{state.dashFilters.ano = +e.target.value; renderDashboard();};
  document.getElementById('dashMes').onchange    = e=>{state.dashFilters.mes = +e.target.value; renderDashboard();};
  document.getElementById('dashSemana').onchange = e=>{state.dashFilters.semana = e.target.value; renderDashboard();};
  document.getElementById('dashDia').onchange    = e=>{state.dashFilters.dia = e.target.value; renderDashboard();};
  document.getElementById('dashSeg').onchange    = e=>{state.dashFilters.segmento = e.target.value; renderDashboard();};
  document.getElementById('dashResp').onchange   = e=>{state.dashFilters.responsavel = e.target.value; renderDashboard();};
  document.getElementById('dashTipo').onchange   = e=>{state.dashFilters.tipo = e.target.value; renderDashboard();};
  function bindSlider(id, labelId, key, min, max, unit){
    const sl = document.getElementById(id);
    const lb = document.getElementById(labelId);
    if(!sl) return;
    sl.oninput = e=>{
      const v = Math.max(min, Math.min(max, +e.target.value || max));
      state.dashFilters[key] = v;
      if(lb) lb.textContent = v + ' ' + unit + (v===1?'':(unit==='mes'?'es':'s'));
    };
    sl.onchange = e=>{
      const v = Math.max(min, Math.min(max, +e.target.value || max));
      state.dashFilters[key] = v;
      renderDashboard();
    };
  }
  bindSlider('sliderProd',    'sliderProdLabel',    'mesesJanelaProd',    1, 12, 'mes');
  bindSlider('sliderBacklog', 'sliderBacklogLabel', 'mesesJanelaBacklog', 1, 12, 'mes');
  bindSlider('sliderSemanas', 'sliderSemanasLabel', 'semanasJanela',      1,  8, 'semana');
  bindSlider('sliderStatus',  'sliderStatusLabel',  'mesesJanelaStatus',  1, 12, 'mes');
}

function resetDashFilters(){
  const now = new Date();
  state.dashFilters = null;
  ensureDashFilters();
  renderDashboard();
}

function isoWeekToRange(iso){
  // iso = 'YYYY-Www'
  const m = /^(\d{4})-W(\d{2})$/.exec(iso || '');
  if(!m) return null;
  const year = +m[1], week = +m[2];
  // ISO week 1 contains Jan 4
  const jan4 = new Date(Date.UTC(year, 0, 4));
  const jan4Dow = jan4.getUTCDay() || 7;
  const week1Mon = new Date(jan4); week1Mon.setUTCDate(jan4.getUTCDate() - (jan4Dow-1));
  const start = new Date(week1Mon); start.setUTCDate(week1Mon.getUTCDate() + (week-1)*7);
  const end = new Date(start); end.setUTCDate(start.getUTCDate() + 7);
  return {start: new Date(start.getUTCFullYear(), start.getUTCMonth(), start.getUTCDate()),
          end:   new Date(end.getUTCFullYear(),   end.getUTCMonth(),   end.getUTCDate())};
}

function getDashRange(){
  const f = state.dashFilters;
  if(!f || f.periodo === 'all') return null;
  if(f.periodo === 'year'){
    return {start:new Date(f.ano,0,1), end:new Date(f.ano+1,0,1), label:`Ano ${f.ano}`};
  }
  if(f.periodo === 'month'){
    return {start:new Date(f.ano,f.mes,1), end:new Date(f.ano,f.mes+1,1),
            label:`${MESES_FULL_PT[f.mes]} de ${f.ano}`};
  }
  if(f.periodo === 'week'){
    const r = isoWeekToRange(f.semana);
    if(!r) return null;
    return {...r, label:`Semana ${f.semana}`};
  }
  if(f.periodo === 'day'){
    if(!f.dia) return null;
    const s = new Date(f.dia + 'T00:00:00');
    const e = new Date(s); e.setDate(s.getDate()+1);
    const [y,m,d] = f.dia.split('-');
    return {start:s, end:e, label:`${d}/${m}/${y}`};
  }
  return null;
}

function parseTaskDate(s){ if(!s) return null; const d = /^\d{4}-\d{2}-\d{2}$/.test(String(s)) ? new Date(s + 'T00:00:00') : new Date(s); return isNaN(d)?null:d; }

function taskTouchedInRange(t, range){
  if(!range) return true;
  const ds = [t.dataConclusao, t.dataEntrega, t.dataInicio, t.createdAt]
    .map(parseTaskDate).filter(Boolean);
  return ds.some(d => d >= range.start && d < range.end);
}
function taskCompletedInRange(t, range){
  if(t.status !== 'Concluída') return false;
  const d = parseTaskDate(t.dataConclusao) || parseTaskDate(t.dataEntrega);
  if(!d) return false;
  if(!range) return true;
  return d >= range.start && d < range.end;
}
function taskCreatedInRange(t, range){
  const d = parseTaskDate(t.createdAt);
  if(!d) return false;
  if(!range) return true;
  return d >= range.start && d < range.end;
}

function applyAttrFilters(arr){
  const f = state.dashFilters;
  return arr.filter(t=>{
    if(f.segmento && t.segmento !== f.segmento) return false;
    if(f.responsavel && t.responsavel !== f.responsavel) return false;
    if(f.tipo && t.tipo !== f.tipo) return false;
    return true;
  });
}

function renderDashboard(){
  ensureDashFilters();
  buildDashFilterOptions();
  bindDashFilterEvents();

  const range = getDashRange();
  const f = state.dashFilters;

  // Universe: tasks matching attr filters (seg/resp/tipo)
  const universe = applyAttrFilters(state.tasks);

  // Touched in period = encostou no período (criação/início/entrega/conclusão)
  const touched   = universe.filter(t => taskTouchedInRange(t, range));
  // Concluídas no período (dataConclusao OR dataEntrega para concluídas)
  const completed = universe.filter(t => taskCompletedInRange(t, range));
  // Criadas no período (createdAt)
  const created   = universe.filter(t => taskCreatedInRange(t, range));

  // Active workload (estado AGORA, ignora range)
  const today = new Date(); today.setHours(0,0,0,0);
  const andamento  = universe.filter(t => ['Em andamento','Em revisão','Correção'].includes(t.status)).length;
  const aguardando = universe.filter(t => t.status === 'Aguardando').length;
  const atrasadas  = universe.filter(t => t.status !== 'Concluída' && t.dataEntrega && parseISO(t.dataEntrega) < today).length;

  // Tempo médio das concluídas no período (dataInicio → dataConclusao/dataEntrega)
  let leadDays = [];
  completed.forEach(t=>{
    const s = parseTaskDate(t.dataInicio);
    const e = parseTaskDate(t.dataConclusao) || parseTaskDate(t.dataEntrega);
    if(s && e && e>=s){ leadDays.push((e-s)/86400000); }
  });
  const leadAvg = leadDays.length ? (leadDays.reduce((a,b)=>a+b,0)/leadDays.length).toFixed(1) : '—';

  // % no prazo (dataConclusao <= dataEntrega) dos concluídos do período
  let onTime = 0, evaluated = 0;
  completed.forEach(t=>{
    const conc = parseTaskDate(t.dataConclusao);
    const due  = parseTaskDate(t.dataEntrega);
    if(conc && due){ evaluated++; if(conc <= due) onTime++; }
  });
  const onTimePct = evaluated ? Math.round(onTime/evaluated*100) + '%' : '—';

  // Produção média por dia útil
  let perDay = '—';
  if(range){
    let busDays = 0;
    const tmp = new Date(range.start);
    while(tmp < range.end){
      const dow = tmp.getDay();
      if(dow !== 0 && dow !== 6) busDays++;
      tmp.setDate(tmp.getDate()+1);
    }
    if(busDays>0) perDay = (completed.length/busDays).toFixed(1);
  }

  // Range info
  const rangeLabel = range ? range.label : 'Todo o histórico';
  document.getElementById('dashRangeInfo').textContent =
    `Período: ${rangeLabel} · ${touched.length} demandas tocadas · ${completed.length} concluídas · ${created.length} criadas`;

  // KPIs de horas (período = concluídas no range com horas preenchidas)
  const horasNoPeriodo = completed
    .filter(t => t.horasReais != null && t.horasReais !== '')
    .map(t => parseFloat(t.horasReais) || 0);
  const somaHoras = horasNoPeriodo.reduce((a,b)=>a+b, 0);
  const mediaHoras = horasNoPeriodo.length ? (somaHoras/horasNoPeriodo.length).toFixed(1) : '—';
  const coberturaHoras = completed.length ? Math.round((horasNoPeriodo.length/completed.length)*100) : 0;

  // KPIs
  document.getElementById('kpiGrid').innerHTML = `
    <div class="kpi-card green"><div class="kpi-label">Concluídas no período</div><div class="kpi-value">${completed.length}</div><div class="kpi-sub">entregas finalizadas</div></div>
    <div class="kpi-card blue"><div class="kpi-label">Tocadas no período</div><div class="kpi-value">${touched.length}</div><div class="kpi-sub">criadas + ativas + entregues</div></div>
    <div class="kpi-card cyan"><div class="kpi-label">Criadas no período</div><div class="kpi-value">${created.length}</div><div class="kpi-sub">novas demandas</div></div>
    <div class="kpi-card orange"><div class="kpi-label">Em andamento agora</div><div class="kpi-value">${andamento}</div><div class="kpi-sub">no Gantt</div></div>
    <div class="kpi-card"><div class="kpi-label">Aguardando agora</div><div class="kpi-value">${aguardando}</div><div class="kpi-sub">no backlog</div></div>
    <div class="kpi-card red"><div class="kpi-label">Atrasadas</div><div class="kpi-value">${atrasadas}</div><div class="kpi-sub">passaram da entrega</div></div>
    <div class="kpi-card"><div class="kpi-label">Lead time médio</div><div class="kpi-value">${leadAvg}</div><div class="kpi-sub">dias entre início e entrega</div></div>
    <div class="kpi-card"><div class="kpi-label">% no prazo</div><div class="kpi-value">${onTimePct}</div><div class="kpi-sub">conclusão ≤ entrega</div></div>
    <div class="kpi-card"><div class="kpi-label">Produção/dia útil</div><div class="kpi-value">${perDay}</div><div class="kpi-sub">média no período</div></div>
    <div class="kpi-card orange"><div class="kpi-label">Horas trabalhadas</div><div class="kpi-value">${somaHoras.toFixed(1)}h</div><div class="kpi-sub">${horasNoPeriodo.length} de ${completed.length} preenchidas (${coberturaHoras}%)</div></div>
    <div class="kpi-card"><div class="kpi-label">Horas/demanda</div><div class="kpi-value">${mediaHoras}${mediaHoras!=='—'?'h':''}</div><div class="kpi-sub">média entre concluídas com horas</div></div>
  `;

  // destruir gráficos antigos
  Object.values(charts).forEach(c=>c && c.destroy && c.destroy());
  charts = {};
  const textColor = state.theme==='dark' ? '#e8eaf2' : '#333';
  Chart.defaults.color = textColor;
  Chart.defaults.borderColor = state.theme==='dark' ? '#2a3147' : '#e3e3e3';

  // ===== Helper: gera buckets de N meses ancorados no período =====
  function buildMonthBuckets(janela){
    janela = Math.max(1, Math.min(12, janela || 12));
    let buckets;
    if(f.periodo === 'all'){
      const now = new Date();
      buckets = [];
      for(let i=janela-1;i>=0;i--) buckets.push(new Date(now.getFullYear(), now.getMonth()-i, 1));
    } else if(f.periodo === 'year'){
      const nowY = new Date().getFullYear();
      const anchorMonth = (f.ano === nowY) ? new Date().getMonth() : 11;
      buckets = [];
      for(let i=janela-1;i>=0;i--) buckets.push(new Date(f.ano, anchorMonth-i, 1));
    } else {
      const refMes = (f.periodo === 'month') ? f.mes
                    : (f.periodo === 'day' && f.dia) ? (new Date(f.dia+'T00:00:00').getMonth())
                    : new Date().getMonth();
      const refAno = (f.periodo === 'month' || f.periodo === 'day') ? f.ano : new Date().getFullYear();
      buckets = [];
      for(let i=janela-1;i>=0;i--) buckets.push(new Date(refAno, refMes-i, 1));
    }
    const labels = buckets.map(m => MESES_PT[m.getMonth()] + '/' + String(m.getFullYear()).slice(-2));
    const ends = buckets.map(m => new Date(m.getFullYear(), m.getMonth()+1, 1));
    return {buckets, labels, ends};
  }
  function countByMonthArr(arr, datePicker, buckets, ends){
    return buckets.map((s,i)=>{
      const e = ends[i];
      return arr.filter(t=>{
        const d = datePicker(t);
        return d && d>=s && d<e;
      }).length;
    });
  }

  // ===== Produção mensal — janela própria =====
  const prodWin = buildMonthBuckets(f.mesesJanelaProd || 12);
  const compByMonth = countByMonthArr(
    universe.filter(t=>t.status==='Concluída'),
    t=>parseTaskDate(t.dataConclusao) || parseTaskDate(t.dataEntrega),
    prodWin.buckets, prodWin.ends
  );
  charts.prodMes = new Chart(document.getElementById('chartProducaoMensal'),{
    type:'bar',
    data:{
      labels: prodWin.labels,
      datasets:[
        {label:'Concluídas', data:compByMonth, backgroundColor:'#FF6200'}
      ]
    },
    options:{plugins:{legend:{display:false}}, scales:{y:{beginAtZero:true,ticks:{stepSize:1}}}}
  });

  // ===== Backlog mensal (demandas criadas) — barras agrupadas por segmento, janela própria =====
  const backWin = buildMonthBuckets(f.mesesJanelaBacklog || 12);
  const monthLabelsBacklog = backWin.labels;
  const SEG_ORDER = ['Asset','Private','Íon','Varejo','Banco de Ideias','Gaveta'];
  const segsPresent = SEG_ORDER.filter(s => universe.some(t => t.segmento === s));
  const backlogDatasets = segsPresent.map(seg => ({
    label: seg,
    data: countByMonthArr(universe.filter(t=>t.segmento===seg), t=>parseTaskDate(t.createdAt), backWin.buckets, backWin.ends),
    backgroundColor: SEG_COLOR[seg] || '#888'
  }));
  charts.backlogMes = new Chart(document.getElementById('chartBacklogMensal'),{
    type:'bar',
    data:{ labels: monthLabelsBacklog, datasets: backlogDatasets },
    options:{
      plugins:{ legend:{ position:'bottom' } },
      scales:{
        y:{ beginAtZero:true, ticks:{ stepSize:1 } }
      }
    }
  });

  // ===== Fluxo semanal — barras (concluídas) + linha (saldo = criadas - concluídas) =====
  // Âncora = menor entre fim do range e hoje (nunca avança no futuro)
  const semWin = Math.max(1, Math.min(8, f.semanasJanela || 8));
  const todayAnchor = new Date();
  const rawAnchor = range ? new Date(range.end.getTime()-1) : todayAnchor;
  const anchor = (rawAnchor > todayAnchor) ? todayAnchor : rawAnchor;
  const weeks = [];
  for(let i=semWin-1;i>=0;i--){
    const ref = new Date(anchor); ref.setDate(ref.getDate()-i*7);
    weeks.push(startOfWeek(ref));
  }
  const weekLabels = weeks.map(w => formatDateShort(w));
  const concWeek = weeks.map(w => countInWeek(universe.filter(t=>t.status==='Concluída'), w, 'dataConclusao','dataEntrega'));
  const newWeek  = weeks.map(w => countInWeek(universe, w, 'createdAt'));
  const saldoWeek = newWeek.map((n,i) => n - concWeek[i]);
  // Eixo do saldo simétrico em torno do zero
  const saldoMax = Math.max(1, ...saldoWeek.map(v => Math.abs(v)));
  charts.evo = new Chart(document.getElementById('chartEvolucao'),{
    data:{
      labels: weekLabels,
      datasets:[
        {
          type:'bar', label:'Concluídas (produção)',
          data:concWeek, backgroundColor:'rgba(255,98,0,.55)',
          borderColor:'#FF6200', borderWidth:1, yAxisID:'y', order:2
        },
        {
          type:'line', label:'Saldo (criadas − concluídas)',
          data:saldoWeek, borderColor:'#111827', backgroundColor:'rgba(216,67,21,.18)',
          tension:.25, yAxisID:'ySaldo',
          pointRadius:4, pointBackgroundColor:'#111827', borderWidth:2.5,
          fill:{ target:{value:0}, above:'rgba(216,67,21,.18)', below:'rgba(46,125,80,.18)' },
          order:1
        }
      ]
    },
    options:{
      plugins:{
        legend:{position:'bottom'},
        tooltip:{callbacks:{
          afterBody:(items)=>{
            const i = items[0].dataIndex;
            const s = saldoWeek[i];
            if(s > 0) return '↑ backlog cresceu '+s;
            if(s < 0) return '↓ queimou '+Math.abs(s)+' do backlog';
            return 'ritmo equilibrado';
          }
        }}
      },
      scales:{
        y:{ position:'left', beginAtZero:true, ticks:{stepSize:1},
            title:{display:true, text:'Concluídas'} },
        ySaldo:{ position:'right', grid:{color:(ctx)=> ctx.tick.value===0 ? '#9CA3AF' : 'transparent'},
                 suggestedMin:-saldoMax, suggestedMax:saldoMax,
                 ticks:{stepSize:1},
                 title:{display:true, text:'Saldo (+ acumula / − queima)'} }
      }
    }
  });

  // ===== Dia da semana (conclusões) =====
  const dowCounts = [0,0,0,0,0,0,0];
  completed.forEach(t=>{
    const d = parseTaskDate(t.dataConclusao) || parseTaskDate(t.dataEntrega);
    if(d) dowCounts[d.getDay()]++;
  });
  // Reordenar para Seg..Dom
  const dowOrdered = [dowCounts[1],dowCounts[2],dowCounts[3],dowCounts[4],dowCounts[5],dowCounts[6],dowCounts[0]];
  charts.dow = new Chart(document.getElementById('chartDiaSemana'),{
    type:'bar',
    data:{
      labels:['Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
      datasets:[{label:'Concluídas',data:dowOrdered,backgroundColor:'#FF6200'}]
    },
    options:{plugins:{legend:{display:false}}, scales:{y:{beginAtZero:true,ticks:{stepSize:1}}}}
  });

  // ===== Por Segmento (donut) — tocadas no período =====
  const bySeg = groupCount(touched,'segmento');
  charts.seg = new Chart(document.getElementById('chartSegmento'),{
    type:'doughnut',
    data:{labels:Object.keys(bySeg),datasets:[{data:Object.values(bySeg),
      backgroundColor:Object.keys(bySeg).map(k=>SEG_COLOR[k]||'#888')}]},
    options:{plugins:{legend:{position:'bottom'}}}
  });

  // ===== Por Responsável =====
  const byResp = groupCount(touched,'responsavel');
  charts.resp = new Chart(document.getElementById('chartResponsavel'),{
    type:'bar',
    data:{labels:Object.keys(byResp),datasets:[{label:'Demandas',data:Object.values(byResp),backgroundColor:'#FF6200'}]},
    options:{plugins:{legend:{display:false}}, indexAxis:'y', scales:{x:{beginAtZero:true,ticks:{stepSize:1}}}}
  });

  // ===== Por Tipo =====
  const byTipo = groupCount(touched,'tipo');
  charts.tipo = new Chart(document.getElementById('chartTipo'),{
    type:'bar',
    data:{labels:Object.keys(byTipo),datasets:[{label:'Demandas',data:Object.values(byTipo),backgroundColor:'#6B7280'}]},
    options:{plugins:{legend:{display:false}}, indexAxis:'y', scales:{x:{beginAtZero:true,ticks:{stepSize:1}}}}
  });

  // ===== Status × Idade =====
  // Universo do GRÁFICO: demandas ATIVAS agora (estado-presente, sem janela).
  // Universo do KPI lateral: Concluídas dentro da janela do slider.
  const statusWinN = Math.max(1, Math.min(12, f.mesesJanelaStatus || 12));
  const statusAnchorEnd = new Date(); statusAnchorEnd.setHours(0,0,0,0);
  statusAnchorEnd.setMonth(statusAnchorEnd.getMonth()+1, 1); // início do mês seguinte
  const statusStart = new Date(statusAnchorEnd.getFullYear(), statusAnchorEnd.getMonth()-statusWinN, 1);
  const concludedRange = {start: statusStart, end: statusAnchorEnd};

  const statusUniverse = universe.filter(t => t.status !== 'Concluída');
  const concludedCount = universe.filter(t =>
    t.status === 'Concluída' && taskCompletedInRange(t, concludedRange)
  ).length;
  const byStatus = groupCount(statusUniverse,'status');
  // --- Aging: idade em dias da demanda ativa ---
  // âncora = dataInicio || dataPedido || createdAt; ref = hoje
  const ageRefMs = Date.now();
  function ageDays(t){
    const anchor = parseTaskDate(t.dataInicio) || parseTaskDate(t.dataPedido) || parseTaskDate(t.createdAt);
    if(!anchor) return null;
    return Math.max(0, Math.floor((ageRefMs - anchor.getTime())/86400000));
  }
  const ageBands = [
    {key:'≤ 7 dias',     test:d => d!=null && d<=7,            color:'#86EFAC'}, // verde
    {key:'8–14 dias',    test:d => d!=null && d>7  && d<=14,   color:'#FBBF24'}, // amarelo
    {key:'15–30 dias',   test:d => d!=null && d>14 && d<=30,   color:'#FB923C'}, // laranja
    {key:'> 30 dias',    test:d => d!=null && d>30,            color:'#EF4444'}, // vermelho
  ];
  const statusOrder = ['Aguardando','Em andamento','Em revisão','Correção'];
  const statusLabels = statusOrder.filter(s => (byStatus[s]||0) > 0);
  const tasksByStatus = {};
  statusLabels.forEach(s => { tasksByStatus[s] = statusUniverse.filter(t => t.status === s); });
  const datasets = ageBands.map(band => ({
    label: band.key,
    backgroundColor: band.color,
    borderWidth: 0,
    data: statusLabels.map(s => tasksByStatus[s].filter(t => band.test(ageDays(t))).length),
  }));
  charts.status = new Chart(document.getElementById('chartStatus'),{
    type:'bar',
    data:{labels:statusLabels, datasets},
    options:{
      indexAxis:'y',
      plugins:{
        legend:{position:'bottom', labels:{boxWidth:12, font:{size:11}}},
        tooltip:{callbacks:{
          footer:(items)=>{
            const tot = items.reduce((a,i)=>a+i.parsed.x,0);
            return 'Total: ' + tot;
          }
        }}
      },
      scales:{
        x:{stacked:true, beginAtZero:true, ticks:{stepSize:1}},
        y:{stacked:true}
      }
    }
  });
  const sdv = document.getElementById('statusDoneValue');
  if(sdv) sdv.textContent = concludedCount;
  const sds = document.getElementById('statusDoneSub');
  if(sds){
    sds.textContent = 'últimos ' + statusWinN + ' mes' + (statusWinN===1?'':'es');
  }

  // ===== Tempo médio por tipo (dias) =====
  const tempoMap = {};
  completed.forEach(t=>{
    const s = parseTaskDate(t.dataInicio);
    const e = parseTaskDate(t.dataConclusao) || parseTaskDate(t.dataEntrega);
    if(s && e && e>=s){
      const days = (e-s)/86400000;
      const k = t.tipo || '(sem tipo)';
      if(!tempoMap[k]) tempoMap[k] = {sum:0,n:0};
      tempoMap[k].sum += days; tempoMap[k].n++;
    }
  });
  const tipos = Object.keys(tempoMap);
  const avgs = tipos.map(k => +(tempoMap[k].sum/tempoMap[k].n).toFixed(1));
  charts.tempo = new Chart(document.getElementById('chartTempo'),{
    type:'bar',
    data:{labels:tipos.length?tipos:['(sem dados)'],
      datasets:[{label:'Dias',data:avgs.length?avgs:[0],backgroundColor:'#6B7280'}]},
    options:{plugins:{legend:{display:false}}, indexAxis:'y', scales:{x:{beginAtZero:true}}}
  });

  // ===== Horas trabalhadas por responsável =====
  const horasResp = {};
  completed.forEach(t=>{
    if(t.horasReais == null || t.horasReais === '') return;
    const r = t.responsavel || '(sem responsável)';
    horasResp[r] = (horasResp[r] || 0) + (parseFloat(t.horasReais) || 0);
  });
  const respLabels = Object.keys(horasResp);
  const respVals = respLabels.map(k => +horasResp[k].toFixed(1));
  charts.horasResp = new Chart(document.getElementById('chartHorasResp'),{
    type:'bar',
    data:{
      labels: respLabels.length ? respLabels : ['(sem dados)'],
      datasets:[{label:'Horas', data: respVals.length ? respVals : [0], backgroundColor:'#FF6200'}]
    },
    options:{
      indexAxis:'y',
      plugins:{
        legend:{display:false},
        tooltip:{callbacks:{label:(c)=>c.parsed.x + 'h'}}
      },
      scales:{x:{beginAtZero:true, ticks:{callback:(v)=>v+'h'}}}
    }
  });

  // ===== Estimado × Realizado por tipo (horas) =====
  // Estimado = duracao (dias úteis) × 8h. Realizado = horasReais.
  // Só considera concluídas que TÊM horasReais preenchidas (comparação justa).
  const hourCompare = {};
  completed.forEach(t=>{
    if(t.horasReais == null || t.horasReais === '') return;
    const k = t.tipo || '(sem tipo)';
    if(!hourCompare[k]) hourCompare[k] = {est:0, real:0, n:0};
    hourCompare[k].est  += (parseInt(t.duracao) || 0) * 8;
    hourCompare[k].real += parseFloat(t.horasReais) || 0;
    hourCompare[k].n++;
  });
  const compTipos = Object.keys(hourCompare);
  const compEst  = compTipos.map(k => +(hourCompare[k].est / hourCompare[k].n).toFixed(1));
  const compReal = compTipos.map(k => +(hourCompare[k].real / hourCompare[k].n).toFixed(1));
  charts.horasTipo = new Chart(document.getElementById('chartHorasTipo'),{
    type:'bar',
    data:{
      labels: compTipos.length ? compTipos : ['(sem dados)'],
      datasets:[
        {label:'Estimado (média)', data: compEst.length ? compEst : [0], backgroundColor:'#9CA3AF'},
        {label:'Realizado (média)', data: compReal.length ? compReal : [0], backgroundColor:'#FF6200'}
      ]
    },
    options:{
      indexAxis:'y',
      plugins:{
        legend:{position:'bottom', labels:{boxWidth:12, font:{size:11}}},
        tooltip:{callbacks:{label:(c)=>c.dataset.label+': '+c.parsed.x+'h'}}
      },
      scales:{x:{beginAtZero:true, ticks:{callback:(v)=>v+'h'}}}
    }
  });
}
function startOfWeek(d){
  const x = new Date(d); x.setHours(0,0,0,0);
  const day = x.getDay();
  x.setDate(x.getDate() + (day===0 ? -6 : 1-day));
  return x;
}
function countInWeek(arr, monday, ...keys){
  const next = new Date(monday); next.setDate(monday.getDate()+7);
  return arr.filter(t=>{
    for(const k of keys){
      const d = parseTaskDate(t[k]);
      if(d && d>=monday && d<next) return true;
    }
    return false;
  }).length;
}
function groupCount(arr,key){
  const m = {};
  arr.forEach(t=>{const k=t[key]||'(vazio)';m[k]=(m[k]||0)+1});
  return m;
}

/* ============================================================
   IMPORT / EXPORT JSON (compartilhamento via OneDrive)
   ============================================================ */
function exportJSON(){
  const data = {
    exportedAt:new Date().toISOString(),
    version:'1.0',
    tasks:state.tasks.map(stripSp)
  };
  downloadFile('planner_dados_'+todayTag()+'.json', JSON.stringify(data,null,2), 'application/json');
  toast('Backup JSON exportado');
}
function importJSON(e){
  const file = e.target.files[0];
  if(!file) return;
  const reader = new FileReader();
  reader.onload = async ev=>{
    try{
      const data = JSON.parse(ev.target.result);
      if(!Array.isArray(data.tasks)) throw new Error('JSON inválido');
      if(!await uiDialog({title:'Importar tarefas', message:`Importar ${data.tasks.length} tarefa(s)? Isso substituirá os dados atuais.`, okText:'Importar'})) return;
      state.tasks = data.tasks.map(stripSp);
      saveState();
      renderCurrent();
      toast(`${data.tasks.length} tarefa(s) importada(s)`);
    }catch(err){
      toast('Falha ao importar: '+err.message,'error');
    }
  };
  reader.readAsText(file);
  e.target.value = '';
}

/* ============================================================
   UTIL
   ============================================================ */
function downloadFile(name, content, type){
  const blob = new Blob([content],{type});
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url; a.download = name; a.click();
  setTimeout(()=>URL.revokeObjectURL(url), 1000);
}
function formatDate(d){
  if(!d) return '—';
  const date = (d instanceof Date) ? d : parseTaskDate(d);
  if(!date || isNaN(date)) return '—';
  return date.toLocaleDateString('pt-BR',{day:'2-digit',month:'2-digit'});
}
function formatDateShort(d){
  return d.toLocaleDateString('pt-BR',{day:'2-digit',month:'2-digit'});
}
function todayTag(){return tlISO(new Date())}
function escapeHtml(s){return (s===null||s===undefined?'':String(s)).replace(/[&<>"]/g, c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;'}[c]))}
function truncate(s,n){return s && s.length>n ? s.slice(0,n-1)+'…' : (s||'')}
function toast(msg, type='success'){
  const el = document.createElement('div');
  el.className = 'toast '+(type==='success'?'':type);
  el.textContent = msg;
  document.getElementById('toastStack').appendChild(el);
  setTimeout(()=>{el.style.opacity='0';el.style.transition='opacity .3s';setTimeout(()=>el.remove(),300)},2800);
}

/* ============================================================
   INIT
   ============================================================ */
populateResponsavelSelect();
boot();


/* ============================================================
   DESIGN V2 — sidebar sync + segment badge rewrite
   ============================================================ */
const PAGE_META = {
  backlog:    {title:'Backlog',     sub:'Demandas aguardando início, agrupadas por segmento'},
  planner:    {title:'Planner',     sub:'Linha do tempo das demandas em produção'},
  concluidos: {title:'Concluídos',  sub:'Histórico de tarefas finalizadas'},
  dashboard:  {title:'Dashboard',   sub:'Volume e ritmo do que a coordenação entrega'}
};

(function patchSwitchTab(){
  const original = window.switchTab;
  window.switchTab = function(tab){
    original(tab);
    document.querySelectorAll('.sidebar-item').forEach(el=>{
      el.classList.toggle('active', el.dataset.tab === tab);
    });
    const meta = PAGE_META[tab];
    if(meta){
      document.getElementById('topbarTitle').textContent = meta.title;
      document.getElementById('topbarSub').textContent = meta.sub;
    }
    // Esconder os page-header antigos (título duplicado)
    document.querySelectorAll('.page .page-header > div:first-child').forEach(el=>{
      el.style.display='none';
    });
  };
})();

function segBadgeClass(seg){
  return 'seg-badge seg-' + String(seg||'').replace(/\s+/g,'-');
}

// Botão "Reabrir" na tabela de concluídos
(function addReabrir(){
  const originalRender = window.renderConcluidos;
  if(typeof originalRender !== 'function') return;
  window.renderConcluidos = function(){
    originalRender();
    document.querySelectorAll('#concluidosBody tr').forEach(tr=>{
      const lastCell = tr.querySelector('td:last-child');
      if(!lastCell || lastCell.querySelector('.btn-reabrir')) return;
      const tid = (tr.getAttribute('onclick')||'').match(/openTaskModal\('([^']+)'\)/);
      if(!tid) return;
      const btn = document.createElement('button');
      btn.className = 'btn btn-success btn-sm btn-reabrir';
      btn.textContent = 'Reabrir';
      btn.style.marginRight = '6px';
      btn.onclick = (e)=>{
        e.stopPropagation();
        const task = state.tasks.find(t=>t.id===tid[1]);
        if(!task) return;
        task.status = 'Em andamento';
        delete task.dataConclusao;
        saveState();
        renderCurrent();
        toast(`"${task.nome}" reaberta`);
      };
      lastCell.insertBefore(btn, lastCell.firstChild);
    });
  };
})();

// ===== Auto-preencher Data de Entrega a partir de Início + Duração (dias úteis) =====
(function autoFillDataEntrega(){
  function addBusinessDays(isoDate, n){
    // n = "dias úteis" totais a partir do início. duracao=1 → mesmo dia.
    if(!isoDate) return '';
    const [y,m,d] = isoDate.split('-').map(Number);
    const dt = new Date(y, m-1, d);
    if(isNaN(dt.getTime())) return '';
    let remaining = Math.max(1, n) - 1; // o próprio dia de início já conta como dia útil 1
    while(remaining > 0){
      dt.setDate(dt.getDate() + 1);
      const dow = dt.getDay(); // 0=dom 6=sáb
      if(dow !== 0 && dow !== 6) remaining--;
    }
    const yy = dt.getFullYear();
    const mm = String(dt.getMonth()+1).padStart(2,'0');
    const dd = String(dt.getDate()).padStart(2,'0');
    return `${yy}-${mm}-${dd}`;
  }

  function recalc(form){
    const inicio = form.dataInicio && form.dataInicio.value;
    const duracao = parseInt(form.duracao && form.duracao.value, 10);
    if(!inicio || !duracao || duracao < 1) return;
    const novaEntrega = addBusinessDays(inicio, duracao);
    if(novaEntrega) form.dataEntrega.value = novaEntrega;
  }

  function wire(){
    const form = document.getElementById('taskForm');
    if(!form || form.dataset.autoEntregaWired) return;
    form.dataset.autoEntregaWired = '1';
    ['dataInicio','duracao'].forEach(name=>{
      const el = form[name];
      if(!el) return;
      el.addEventListener('input', ()=>recalc(form));
      el.addEventListener('change', ()=>recalc(form));
    });
  }
  document.addEventListener('DOMContentLoaded', wire);
  // re-tentar caso o modal carregue depois
  setTimeout(wire, 500);
})();

// Disparar enhancer logo após o boot
document.addEventListener('DOMContentLoaded', ()=>{
  // garantir que a aba ativa atualize topbar
  if(typeof switchTab==='function'){
    const cur = state.currentTab || 'backlog';
    switchTab(cur);
  }
});

// Fechar modal ao clicar fora
document.getElementById('taskModal').addEventListener('click',e=>{
  if(e.target.id==='taskModal') closeTaskModal();
});
// Esc fecha modal
document.addEventListener('keydown',e=>{
  if(e.key==='Escape') closeTaskModal();
});
</script>
</body>
</html>
