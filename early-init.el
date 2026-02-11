;;; early-init.el --- Early Initialization Configuration -*- lexical-binding: t -*-

;; ----------------------------------------------------------------------------
;; 1. 垃圾回收 (GC) 性能优化
;; ----------------------------------------------------------------------------
;; 启动时大幅增加阈值，减少 GC 次数，启动后需在 init.el 中恢复
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; ----------------------------------------------------------------------------
;; 2. 极致 UI 预设 (解决闪烁和残留)
;; ----------------------------------------------------------------------------
;; 彻底从底层参数级禁用 UI 元素，确保窗口弹出时就是干净的
(setq default-frame-alist
      '((menu-bar-lines . 0)      ; 菜单栏
        (tool-bar-lines . 0)      ; 工具栏
        (vertical-scroll-bars)    ; 垂直滚动条
        (horizontal-scroll-bars)  ; 水平滚动条
        (internal-border-width . 0))) ; 内部边距

;; 针对不同平台和编译版本的兼容性处理
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode) (horizontal-scroll-bar-mode -1))

;; 禁止显示启动画面和多余信息
(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)

;; ----------------------------------------------------------------------------
;; 3. 性能与编码增强
;; ----------------------------------------------------------------------------
;; 优化文件读写性能
(setq file-name-handler-alist nil)

;; 禁止压缩字体缓存（大幅提升含中文字符页面的滚动顺畅度）
(setq inhibit-compacting-font-caches t)

;; 设置渲染延迟，减少输入时的微卡顿
(setq idle-update-delay 1.0)

;; 强制使用 UTF-8
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; ----------------------------------------------------------------------------
;; 4. Emacs 30 特性优化 (Native Comp & PGTK)
;; ----------------------------------------------------------------------------
;; 静默原生编译（JIT）的警告信息，避免弹出无用窗口
(when (boundp 'native-comp-async-report-warnings-errors)
  (setq native-comp-async-report-warnings-errors 'silent))

;; 针对 Emacs 30 的新窗口调整逻辑
(setq frame-inhibit-implied-resize t)

;; ----------------------------------------------------------------------------
;; 5. 包管理器预设 (针对现代方案 Elpaca/Straight)
;; ----------------------------------------------------------------------------
;; 禁用内置的 package.el 自动初始化，防止它抢占加载顺序
(setq package-enable-at-startup nil)

(provide 'early-init)
