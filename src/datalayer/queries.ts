import sql from "./postgres-config"
import { handleDbError } from "./utils"

export const getExercises = async () => {
    return await handleDbError(sql`SELECT * FROM exercises`);
}