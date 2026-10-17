-- Shared EGS Quiz Arena state. Public visitors can view; authenticated judges can edit.
create table if not exists public.quiz_state (
  id text primary key check (id = 'main'),
  state jsonb not null,
  updated_at timestamptz not null default now()
);
alter table public.quiz_state enable row level security;
revoke all on public.quiz_state from anon, authenticated;
grant usage on schema public to anon, authenticated;
grant select on public.quiz_state to anon, authenticated;
grant insert, update on public.quiz_state to authenticated;
drop policy if exists quiz_state_public_read on public.quiz_state;
create policy quiz_state_public_read on public.quiz_state for select to anon, authenticated using (id = 'main');
drop policy if exists quiz_state_judge_insert on public.quiz_state;
create policy quiz_state_judge_insert on public.quiz_state for insert to authenticated with check (id = 'main');
drop policy if exists quiz_state_judge_update on public.quiz_state;
create policy quiz_state_judge_update on public.quiz_state for update to authenticated using (id = 'main') with check (id = 'main');
do $$ begin
  if not exists (select 1 from pg_publication_tables where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'quiz_state') then
    alter publication supabase_realtime add table public.quiz_state;
  end if;
end $$;
