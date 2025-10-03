import sql from "@/datalayer/postgres-config";

export default async function Home() {
  const exercises = await sql`SELECT * FROM exercises`;
  return <div>{exercises.map((exercise) => exercise.exercise_name)}</div>;
}
