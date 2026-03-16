(use-package treemacs
  :ensure t
  :bind
  ("C-x t t" . treemacs))
;; 1. 基础 UI：Vertico (让补全列表垂直显示，像 Telescope 的小窗口)
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(provide 'ui)
