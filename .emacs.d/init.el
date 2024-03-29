(defun load-theme-by-time ()
  (setq hour (string-to-number (substring (current-time-string) 11 13)))
  (mapcar #'disable-theme custom-enabled-themes)
  (if (or (< hour 20) (< 8 hour))
      (load-theme 'standard-light t)
    (load-theme 'standard-dark t)))

(package-initialize)

;; (load "~/.emacs.d/asm-hook.el")
(load "~/.emacs.d/bootstrap.el")

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/mypkgs"))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(add-to-list 'write-file-functions 'delete-trailing-whitespace)

(setq inhibit-startup-screen t
      make-backup-files nil
      default-directory "~/"
      create-lockfiles nil
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      completion-cycle-threshold 3
      gc-cons-threshold 100000000
      erc-nick "nickiminjaj"
      erc-user-full-name "cocateh"
      ring-bell-function 'ignore
      ns-alternate-modifier 'meta
      ns-right-alternate-modifier 'none)

(setq-default comment-style 'extra-line
              display-fill-column-indicator-column 81
              indent-tabs-mode nil
              c-basic-offset 4)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(set-language-environment "UTF-8")

(menu-bar-mode 0)
(tool-bar-mode 0)
(column-number-mode 1)
(global-display-fill-column-indicator-mode t)
(global-display-line-numbers-mode)

(define-key global-map [remap find-file] #'counsel-find-file)
(define-key global-map [remap switch-to-buffer] #'ivy-switch-buffer)
(define-key global-map [remap execute-extended-command] #'counsel-M-x)
(define-key global-map [remap isearch-forward] #'swiper)
(define-key global-map [remap isearch-backward] #'swiper-backward)

(global-set-key (kbd "C-c C-SPC") 'mc/edit-lines)
(global-set-key (kbd "C-c '") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-c g") 'highlight-symbol)
(global-set-key (kbd "C-c <") 'highlight-symbol-prev)
(global-set-key (kbd "C-c >") 'highlight-symbol-next)
(global-set-key (kbd "C-c s") 'counsel-rg)
(global-set-key (kbd "C-c p") 'counsel-projectile)
(global-set-key (kbd "C-<") 'indent-rigidly-left-to-tab-stop)
(global-set-key (kbd "C->") 'indent-rigidly-right-to-tab-stop)
(global-set-key (kbd "<f5>") 'recompile)

(if (not (eq system-type 'windows-nt))
    (exec-path-from-shell-initialize))

(load-theme-by-time)
(run-with-timer 0 (* 30 60) #'load-theme-by-time)
;; (set-face-attribute 'default nil :font "SF Mono-12")

(add-hook 'c++-mode-common-hook
	  (lambda ()
	    (c-set-offset 'inextern-lang 0)
            (c-set-offset 'innamespace 0)))

(add-hook 'c++-mode-hook '(lambda ()
                            (setq display-fill-column-indicator-column 101)
                            (setq c-basic-offset 4)
                            (setq indent-tabs-mode nil)
                            (dtrt-indent-mode)))

(add-hook 'c-mode-hook '(lambda ()
                          (setq display-fill-column-indicator-column 81)
                          (setq c-basic-offset 8)
                          (setq indent-tabs-mode t)
                          (dtrt-indent-mode)))

(add-hook 'java-mode-hook '(lambda ()
                             (setq display-fill-column-indicator-column 121)
                             (setq c-basic-offset 4)
                             (setq indent-tabs-mode nil)))
