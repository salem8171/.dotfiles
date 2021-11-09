#!/usr/bin/env bash

CHROMIUM_ARGS=()
CHROMIUM_ARGS+=("--password-store=basic")
CHROMIUM_ARGS+=("--profile-directory=Default")
CHROMIUM_ARGS+=("--test-type")
CHROMIUM_ARGS+=("--enable-crashpad")
CHROMIUM_ARGS+=("--remote-debugging-port=9222")

CHROMIUM_ARGS+=("--flag-switches-begin")

CHROMIUM_ARGS+=("--extension-mime-request-handling=always-prompt-for-install")
CHROMIUM_ARGS+=("--extensions-on-chrome-urls")
CHROMIUM_ARGS+=("--bookmark-bar-ntp=never")
# CHROMIUM_ARGS+=("--close-window-with-last-tab=never")
CHROMIUM_ARGS+=("--keep-old-history=enabled")
CHROMIUM_ARGS+=("--disable-smooth-scrolling")
CHROMIUM_ARGS+=("--debug-packed-apps=enabled")
CHROMIUM_ARGS+=("--form-controls-dark-mode=enabled")
CHROMIUM_ARGS+=("--show-avatar-button=never")

CHROMIUM_FEATURES=()
CHROMIUM_FEATURES+=("OverlayScrollbar")
# CHROMIUM_FEATURES+=("WebContentsForceDark:inversion_method/cielab_based/image_behavior/selective/text_lightness_threshold/150/background_lightness_threshold/205")
CHROMIUM_FEATURES+=("TabHoverCardImages")
CHROMIUM_FEATURES+=("Commander")

CHROMIUM_FEATURES_STRING="${CHROMIUM_FEATURES[*]}"
CHROMIUM_FEATURES_STRING="${CHROMIUM_FEATURES_STRING// /,}"
CHROMIUM_ARGS+=("--enable-features=${CHROMIUM_FEATURES_STRING}")

CHROMIUM_ARGS+=("--flag-switches-end")
