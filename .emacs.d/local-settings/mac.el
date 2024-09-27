(exec-path-from-shell-initialize)

(set-face-attribute 'default nil :font "SF Mono:size=12")

(setq ns-alternate-modifier 'meta
      ns-right-alternate-modifier 'none
      initial-frame-alist '((top . 40) (left . 10) (width . 128) (height . 68))
      default-frame-alist '((top . 40) (left . 10) (width . 128) (height . 68))
      default-day-theme 'leuven
      default-night-theme 'leuven-dark)

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq-default line-spacing 0.1)

(menu-bar-mode 1)
(load-theme 'challenger-deep t)
;; (load-theme-by-time)
;; (run-with-timer 0 (* 30 60) #'load-theme-by-time)

(ignore-errors
  (add-hook 'compilation-filter-hook '(lambda ()
                                        (when (eq major-mode 'compilation-mode)
                                          (ansi-color-apply-on-region
                                           compilation-filter-start (point-max))))))
