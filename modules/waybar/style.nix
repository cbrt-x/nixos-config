''
@define-color fg rgb(230, 230, 230);
@define-color bg rgb(40, 40, 50);

window, tooltip {
    font-family: Jetbrains Mono Nerd Font, monospace;
    font-weight: bold;
    font-size: 12pt;
}

#workspaces,
#clock,
#cpu,
#memory,
#wireplumber,
#mpd,
#battery {
    padding: 0.5em 1em;
    margin: 0.5em;

    border-radius: 0.7em;
    /* border-bottom-left-radius: 0;
    border-top-right-radius: 0; */

    /* background-image: linear-gradient(135deg, @bg, shade(@bg, 1.375)); */
    background: @bg;

    color: @fg;
    opacity: 1;
    transition: opacity 0.5s;
}

#workspaces {
    padding-left: 0;
    padding-right: 0;
}

#workspaces button.empty {
    background: shade(@fg, 0.3);
}

#workspaces button:hover {
    background: @bg;
    box-shadow: inherit;
    text-shadow: inherit;
}

#workspaces button {
    padding: 8px 0.75em;
    margin: 0 0.5em;
    color: @bg;
    background: shade(@fg, 0.75);
    border-radius: inherit;
}

#workspaces button.active {
    background: @fg;
}

window#waybar {
    background: transparent;
    border-radius: 0;
}

.modules-left,
.modules-right {
    padding: 0 0.4em 
             0 0.4em;
}

/* MPD style */
#mpd.paused,
#mpd.stopped,
#wireplumber.muted {
    opacity: 0.2;
}

#window {
    color: @fg;
    padding-left: 1em;
}
''
