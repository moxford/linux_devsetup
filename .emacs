(global-font-lock-mode 1)
(setq kill-whole-line t) ; C-k deletes the end of line

;; ************ COMPILATION **************
(setq compile-command "cmake -no-opt")
(setq compilation-read-command nil)
(setq compilation-scroll-output 'first-error)

;; ************ KEY BINDING **************
(global-set-key "\C-l" 'goto-line)
(global-set-key "\C-]" 'mox-compile)
(global-set-key [(control return)] 'semantic-ia-complete-symbol)

;; ************ AUTOSAVE ************
(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,auto-save-list-file-prefix t)))

;; ********** ERLANG ************
(add-to-list 'load-path "~/.emacs.d/erlang")
;; ********** DISTEL ************
;;(add-to-list
;; 'load-path
;; (car (file-expand-wildcards "/usr/local/lib/erlang/lib/tools-*/emacs")))
(add-to-list 'load-path "~/.emacs.d/distel/elisp")
(require 'distel)
(distel-setup)
(add-to-list 'auto-mode-alist '("\\.erl\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl\\'" . erlang-mode))

;; ************ DEFUNS **************
(defun mox-compile ()
  "Recompile if possible, otherwise compile"
  (interactive)
  (if (fboundp 'recompile)
      (recompile)
    (call-interactively 'compile)))

(setq-default major-mode 'c-mode)
(setq-default indent-tabs-mode t)
(setq-default c-tab-always-indent nil)
(setq-default c-insert-tab-function 'tab-to-tab-stop)

;; ************ GOOGLE STYLE **************
(load "~/.emacs.d/google-c-style.el")
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; *************************************
;; ************ PACKAGES  **************
;; *************************************

;; ************ XCSCOPE ****************
;;(require 'xcscope)
;;(set 'cscope-database-regexp '/home/moxford/cscope)

;; ************ CEDET **************
;;(defun custom-autoload(&rest args))
;;(load "~/.emacs.d/cedet-1.0/common/cedet.el")
;;(require 'semantic-ia)
;;(semantic-load-enable-excessive-code-helpers)
;;(require 'semantic-gcc)
;;(require 'semanticdb-cscope)

;; ************ PERFORCE **************
;(load-library "~/.emacs.d/p4")

;; ***** OLD STUFF *****
;(global-set-key (kbd "TAB") 'self-insert-command);
; allow tabs inside indentation blocks instead of forcing spaces
;(setq-default indent-tabs-mode t)

; tabs are not just for formatting
;(setq-default c-tab-always-indent nil)

; don't convert TAB to spaces when backspacing (do nothing special)
;(setq-default backward-delete-char-untabify-method nil)

;(setq auto-mode-alist (cons '("\\.html$" . text-mode)       auto-mode-alist))

;(setq auto-mode-alist (cons '("\\.h$" . c-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.cpp$" . c-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.c$" . c-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.php$" . c-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.tpl$" . c-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.tpc$" . c-mode) auto-mode-alist))


;(setq kill-whole-line t) ; C-k deletes the end of line
;(setq backup-directory-alist '(("." . "~/.emacs_backups"))
;	backup-by-copying t
;	delete-old-versions t
;	kept-new-versions 6
;	kept_old-versions 2
;	version-control t)

;(global-set-key "\C-l" 'goto-line) ; [Ctrl]-[L]

;(defconst mox-style
;        '("stroustrup"
;        (c-hanging-braces-alist         .       ((brace-list-open)
;                                                 (brace-entry-open)
;                                                 (statement-cont)
;                                                 (substatement-open)
;                                                 (block-close)
;                                                 (extern-lang-open)
;                                                 (namespace-open)
;                                                 (module-open)
;                                                 (composition-open)
;                                                 (inexpr-class-open)
;                                                 (inexpr-class-close)))
;
;        (c-hanging-colons-alist          .      ((case-label after)
;                                                 (label after after)
;                                                 (access-label after)
;                                                 (member-init-intro)
;                                                 (inher-intro)))
;
;        (c-offsets-alist                .       ((case-label . +)
;                                                 (substatement-open . 0)
;                                                 (statement-cont . +)))
;
;        (tab-width                              .       4)
;        (c-basic-offset                         .       4)
;
;        ; allow tabs inside indentation blocks instead of forcing spaces
;        (indent-tabs-mode                       .       t)
;
;        ; tabs are not just for formatting
;        (c-tab-always-indent                    .       nil)
;
;        ; auto place newlines before and after braces and ; and :
;        (c-auto-newline                         .       nil)
;
;        ; don't convert TAB to spaces when backspacing (do nothing special)
;        (backward-delete-char-untabify-method   .       nil)
;
;        ; no autosave annoyances
;        (auto-save-default                      .       0)
;        (auto-save-interval                     .       0)
;
;        ; no autobackup annoyances
;        (make-backup-files                      .       0)
;
;        ) ; end of strustrup
;
;)
;
;(c-add-style "mox" mox-style)
;
;(defun my-c-mode-common-hook ()
;        (c-set-style "mox")
;        (font-lock-mode)
;        (winner-mode 1)
;)
;
;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
