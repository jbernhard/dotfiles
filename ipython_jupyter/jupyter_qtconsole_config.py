#
# ~/.jupyter/jupyter_qtconsole_config.py
#

color_theme = 'solarizedlight'

import pkg_resources

c.JupyterQtConsoleApp.stylesheet = pkg_resources.resource_filename(
    'jupyter_qtconsole_colorschemes', '{}.css'.format(color_theme)
)

c.JupyterWidget.syntax_style = color_theme
