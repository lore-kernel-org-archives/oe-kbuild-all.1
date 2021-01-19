Content-Type: multipart/mixed; boundary="===============3469269818070310168=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-4.19.y 5835/9999] arch/x86/kernel/cpu/mcheck/mce_amd.c:552:6: warning: no previous prototype for 'disable_err_thresholding'
Date: Tue, 19 Jan 2021 18:41:02 +0100
Message-ID: <20210119174052.GH27634@zn.tnic>
In-Reply-To: <202101200109.8dQUFiPN-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3469269818070310168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 01:36:14AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git linux-4.19.y
> head:   e864f43593ccf9180c61738abdf1c1dde091367d
> commit: 938de2324afb53acd20893cd8eec8ee6f80de646 [5835/9999] x86/MCE/AMD:=
 Carve out the MC4_MISC thresholding quirk
> config: i386-randconfig-r005-20210118 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=3D1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able-rc.git/commit/?id=3D938de2324afb53acd20893cd8eec8ee6f80de646
>         git remote add linux-stable-rc https://git.kernel.org/pub/scm/lin=
ux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc linux-4.19.y
>         git checkout 938de2324afb53acd20893cd8eec8ee6f80de646
>         # save the attached .config to linux build tree
>         make W=3D1 ARCH=3Di386 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

> >> arch/x86/kernel/cpu/mcheck/mce_amd.c:552:6: warning: no previous proto=
type for 'disable_err_thresholding' [-Wmissing-prototypes]
>      552 | void disable_err_thresholding(struct cpuinfo_x86 *c)

Why are you running W=3D1 build tests on stable kernels?

Especially -Wmissing-prototypes is a complete waste of time for those.

And the fix

  47cd84e98f51 ("x86/mce/amd: Make disable_err_thresholding() static")

would be a complete waste of backporting bandwidth and it doesn't even
fit the stable rules.

-- =

Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imend=C3=B6rffer, HRB 36809=
, AG N=C3=BCrnberg
--===============3469269818070310168==--

