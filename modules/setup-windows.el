(cond ((eq system-type 'windows-nt)
 ;; Keep config files here: %USERPROFILE%\AppData\Roaming\.emacs.d
 ;; Msys2 installation path: C:\tools\msys64
 ;; Prerequisities: Emacs msys2 cascadiacode aria2 mpg123
 ;; To prevent opening extra windows: `runemacs`.
 ;; To all-the-icons works properly, run: `all-the-icons-install-fonts' and set path to: C:\Users\s.mirzakhani\AppData\Roaming\.emacs.d, and install fonts one by one.
 ;; Install fonts through elisp
 (straight-use-package 'trashed)
 (straight-use-package 'powershell)

 (setq ls-lisp-dirs-first t)
 (setq ls-lisp-use-insert-directory-program nil)
 (setq dap-lldb-debug-program '("C:\Program Files\LLVM\bin\lldb-vscode.exe"))
 (setq bmkp-current-bookmark-file "~/.emacs.d/bookmarks_windows.bmk")

 (defun linarcx-apps ()
   (interactive)
   (setq completions `(
		 ;; Power Management
		 ("Lock" "rundll32.exe user32.dll,LockWorkStation")
		 ("Restart" "shutdown /r")
		 ("Shutdown" "shutdown /s")

		 ;; Applications
		 ("Firefox" "C:\\Program Files\\Mozilla Firefox\\firefox.exe")
		 ("Kerio Control VPN Client" "kvpncgui.exe")
		 ("Uget" "C:\\ProgramData\\chocolatey\\bin\\uget.exe")
		 ("Transmission" "C:\\Program Files\\Transmission\\transmission-qt.exe")
		 ("Rufus" "C:\\ProgramData\\chocolatey\\bin\\rufus.exe")
		 ("Process Explorer" "C:\\ProgramData\\chocolatey\\lib\\procexp\\tools\\procexp64.exe")
		 ("Power4Gear Hybrid" "P4GXui.exe")
		 ("Nvidia Control Panel" "nvcplui.exe")

		 ;; VPN
		 ("Restart Tor" "gsudo net stop tor && gsudo net start tor")
		 ("Torifier" "C:\\Program Files\\Torifier\\torifier.exe")
		 ("Lantern" "C:\\Users\\saeed\\AppData\\Roaming\\Lantern\\lantern.exe")
		 ("Psiphon3" "D:\\software\\windows\\raw\\proxies\\psiphon3.exe")
		 ("FreeGate" "D:\\software\\windows\\raw\\proxies\\fg790p.exe")

		 ;; Windows Apps
		 ("FileExplorer" "explorer.exe")
		 ("Notepad" "notepad.exe")
		 ("Paint" "mspaint.exe")
		 ("Task Manager" "Taskmgr.exe")
		 ("Regedit" "regedit.exe")
		 ("Services" "services.msc")
		 ("File Explorer Options (General tab)" "control /name Microsoft.FolderOptions")
		 ("Charmap" "charmap.exe")
		 ("Math input panel" "C:\\Program Files\\Common Files\\Microsoft Shared\\Ink\\mip.exe")
		 ("Remote Desktop Connection" "mstsc")
		 ("Magnifier" "magnify")
		 ("On Screen Keyboard" "osk")
		 ("Environment Variables" "rundll32 sysdm.cpl,EditEnvironmentVariables")

		 ;; Office
		 ("Writer" "C:\\Program Files\\LibreOffice\\program\\swriter.exe")
		 ("Calc" "C:\\Program Files\\LibreOffice\\program\\scalc.exe")
		 ("Math" "C:\\Program Files\\LibreOffice\\program\\smath.exe")
		 ("Draw" "C:\\Program Files\\LibreOffice\\program\\sdraw.exe")
		 ("Impress" "C:\\Program Files\\LibreOffice\\program\\simpress.exe")

		 ;; IDE
		 ("Visual Studio 2019" "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\Common7\\IDE\\devenv.exe")
		 ("Visual Studio 2017" "C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\Community\\Common7\\IDE\\devenv.exe")
		 ("Visual Studio 2015" "C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\Common7\\IDE\\devenv.exe")
		 ("Visual Studio 2013" "C:\\Program Files (x86)\\Microsoft Visual Studio 12.0\\Common7\\IDE\\devenv.exe")
		 ("Visual Stuiod 2005 (Standard)" "C:\\Program Files (x86)\\Microsoft Visual Studio 8\\Common7\\IDE\\devenv.exe")
		 ("Visual C++ 2005 (Express)" "C:\\Program Files (x86)\\Microsoft Visual Studio 8\\Common7\\IDE\\VCExpress.exe")
		 ("Eclipse" "D:\\software\\windows\\raw\\eclipse-jee-2019\\eclipse.exe")

		 ;; Development tools
		 ("Cmake Gui" "cmake-gui.exe")
		 ("Dependency Walker" "depends.exe")
		 ("GraphEdit" "C:\\Program Files (x86)\\Windows Kits\\10\\bin\\10.0.18362.0\\x86\\graphedt.exe")
		 ("RegDllView" "C:\\ProgramData\\chocolatey\\bin\\RegDllView.exe")

		 ;; Windows development tools
		 ("windbg(x86)" "C:\\Program Files (x86)\\Windows Kits\\10\\Debuggers\\x86\\windbg.exe")
		 ("windbg(x64)" "C:\\Program Files (x86)\\Windows Kits\\10\\Debuggers\\x64\\windbg.exe")
		 ("Windows Performance Analyzer" "wpa")
		 ("Windows Performance Recorder" "WPRUI")
		 ("Global Flags(x86)" "C:\\Program Files (x86)\\Windows Kits\\10\\Debuggers\\x86\\gflags.exe")
		 ("Global Flags(x64)" "C:\\Program Files (x86)\\Windows Kits\\10\\Debuggers\\x64\\gflags.exe")
		 ("Debugging Help(x64)" "C:\\Program Files (x86)\\Windows Kits\\10\\Debuggers\\x64\\debugger.chm")
		 ("Debugging Help(x86)" "C:\\Program Files (x86)\\Windows Kits\\10\\Debuggers\\x86\\debugger.chm")

		 ;; Control Panel - Info
		 ("Control Panel" "control.exe")
		 ("Administrative Tools" "control admintools")
		 ("Windows Version" "winver")
		 ("System" "control /name Microsoft.System")
		 ("System Properties" "sysdm.cpl")
		 ("System Information" "msinfo32.exe")

		 ;; Control Panel - Apps
		 ("Add/Remove Programs" "appwiz.cpl")
		 ("Default Programs" "control /name Microsoft.DefaultPrograms")

		 ;; Control Panel - Network
		 ("Network Properties" "Ncpa.cpl")
		 ("Internet Properties" "inetcpl.cpl")
		 ("Fire Wall" "WF.msc")
		 ("Windows Defender Firewall" "control /name Microsoft.WindowsFirewall")

		 ;; Control Panel - Devices
		 ("Add New Hardware" "sysdm.cpl")
		 ("Keyboard" "control /name Microsoft.Keyboard")
		 ("Joystick Properties" "joy.cpl")
		 ("Keyboard Properties" "main.cpl")
		 ("Device Manager" "control /name Microsoft.DeviceManager")
		 ("Devices and Printers" "control /name Microsoft.DevicesAndPrinters")

		 ;; Control Panel - Security
		 ("Security Policy" "secpol.msc")
		 ("Credential Manager" "control /name Microsoft.CredentialManager")

		 ;; Control Panel - Performance
		 ("Performance Monitor" "perfmon.exe")
		 ("Resource Monitor" "resmon.exe")

		 ;; Control Panel - Log
		 ("Event Viewer" "eventvwr.exe")

		 ;; Control Panel - Other
		 ("Disk Managment" "diskmgmt.msc")
		 ("Multimedia Properties" "mmsys.cpl")
		 ("Power Management" "powercfg.cpl")
		 ("Computer Management" "compmgmt.msc")
		 ("Regional Settings" "intl.cpl")
		 ("System Configuration" "msconfig")
		 ("Date/Time Properties" "timedate.cpl")
		 ("Fonts" "control /name Microsoft.Fonts")
		 ("Display Properties" "desk.cpl")
		 ("Color Management" "control /name Microsoft.ColorManagement")
		 ("User Accounts" "control /name Microsoft.UserAccounts")
		 ("User Accounts (netplwiz)" "netplwiz")
		 ("Windows Mobility Center" "control /name Microsoft.MobilityCenter")
		 ("Ease of Access Center" "control /name Microsoft.EaseOfAccessCenter")
		 ))
   (setq choiceList(assoc (completing-read "Choose: " completions) completions))
   (call-process-shell-command (nth 1 choiceList) nil 0))

 (global-set-key (kbd "<f2> a") 'linarcx-apps)

 (defun linarcx-open-cmd-here()
   (interactive)
   (let ((proc (start-process "cmd" nil "cmd.exe" "/C" "start" "cmd.exe")))
     (set-process-query-on-exit-flag proc nil)))

 (defun linarcx-open-pwsh-here()
   (interactive)
   (let ((proc (start-process "pwsh" nil "pwsh.exe" "/C" "start" "pwsh.exe")))
     (set-process-query-on-exit-flag proc nil)))

 ;;(global-set-key (kbd "M-t") (lambda () (interactive) (shell)))
 (global-set-key (kbd "M-t") 'linarcx-open-cmd-here)
 (global-set-key (kbd "M-p") 'linarcx-open-pwsh-here)

 (eval-after-load "dired" '(progn
		       (define-key dired-mode-map (kbd "C-c n") (lambda ()(interactive)(dired-sort-other "-Al")))
		       (define-key dired-mode-map (kbd "C-c t") (lambda()(interactive)(dired-sort-other "-Al -t")))
		       (define-key dired-mode-map (kbd "C-c s") (lambda()(interactive)(dired-sort-other "-Al -S")))))
 ))

(provide 'setup-windows)
