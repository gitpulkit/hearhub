import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { ArrowLeft, GraduationCap, Briefcase, Users, Heart, ChevronRight } from "lucide-react";
import MobileLayout from "@/components/MobileLayout";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";

const categories = [
  { id: "student", icon: GraduationCap, label: "I am a student", variant: "secondary" as const },
  { id: "professional", icon: Briefcase, label: "I am a professional", variant: "accent" as const },
  { id: "parent", icon: Users, label: "I am a parent", variant: "secondary" as const },
  { id: "senior", icon: Heart, label: "I am a senior", variant: "accent" as const },
];

const Onboarding = () => {
  const navigate = useNavigate();
  const [selected, setSelected] = useState<string | null>(null);

  return (
    <MobileLayout>
      <div className="flex flex-col min-h-screen px-8 py-6">
        {/* Header */}
        <div className="flex items-center gap-4 mb-4">
          <button
            onClick={() => navigate("/")}
            className="w-12 h-12 rounded-full bg-card flex items-center justify-center min-h-[48px]"
          >
            <ArrowLeft size={24} className="text-foreground" />
          </button>
        </div>

        <Progress value={25} className="h-2 mb-8 bg-secondary [&>div]:bg-primary" />

        <h2 className="text-2xl font-bold text-foreground mb-2">How can we help?</h2>
        <p className="text-muted-foreground mb-8">Select the option that best describes you.</p>

        {/* Cards */}
        <div className="space-y-4 flex-1">
          {categories.map(({ id, icon: Icon, label, variant }) => (
            <button
              key={id}
              onClick={() => setSelected(id)}
              className={`w-full flex items-center gap-4 p-4 rounded-3xl bg-card border-2 transition-all min-h-[56px] ${
                selected === id
                  ? "border-primary shadow-md"
                  : "border-border hover:border-primary/30"
              }`}
            >
              <div
                className={`w-12 h-12 rounded-full flex items-center justify-center shrink-0 ${
                  variant === "secondary" ? "bg-secondary" : "bg-accent"
                }`}
              >
                <Icon size={24} className={variant === "secondary" ? "text-primary" : "text-foreground"} />
              </div>
              <span className="text-base font-medium text-foreground flex-1 text-left">{label}</span>
              <ChevronRight size={20} className="text-muted-foreground" />
            </button>
          ))}
        </div>

        {/* CTA */}
        <div className="pb-4 pt-8">
          <Button
            onClick={() => selected && navigate(`/guide/${selected}`)}
            disabled={!selected}
            className="w-full min-h-[56px] text-lg font-semibold rounded-3xl"
          >
            Continue
          </Button>
        </div>
      </div>
    </MobileLayout>
  );
};

export default Onboarding;
