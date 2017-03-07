(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(require 'package)

(add-to-list 'package-archives '("org" .  "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" .  "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" .  "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(use-package try
	:ensure t)

(use-package which-key
	:ensure t
	:config
	(which-key-mode))

(use-package avy
  :ensure t
  :init
  (progn
	(global-set-key (kbd "C-:") 'avy-goto-char)))

(use-package neotree
  :ensure t
  :init
  (progn
	(global-set-key [f8] 'neotree-toggle)))


(defalias 'list-buffers 'ibuffer)

(winner-mode 1)
(windmove-default-keybindings)

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)



;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)


(global-set-key (kbd "C-c f") 'helm-do-grep-ag)
