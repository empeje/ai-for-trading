.PHONY: help notebook clean install new-project

# Default target
help:
	@echo "Available commands:"
	@echo "  make notebook    - Start Jupyter notebook server"
	@echo "  make install     - Install project dependencies"
	@echo "  make clean       - Clean up temporary files"
	@echo "  make new-project - Create a new project folder with auto-incrementing number"
	@echo "                    Usage: make new-project NAME=<name> [PADDING=<zeros>]"
	@echo "  make help        - Show this help message"

# Start Jupyter notebook
notebook:
	@echo "Starting Jupyter notebook server..."
	uv run jupyter notebook

# Install dependencies
install:
	@echo "Installing project dependencies..."
	uv sync

# Clean up temporary files
clean:
	@echo "Cleaning up temporary files..."
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete
	find . -type f -name ".DS_Store" -delete
	find . -type f -name "*.ipynb_checkpoints" -delete
	rm -rf .pytest_cache
	rm -rf .coverage
	rm -rf htmlcov

# Create a new project folder
# Usage: make new-project NAME=<project-name> [PADDING=<number-of-zeros>]
# Example: make new-project NAME=my-strategy PADDING=3
new-project:
	@echo "Creating new project folder..."
	@if [ -z "$(NAME)" ]; then \
		echo "Error: Please specify a project name with NAME=<project-name>"; \
		echo "Example: make new-project NAME=my-strategy"; \
		echo "Optional: PADDING=<number-of-zeros> (default: 3)"; \
		exit 1; \
	fi
	@echo "Finding next available project number..."
	@NEXT_NUM=$$(ls -1 projects/ | grep -E '^[0-9]+-' | sed 's/^\([0-9]*\)-.*/\1/' | sort -n | tail -1 | awk '{print $$1 + 1}'); \
	if [ -z "$$NEXT_NUM" ]; then NEXT_NUM=1; fi; \
	PADDING_VAL=$${PADDING:-3}; \
	PROJECT_NUM=$$(printf "%0$${PADDING_VAL}d" $$NEXT_NUM); \
	echo "Creating project: projects/$$PROJECT_NUM-$(NAME)/"; \
	mkdir -p projects/$$PROJECT_NUM-$(NAME)/{data,results,config}; \
	echo "# $(NAME) Project" > projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "This project implements $(NAME)." >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "## Project Structure" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "\`\`\`" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "$$PROJECT_NUM-$(NAME)/" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "├── README.md              # This file - project overview" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "├── main.ipynb             # Main project notebook" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "├── data/                  # Project-specific data" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "├── results/               # Generated results and outputs" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "└── config/                # Configuration files" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "\`\`\`" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "## How to Run" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "1. Open \`main.ipynb\` in Jupyter" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "2. Run the complete analysis pipeline" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "3. Check results in \`results/\` folder" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "## Dependencies" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "" >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "This project uses functions from the \`library/\` folder for common operations." >> projects/$$PROJECT_NUM-$(NAME)/README.md; \
	echo "Creating main.ipynb template..." >> projects/$$PROJECT_NUM-$(NAME)/main.ipynb; \
	echo "✅ Project \`$$PROJECT_NUM-$(NAME)\` created successfully!"; \
	echo "📁 Location: projects/$$PROJECT_NUM-$(NAME)/"; \
	echo "🚀 Next steps: cd projects/$$PROJECT_NUM-$(NAME)/ && start coding!"
