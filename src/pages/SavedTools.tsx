import { useState } from "react";
import MobileLayout from "@/components/MobileLayout";
import BottomNav from "@/components/BottomNav";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Bookmark } from "lucide-react";

const allTools = [
  {
    id: "live-transcribe",
    category: "all",
    tag: "TECH TOOL",
    title: "Live Transcribe Pro",
    desc: "Real-time speech-to-text with noise cancellation for loud spaces.",
    cta: "Open Tool",
  },
  {
    id: "airport-guide",
    category: "all",
    tag: "ARTICLE",
    title: "Airport Navigation Guide",
    desc: "Tips for visual boarding cues and gate announcements.",
    cta: "Read Article",
  },
  {
    id: "asl-signs",
    category: "all",
    tag: "EDUCATION",
    title: "Emergency ASL Signs",
    desc: "Quick visual guide for critical communication signs.",
    cta: "View Guide",
  },
  {
    id: "reddit-accessible",
    category: "apps",
    tag: "APP",
    title: "Reddit Accessible",
    desc: "Screen reader optimized interface for Reddit browsing.",
    cta: "Download App",
  },
  {
    id: "voicebase",
    category: "apps",
    tag: "APP",
    title: "VoiceBase",
    desc: "Voice-to-text transcription and organization tool.",
    cta: "Open App",
  },
  {
    id: "hearing-spectrum",
    category: "articles",
    tag: "ARTICLE",
    title: "Understanding the Hearing Spectrum",
    desc: "Learn about different types of hearing loss and solutions.",
    cta: "Read Article",
  },
  {
    id: "asl-basics",
    category: "articles",
    tag: "ARTICLE",
    title: "ASL Basics for Beginners",
    desc: "Introduction to American Sign Language fundamentals.",
    cta: "Read Article",
  },
  {
    id: "navigation-guide",
    category: "guides",
    tag: "GUIDE",
    title: "Public Transit Navigation Guide",
    desc: "Tips for using public transportation confidently.",
    cta: "View Guide",
  },
  {
    id: "workplace-guide",
    category: "guides",
    tag: "GUIDE",
    title: "Workplace Accommodations Guide",
    desc: "How to request and implement workplace accommodations.",
    cta: "View Guide",
  },
];

const FilterPill = ({
  children,
  active = false,
  onClick,
}: {
  children: React.ReactNode;
  active?: boolean;
  onClick?: () => void;
}) => (
  <button
    onClick={onClick}
    className={`rounded-full px-4 py-2 text-sm font-medium transition ${
      active ? "bg-primary text-primary-foreground" : "bg-card text-foreground"
    }`}
  >
    {children}
  </button>
);

const SavedTools = () => {
  const [activeFilter, setActiveFilter] = useState("all");

  const filteredTools = allTools.filter((tool) => {
    if (activeFilter === "all") return true;
    return tool.category === activeFilter;
  });

  return (
    <MobileLayout>
      <div className="flex flex-col min-h-screen pb-28">
        <div className="px-8 pt-6">
          <h1 className="text-2xl font-extrabold text-foreground">Saved Tools</h1>
          <p className="text-sm text-muted-foreground mt-1">Your toolkit for any situation.</p>

          <div className="flex gap-3 mt-5 overflow-x-auto pb-2">
            <FilterPill active={activeFilter === "all"} onClick={() => setActiveFilter("all")}>
              All Tools
            </FilterPill>
            <FilterPill active={activeFilter === "articles"} onClick={() => setActiveFilter("articles")}>
              Articles
            </FilterPill>
            <FilterPill active={activeFilter === "apps"} onClick={() => setActiveFilter("apps")}>
              Apps
            </FilterPill>
            <FilterPill active={activeFilter === "guides"} onClick={() => setActiveFilter("guides")}>
              Guides
            </FilterPill>
          </div>
        </div>

        <div className="px-6 mt-6 space-y-6">
          {filteredTools.map((t) => (
            <Card key={t.id} className="rounded-2xl shadow-md">
              <CardContent className="p-6">
                <div className="flex items-start justify-between">
                  <div className="flex-1 pr-4">
                    <div className="flex items-center justify-between">
                      <Badge variant="secondary">{t.tag}</Badge>
                      <button className="p-2 rounded-md text-muted-foreground hover:bg-accent/50">
                        <Bookmark />
                      </button>
                    </div>

                    <h3 className="text-lg font-semibold text-foreground mt-4">{t.title}</h3>
                    <p className="text-sm text-muted-foreground mt-2">{t.desc}</p>

                    <div className="mt-5">
                      <Button className="w-full rounded-2xl bg-primary" size="lg">
                        {t.cta}
                      </Button>
                    </div>
                  </div>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>

        <BottomNav />
      </div>
    </MobileLayout>
  );
};

export default SavedTools;
