.PHONY: init
init: ## 安裝套件
	brew bundle
	$(MAKE) update

.PHONY: dump
dump: ## 更新套件清單
	touch Brewfile && rm -iv Brewfile
	brew tap && brew bundle dump

.PHONY: update
update: ## 進行套件更新
	brew update && brew upgrade && brew cleanup

.PHONY: check
check: ## 運行環境健康檢查
	brew doctor
	brew cask doctor

# Absolutely awesome: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
