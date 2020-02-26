Content-Type: multipart/mixed; boundary="===============3025507960685607761=="
MIME-Version: 1.0
From: Alexander Potapenko <glider@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 3/3] kasan: stackdepot: move filter_irq_stacks() to stackdepot.c
Date: Wed, 26 Feb 2020 10:53:01 +0100
Message-ID: <CAG_fn=X7mUyJxLBMohkud6DEwyf6gvU7j_eXW6kc_qYUdURo=Q@mail.gmail.com>
In-Reply-To: <202002260412.ybvj1aPM%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3025507960685607761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andes maintainers,

On Tue, Feb 25, 2020 at 9:26 PM kbuild test robot <lkp@intel.com> wrote:
>
> Hi,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v5.6-rc3 next-20200225]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>
> url:    https://github.com/0day-ci/linux/commits/glider-google-com/stackd=
epot-check-depot_index-before-accessing-the-stack-slab/20200222-065605
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t 0c0ddd6ae47c9238c18f475bcca675ca74c9dc31
> config: nds32-randconfig-a001-20200225 (attached as .config)
> compiler: nds32le-linux-gcc (GCC) 9.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D9.2.0 make.cross ARCH=3Dnds32
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    nds32le-linux-ld: lib/stackdepot.o: in function `filter_irq_stacks':
> >> stackdepot.c:(.text+0xc6): undefined reference to `__softirqentry_text=
_start'
> >> nds32le-linux-ld: stackdepot.c:(.text+0xca): undefined reference to `_=
_softirqentry_text_start'
> >> nds32le-linux-ld: stackdepot.c:(.text+0xce): undefined reference to `_=
_softirqentry_text_end'
>    nds32le-linux-ld: stackdepot.c:(.text+0xd2): undefined reference to `_=
_softirqentry_text_end'

Can you please help me with this?
I couldn't find out where this section needs to be declared, and I
don't really know whether nds32 is supposed to have softirqs or not.
Maybe filter_irq_stacks() should be no-op on nds32?

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org



-- =

Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
--===============3025507960685607761==--

