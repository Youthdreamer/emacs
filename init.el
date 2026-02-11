(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "theme" user-emacs-directory))

(require 'basic)
;;; init-package.el --- Package Manager Configuration -*- lexical-binding: t -*-

;; ================================
;; 包管理初始化
;; ================================
(require 'package)
;; 1. 设置清华镜像源
(setq package-archives
      '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
        ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;; 2. 初始化包管理器
(unless (bound-and-true-p package--initialized)
  (package-initialize))
;; 3. 刷新软件源缓存 (如果本地没有缓存则自动下载)
(unless package-archive-contents
  (package-refresh-contents))


(require 'use-package)
(setq use-package-always-ensure t)

(require 'theme)

;; 1. 定义一个专门存放自动生成代码的文件路径
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; 2. 如果该文件存在，则加载它（防止你之前在 UI 界面做的设置丢失）
(when (file-exists-p custom-file)
  (load custom-file))
