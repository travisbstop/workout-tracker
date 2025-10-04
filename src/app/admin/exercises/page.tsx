import { getExercises } from "@/datalayer/queries";

export default async function Exercises() {
  const { results: exercises, error } = await getExercises();

  if (error) {
    return <div>database error occurred</div>;
  }

  return (
    <div>{exercises.map((exercise) => `${exercise.exercise_name}, `)}</div>
  );
}
