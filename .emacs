;; jvc.emacs is backup /Users/John/Documents/_Home/EMACS/
;; emacs v 27.1 is in the applications folder
;; emacs v 26.1 location /usr/local/Cellar/emacs/26.1_1/share/emacs/26.1

;; server off
;;(server-start)

;; startup screen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Use package and add MELPA repository.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

;; rainbow delimiters https://github.com/Fanael/rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t)
(when (require 'rainbow-delimiters nil 'noerror) 
  (add-hook 'scheme-mode-hook 'rainbow-delimiters-mode))
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)


;; Python3
(setq python-shell-interpreter "python3")
(use-package elpy
  :ensure t)
(setq elpy-rpc-python-command "python3")
(elpy-enable)
(use-package flycheck
  :ensure t)
;; new iPython stuff see:  https://emacs.stackexchange.com/questions/16637/how-to-set-up-elpy-to-use-python3
(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "-i")


;; ergonomics my keys
(defalias 'yes-or-no-p 'y-or-n-p) ; y or n is enough
(global-linum-mode t) ;; enable line numbers globally
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "C-Z") 'redo) ; 【Ctrl+Shift+z】
(global-set-key (kbd "C-c f") 'find-file)
(global-set-key (kbd "C-x f") 'find-file)
;; make cursor movement keys under right hand's home-row.
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-u") 'backward-word)
(global-set-key (kbd "M-o") 'forward-word)
;;(global-set-key (kbd "M-<left>") 'beginning-of-buffer)
;;(global-set-key (kbd "M-<right>") 'end-of-buffer)
;;(global-set-key (kbd "M-SPC") 'set-mark-command)

;; make frequently used commands short
(defalias 'qrr 'query-replace-regexp)
(defalias 'lml 'list-matching-lines)
(defalias 'dml 'delete-matching-lines)
(defalias 'dnml 'delete-non-matching-lines)
(defalias 'dtw 'delete-trailing-whitespace)
(defalias 'sl 'sort-lines)
(defalias 'rr 'reverse-region)
(defalias 'rs 'replace-string)
(defalias 'g 'grep)
(defalias 'gf 'grep-find)
(defalias 'rb 'revert-buffer)
(defalias 'sh 'shell)
(defalias 'fb 'flyspell-buffer)
(defalias 'sbc 'set-background-color)
(defalias 'sfc 'set-fill-column)
(defalias 'rof 'recentf-open-files)
(defalias 'lcd 'list-colors-display)
(defalias 'cc 'calc)
(defalias 'th 'org-toggle-link-display)
; elisp
(defalias 'eb 'eval-buffer)
(defalias 'er 'eval-region)
(defalias 'ed 'eval-defun)
(defalias 'eis 'elisp-index-search)
(defalias 'lf 'load-file)
; major modes
(defalias 'hm 'html-mode)
(defalias 'tm 'text-mode)
(defalias 'elm 'emacs-lisp-mode)
(defalias 'om 'org-mode)
(defalias 'ssm 'shell-script-mode)
; minor modes
(defalias 'wsm 'whitespace-mode)
(defalias 'gwsm 'global-whitespace-mode)
(defalias 'vlm 'visual-line-mode)
(defalias 'glm 'global-linum-mode)

;; magit
(setq magit-view-git-manual-method 'man)
(global-set-key (kbd "C-x g") 'magit-status)

;; deft stuff
(require 'deft)
(setq deft-directory "~/Dropbox/org/deft")
(setq deft-extensions '("org"))
(setq deft-default-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)
(setq deft-use-filter-string-for-filename t)
(setq deft-auto-save-interval 0)
;;key to launch deft
(global-set-key (kbd "C-c d") 'deft)
(global-set-key (kbd "C-c C-d") 'deft)

;; flyspell stuff
(require 'flyspell)


;;=============================================================================

;; Org-Mode stuff
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
;; org-mouse 
(require 'org-mouse)
;; Org-Mode open links with default program
(setq org-file-apps
      '(("\\.docx\\'" . default)
        (auto-mode . emacs)))
;; Org-Mode default fill
(setq set-fill-column 90)
;; org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook 'org-bullets-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(define-key flyspell-mode-map (kbd "C-;") #'flyspell-correct-word-before-point)
;; add mouse tab hook
(add-hook 'org-mode-hook 
   (lambda ()
     (local-set-key [mouse-1] 'org-cycle)
     ;; display images
     (local-set-key "\M-I" 'org-toggle-iimage-in-org)
     ))

;; mobileorg settings
(setq org-directory "~/Dropbox/org")
(setq org-mobile-inbox-for-pull "~/Dropbox/org/inbox.org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(setq org-mobile-files '("~/Dropbox/org"))

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (python . t)
   (ipython . t)
   (ein . t)
   (shell . t)))
;; Set python to python3
(setq org-babel-python-command "python3")
;; org inline images
(setq org-startup-with-inline-images t) 
(setq org-redisplay-inline-images t)

;; org-ref settings for Bibliography  by John Kitchin
;; See: https://github.com/jkitchin/org-ref
(setq reftex-default-bibliography '("~/Dropbox/bibliography/references.bib"))
;; see org-ref for use of these variables
(setq org-ref-bibliography-notes "~/Dropbox/bibliography/notes.org"
      org-ref-default-bibliography '("~/Dropbox/bibliography/references.bib")
      org-ref-pdf-directory "~/Dropbox/bibliography/bibtex-pdfs/")
(setq bibtex-completion-bibliography "~/Dropbox/bibliography/references.bib"
      bibtex-completion-library-path "~/Dropbox/bibliography/bibtex-pdfs"
      bibtex-completion-notes-path "~/Dropbox/bibliography/helm-bibtex-notes")
;; org-ref open pdf with system pdf viewer (works on mac)
(setq bibtex-completion-pdf-open-function
  (lambda (fpath)
    (start-process "open" "*open*" "open" fpath)))

;;=============================================================================

;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph    
(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        ;; This would override `fill-column' if it's an integer.
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))
;; Handy key definition
(define-key global-map "\M-\S-Q" 'unfill-paragraph)

;; ace jump mode major function
;; C-j to jump
(add-to-list 'load-path "/full/path/where/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-j") 'ace-jump-mode)
;;;; jump back not used
;;;; enable a more powerful jump back function from ace jump mode
;;(autoload
;;  'ace-jump-mode-pop-mark
;;  "ace-jump-mode"
;;  "Ace jump back:-)"
;;  t)
;;(eval-after-load "ace-jump-mode"
;;  '(ace-jump-mode-enable-mark-sync))
;;(define-key global-map (kbd "C-x j") 'ace-jump-mode-pop-mark)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes '(wheatgrass))
 '(custom-safe-themes
   '("f2c35f8562f6a1e5b3f4c543d5ff8f24100fae1da29aeb1864bbc17758f52b70" "9bebf6e27baaff3b140e442549a7a2b49c02e52666c9b7ba5a40954f1b5e828b" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "d4f8fcc20d4b44bf5796196dbeabec42078c2ddb16dcb6ec145a1c610e0842f3" "4ced6dc5f82dfbd00a78159179928c5b3ef08384b0e357b2e1e49d915e74b040" "afd761c9b0f52ac19764b99d7a4d871fc329f7392dfc6cd29710e8209c691477" "9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" default))
 '(elpy-modules
   '(elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults))
 '(elpy-rpc-python-command "python3")
 '(fci-rule-color "#383838")
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
   '("#efe4da49afb1" "#cfc4e1acd08b" "#fe52c9e6b34e" "#dbb6d3c2dcf3" "#e183dee0b053" "#f944cc6dae47" "#d35fdac4e069"))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   '(("#eee8d5" . 0)
     ("#b3c34d" . 20)
     ("#6ccec0" . 30)
     ("#74adf5" . 50)
     ("#e1af4b" . 60)
     ("#fb7640" . 70)
     ("#ff699e" . 85)
     ("#eee8d5" . 100)))
 '(hl-bg-colors
   '("#e1af4b" "#fb7640" "#ff6849" "#ff699e" "#8d85e7" "#74adf5" "#6ccec0" "#b3c34d"))
 '(hl-fg-colors
   '("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(hl-sexp-background-color "#1c1f26")
 '(lsp-ui-doc-border "#586e75")
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(org-agenda-files '("~/Dropbox/org/deft/" "~/schedule.org"))
 '(org-export-backends '(ascii beamer html icalendar latex odt))
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-gnus ol-info ol-irc ol-mhe))
 '(package-selected-packages
   '(rainbow-delimiters flycheck elpy material-theme ace-jump-mode ob-ipython ein alert julia-mode ivy hydra ht helm-core gntp ghub f counsel org-ref org-plus-contrib impatient-mode ranger php-mode org-learn slime deft spotlight avy org-drill yasnippet-classic-snippets r-autoyas common-lisp-snippets yasnippet-snippets yasnippet leuven-theme leuven org-dotemacs magit klere-theme list-packages-ext company ac-html ac-math org-bullets latex-preview-pane latex-math-preview helm-ispell which-key use-package try solarized-theme org-pdfview org-gcal org-dp org-ac nyan-mode multiple-cursors ess auctex))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(weechat-color-list
   '(unspecified "#fdf6e3" "#eee8d5" "#a7020a" "#dc322f" "#5b7300" "#859900" "#866300" "#b58900" "#0061a8" "#268bd2" "#a00559" "#d33682" "#007d76" "#2aa198" "#657b83" "#839496"))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
;; Nov 2020 found several required files missing and replaced them as defined below
;; replaced org-mhe->ol-mhe, org-irc->ol-irc, org-info->ol-info, org-guns->ol-guns, org-docview->ol-docview, org-bibtex->ol-bibtex, org-bbdb->ol-bbdb

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:extend nil :background "#F0F0F0" :foreground "#3C3C3C" :overline "#A7A7A7" :weight bold :height 1.1)))))

;; AucTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

;; add path for texbin
(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin"))

;; path fix for pdf output
(defun set-exec-path-from-shell-PATH ()
  "Sets the exec-path to the same value used by the user shell"
  (let ((path-from-shell
         (replace-regexp-in-string
          "[[:space:]\n]*$" ""
          (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

;; call function now
(set-exec-path-from-shell-PATH)

;; Use Skim as viewer, enable source <-> PDF sync
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))


;; counsel,ivy,swiper
(use-package counsel
  :ensure t)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

;;(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
;;;; added allowing <ESC> key to exit minibuffer
;;(define-key ivy-minibuffer-map [escape] 'minibuffer-keyboard-quit)
;;;;(define-key ivy-minibuffer-map (kbd "") 'minibuffer-keyboard-quit)


;; Exam mode for latex
(with-eval-after-load "ox-latex"
  (add-to-list 'org-latex-classes
               '("exam" "\\documentclass[addpoints,11pt]{exam}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M->") 'mc/mark-all-like-this)


;; My favorite theme
;;(use-package leuven-theme
;;  :ensure t)
;;(load-theme 'leuven t)
;;(setq leuven-scale-outline-headlines 1)
;;(setq leuven-scale-org-agenda-structure 1)

;; windmove
(use-package windmove
  ;; :defer 4
  :ensure t
  :config
  ;; use command key on Mac
  (windmove-default-keybindings 'super)
  ;; wrap around at edges
  (setq windmove-wrap-around t))

;; avy
(require 'avy)
(global-set-key (kbd "C-:") 'avy-goto-char)

;; yasnippet
(use-package yasnippet
  :ensure t)
(yas-global-mode 1)

;; delete extra spaces in region
(defun just-one-space-in-region (beg end)
  "replace all whitespace in the region with single spaces"
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (re-search-forward "\\s-+" nil t)
        (replace-match " ")))))

;; dired mode arrow keys
(defun jvc-dired-up-directory ()
  "close previous window addition"
  (interactive)
  (setq oldbuf (buffer-name))
  (dired-up-directory)
  (kill-buffer oldbuf))
(defun jvc-dired-find-file ()
  "close previous window addition"
  (interactive)
  (setq oldbuf (buffer-name))
  (dired-find-file)
  (kill-buffer oldbuf))
(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "<left>") #'jvc-dired-up-directory)
(define-key dired-mode-map (kbd "<right>") #'jvc-dired-find-file)
;; dired sort directories first
;;(setq dired-listing-switches "-aBhl  --group-directories-first")

;; New buffer untitled
(defun jvc-new-buffer-frame ()
  "Create a new frame with a new empty buffer."
  (interactive)
  (let ((buffer (generate-new-buffer "untitled")))
    (set-buffer-major-mode buffer)
    (display-buffer buffer '(display-buffer-pop-up-frame . nil))))
(global-set-key (kbd "C-c n") #'jvc-new-buffer-frame)

;; calculator Cc Cc
(global-set-key (kbd "C-c C-c") 'calc)

;; slime mode insalled
;; loaded sbcl and set path below
(setq inferior-lisp-program "/usr/local/Cellar/sbcl/1.4.10/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; recentf - recent files mode saved every 5 min
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(run-at-time nil (* 5 60) 'recentf-save-list)

