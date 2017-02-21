#
# ~/.jupyter/jupyter_qtconsole_config.py
#

c.ConsoleWidget.font_size = 13

color_theme = 'solarizedlight'

import pkg_resources

c.JupyterQtConsoleApp.stylesheet = pkg_resources.resource_filename(
    'jupyter_qtconsole_colorschemes', '{}.css'.format(color_theme)
)

c.JupyterWidget.syntax_style = color_theme
