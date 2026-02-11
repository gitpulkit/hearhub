import { useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { Utensils, Users, GraduationCap, Home, Check, X, Info, ArrowLeft } from "lucide-react";
import MobileLayout from "@/components/MobileLayout";
import { Button } from "@/components/ui/button";

const scenarioData: Record<string, { icon: typeof Utensils; question: string; subtext: string }> = {
  restaurant: {
    icon: Utensils,
    question: "Do you find it hard to hear in noisy restaurants?",
    subtext: "Consider places with loud background music or crowded tables.",
  },
  meeting: {
    icon: Users,
    question: "Do you struggle to follow conversations in meetings?",
    subtext: "Think about conference rooms or video calls with multiple speakers.",
  },
  classroom: {
    icon: GraduationCap,
    question: "Is it difficult to hear your teacher or professor?",
    subtext: "Consider large lecture halls or group discussions.",
  },
  home: {
    icon: Home,
    question: "Do you have trouble hearing the TV or doorbell at home?",
    subtext: "Think about everyday sounds you might be missing.",
  },
};

const Assessment = () => {
  const navigate = useNavigate();
  const { scenario } = useParams<{ scenario: string }>();
  const [answered, setAnswered] = useState(false);

  const data = scenarioData[scenario || "restaurant"] || scenarioData.restaurant;
  const Icon = data.icon;

  const handleAnswer = () => {
    setAnswered(true);
    setTimeout(() => navigate("/dashboard"), 1200);
  };

  if (answered) {
    return (
      <MobileLayout>
        <div className="flex flex-col items-center justify-center min-h-screen px-8 gap-6">
          <div className="w-24 h-24 rounded-full bg-primary flex items-center justify-center">
            <Check size={48} className="text-primary-foreground" />
          </div>
          <h2 className="text-2xl font-bold text-foreground text-center">Thank you!</h2>
          <p className="text-muted-foreground text-center">Your answer helps us personalize your experience.</p>
        </div>
      </MobileLayout>
    );
  }

  return (
    <MobileLayout>
      <div className="flex flex-col min-h-screen px-8 py-6">
        {/* Header */}
        <div className="flex items-center justify-between mb-8">
          <button
            onClick={() => navigate("/dashboard")}
            className="w-12 h-12 rounded-full bg-card flex items-center justify-center min-h-[48px]"
          >
            <ArrowLeft size={24} className="text-foreground" />
          </button>
          <span className="text-base font-semibold text-foreground">Question 3 of 10</span>
          <button
            onClick={() => navigate("/dashboard")}
            className="text-muted-foreground font-medium min-h-[48px] flex items-center"
          >
            Skip
          </button>
        </div>

        {/* Content */}
        <div className="flex-1 flex flex-col items-center justify-center gap-8">
          <div className="w-[100px] h-[100px] rounded-full bg-secondary flex items-center justify-center">
            <Icon size={48} className="text-primary" />
          </div>

          <div className="text-center space-y-3">
            <h2 className="text-2xl font-bold text-foreground">{data.question}</h2>
            <p className="text-muted-foreground">{data.subtext}</p>
          </div>

          <div className="w-full space-y-4 mt-4">
            <Button
              onClick={handleAnswer}
              className="w-full min-h-[56px] text-lg font-semibold rounded-3xl gap-3"
            >
              <Check size={20} />
              Yes, often
            </Button>
            <Button
              onClick={handleAnswer}
              variant="secondary"
              className="w-full min-h-[56px] text-lg font-semibold rounded-3xl gap-3 bg-accent text-foreground hover:bg-accent/80"
            >
              <X size={20} />
              No, rarely
            </Button>
          </div>
        </div>

        {/* Footer */}
        <div className="flex items-center gap-2 justify-center py-6 text-muted-foreground">
          <Info size={16} />
          <span className="text-sm">Your answers help us personalize tools.</span>
        </div>
      </div>
    </MobileLayout>
  );
};

export default Assessment;
