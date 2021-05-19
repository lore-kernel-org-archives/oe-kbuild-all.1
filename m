Content-Type: multipart/mixed; boundary="===============5956498339683340829=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: kbuild-all@lists.01.org
Subject: Re: [asm-generic:compat-alloc-user-space-9 6/41] net/ethtool/ioctl.c:815:9: error: implicit declaration of function 'in_ia32_syscall'; did you mean 'in_compat_syscall'?
Date: Wed, 19 May 2021 22:33:08 +0200
Message-ID: <CAK8P3a3ytGKfRftRqC5OaGTxNfxX5-qpbXdGG9AYHcRJFMB-RA@mail.gmail.com>
In-Reply-To: <202105200456.B8lcITGX-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5956498339683340829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:08 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.=
git compat-alloc-user-space-9
> head:   c20b182ddc8032c63c381bf868f99222bab89537
> commit: 5cbe995d81d1ea310babe2c123bf1a40dff25e46 [6/41] ethtool: improve =
compat ioctl handling
> config: um-allmodconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=3D1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generi=
c.git/commit/?id=3D5cbe995d81d1ea310babe2c123bf1a40dff25e46
>         git remote add asm-generic https://git.kernel.org/pub/scm/linux/k=
ernel/git/arnd/asm-generic.git
>         git fetch --no-tags asm-generic compat-alloc-user-space-9
>         git checkout 5cbe995d81d1ea310babe2c123bf1a40dff25e46
>         # save the attached .config to linux build tree
>         make W=3D1 ARCH=3Dum
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    net/ethtool/ioctl.c: In function 'ethtool_translate_compat':
> >> net/ethtool/ioctl.c:815:9: error: implicit declaration of function 'in=
_ia32_syscall'; did you mean 'in_compat_syscall'? [-Werror=3Dimplicit-funct=
ion-declaration]
>      815 |  return in_ia32_syscall();
>          |         ^~~~~~~~~~~~~~~
>          |         in_compat_syscall
>    cc1: some warnings being treated as errors
>
>
> vim +815 net/ethtool/ioctl.c
>
>    810
>    811  static bool ethtool_translate_compat(void)
>    812  {
>    813  #ifdef CONFIG_X86_64
>    814          /* On x86, translation is needed for i386 but not x32 */
>  > 815          return in_ia32_syscall();
>    816  #else
>    817          BUILD_BUG_ON(sizeof(struct compat_ethtool_rxnfc) !=3D
>    818                       sizeof(struct ethtool_rxnfc));
>    819  #endif

I never noticed that uml sets CONFIG_X86_64, but that makes sense.
Changing the check to

--- a/net/ethtool/ioctl.c
+++ b/net/ethtool/ioctl.c
@@ -810,7 +810,7 @@ static noinline_for_stack int
ethtool_get_sset_info(struct net_device *dev,

 static bool ethtool_translate_compat(void)
 {
-#ifdef CONFIG_X86_64
+#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
        /* On x86, translation is needed for i386 but not x32 */
        return in_ia32_syscall();
 #else


         Arnd
--===============5956498339683340829==--

