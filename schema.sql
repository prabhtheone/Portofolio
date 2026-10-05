create table public.projects(id bigint generated always as identity primary key,title text not null check (char_length(title)<=80),description text check (char_length(description)<=400),url text check (url ~ '^https://'),tags text,sort int default 0);
alter table public.projects enable row level security;
create policy "public read" on public.projects for select using (true);
create policy "owner write" on public.projects for all to authenticated using ((auth.jwt()->>'email')='YOUR_EMAIL') with check ((auth.jwt()->>'email')='YOUR_EMAIL');