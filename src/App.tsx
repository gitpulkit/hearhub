import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Index from "./pages/Index";
import Onboarding from "./pages/Onboarding";
import GuideStudent from "./pages/GuideStudent";
import Dashboard from "./pages/Dashboard";
import Assessment from "./pages/Assessment";
import NotFound from "./pages/NotFound";
import PersonalizeApp from "./pages/PersonalizeApp";
import SavedTools from "./pages/SavedTools";

const queryClient = new QueryClient();

const App = () => (
  <QueryClientProvider client={queryClient}>
    <TooltipProvider>
      <Toaster />
      <Sonner />
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Index />} />
          <Route path="/onboarding" element={<Onboarding />} />
          <Route path="/guide/:category" element={<GuideStudent />} />
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/settings" element={<PersonalizeApp />} />
          <Route path="/saved" element={<SavedTools />} />
          <Route path="/assessment/:scenario" element={<Assessment />} />
          <Route path="*" element={<NotFound />} />
        </Routes>
      </BrowserRouter>
    </TooltipProvider>
  </QueryClientProvider>
);

export default App;
