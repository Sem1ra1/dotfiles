local scriptsDir = HOME .. "/.config/hypr/scripts"

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})
-- hl.gesture({
--     fingers = 4,
--     direction = "up",
--     action = "dispatcher",
--     -- TODO: manual review — extra gesture field "exec"
--     -- TODO: manual review — extra gesture field "hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 1.5}')\""
-- })
-- hl.gesture({
--     fingers = 4,
--     direction = "down",
--     action = "dispatcher",
--     -- TODO: manual review — extra gesture field "exec"
--     -- TODO: manual review — extra gesture field "hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 1.5}')\""
-- })
-- hl.gesture({
--     fingers = 3,
--     direction = "up",
--     action = "dispatcher",
--     -- TODO: manual review — extra gesture field "exec"
--     -- TODO: manual review — extra gesture field "$scriptsDir/OverviewToggle.sh"
-- })

hl.config({
    dwindle = {
        preserve_split = true,
        special_scale_factor = 0.8,
    },
    master = {
        new_status = "master",
        new_on_top = true,
        mfact = 0.5,
    },
    general = {
        border_size = 2,
        gaps_in = 5,
        gaps_out = 5,
        resize_on_border = true,
        layout = "master",
        col = {
            active_border = "rgb(BC14EB)",
            inactive_border = "rgb(BCB9C8)",
        },
    },
    group = {
        col = {
            border_active = "rgb(BC14EB)",
        },
        groupbar = {
            col = {
                active = "rgb(BC14EB)",
            },
        },
    },
    decoration = {
        rounding = 5,
        active_opacity = 2,
        inactive_opacity = 2.0,
        blur = {
            enabled = true,
            size = 6,
            passes = 3,
            new_optimizations = true,
            xray = true,
            ignore_opacity = true,
            special = true,
            popups = true,
        },
    },
    animations = {
        enabled = false,
    },
    input = {
        kb_layout = "us,ru",
        kb_variant = "unieng, unirus",
        kb_options = "grp:win_space_toggle",
        kb_model = "",
        kb_rules = "",
        repeat_rate = 50,
        repeat_delay = 300,
        sensitivity = 0, --mouse sensitivity
        numlock_by_default = true,
        left_handed = false,
        follow_mouse = 1,
        float_switch_override_focus = false,
        touchpad = {
            disable_while_typing = true,
            natural_scroll = true,
            clickfinger_behavior = false,
            middle_button_emulation = false,
            tap_to_click = true,
            drag_lock = false,
        },
        touchdevice = {
            enabled = true,
        },
        tablet = {
            transform = 0,
            left_handed = true,
        },
    },
    gestures = {
        workspace_swipe_distance = 500,
        workspace_swipe_invert = true,
        workspace_swipe_min_speed_to_force = 30,
        workspace_swipe_cancel_ratio = 0.5,
        workspace_swipe_create_new = true,
        workspace_swipe_forever = true,
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        vrr = 2,
        mouse_move_enables_dpms = true,
        enable_swallow = false,
        swallow_regex = "^(kitty)$",
        focus_on_activate = false,
        initial_workspace_tracking = 0,
        middle_click_paste = false,
        enable_anr_dialog = true, -- Application not Responding (ANR)
        anr_missed_pings = 15, -- ANR Threshold default 1 is too low
        allow_session_lock_restore = true, -- Prevent lockscreen crash when resume from suspend
        on_focus_under_fullscreen = 1,
    },
    binds = {
        workspace_back_and_forth = false,
        allow_workspace_cycles = true,
        pass_mouse_when_bound = false,
    },
    xwayland = {
        enabled = true,
        force_zero_scaling = true,
    },
    render = {
        direct_scanout = 0,
    },
    cursor = {
        sync_gsettings_theme = true,
        no_hardware_cursors = 1,
        enable_hyprcursor = true,
        warp_on_change_workspace = 2,
        no_warps = false,
    },
})

