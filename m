Content-Type: multipart/mixed; boundary="===============8532587139222289731=="
MIME-Version: 1.0
From: Catalin Marinas <catalin.marinas@arm.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 09/19] arm64: mte: Add specific SIGSEGV codes
Date: Thu, 27 Feb 2020 11:05:58 +0000
Message-ID: <20200227110558.GB3281767@arrakis.emea.arm.com>
In-Reply-To: <202002270627.YYGOStB9%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8532587139222289731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2020 at 06:33:14AM +0800, kbuild test robot wrote:
> url:    https://github.com/0day-ci/linux/commits/Catalin-Marinas/arm64-Me=
mory-Tagging-Extension-user-space-support/20200227-041230
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git f=
or-next
> config: x86_64-defconfig (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All error/warnings (new ones prefixed by >>):
> =

>    In file included from include/linux/export.h:43:0,
>                     from include/linux/linkage.h:7,
>                     from arch/x86/include/asm/cache.h:5,
>                     from include/linux/cache.h:6,
>                     from include/linux/time.h:5,
>                     from include/linux/compat.h:10,
>                     from arch/x86/kernel/signal_compat.c:2:
>    In function 'signal_compat_build_tests',
>        inlined from 'sigaction_compat_abi' at arch/x86/kernel/signal_comp=
at.c:166:2:
> >> include/linux/compiler.h:350:38: error: call to '__compiletime_assert_=
30' declared with attribute error: BUILD_BUG_ON failed: NSIGSEGV !=3D 7

I haven't realised that x86 has a build check for NSIGSEGV. I'll fold in
the diff below (there are no new fields added to siginfo, so no other
changes necessary):

diff --git a/arch/x86/kernel/signal_compat.c b/arch/x86/kernel/signal_compa=
t.c
index 9ccbf0576cd0..a7f3e12cfbdb 100644
--- a/arch/x86/kernel/signal_compat.c
+++ b/arch/x86/kernel/signal_compat.c
@@ -27,7 +27,7 @@ static inline void signal_compat_build_tests(void)
 	 */
 	BUILD_BUG_ON(NSIGILL  !=3D 11);
 	BUILD_BUG_ON(NSIGFPE  !=3D 15);
-	BUILD_BUG_ON(NSIGSEGV !=3D 7);
+	BUILD_BUG_ON(NSIGSEGV !=3D 9);
 	BUILD_BUG_ON(NSIGBUS  !=3D 5);
 	BUILD_BUG_ON(NSIGTRAP !=3D 5);
 	BUILD_BUG_ON(NSIGCHLD !=3D 6);

-- =

Catalin
--===============8532587139222289731==--

