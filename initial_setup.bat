@ECHO OFF
IF NOT EXIST bundle (
    git clone git://github.com/VundleVim/Vundle.vim.git bundle/Vundle.vim
    vim -u bundles.vim +PluginInstall +qall
) ELSE (
    echo "Vundle appears to be already initialized, stopping."
)
