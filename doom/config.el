(setq
 doom-font (font-spec :family "MonoLisa Nerd Font" :size 19 :weight 'semibold)
 doom-variable-pitch-font (font-spec :family "MonoLisa Nerd Font" :size 19 :weight 'bold))

(setq doom-theme 'doom-dark+)

(setq display-line-numbers-type t)

(setq org-directory "~/brain/")


(remove-hook 'dired-mode-hook #'dired-omit-mode)
(set-face-attribute 'default nil :background "#000000")
(set-frame-parameter nil 'alpha-background 80)
(add-to-list 'default-frame-alist '(alpha-background . 80))

(defun +doom-dashboard-ascii-banner-fn ()
  (let ((banner
                                '("                _____                      _            _     "
                                  "               /  ___|                    | |          | |    "
                                  "               \\ `--.  ___   ___ _ __ __ _| |_ ___  ___| |__  "
                                  "                `--. \\/ _ \\ / __| '__/ _` | __/ _ \\/ __| '_ \\ "
                                  "               /\\__/ / (_) | (__| | | (_| | ||  __/ (__| | | |"
                                  "               \\____/ \\___/ \\___|_|  \\__,_|\\__\\___|\\___|_| |_|"
                                  "\n"
                                  "                                  socratech.sh                  "
                                  "\n")))
    (dolist (line banner)
      (insert line "\n"))))

(setq +doom-dashboard-ascii-banner-fn #'+doom-dashboard-ascii-banner-fn)

(after! org (setq org-agenda-files '("~/brain/")))


(after! org-roam
  (setq org-roam-directory "~/brain")
        (setq org-roam-capture-templates
                '(("d" "default" plain
                "
* %<%d-%m-%Y> Protocol
        :PROPERTIES:
        :ID:             %(org-id-new)
        :SLEEP_HOURS:    %^{Sleep Hours}
        :SLEEP_QUAL:     %^{Sleep Quality (1-10)}
        :MOOD:           %^{Mood (1-10)}
        :ENERGY:         %^{Energy (1-10)}
        :WEIGHT:         %^{Weight (kg)|0}
        :WAIST SIZE:     %^{Waist size (cm)|0}
        :CARDIO_MINS:    %^{Cardio Mins|0}
        :STRENGTH_MINS:  %^{Strength Mins|0}
        :EXPENSE_TOTAL:  %^{Total Expenses ($)|0}
        :END:

** Sleep Analysis
/Dreams, wake up time, grogginess./
- %?

** Training Log
/Specific lifts, zones, or perceived exertion./
-

** The Lexicon (New Vocabulary)
:PROPERTIES:
:CATEGORY: Learning
:END:
-

** Engineering & Work Tasks
:PROPERTIES:
:CATEGORY: Work
:END:
*** Priorities (The 'Must Dos')
- [ ]

** Things I want to learn (Log)
/What do I want to research?/
-

** Financial Ledger
/Update the :EXPENSE_TOTAL: property after filling this./
| Item Description | Category | Cost ($) |
|------------------+----------+----------|
|                  |          |          |
|------------------+----------+----------|
| *Total* |          | *0.00* |
#+TBLFM: $3=vsum(@2$3..@-1$3)

** Closing Reflection
/Synthesis of the day./"
                :target (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n#+filetags: :protocol:\n")
                :unnarrowed t))))

(after! org-capture
  (set-popup-rule! "^CAPTURE" :actions '(display-buffer-same-window) :select t :quit nil))
