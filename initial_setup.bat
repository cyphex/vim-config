@ECHO OFF
IF NOT EXIST bundle (
    mkdir autoload
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim', $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath('~\vimfiles\autoload\plug.vim'))"
    vim -u plugins.vim +PlugInstall +qall
) ELSE (
    echo "vim-plug appears to be already initialized, stopping."
)
