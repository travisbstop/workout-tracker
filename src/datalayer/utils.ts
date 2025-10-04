import postgres from 'postgres';

interface SuccessResult {
    results: postgres.RowList<postgres.Row[]>;
    error: null;
}

interface FailResult {
    results: null;
    error: Error;
}

type Results = SuccessResult | FailResult;

export const handleDbError = async (dbPromise: Promise<postgres.RowList<postgres.Row[]>>): Promise<Results> => {
    try {
        return {results: await dbPromise, error: null };
    } catch {
        return { results: null, error: new Error('error when querying database') };
    }
}