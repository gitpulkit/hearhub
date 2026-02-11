import { useNavigate } from "react-router-dom";
import { ArrowLeft, Mic, FileText, Play } from "lucide-react";
import MobileLayout from "@/components/MobileLayout";
import { Button } from "@/components/ui/button";

const tools = [
  {
    name: "Live Transcribe",
    desc: "Real-time speech to text for lectures and meetings.",
    icon: Mic,
  },
  {
    name: "Otter.ai",
    desc: "AI-powered note-taking for students and professionals.",
    icon: FileText,
  },
];

const steps = [
  "Download the app from your app store.",
  "Open it during your next lecture or meeting.",
  "Review your transcription and share notes.",
];

const GuideStudent = () => {
  const navigate = useNavigate();

  return (
    <MobileLayout>
      <div className="flex flex-col min-h-screen pb-24">
        {/* Header */}
        <div className="px-8 py-6">
          <button
            onClick={() => navigate("/onboarding")}
            className="w-12 h-12 rounded-full bg-card flex items-center justify-center min-h-[48px]"
          >
            <ArrowLeft size={24} className="text-foreground" />
          </button>
        </div>

        <div className="px-8">
          <h2 className="text-2xl font-bold text-foreground mb-2">For Students</h2>
          <p className="text-muted-foreground mb-6">Tools and tips to help you in the classroom.</p>
        </div>

        {/* Recommended tools - horizontal scroll */}
        <div className="px-8 mb-8">
          <h3 className="text-lg font-semibold text-foreground mb-4">Recommended Tools</h3>
          <div className="flex gap-4 overflow-x-auto pb-2 -mx-2 px-2 scrollbar-hide">
            {tools.map(({ name, desc, icon: Icon }) => (
              <div
                key={name}
                className="min-w-[220px] bg-card rounded-3xl p-5 border border-border flex flex-col gap-3"
              >
                <div className="w-12 h-12 rounded-full bg-accent flex items-center justify-center">
                  <Icon size={24} className="text-foreground" />
                </div>
                <h4 className="font-bold text-foreground">{name}</h4>
                <p className="text-sm text-muted-foreground">{desc}</p>
              </div>
            ))}
          </div>
        </div>

        {/* Video section */}
        <div className="px-8 mb-8">
          <h3 className="text-lg font-semibold text-foreground mb-4">Watch How It Works</h3>
          <div className="relative w-full aspect-video bg-secondary rounded-3xl overflow-hidden flex items-center justify-center mb-3">
            <div className="w-16 h-16 rounded-full bg-primary/80 flex items-center justify-center">
              <Play size={32} className="text-primary-foreground ml-1" />
            </div>
          </div>
          <div className="bg-foreground/80 rounded-2xl px-4 py-3">
            <p className="text-primary-foreground text-sm font-mono">
              Professor: "Today we will study..."
            </p>
          </div>
        </div>

        {/* How to use steps */}
        <div className="px-8 mb-8">
          <h3 className="text-lg font-semibold text-foreground mb-4">How to Use</h3>
          <div className="space-y-4">
            {steps.map((step, i) => (
              <div key={i} className="flex items-start gap-4">
                <div className="w-8 h-8 rounded-full bg-primary flex items-center justify-center shrink-0 mt-0.5">
                  <span className="text-primary-foreground font-bold text-sm">{i + 1}</span>
                </div>
                <p className="text-foreground text-base pt-1">{step}</p>
              </div>
            ))}
          </div>
        </div>

        {/* Fixed CTA */}
        <div className="fixed bottom-0 left-1/2 -translate-x-1/2 w-full max-w-[480px] px-8 py-4 bg-background">
          <Button
            onClick={() => navigate("/dashboard")}
            className="w-full min-h-[56px] text-lg font-semibold rounded-3xl"
          >
            Try these tools
          </Button>
        </div>
      </div>
    </MobileLayout>
  );
};

export default GuideStudent;
