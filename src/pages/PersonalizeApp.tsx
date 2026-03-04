import { useState } from "react";
import { ChevronLeft, Type, SunMoon, Repeat, Zap } from "lucide-react";
import MobileLayout from "@/components/MobileLayout";
import BottomNav from "@/components/BottomNav";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Slider } from "@/components/ui/slider";
import { Switch } from "@/components/ui/switch";
import { Separator } from "@/components/ui/separator";
import { Button } from "@/components/ui/button";

const SectionLabel = ({ children }: { children: React.ReactNode }) => (
  <p className="text-xs text-muted-foreground uppercase tracking-widest px-8 mb-3 mt-6">{children}</p>
);

const PersonalizeApp = () => {
  const [textSize, setTextSize] = useState(50);
  const [highContrast, setHighContrast] = useState(true);
  const [reducedMotion, setReducedMotion] = useState(false);
  const [tactileFeedback, setTactileFeedback] = useState(true);

  return (
    <MobileLayout>
      <div className="flex flex-col min-h-screen pb-24">
        <div className="px-6 py-5">
          <div className="flex items-center gap-4">
            <button className="w-10 h-10 rounded-full bg-accent/40 flex items-center justify-center">
              <ChevronLeft size={18} />
            </button>
            <div>
              <p className="text-sm text-muted-foreground">Settings & Accessibility</p>
            </div>
          </div>
        </div>

        <div className="px-8">
          <h1 className="text-3xl font-extrabold text-foreground">Personalize App</h1>
        </div>

        <SectionLabel>Visual Support</SectionLabel>

        <div className="px-6">
          <Card className="rounded-2xl bg-violet-50 border-transparent">
            <CardHeader className="p-4">
              <div className="flex items-center justify-between">
                <div className="flex items-start gap-4">
                  <div className="w-10 h-10 rounded-md bg-violet-100 flex items-center justify-center">
                    <Type size={20} className="text-violet-700" />
                  </div>
                  <div>
                    <h3 className="text-base font-semibold text-foreground">Text Size Adjustment</h3>
                    <p className="text-sm text-muted-foreground mt-1">A</p>
                  </div>
                </div>
              </div>
            </CardHeader>
            <CardContent className="p-4 pt-0">
              <div className="flex items-center gap-3">
                <span className="text-sm text-muted-foreground">A</span>
                <div className="flex-1">
                  <Slider value={[textSize]} onValueChange={(v) => setTextSize(v[0])} max={100} min={0} />
                </div>
                <span className="text-sm text-muted-foreground">A</span>
              </div>

              <div className="mt-4">
                <Separator />
              </div>

              <div className="flex items-center justify-between mt-4">
                <div className="flex items-center gap-3">
                  <div className="w-8 h-8 rounded-full bg-violet-100 flex items-center justify-center">
                    <SunMoon size={16} className="text-violet-700" />
                  </div>
                  <div>
                    <h4 className="text-sm font-medium text-foreground">High-Contrast Mode</h4>
                    <p className="text-xs text-muted-foreground">Enhance contrast for readability</p>
                  </div>
                </div>
                <Switch checked={highContrast} onCheckedChange={(v) => setHighContrast(Boolean(v))} />
              </div>
            </CardContent>
          </Card>
        </div>

        <SectionLabel>Interaction</SectionLabel>

        <div className="px-6">
          <Card className="rounded-2xl bg-pink-50 border-transparent">
            <CardContent className="p-4">
              <div className="flex items-center justify-between py-3">
                <div className="flex items-center gap-3">
                  <div className="w-8 h-8 rounded-full bg-pink-100 flex items-center justify-center">
                    <Repeat size={16} className="text-pink-700" />
                  </div>
                  <div>
                    <h4 className="text-sm font-medium text-foreground">Reduced Motion</h4>
                    <p className="text-xs text-muted-foreground">Limit animations and motion</p>
                  </div>
                </div>
                <Switch checked={reducedMotion} onCheckedChange={(v) => setReducedMotion(Boolean(v))} />
              </div>

              <div className="border-t border-border mt-2" />

              <div className="flex items-center justify-between py-3">
                <div className="flex items-center gap-3">
                  <div className="w-8 h-8 rounded-full bg-pink-100 flex items-center justify-center">
                    <Zap size={16} className="text-pink-700" />
                  </div>
                  <div>
                    <h4 className="text-sm font-medium text-foreground">Tactile Feedback</h4>
                    <p className="text-xs text-muted-foreground">Haptic feedback for actions</p>
                  </div>
                </div>
                <Switch checked={tactileFeedback} onCheckedChange={(v) => setTactileFeedback(Boolean(v))} />
              </div>
            </CardContent>
          </Card>
        </div>

        <SectionLabel>System</SectionLabel>

        <div className="px-6">
          <Card className="rounded-2xl bg-violet-50 border-transparent">
            <CardContent className="p-4 flex items-center justify-between">
              <div className="flex items-center gap-4">
                <div className="w-10 h-10 rounded-md bg-violet-100 flex items-center justify-center">
                  <Type size={18} className="text-violet-700" />
                </div>
                <div>
                  <h4 className="text-sm font-medium text-foreground">App Language</h4>
                  <p className="text-xs text-muted-foreground">English</p>
                </div>
              </div>
              <Button variant="ghost" size="sm">Change</Button>
            </CardContent>
          </Card>
        </div>
      </div>

      <BottomNav />
    </MobileLayout>
  );
};

export default PersonalizeApp;
