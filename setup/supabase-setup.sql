create table if not exists public.user_progress (
  user_id uuid primary key references auth.users(id) on delete cascade,
  progress jsonb not null,
  version bigint not null default 1,
  updated_at timestamptz not null default now()
);

alter table public.user_progress enable row level security;
revoke all on public.user_progress from public, anon, authenticated;
grant select, insert, update on public.user_progress to authenticated;

drop policy if exists "owner reads progress" on public.user_progress;
create policy "owner reads progress" on public.user_progress
  for select to authenticated
  using ((select auth.uid()) = user_id);

drop policy if exists "owner creates progress" on public.user_progress;
create policy "owner creates progress" on public.user_progress
  for insert to authenticated
  with check ((select auth.uid()) = user_id);

drop policy if exists "owner updates progress" on public.user_progress;
create policy "owner updates progress" on public.user_progress
  for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);
