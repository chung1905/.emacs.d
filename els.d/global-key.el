;;; global-key --- Emacs
;;; Commentary:
;;; Code:
(cua-mode t)

(define-key input-decode-map (kbd "S-C-i") (kbd "S-<up>"))
(define-key input-decode-map (kbd "C-i") (kbd "<up>"))

(define-key key-translation-map (kbd "C-k") (kbd "<down>"))
(define-key key-translation-map (kbd "C-j") (kbd "<left>"))
(define-key key-translation-map (kbd "C-l") (kbd "<right>"))

(global-set-key (kbd "C-k") 'next-line)
(global-set-key (kbd "C-j") 'backward-char)
(global-set-key (kbd "C-l") 'forward-char)

(define-key input-decode-map (kbd "M-j") (kbd "M-<left>"))
(define-key input-decode-map (kbd "M-J") (kbd "M-S-<left>"))

(global-set-key (kbd "M-l") 'forward-word)
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-k") 'next-line)

(global-set-key (kbd "C-M-l") 'end-of-line)
(global-set-key (kbd "C-M-j") 'beginning-of-line)
(global-set-key (kbd "C-M-i") 'backward-paragraph)
(global-set-key (kbd "C-M-k") 'forward-paragraph)

(global-set-key (kbd "C-<tab>") 'completion-at-point)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-e") 'switch-to-buffer)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-s") 'save-buffer)
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

;;; global-key.el ends here
