Content-Type: multipart/mixed; boundary="===============7052230694451815511=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [tip:locking/core 10/10] sclp_early_core.c:undefined reference to `warn_bogus_irq_restore'
Date: Thu, 28 Jan 2021 13:13:49 +0100
Message-ID: <871re5dzsy.fsf@nanos.tec.linutronix.de>
In-Reply-To: <202101281628.n32qBmXh-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7052230694451815511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28 2021 at 16:29, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locki=
ng/core
> head:   997acaf6b4b59c6a9c259740312a69ea549cc684
> commit: 997acaf6b4b59c6a9c259740312a69ea549cc684 [10/10] lockdep: report =
broken irq restoration
> config: s390-randconfig-r035-20210128 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 48bd=
d676a1d1338c10541460bf5beb69ac17e451)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/com=
mit/?id=3D997acaf6b4b59c6a9c259740312a69ea549cc684
>         git remote add tip https://git.kernel.org/pub/scm/linux/kernel/gi=
t/tip/tip.git
>         git fetch --no-tags tip locking/core
>         git checkout 997acaf6b4b59c6a9c259740312a69ea549cc684
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Ds390 =

>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    s390x-linux-gnu-ld: arch/s390/boot/sclp_early_core.o: in function `scl=
p_early_cmd':
>>> sclp_early_core.c:(.text+0x18c): undefined reference to `warn_bogus_irq=
_restore'
>    s390x-linux-gnu-ld: arch/s390/boot/sclp_early_core.o: in function `scl=
p_early_set_event_mask':
>    sclp_early_core.c:(.text+0x376): undefined reference to `warn_bogus_ir=
q_restore'
>    s390x-linux-gnu-ld: arch/s390/boot/sclp_early_core.o: in function `__s=
clp_early_printk':
>    sclp_early_core.c:(.text+0xa90): undefined reference to `warn_bogus_ir=
q_restore'
>>> s390x-linux-gnu-ld: sclp_early_core.c:(.text+0xa9a): undefined referenc=
e to `warn_bogus_irq_restore'

That's S390 early boot code which lacks a stub function ....
--===============7052230694451815511==--

