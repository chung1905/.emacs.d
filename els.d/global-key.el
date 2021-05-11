;;; global-key --- Emacs
;;; Commentary:
;;; Code:
(cua-mode t)

(global-set-key (kbd "C-<tab>") 'completion-at-point)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-e") 'switch-to-buffer)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-s") 'save-buffer)

(global-set-key (kbd "<f5>") 'revert-buffer)

(if (display-graphic-p)
    ;; In console, M-x doesn't work (ESC = Meta key)
    (define-key key-translation-map (kbd "ESC") (kbd "C-g")))

;;; global-key.el ends here
