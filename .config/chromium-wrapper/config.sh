#!/usr/bin/env bash

CHROMIUM_ARGS=(
  "--disable-dinosaur-easter-egg"
  "--disable-top-sites"
  "--enable-crashpad"
  "--force-dark-mode"
  "--force-device-scale-factor=0.9"
  "--password-store=basic"
  "--profile-directory=Default"
  "--remote-debugging-port=9222"
  "--test-type"
  "--use-vulkan"

  "--flag-switches-begin"

  "--bookmark-bar-ntp=never"
  "--debug-packed-apps=enabled"
  "--disable-smooth-scrolling"
  "--enable-gpu-rasterization"
  "--extension-mime-request-handling=always-prompt-for-install"
  "--extensions-on-chrome-urls"
  "--fingerprinting-canvas-image-data-noise"
  "--fingerprinting-canvas-measuretext-noise"
  "--fingerprinting-client-rects-noise"
  "--form-controls-dark-mode=enabled"
  "--keep-old-history=enabled"
  "--remove-grab-handle"
  "--remove-tabsearch-button"
  "--show-avatar-button=never"
  # "--close-window-with-last-tab=never"
)

CHROMIUM_FEATURES=(
  "Commander"
  "OverlayScrollbar"
  "SystemNotifications"
  "TabHoverCardImages"
  "VaapiVideoDecoder"
  "WebUIDarkMode"
  # "WebContentsForceDark:inversion_method/cielab_based/image_behavior/selective/text_lightness_threshold/150/background_lightness_threshold/205"
)

CHROMIUM_FEATURES_STRING="${CHROMIUM_FEATURES[*]}"
CHROMIUM_FEATURES_STRING="${CHROMIUM_FEATURES_STRING// /,}"
CHROMIUM_ARGS+=("--enable-features=${CHROMIUM_FEATURES_STRING}")

CHROMIUM_ARGS+=("--flag-switches-end")
