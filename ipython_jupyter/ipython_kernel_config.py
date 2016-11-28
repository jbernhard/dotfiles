#
# ~/.ipython/profile_default/ipython_kernel_config.py
#

c.InteractiveShellApp.pylab = 'inline'
c.InteractiveShellApp.pylab_import_all = False

from cycler import cycler
import jupyter_qtconsole_colorschemes.solarizedlight as solarized

bg = solarized.BASE03
fg = solarized.BASE00

width = 16.

c.InlineBackend.figure_formats = {'retina'}
c.InlineBackend.rc = {
    'figure.figsize': (width, width/1.618),
    'figure.autolayout': False,
    'lines.linewidth': 2,
    'font.size': 14,
    'figure.facecolor': bg,
    'axes.facecolor': bg,
    'text.color': fg,
    'axes.edgecolor': fg,
    'axes.labelcolor': fg,
    'xtick.color': fg,
    'ytick.color': fg,
    'xtick.major.size': 3,
    'ytick.major.size': 3,
    'axes.prop_cycle': cycler('color', [
        getattr(solarized, c.upper()) for c in [
            'blue', 'cyan', 'green', 'yellow', 'orange', 'red', 'magenta',
            'violet', 'base1'
        ]
    ]),
}
