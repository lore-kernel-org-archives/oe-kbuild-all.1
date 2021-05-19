Content-Type: multipart/mixed; boundary="===============0791452830232327037=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: kbuild-all@lists.01.org
Subject: Re: [asm-generic:compat-alloc-user-space-9 6/41] net/ethtool/ioctl.c:815:9: error: implicit declaration of function 'in_ia32_syscall'; did you mean 'in_compat_syscall'?
Date: Wed, 19 May 2021 22:39:31 +0200
Message-ID: <CAK8P3a0ajoE-8SjeAxmWgpMB0nnaM-zw5tCn+-yCQRHEVLsPfg@mail.gmail.com>
In-Reply-To: <CAK8P3a3ytGKfRftRqC5OaGTxNfxX5-qpbXdGG9AYHcRJFMB-RA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0791452830232327037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:33 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> --- a/net/ethtool/ioctl.c
> +++ b/net/ethtool/ioctl.c
> @@ -810,7 +810,7 @@ static noinline_for_stack int
> ethtool_get_sset_info(struct net_device *dev,
>
>  static bool ethtool_translate_compat(void)
>  {
> -#ifdef CONFIG_X86_64
> +#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
>         /* On x86, translation is needed for i386 but not x32 */
>         return in_ia32_syscall();
>  #else

No, that wouldn't work either, as that triggers the BUILD_BUG_ON() for UML.

This is getting rather ugly but hopefully covers all cases:

diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
index dd09e6aceae1..c323bbfa97b3 100644
--- a/net/ethtool/ioctl.c
+++ b/net/ethtool/ioctl.c
@@ -811,8 +811,10 @@ static noinline_for_stack int
ethtool_get_sset_info(struct net_device *dev,
 static bool ethtool_translate_compat(void)
 {
 #ifdef CONFIG_X86_64
+#ifdef CONFIG_COMPAT
        /* On x86, translation is needed for i386 but not x32 */
        return in_ia32_syscall();
+#endif
 #else
        BUILD_BUG_ON(sizeof(struct compat_ethtool_rxnfc) !=3D
                     sizeof(struct ethtool_rxnfc));

       Arnd
--===============0791452830232327037==--

