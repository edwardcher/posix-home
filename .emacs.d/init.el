;; Basic setup
(menu-bar-mode -1)
(setq tab-width 4)
(setq-default c-basic-offset 4)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-xk"  'kill-this-buffer)

;; Adds ido-mode when C-x b switching
(require  'ido)
(ido-mode 'buffers)
(setq ido-ignore-buffers '("^ " "*Completions*" "*Shell Command Output*"
			   "*Messages*" "Async Shell Command"))

;; ELPA repos
(setq package-archives '(("gnu"       . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa"     . "http://melpa.milkbox.net/packages/")
			 ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))

;; Hide status bar
(setq-default mode-line-format nil)

;; Dont echo the password when logging in form the emacs shell
(add-hook 'comint-output-filter-functions
      'comint-watch-for-password-prompt)

;; Add linum-format-func (line)
(defun linum-format-func (line)
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
     (propertize (format (format "%%%dd " w) line) 'face 'linum)))
(setq linum-format 'linum-format-func)

(put 'downcase-region 'disabled nil)
(put 'upcase-region   'disabled nil)
