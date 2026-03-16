;; 模糊匹配：Orderless (让你输入 "mod con" 就能搜到 "model-context")
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; 增强指令：Consult (这是 Telescope 的核心替代品)
(use-package consult
  :ensure t
  :bind (;; 类似 Telescope 的 live_grep
         ("M-s g" . consult-ripgrep)
         ;; 类似 Telescope 的 find_files (配合 project.el)
         ("C-x p f" . project-find-file)
         ;; 类似 Telescope 的 buffers
         ("C-x b" . consult-buffer)
         ;; 类似 Telescope 的 current_buffer_fuzzy_find
         ("M-s l" . consult-line))
  :hook (completion-list-mode . consult-preview-at-point-mode))

;; 侧边注释：Marginalia (在搜索结果旁边显示文件大小、日期等)
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package avy
  :ensure t
  :bind (("M-j" . avy-goto-char-timer)    ; 类似 flash.nvim 的搜索模式
         ("C-:" . avy-goto-char)          ; 跳转到指定字符
         ("M-g f" . avy-goto-line))       ; 跳转到行
  :config
  ;; 设置等待时间（毫秒），超时后自动开始跳转
  (setq avy-timeout-seconds 0.3)
  ;; 让标签显示在字符中心，更醒目
  (setq avy-position 'at-full))

(provide 'navigation)
