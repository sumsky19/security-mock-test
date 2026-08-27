-- SK쉴더스 모의테스트 PC ↔ iPhone 공용 DB
-- Supabase SQL Editor에서 전체 실행

create table if not exists public.app_config (
  user_id uuid primary key references auth.users(id) on delete cascade,
  config jsonb not null,
  updated_at timestamptz not null default now()
);

create table if not exists public.evaluations (
  id text primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  data jsonb not null,
  created_at timestamptz not null default now()
);

alter table public.app_config enable row level security;
alter table public.evaluations enable row level security;

drop policy if exists "app_config_select_own" on public.app_config;
drop policy if exists "app_config_insert_own" on public.app_config;
drop policy if exists "app_config_update_own" on public.app_config;
drop policy if exists "app_config_delete_own" on public.app_config;
drop policy if exists "evaluations_select_own" on public.evaluations;
drop policy if exists "evaluations_insert_own" on public.evaluations;
drop policy if exists "evaluations_update_own" on public.evaluations;
drop policy if exists "evaluations_delete_own" on public.evaluations;

create policy "app_config_select_own" on public.app_config for select to authenticated using (auth.uid() = user_id);
create policy "app_config_insert_own" on public.app_config for insert to authenticated with check (auth.uid() = user_id);
create policy "app_config_update_own" on public.app_config for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "app_config_delete_own" on public.app_config for delete to authenticated using (auth.uid() = user_id);

create policy "evaluations_select_own" on public.evaluations for select to authenticated using (auth.uid() = user_id);
create policy "evaluations_insert_own" on public.evaluations for insert to authenticated with check (auth.uid() = user_id);
create policy "evaluations_update_own" on public.evaluations for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "evaluations_delete_own" on public.evaluations for delete to authenticated using (auth.uid() = user_id);

create index if not exists evaluations_user_created_idx on public.evaluations(user_id, created_at desc);
