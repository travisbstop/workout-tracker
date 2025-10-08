interface ButtonProps {
  children: React.ReactNode;
}

const Button = ({ children }: ButtonProps) => {
  return (
    <button
      type="button"
      className="bg-primary hover:opacity-75 hover:cursor-pointer rounded-sm p-2"
    >
      {children}
    </button>
  );
};

export default Button;
