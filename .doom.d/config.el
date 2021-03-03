;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jack Teasell"
      user-mail-address "contact.jackteasell@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/emacs/agenda")

;;---------------------PERSONAL CONFIG FOR ORG MODE----------------------------------
(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-agenda-hide-tags-regexp ".")

(setq org-html-postamble nil)
(after! org
 (setq org-agenda-files '("~/Dropbox/emacs/agenda/inbox.org"
                          "~/Dropbox/emacs/agenda/projects.org"
                          "~/Dropbox/emacs/agenda/agenda.org"))
 (setq org-capture-templates '(("t" "Todo [inbox]" entry
                                (file "~/Dropbox/emacs/agenda/inbox.org")
                                "* TODO %i%?")
                               ("a" "Agenda" entry
                                (file "~/Dropbox/emacs/agenda/agenda.org")
                                "* %i%? \n %U")))
 (setq org-refile-targets '(("~/Dropbox/emacs/agenda/projects.org" :maxlevel . 3)
                            ("~/Dropbox/emacs/agenda/someday.org" :level . 1)
                            ("~/Dropbox/emacs/agenda/agenda.org" :maxlevel . 2)))
 (setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "EVENT(e)" "|" "DONE(d)" "CANCELLED(c)")))

 (require 'org-bullets)
 (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
