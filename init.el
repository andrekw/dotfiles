;;; init.el --- setup local preferences
;;; Commentary: 

;;; Code:

;; add theme dir
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; setup UTF8 support (mac specific)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
(setenv "WORKON_HOME" "~/Documents/Projetos/python/venv")

;; setup package hosts
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")))

;; initialize packages so we can load themes afterwards
(package-initialize)

;; install missing packages
(defvar my/packages
  '(company company-jedi auctex org ac-cider auto-complete cider clojure-mode  auto-complete popup cider ac-octave ac-slime slime ace-jump-mode auctex  yasnippet  clojure-snippets  company-irony-c-headers company-irony ess elisp-slime-nav s exec-path-from-shell f find-file-in-project  flycheck-color-mode-line flycheck  haskell-mode  idle-highlight-mode ido-complete-space-or-hyphen ido-ubiquitous s ido-completing-read+ langtool  lua-mode  markdown-mode magit osx-plist paredit  pyvenv  rainbow-delimiters slime smart-mode-line-powerline-theme smart-mode-line powerline smex solarized-theme zenburn-theme base16-theme nyan-mode helm cdlatex))

(require 'cl-lib)

(defun my/install-packages ()
  "Ensures I install the packages I want."
  (interactive)
  (let ((missing-packages (cl-remove-if #'package-installed-p my/packages)))
    (when missing-packages
      (message "Installing %d missing package(s)" (length missing-packages))
      (package-refresh-contents)
      (mapc #'package-install missing-packages))))

(my/install-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-term-color-vector
   [unspecified "#202020" "#fb9fb1" "#acc267" "#ddb26f" "#6fc2ef" "#e1a3ee" "#6fc2ef" "#e0e0e0"] t)
 '(company-idle-delay 0.2)
 '(company-quickhelp-delay 0.2)
 '(custom-safe-themes
   (quote
    ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "69831e572dc46ced47c5309bff8fc2f4a9e237e2bad2c76f313da814a4628694" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "dcbe22bc74153257f412183dd14ab9652197f59adf65646e618c2577e7cca34d" "b04425cc726711a6c91e8ebc20cf5a3927160681941e06bc7900a5a5bfe1a77f" "f21caace402180ab3dc5157d2bb843c4daafbe64aadc362c9f4558ac17ce43a2" "27890155f81d23512a9933f4ac6110e94de6266e948fd464eda3423c799713e2" "83279c1d867646c5eea8a804a67a23e581b9b3b67f007e7831279ed3a4de9466" "f0b0710b7e1260ead8f7808b3ee13c3bb38d45564e369cbe15fc6d312f0cd7a0" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "e56f1b1c1daec5dbddc50abd00fcd00f6ce4079f4a7f66052cf16d96412a09a9" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "e3c90203acbde2cf8016c6ba3f9c5300c97ddc63fcb78d84ca0a144d402eedc6" "51bea7765ddaee2aac2983fac8099ec7d62dff47b708aa3595ad29899e9e9e44" "9bac44c2b4dfbb723906b8c491ec06801feb57aa60448d047dbfdbd1a8650897" "16248150e4336572ff4aa21321015d37c3744a9eb243fbd1e934b594ff9cf394" "11d069fbfb0510e2b32a5787e26b762898c7e480364cbc0779fe841662e4cf5d" "0f0e3af1ec61d04ff92f238b165dbc6d2a7b4ade7ed9812b4ce6b075e08f49fe" "a3d519ee30c0aa4b45a277ae41c4fa1ae80e52f04098a2654979b1ab859ab0bf" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(doc-view-continuous t)
 '(inferior-octave-program "/opt/local/bin/octave")
 '(mac-drawing-use-gcd t)
 '(magit-use-overlays nil)
 '(ns-alternate-modifier (quote meta))
 '(package-selected-packages
   (quote
    (ebib ensime scala-mode cython-mode monokai-theme dockerfile-mode helm zenburn-theme web-mode solarized-theme smex smart-mode-line-powerline-theme rainbow-delimiters pyvenv paredit osx-plist nyan-mode markdown-mode magit lua-mode langtool jsx-mode json-mode js2-mode ido-ubiquitous ido-complete-space-or-hyphen idle-highlight-mode haskell-mode gitignore-mode flycheck-color-mode-line find-file-in-project f exec-path-from-shell ess elisp-slime-nav ein cyberpunk-theme company-statistics company-quickhelp company-jedi company-irony-c-headers company-irony clojure-snippets base16-theme auctex ace-jump-mode ac-slime ac-octave ac-cider cdlatex)))
 '(python-shell-interpreter "/opt/local/bin/python" t)
 '(solarized-distinct-fringe-background t)
 '(solarized-high-contrast-mode-line t)
 '(x-stretch-cursor t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(variable-pitch ((t (:height 1.1 :family "Helvetica")))))

;; only run the following if in graphic mode
(when (display-graphic-p)

  ;; load theme
  (load-theme 'base16-chalk)

;; hide the hideous toolbar
  (tool-bar-mode -1)

;; hide the terrible scrollbar
  (scroll-bar-mode -1)

;; enable menus (disabled by starter kit)
  (menu-bar-mode 1)
;; disable visual bell (useless)
  (setq ring-bell-function 'ignore)


;; set window size to something usable -- at 1920x1200
  (when window-system (set-frame-size (selected-frame) 120 82)))

;; setup yasnippet and autocomplete to work together http://truongtx.me/2013/01/06/config-yasnippet-and-autocomplete-on-emacs/
;;; yasnippet
;;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
(yas-global-mode 1)
;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together
;; disabled


;; setup clang-auto-complete-async from https://github.com/Golevka/emacs-clang-complete-async
;; disabled

;; enable hunspell instead of aspell
(when (executable-find "hunspell")
  (setq-default ispell-program-name "hunspell")
  (setq ispell-really-hunspell t))

;; enable langtool for grammar checking
(require 'langtool)
(setq langtool-language-tool-jar "/usr/local/share/languagetool/languagetool-commandline.jar"
      langtool-java-bin "/usr/bin/java"
      langtool-mother-tongue "en"
      langtool-disabled-rules '("WHITESPACE_RULE"
                                "EN_UNPAIRED_BRACKETS"
                                "COMMA_PARENTHESIS_WHITESPACE"
                                "EN_QUOTES"))

;; enable flyspell wherever it's available
(add-hook 'after-init-hook 'global-flycheck-mode)

;; flyspell workaround for mac UI session
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; flycheck color-mode setup
;; https://github.com/flycheck/flycheck-color-mode-line
(require 'flycheck-color-mode-line)

(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;; auto-complete for clojure repl
;; https://github.com/clojure-emacs/ac-cider
(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))

;; Tramp zsh fix
  (eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

;; Stop spewing backup files everywhere http://stackoverflow.com/questions/15302973/emacs-auto-save-why-are-files-not-stored-in-the-correct-folder
(defvar my-auto-save-folder "~/.emacs.d/backups/"); folder for auto-saves
(setq backup-directory-alist
      `((".*" . ,my-auto-save-folder)))
(setq auto-save-file-name-transforms
      `((".*" ,my-auto-save-folder t)))

;; Setup SLIME for CLISP
;; https://github.com/slime/slime

(require 'slime-autoloads)
(setq inferior-lisp-program "/opt/local/bin/ccl64")
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
(setq slime-contribs '(slime-fancy))


;; Add asm-mode hook to .psm files (picosynth)
;; Also for UFRGS architecture courses
(add-to-list 'auto-mode-alist '("\\.psm\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.ced\\'" . asm-mode))

;; Initialize ess (R mode)
(require 'ess-site)


;; Use macports Python
(setq python-python-command "/opt/local/bin/python")

;(require 'virtualenvwrapper)
;(venv-initialize-interactive-shells)
;(venv-initialize-eshell)
;;(setq venv-location "~/Documents/Projetos/python/venv")

;; Setup Jedi (Python autocomplete) http://tkf.github.io/emacs-jedi/latest/#install
;; Standard Jedi.el setting
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)

;; enable ido-mode
(ido-mode t)

;; enable smex https://github.com/nonsequitur/smex/
;;; Smex
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(setq smex-save-file "~/.emacs.d/smex-items")

;; https://github.com/doitian/ido-complete-space-or-hyphen
(require 'ido-complete-space-or-hyphen)

;; add flycheck support to python-mode
(eval-after-load "flycheck"
  '(add-hook 'python-mode-hook 'flycheck-mode))

;; color terminal
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; rainbow delimiters for all programming modes
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; show matching parens in programming mode
(make-variable-buffer-local 'show-paren-mode)
(add-hook 'prog-mode-hook 'show-paren-mode)

;; workaround for emacs run-octave bug
;; see ~/.octaverc and
;; http://stackoverflow.com/questions/24709653/inferior-octave-freezes
(setq inferior-octave-prompt ">> ")


;; initialize maxima
;; http://cxwangyi.wordpress.com/2012/04/30/using-maxima-with-mac-os-x-in-emacs-imaxima-mode/
;;(add-to-list 'load-path "/opt/local/share/maxima/5.36.1/emacs")
;;(require 'maxima)
;; (autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)

;; default octave-mode for .m files
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

(global-company-mode t)
(company-quickhelp-mode 1)


;; configure smart-mode-line
(sml/setup)
(sml/apply-theme 'powerline)

;; irony and company-irony
;; https://github.com/Sarcasm/irony-mode
;; https://github.com/Sarcasm/company-irony

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; set indent-mode for haskell-mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; enable company-mode for all programming modes
(add-hook 'prog-mode-hook 'company-mode)

;; force python-mode to use UTF-8
(add-hook 'inferior-python-mode-hook
	  (lambda ()
	    (setenv "LANG" "en_US.UTF8")
	    (setenv "LC_CTYPE" "UTF-8")
	    (setenv "LC_ALL" "en_US.UTF-8")
	    (setenv "LANG" "en_US.UTF-8")))

(require 'ein)

(nyan-mode 1)

(server-start)

;; javascript stuff
;; http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html

;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

(setq flycheck-javascript-eslint-executable "/Users/andre/Documents/Projetos/my_wardrobe/tools/node_modules/.bin/eslint")

;; add hook for web-mode for html
(add-to-list 'auto-mode-alist '("\\.htm?$" . web-mode))

;; add web-mode to flycheck-eslint set
(with-eval-after-load 'flycheck
  (push 'web-mode (flycheck-checker-get 'javascript-eslint 'modes)))

;; start server
(server-start)

;; enable helm
(global-set-key (kbd "M-X") 'helm-M-x)
(helm-mode 1)

;; use ipython as python interpreter
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")
(setenv "IPY_TEST_SIMPLE_PROMPT" "1")

;; use visual-line-mode in org-mode
(add-hook 'org-mode-hook 'turn-on-visual-line-mode)

;; collapse all headers in org-mode
(add-hook 'org-mode-hook 'outline-show-all)

;; use cdlatex in org-mode
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

;; enable linum-mode to show line number column
(global-linum-mode t)
