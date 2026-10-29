# 经济基础知识 H5：GitHub 登录与云同步开通

登录与自动同步代码已经接入。当前缺少一个 Supabase 项目，所以线上 H5 暂时仍用本地进度。

1. 打开 https://supabase.com/dashboard ，用自己的账号创建一个项目。可以选择较近的区域，例如 Singapore。
2. 在项目的 **SQL Editor** 执行同目录的 `supabase-setup.sql`。这会创建每位用户只能读取、修改自己进度的表。
3. 在 **Authentication → URL Configuration** 中把 Site URL 设为 `https://akamoxi.github.io/jingjishi-jichu-2026/`，并把该地址加入 Redirect URLs。
4. 在 **Authentication → Sign In / Providers → GitHub** 复制 Callback URL，格式为 `https://<project-ref>.supabase.co/auth/v1/callback`。
5. 在 GitHub 的 **Settings → Developer settings → OAuth Apps → New OAuth App** 创建应用：Homepage URL 填上面的 H5 地址，Authorization callback URL 填第 4 步的 Supabase 回调地址。生成 Client Secret 后，只在 Supabase 的 GitHub Provider 设置中填写 Client ID 和 Client Secret，并启用 GitHub Provider。**不要把 Client Secret 发给我，也不要写进网页代码。**
6. 在 Supabase 项目设置中找到 **Project URL** 和 **Publishable key**（旧界面可能叫 `anon` key），把这两项发给我。我会填入 H5、发布并做联调。**不要发送数据库密码、secret key 或 service_role key。**
7. 发布后在两部手机点“使用 GitHub 登录”，用同一个 GitHub 账号完成授权，进度就能同步。

原有导入、导出功能会保留作本地备份。网络不可用时进度先保存在本机，恢复联网后再同步。邮箱密码方式也留作备选，但个人使用 GitHub 登录无需配置邮件发送服务。
