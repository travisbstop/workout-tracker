import Link from "next/link";

export default async function Home() {
  return (
    <div>
      <Link href="/admin">Admin</Link>
    </div>
  );
}
