import { ReactNode } from "react";

interface MobileLayoutProps {
  children: ReactNode;
  className?: string;
}

const MobileLayout = ({ children, className = "" }: MobileLayoutProps) => {
  return (
    <div className="flex min-h-screen items-start justify-center bg-background">
      <div className={`relative w-full max-w-[480px] min-h-screen bg-background ${className}`}>
        {children}
      </div>
    </div>
  );
};

export default MobileLayout;
