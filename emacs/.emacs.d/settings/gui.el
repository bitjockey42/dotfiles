;;---------------------------;;
;; General                   ;;
;;---------------------------;;

(prefer-coding-system 'utf-8)

(windmove-default-keybindings) 

;; Display continuous lines
(setq-default truncate-lines nil)
;; Do not use tabs for indentation
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;; Set font
(add-to-list 'default-frame-alist '(font . "Essential PragmataPro-9"))
(set-default-font "Essential PragmataPro-9")

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; If using the daemon, load the correct theme in the client
(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (select-frame frame)
            (load-theme 'spacemacs-dark t)))
    (load-theme 'spacemacs-dark t))

;; Display Options
(set-fringe-mode 5)
(menu-bar-mode -1) ;; set to 1 for OS X
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-visual-line-mode 1)

;; trucate even even when screen is split into multiple windows
(setq-default truncate-partial-width-windows nil)

;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p) 

;; Highlight incremental search
(setq search-highlight t)
(transient-mark-mode t)

;; Set the backup directory
(setq backup-directory-alist `(("." . "~/.saves")))

;; Disable flyspell
(flyspell-mode 0)

;; Show line numbers and set format
(global-linum-mode 1)
(setq linum-format "%4d  ")

;; Use command key as meta key (really only for GUI-mode)
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; This uses the exec-path-from-shell to make sure that environment
;; variables are loaded within Emacs.app. 
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Initialize font-lock
(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode 1)        ; GNU Emacs
  (setq font-lock-auto-fontify t))   ; XEmacs

;;---------------------------;;
;; eshell                    ;;
;;---------------------------;;
(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(defun eshell/x ()
  (insert "exit")
  (eshell-send-input)
  (delete-window))

(global-set-key (kbd "C-!") 'eshell-here)

;; Set PATH for eshell
;; show env var named path
(getenv "PATH")

(setenv "PATH"
  (concat
   "/home/aj/.pyenv/bin" ":"
   (getenv "PATH") ; inherited from OS
  )
)

;;---------------------------;;
;; ido                       ;;
;;---------------------------;;
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-use-faces nil)

;;---------------------------;;
;; auto-complete             ;;
;;---------------------------;;
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories
                   "~/.emacs.d/.cask/24.5.1/elpa/auto-complete-20150408.1132/dict")
(require 'auto-complete-config)
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)
(global-auto-complete-mode t)

;;---------------------------;;
;; smartparens               ;;
;;---------------------------;;
 (require 'smartparens-config)
 (require 'smartparens-ruby)
 (smartparens-global-mode)
 (show-smartparens-global-mode t)
 (sp-with-modes '(rhtml-mode)
      (sp-local-pair "<" ">")
         (sp-local-pair "<%" "%>"))


;;---------------------------;;
;; fiplr                     ;;
;;---------------------------;;
(global-set-key (kbd "M-t") 'fiplr-find-file) ;; Invoke the fiplr finder

;; Ignore these files
(setq fiplr-ignored-globs '((directories (".git" ".hg" ".svn" ".bundle" "vendor" "_site" "tags" "tmp" ".cask" "node_modules"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))

;;---------------------------;;
;; indent-guide              ;;
;;---------------------------;;
(require 'indent-guide)
(indent-guide-global-mode)

