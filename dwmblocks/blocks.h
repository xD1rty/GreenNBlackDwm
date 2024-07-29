//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
  	{"┇  ", "/home/ivan/Dwm/scripts/keyboard.sh", 0, 1},

  	{"bat: ", "/home/ivan/Dwm/scripts/battery.sh", 15, 0},
	{"dat: " , "/home/ivan/Dwm/scripts/date.sh", 1, 0},
	{"",       "/home/ivan/Dwm/scripts/currency.sh", 1, 0 },
	{"vol: ",       "/home/ivan/Dwm/scripts/get_volume.sh", 1, 0 },
	{"MSK: ",       "/home/ivan/Dwm/scripts/weather.sh", 1, 0 },
	{"",       "/home/ivan/Dwm/scripts/wifi.sh", 1, 0 },
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "  ┇  ";
static unsigned int delimLen = 100;
