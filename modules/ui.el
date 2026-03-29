(use-package treemacs
  :ensure t
  :bind
  ("C-x t t" . treemacs))
;; 1. 基础 UI：Vertico (让补全列表垂直显示，像 Telescope 的小窗口)
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (centaur-tabs-mode t)

  ;; 开启图标
  (setq centaur-tabs-set-icons t)

  ;; 图标大小
  (setq centaur-tabs-icon-scale-factor 1.0)

  ;; 是否显示修改标记
  (setq centaur-tabs-set-modified-marker t)

  ;; 使用 nerd-icons（关键）
  (setq centaur-tabs-icon-type 'nerd-icons)
  )

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)

  :custom
  ;; 高度
  (doom-modeline-height 25)

  ;; 图标（关键）
  (doom-modeline-icon t)

  ;; 使用 nerd-icons
  (doom-modeline-major-mode-icon t)
  (doom-modeline-buffer-file-name-style 'truncate-with-project)

  ;; 显示 LSP
  (doom-modeline-lsp t)
  )
(provide 'ui)
