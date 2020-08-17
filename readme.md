# bANSh

Because the world always need more bash, more bytebeat, more escape sequences, more ephemeral digital art.

# Use

There are two main scripts, **bansh.sh** prints 8-bit colored blocks (spaces with bg color) and **basch.sh** prints 'ASCII' characters with the current color configuration of your terminal by default (run `./basch.sh -c` for color).

Both have a default expression that's evaluated at start, press **CTRL+C** to edit the expression. Writing a `q` anywhere in the expression will quit the program. You can also assign an initial expression to any script like `./bansh.sh "t*t>>10"`. In the case of `basch.sh`, when using color mode, the expression should be after the `-c` parameter like this: `./basch.sh -c "t>>((t>>6)&7)&1"`.

The number of columns is automatically adjusted to powers of two in concordance with the terminal resolution status.

# test.sh

There is a third script that evaluates expressions in blocks of 64 returning the numerical results in order to practice and learn about expressions behavior.

# Tweak

The code is simple and short, edit the value of *s* variable to change the sleeping time after each line but remember that *printing is very CPU expensive*.
