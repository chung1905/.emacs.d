;;; global-key --- Emacs
;;; Commentary:
;;; Code:
(cua-mode t)

;; Separate C-i and "Tab" key
;; Source: https://stackoverflow.com/a/11319885/6881855
(define-key input-decode-map (kbd "C-i") (kbd "H-i"))
(global-set-key (kbd "H-i") 'previous-line)
(global-set-key (kbd "C-k") 'next-line)
(global-set-key (kbd "C-j") 'backward-char)
(global-set-key (kbd "C-l") 'forward-char)

(define-key input-decode-map (kbd "M-j") (kbd "H-j"))
(global-set-key (kbd "H-j") 'backward-word)
(global-set-key (kbd "M-l") 'forward-word)
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-k") 'next-line)

(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

;;; global-key.el ends here
