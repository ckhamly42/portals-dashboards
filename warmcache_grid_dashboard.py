import pathlib

from jinja2 import Environment, FileSystemLoader, Template

TEMPLATE_LOADER = FileSystemLoader(searchpath=pathlib.Path(__file__).parent.joinpath("templates"))
DASHBOARD_TPL_ENV = Environment(loader=TEMPLATE_LOADER)

PORTALS = [
  'entrataresidentportal',
  'resman',
  'appfolio',
  'activebuilding',
  'onesite',
  'aptexx',
  'mriresidentportal',
  'rentmanager',
  'domuso',
  'propertyware',
  'manageamerica',
  'clickpay',
  'zego',
  'paylease',
  'mymadera',
  'rentpayment',
  'salesforce',
  'buildiummanagebuilding',
  'mriresidentconnect',
  'amcrentpay',
  'rentcafe',
  'apprent',
  'macproperties',
  'imtresidentportal',
  'flex2blbplaceholder',
  'rentecdirect',
  'avalonaccess',
  'on-site',
  'residentbillpay',
  'leaserunner',
  'managebuilding',
  'communityresidentportal',
]


def generate_widget(portal_name):
  template = DASHBOARD_TPL_ENV.get_template("cachewarm_group.json.tpl")
  return template.render({"portal_name": portal_name})


def generate_cachewarm_grid():
  panel1 = []
  panel2 = []
  for i,p in enumerate(PORTALS):
    if i % 2 == 0:
      panel1.append(p)
    else:
      panel2.append(p)
  print(panel1)
  print(panel2)

  widgets = [generate_widget(portal) for portal in panel1 + panel2]
  widgets_json = ",\n".join(widgets)
  template = DASHBOARD_TPL_ENV.get_template("cachewarm_dashboard.json.tpl")
  output = template.render({"widgets_json": widgets_json})
  print(output)


generate_cachewarm_grid()
