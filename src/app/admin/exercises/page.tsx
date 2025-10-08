import Button from "@/components/button";
import { getExercises } from "@/datalayer/queries";

export default async function Exercises() {
  const { results: exercises, error } = await getExercises();

  if (error) {
    return <div>database error occurred</div>;
  }

  return (
    <div>
      <Button>This is a button</Button>
    </div>
  );
}
