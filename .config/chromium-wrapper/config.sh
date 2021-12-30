#!/usr/bin/env bash

CHROMIUM_ARGS=(
  "--password-store=basic"
  "--profile-directory=Default"
  "--test-type"
  "--enable-crashpad"
  "--remote-debugging-port=9222"

  "--flag-switches-begin"

  "--extension-mime-request-handling=always-prompt-for-install"
  "--extensions-on-chrome-urls"
  "--bookmark-bar-ntp=never"
  # "--close-window-with-last-tab=never"
  "--keep-old-history=enabled"
  "--disable-smooth-scrolling"
  "--debug-packed-apps=enabled"
  "--form-controls-dark-mode=enabled"
  "--show-avatar-button=never"
)

CHROMIUM_FEATURES=(
  "OverlayScrollbar"
  # "WebContentsForceDark:inversion_method/cielab_based/image_behavior/selective/text_lightness_threshold/150/background_lightness_threshold/205"
  "TabHoverCardImages"
  "Commander"
)

CHROMIUM_FEATURES_STRING="${CHROMIUM_FEATURES[*]}"
CHROMIUM_FEATURES_STRING="${CHROMIUM_FEATURES_STRING// /,}"
CHROMIUM_ARGS+=("--enable-features=${CHROMIUM_FEATURES_STRING}")

CHROMIUM_ARGS+=("--flag-switches-end")
