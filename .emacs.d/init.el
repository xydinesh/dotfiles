;; -*- Mode: emacs-lisp -*-
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

(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'linum)
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
(global-set-key "\C-q" 'set-120-columns)
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

(global-set-key  [f2] 'pep8)
(global-set-key  [f3]  'find-alternate-file)
(global-set-key  [f4]  'set-80-columns)

(global-set-key  [f5]  'enlarge-window)
(global-set-key  [f6]  'shrink-window)
(global-set-key  [f7]  'enlarge-window-horizontally)
(global-set-key  [f8]  'shrink-window-horizontally)

(global-set-key  [f9]  'prev-window)
(global-set-key  [f10]  'other-window)
(global-set-key  [f11]  'compile)
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

(defun set-window-width (n)
  "Set the selected window's width."
  (adjust-window-trailing-edge (selected-window) (- n (window-width)) t))

(defun set-80-columns ()
  "Set the selected window to 80 columns."
  (interactive)
  (set-window-width 81))

(defun set-120-columns ()
  "Set the selected window to 80 columns."
  (interactive)
  (set-window-width 120))

(defun prev-window ()
  (interactive)
  (other-window -1))

(global-set-key "\C-x\C-u" 'line-to-top)
(global-set-key "\M-j" 'scroll-one-line-up)
(global-set-key "\M-u" 'scroll-one-line-down)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;;; From this point onwards init.el contains Dinesh Weerapurage's changes
;;; http://ergoemacs.org/emacs/emacs_make_modern.html
;;; insert matching paranthesis and brackets works with emacs24
;;; (electric-pair-mode 1)
(show-paren-mode 1)
(global-linum-mode 1)
;; Don't create backup files
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"            ;; personal snippets
        "~/.emacs.d/yasnippet/snippets"    ;; the default collection
        ))

;; Common-Lisp mode
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (paredit slime))))

;; Set your lisp system and, optionally, some contribs
(setq slime-contribs '(slime-fancy))
(load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")
