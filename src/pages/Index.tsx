import { useNavigate } from "react-router-dom";
import { Ear, Sparkles, BookOpen, HeartPulse } from "lucide-react";
import MobileLayout from "@/components/MobileLayout";
import { Button } from "@/components/ui/button";

const features = [
  { icon: Sparkles, label: "Discover new tools", variant: "secondary" as const },
  { icon: BookOpen, label: "Learn how to use them", variant: "accent" as const },
  { icon: HeartPulse, label: "Improve your daily life", variant: "secondary" as const },
];

const Index = () => {
  const navigate = useNavigate();

  return (
    <MobileLayout>
      <div className="flex flex-col justify-between min-h-screen px-8 py-12">
        <div className="flex flex-col items-center gap-8 pt-8">
          {/* Hero icon */}
          <div className="w-[120px] h-[120px] rounded-full bg-secondary flex items-center justify-center">
            <Ear size={60} className="text-primary" />
          </div>

          {/* Hero text */}
          <div className="text-center space-y-3">
            <h1 className="text-3xl font-bold text-foreground">Welcome to HearHub</h1>
            <p className="text-lg text-muted-foreground">
              Discover and use hearing support tools — simply.
            </p>
          </div>

          {/* Features */}
          <div className="w-full space-y-4 mt-4">
            {features.map(({ icon: Icon, label, variant }, i) => (
              <div key={i} className="flex items-center gap-4">
                <div
                  className={`w-12 h-12 rounded-full flex items-center justify-center shrink-0 ${
                    variant === "secondary" ? "bg-secondary" : "bg-accent"
                  }`}
                >
                  <Icon size={24} className={variant === "secondary" ? "text-primary" : "text-foreground"} />
                </div>
                <span className="text-base font-medium text-foreground">{label}</span>
              </div>
            ))}
          </div>
        </div>

        {/* CTA */}
        <div className="pb-4 pt-8">
          <Button
            onClick={() => navigate("/onboarding")}
            className="w-full min-h-[56px] text-lg font-semibold rounded-3xl"
          >
            Get Started
          </Button>
        </div>
      </div>
    </MobileLayout>
  );
};

export default Index;
