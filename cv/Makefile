OUTPUT = Bekbulatov-Ramzan-CV
BUILD  = build
FONTS  = --font-path fonts

.PHONY: pdf preview watch clean

pdf: | $(BUILD)
	typst compile $(FONTS) main.typ $(BUILD)/$(OUTPUT).pdf

preview: | $(BUILD)
	typst compile $(FONTS) main.typ "$(BUILD)/$(OUTPUT)-{p}.png" --format png --ppi 200

watch: | $(BUILD)
	typst watch $(FONTS) main.typ $(BUILD)/$(OUTPUT).pdf

clean:
	rm -rf $(BUILD)

$(BUILD):
	mkdir -p $(BUILD)
