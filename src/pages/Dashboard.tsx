import { useNavigate } from "react-router-dom";
import { Ear, Headphones, Volume2, Utensils, Users, GraduationCap, Home as HomeIcon } from "lucide-react";
import MobileLayout from "@/components/MobileLayout";
import BottomNav from "@/components/BottomNav";
import { Button } from "@/components/ui/button";
import { Avatar, AvatarFallback } from "@/components/ui/avatar";

const topPicks = [
  { name: "Sound Amplifier", desc: "Boost surrounding sounds", icon: Volume2 },
  { name: "Hearing Test Pro", desc: "Check your hearing health", icon: Ear },
  { name: "Noise Reducer", desc: "Filter background noise", icon: Headphones },
];

const situations = [
  { id: "restaurant", label: "Restaurant", icon: Utensils, variant: "secondary" as const },
  { id: "meeting", label: "Meeting", icon: Users, variant: "accent" as const },
  { id: "classroom", label: "Classroom", icon: GraduationCap, variant: "secondary" as const },
  { id: "home", label: "Home", icon: HomeIcon, variant: "accent" as const },
];

const Dashboard = () => {
  const navigate = useNavigate();

  return (
    <MobileLayout>
      <div className="flex flex-col min-h-screen pb-24">
        {/* Top bar */}
        <div className="flex items-center justify-between px-8 py-6">
          <div>
            <p className="text-muted-foreground text-sm">Good morning</p>
            <h1 className="text-2xl font-bold text-foreground">Hello, User</h1>
          </div>
          <Avatar className="w-12 h-12 bg-accent">
            <AvatarFallback className="bg-accent text-foreground font-bold">U</AvatarFallback>
          </Avatar>
        </div>

        {/* Top Picks */}
        <div className="px-8 mb-8">
          <h3 className="text-lg font-semibold text-foreground mb-4">Top Picks</h3>
          <div className="flex gap-4 overflow-x-auto pb-2 -mx-2 px-2 scrollbar-hide">
            {topPicks.map(({ name, desc, icon: Icon }) => (
              <div
                key={name}
                className="min-w-[200px] bg-card rounded-3xl p-5 border border-border flex flex-col gap-3"
              >
                <div className="w-12 h-12 rounded-full bg-secondary flex items-center justify-center">
                  <Icon size={24} className="text-primary" />
                </div>
                <h4 className="font-bold text-foreground text-sm">{name}</h4>
                <p className="text-xs text-muted-foreground">{desc}</p>
                <Button size="sm" className="rounded-3xl mt-auto w-fit text-xs px-4 min-h-[36px]">
                  Get
                </Button>
              </div>
            ))}
          </div>
        </div>

        {/* Daily Situations */}
        <div className="px-8">
          <h3 className="text-lg font-semibold text-foreground mb-4">Daily Situations</h3>
          <div className="grid grid-cols-2 gap-4">
            {situations.map(({ id, label, icon: Icon, variant }) => (
              <button
                key={id}
                onClick={() => navigate(`/assessment/${id}`)}
                className="bg-card rounded-3xl p-5 border border-border flex flex-col items-center gap-3 min-h-[120px] transition-all hover:border-primary/30 active:scale-[0.98]"
              >
                <div
                  className={`w-12 h-12 rounded-full flex items-center justify-center ${
                    variant === "secondary" ? "bg-secondary" : "bg-accent"
                  }`}
                >
                  <Icon size={24} className={variant === "secondary" ? "text-primary" : "text-foreground"} />
                </div>
                <span className="text-sm font-medium text-foreground">{label}</span>
              </button>
            ))}
          </div>
        </div>
      </div>

      <BottomNav />
    </MobileLayout>
  );
};

export default Dashboard;
