Content-Type: multipart/mixed; boundary="===============0605580990513820998=="
MIME-Version: 1.0
From: Peter Xu <peterx@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [peterz-queue:smp/core 2/3] arch/mips/kernel/smp.c:714:6: error: unused variable 'cpu'
Date: Fri, 21 Feb 2020 15:19:33 -0500
Message-ID: <20200221201933.GG37727@xz-x1>
In-Reply-To: <202002220347.sY9qI9Bg%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0605580990513820998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2020 at 03:39:52AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git =
smp/core
> head:   dd4f3c1be270072f238c31da54f5beb1b439742f
> commit: a46a8835a9a5d64d79254c8cbacb0f619b0217f3 [2/3] MIPS: smp: Remove =
tick_broadcast_count
> config: mips-allyesconfig (attached as .config)
> compiler: mips-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout a46a8835a9a5d64d79254c8cbacb0f619b0217f3
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Dmips =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    arch/mips/kernel/smp.c: In function 'tick_broadcast_callee':
> >> arch/mips/kernel/smp.c:714:6: error: unused variable 'cpu' [-Werror=3D=
unused-variable]
>      int cpu =3D smp_processor_id();
>          ^~~
>    cc1: all warnings being treated as errors

Hi, Peter,

Sorry to have not noticed this, I think this line should be removed
along with the patch.  Please let me know if you want me to repost.

Thanks,

-- =

Peter Xu

--===============0605580990513820998==--

