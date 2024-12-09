import * as Parser from './peg-parser';

// Function to parse the input using the generated peg-parser
export default function parseInput(input: string) {
    try {
        Parser.parse(input);
    } catch (e: unknown) {
        const error = e as {
            message: string;
            location?: {
                start: {
                    line: number;
                    column: number;
                };
            };
        };

        if (error.location) {
            return 'Error: ' + error.message + ' Cerca de la linea ' + error.location.start.line + ', y columna ' +
                error.location.start.column+'.';
        }
        return 'Error: ' + error.message;
    }
    return 'Codigo fuente parseado, todo bien...';
}
