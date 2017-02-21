#
# ~/.ipython/profile_default/ipython_kernel_config.py
#

c.InteractiveShellApp.pylab = 'inline'
c.InteractiveShellApp.pylab_import_all = False

from cycler import cycler
import jupyter_qtconsole_colorschemes.solarizedlight as solarized

bg = solarized.BASE03
fg = solarized.BASE00

width = 11.

c.InlineBackend.figure_formats = {'retina'}
c.InlineBackend.rc = {
    'figure.figsize': (width, width/1.618),
    'figure.facecolor': bg,
    'axes.facecolor': bg,
    'text.color': fg,
    'axes.edgecolor': fg,
    'axes.labelcolor': fg,
    'xtick.color': fg,
    'ytick.color': fg,
}
