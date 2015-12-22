(global-evil-leader-mode)

(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "M-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "M-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "M-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "M-l") 'evil-window-right)))

(require 'evil)
(evil-mode 1)

(require 'neotree)

(evil-leader/set-leader "'")
(evil-leader/set-key
 "b" 'switch-to-buffer
 "k" 'kill-buffer
 "w" 'switch-to-buffer-other-window
 "n" 'neotree-toggle)

(add-hook 'neotree-mode-hook
	(lambda ()
		(define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
		(define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
		(define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
		(define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
		(define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))

(require 'spaceline-config)
(spaceline-spacemacs-theme)
