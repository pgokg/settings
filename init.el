;;load-path を追加する関数を定義


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

 ;;引数のディレクトリとそのサブディレクトリをload-pathに追加
;(add-to-load-path "elisp" "conf" "public_repos" "site-lisp" "elpa")
(add-to-load-path "elisp" "conf" "site-lisp" "elpa")
(require 'init-loader)
(setq init-loader-show-log-after-init 'error-enly)
(init-loader-load "~/.emacs.d/conf")

;; ;; undo-tree有効化
(require 'undo-tree)
(global-undo-tree-mode)

;; diredで削除したときゴミ箱をを有効にする
(setq delete-by-moving-to-trash t)

;; 左側に行数を表示
(global-linum-mode 1)
;; 4桁分用意する
(setq linum-format "%4d")

;;; helm
(when (require 'helm-config nil t)
  (helm-mode 1)
  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
  ;;補完
  (define-key helm-find-files-map (kbd "C-i") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "C-i") 'helm-execute-persistent-action)

  (define-key global-map (kbd "M-x") 'helm-M-x)
  (define-key global-map (kbd "M-y") 'helm-show-kill-ring)
  )


;; The Elder Scrolls V Skyrim papyrus-mode
(require 'papyrus-mode)

;; (require 'server)
;; (unless (server-running-p)
;;   (server-start)
;; )

;; (require 'google-translate)
;; (require 'google-translate-default-ui)
;; (global-set-key "\C-ct" 'google-translate-at-point)
;; (global-set-key "\C-cT" 'google-translate-query-translate)

 ;; Visual Basic mode
(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode" t)
(add-to-list 'auto-mode-alist '("\\.\\(vbs\\|vb\\|wsf\\|frm\\|bas\\|cls\\)$" . visual-basic-mode))

(add-hook
 'shell-mode-hook
 '(lambda ()
    (set-buffer-process-coding-system 'sjis 'sjis)))

; (setq exec-path (cons "/usr/local/bin" exec-path))

;;; flymake
;(require 'flymake)

;(setq flymake-log-level 3)

;; (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
;;   (setq flymake-check-was-interrupted t))
;; (ad-activate 'flymake-post-syntax-check)

;; (setenv "Path"
;; 	(concat
;; 	 "c:/Program Files (x86)/Microsoft Visual Studio 10.0/Common7/IDE/" ";"
;; 	 "c:/Program Files (x86)/Microsoft Visual Studio 10.0/VC/bin" ";"
;; 	 (getenv "Path")
;; 	 ))

;; (add-to-list 'load-path "c:/Program Files (x86)/Microsoft Visual Studio 10.0/Common7/IDE/")
;; (add-to-list 'load-path "c:/Program Files (x86)/Microsoft Visual Studio 10.0/VC/bin")

;; (setenv "INCLUDE"
;; 	(concat
;; 	 "c:\\Program Files (x86)\\Microsoft Visual Studio 10.0\\VC\\include" ";"
;; 	 "c:\\Program Files (x86)\\Microsoft Visual Studio 10.0\\VC\\atlmfc\\include" ";"
;; 	 "C:\\Program Files (x86)\\Microsoft SDKs\\Windows\\v7.0A\\include" ";"
;; 	 (getenv "INCLUDE")))

;; (add-to-list 'load-path "c:/Program Files (x86)/Microsoft Visual Studio 10.0/VC/include")
;; (add-to-list 'load-path "c:/Program Files (x86)/Microsoft Visual Studio 10.0/VC/atlmfc/include")
;; (add-to-list 'load-path "C:/Program Files (x86)/Microsoft SDKs/Windows/v7.0A/include")

;; (setenv "LIB"
;; 	(concat
;; 	 "c:\\Program Files (x86)\\Microsoft Visual Studio 10.0\\VC\\lib" ";"
;; 	 "c:\\Program Files (x86)\\Microsoft Visual Studio 10.0\\VC\\atlmfc\\lib" ";"
;; 	 "C:\\Program Files (x86)\\Microsoft SDKs\\Windows\\v7.0A\\lib" ";"
;; 	 (getenv "LIB")))


;; (add-to-list 'load-path "c:/Program Files (x86)/Microsoft Visual Studio 10.0/VC/lib")
;; (add-to-list 'load-path "c:/Program Files (x86)/Microsoft Visual Studio 10.0/VC/atlmfc/lib")
;; (add-to-list 'load-path "C:/Program Files (x86)/Microsoft SDKs/Windows/v7.0A/lib")

;; (setenv "LIBPATH"
;; 	(concat
;; 	 "C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319" ";"
;; 	 "C:\\Windows\\Microsoft.NET\\Framework\\v3.5" ";"
;; 	 "c:\\Program Files (x86)\\Microsoft Visual Studio 10.0\\VC\\lib" ";"
;; 	 "c:\\Program Files (x86)\\Microsoft Visual Studio 10.0\\VC\\atlmfc\\lib" ";"
;; 	 (getenv "LIBPATH")))

;; (add-to-list 'load-path "C:/Windows/Microsoft.NET/Framework/v4.0.30319")
;; (add-to-list 'load-path "C:/Windows/Microsoft.NET/Framework/v3.5")
;; (add-to-list 'load-path "c:/Program Files (x86)/Microsoft Visual Studio 10.0/VC/lib")
;; (add-to-list 'load-path "c:/Program Files (x86)/Microsoft Visual Studio 10.0/VC/atlmfc/lib")


;; (defun flymake-vc-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     (concat "local-file:" local-file)
;;     (list "cl" (list "/nologo" "/TC" "/W4" "/Wp64" "/Zs" local-file))))
;; (defun flymake-vc++-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;; 	(list "cl" (list "/nologo" "/TP" "/W4" "/Wp64" "/Zs" local-file))))
;; (push '("\\.c\\'" flymake-vc-init) flymake-allowed-file-name-masks)
;; (push '("\\.h\\'" flymake-vc-init) flymake-allowed-file-name-masks)
;; (push '("\\.cpp\\'" flymake-vc++-init) flymake-allowed-file-name-masks)
;; (push '("\\.hpp\\'" flymake-vc++-init) flymake-allowed-file-name-masks)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rainbow-delimiters undo-tree rfringe org-ac migemo))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
