# ColumbusOccupationTable
Vim Plugin to write Columbus Occupation Table to a text file. 

Open a file with the .coltab extension use the plugin as

:call ColTab('') 

or, if you wish just write the point group directly as:

:call ColTab('d2h')

Please, consider to install dhruvasagar/vim-table-mode plugin to realign the Tables.

To install this plugin, it is better to do it via a plugin manager. If you use Vundle for e.g., include in your .vimrc:

Plugin 'rfkspada/ColumbusOccupationTable'
Plugin 'dhruvasagar/vim-table-mode'

Start vim and on Command Mode execute :PluginInstall
