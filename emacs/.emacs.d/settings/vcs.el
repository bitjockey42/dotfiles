;;---------------------------;;
;; magit                     ;;
;;---------------------------;;
(global-set-key (kbd "C-x g") 'magit-status) ;; Invoke the magit-status panel
(setq magit-last-seen-setup-instructions "1.4.0")

;;---------------------------;;
;; monky                     ;;
;;---------------------------;;
(require 'monky)
;; By default monky spawns a seperate hg process for every command.
;; This will be slow if the repo contains lot of changes.
;; if `monky-process-type' is set to cmdserver then monky will spawn a single
;; cmdserver and communicate over pipe.
;; Available only on mercurial versions 1.9 or higher

(setq monky-process-type 'cmdserver)

;; Invoke the status panel
(global-set-key (kbd "C-x m") 'monky-status)


