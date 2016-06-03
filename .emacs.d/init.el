;; -*- mode: emacs-lisp -*-
;; Simple .emacs configuration

;; ---------------------
;; -- Global Settings --
;; ---------------------
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(add-to-list 'load-path "~/.emacs.d/lisp")
(let ((default-directory "~/.emacs.d/lisp"))
  (normal-top-level-add-subdirs-to-load-path))

;; basic initialization, (require) non-ELPA packages, etc.
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(setq package-enable-at-startup nil)
(package-initialize)

;;(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'linum)
(require 'smooth-scrolling)
(require 'whitespace)
(require 'dired-x)
(require 'compile)
(ido-mode t)
(menu-bar-mode -1)
(normal-erase-is-backspace-mode 0)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit autoface-default :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "monaco"))))
 '(column-marker-1 ((t (:background "red"))))
 '(diff-added ((t (:foreground "cyan"))))
 '(flymake-errline ((((class color) (background light)) (:background "Red"))))
 '(font-lock-comment-face ((((class color) (min-colors 8) (background light)) (:foreground "red"))))
 '(fundamental-mode-default ((t (:inherit default))))
 '(highlight ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(isearch ((((class color) (min-colors 8)) (:background "yellow" :foreground "black"))))
 '(linum ((t (:foreground "black" :weight bold))))
 '(region ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(secondary-selection ((((class color) (min-colors 8)) (:background "gray" :foreground "cyan"))))
 '(show-paren-match ((((class color) (background light)) (:background "black"))))
 '(vertical-border ((t nil))))

;; ------------
;; -- Macros --
;; ------------
(load "defuns-config.el")
(fset 'align-equals "\C-[xalign-regex\C-m=\C-m")
(global-set-key "\M-=" 'align-equals)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c;" 'comment-or-uncomment-region)
(global-set-key "\M-n" 'next5)
(global-set-key "\M-p" 'prev5)
(global-set-key "\M-o" 'other-window)
(global-set-key "\M-i" 'back-window)
(global-set-key "\C-z" 'zap-to-char)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-d" 'delete-word)
(global-set-key "\M-h" 'backward-delete-word)
(global-set-key "\M-u" 'zap-to-char)

;;kbd macro
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\M-?" 'help-command)
(global-set-key "\C-?" 'help-command)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-xt" 'transpose-line)
(global-set-key "\C-ci" 'insert-kbd-macro)
(global-set-key "\C-cp" 'show-paren-mode)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key  [f2] 'server-edit)
(global-set-key  [f3]  'call-last-kbd-macro)
(global-set-key  [f4]  'ds)

(global-set-key  [f5]  'enlarge-window)
(global-set-key  [f6]  'shrink-window)
(global-set-key  [f7]  'enlarge-window-horizontally)
(global-set-key  [f8]  'shrink-window-horizontally)

(global-set-key  [f9]  'compile)
(global-set-key  [f10]  'other-window)
(global-set-key  [f11]  'pep8)
(global-set-key  [f12]  'set-mark-command)


(defun line-to-top ()
  "current line to top of the window"
  (interactive)
  (recenter 0))

(defun scroll-one-line-up ()
  "scrolling one line up "
  (interactive)
  (scroll-up 1))

(defun scroll-one-line-down ()
  "scrolling one line up "
  (interactive)
  (scroll-down 1))

(global-set-key "\C-x\C-u" 'line-to-top)
(global-set-key "\M-j" 'scroll-one-line-up)
(global-set-key "\M-u" 'scroll-one-line-down)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;;; From this point onwards init.el contains Dinesh Weerapurage's changes
;;; http://ergoemacs.org/emacs/emacs_make_modern.html
;;; insert matching paranthesis and brackets works with emacs24
;; (electric-pair-mode 1) 

(show-paren-mode 1)
(setq show-parent-style 'expression)
(global-linum-mode 1)

;; Don't create backup files
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files
 
;;;; nav ;;;;
(require 'nav)
;;(nav-disable-overeager-window-splitting)
;;(require 'sr-speedbar)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"            ;; personal snippets
        "~/.emacs.d/yasnippet/snippets"    ;; the default collection
        ))

;;; using auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;;; Markdown mode 
(autoload 'markdown-mode "markdown-mode"
        "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;http://stackoverflow.com/questions/2855378/ropemacs-usage-tutorial
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(require 'python-mode)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;;(require 'auto-complete)
;;(global-auto-complete-mode t)

(add-hook 'python-mode-hook
          (lambda () (define-key python-mode-map (kbd "DEL") 'py-electric-backspace)))
(normal-erase-is-backspace-mode 0)
(setq python-check-command "pyflakes")
(require 'tramp)
(autoload 'python-pep8 "python-pep8");;
(autoload 'pep8 "python-pep8")


(load-theme 'misterioso)
(require 'column-marker)
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80)))
