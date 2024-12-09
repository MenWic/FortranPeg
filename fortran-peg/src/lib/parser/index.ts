import * as Parser from './peg-parser';

//Funcion que parsea el archivo peg-parser (dicho archivo se genera al ejecutarse el comando "npm run compile")
export default function parseInput(input: string) {
    try {
        Parser.parse(input);
    } catch (e) {
        return e as string;
    }
    return 'Codigo fuente parseado, todo bien...';
}