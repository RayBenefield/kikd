#!/usr/bin/env ./node_modules/.bin/babel-node
>>>>>>> fix(cli): Add shebang to cli and transform it properly in build.
import meow from 'meow';
import kd from '.';

const cli = meow(`
    Usage
        $ kd <input>

    Options
        --rainbow, -r  Include a rainbow

    Examples
        $ kd unicorns --rainbow
        🌈  unicorns 🌈
`, {
    flags: {
        rainbow: {
            type: 'boolean',
            alias: 'r',
        },
    },
});

kd(cli.input[0], cli.flags);
