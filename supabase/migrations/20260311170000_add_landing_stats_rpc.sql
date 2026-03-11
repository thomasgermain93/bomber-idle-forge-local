-- RPC function for landing page KPIs (public stats)
-- Accessible without authentication via RLS bypass for SECURITY DEFINER

CREATE OR REPLACE FUNCTION public.get_landing_stats()
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  result JSONB;
  total_players BIGINT;
  total_invocations BIGINT;
  last_super_legend_user_id UUID;
  last_super_legend_created_at TIMESTAMPTZ;
  last_super_legend_name TEXT;
BEGIN
  -- Count total players (profiles)
  SELECT COUNT(*)::BIGINT INTO total_players FROM public.profiles;

  -- Count total hero invocations
  SELECT COUNT(*)::BIGINT INTO total_invocations FROM public.player_heroes;

  -- Get last super legend invocation with profile join
  SELECT ph.user_id, ph.created_at, p.display_name
  INTO last_super_legend_user_id, last_super_legend_created_at, last_super_legend_name
  FROM public.player_heroes ph
  LEFT JOIN public.profiles p ON p.user_id = ph.user_id
  WHERE ph.rarity = 'super-legend'
  ORDER BY ph.created_at DESC
  LIMIT 1;

  result := jsonb_build_object(
    'players', COALESCE(total_players, 0),
    'totalInvocations', COALESCE(total_invocations, 0),
    'lastSuperLegend', last_super_legend_name
  );

  RETURN result;
END;
$$;

-- Grant execute permission to anon (public)
GRANT EXECUTE ON FUNCTION public.get_landing_stats() TO anon, authenticated;
