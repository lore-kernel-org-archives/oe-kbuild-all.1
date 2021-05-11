Content-Type: multipart/mixed; boundary="===============7119217439968858546=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
Date: Tue, 11 May 2021 11:26:30 -0700
Message-ID: <CAKwvOdkS87-zgPyfxPFyXFFo+rs3ijp9LR4emzzfcUVP4p8sEw@mail.gmail.com>
In-Reply-To: <20210511140712.GA24463@lpieralisi>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7119217439968858546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 7:07 AM Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Thu, May 06, 2021 at 12:09:46PM -0700, Nick Desaulniers wrote:
> > + folks from commit 449e056c76cc ("ARM: cpuidle: Add a cpuidle ops
> > structure to be used for DT")
>
> Hi Nick,
>
> I thought this patch was meant to be merged upstream to fix it:
>
> https://lore.kernel.org/linux-arm-kernel/20201230155506.1085689-1-arnd(a)=
kernel.org
>
> I can add a review tag to it but I don't think that's necessary, just
> let me know please.

Ah right, thanks for the reminder.  Arnd?

>
> Thanks,
> Lorenzo
>
> > On Thu, May 6, 2021 at 12:05 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > On Fri, Apr 30, 2021 at 5:11 PM kernel test robot <lkp@intel.com> w=
rote:
> > > >
> > > > Hi Kees,
> > > >
> > > > FYI, the error/warning still remains.
> > > >
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git master
> > > > head:   65ec0a7d24913b146cd1500d759b8c340319d55e
> > > > commit: 5a17850e251a55bba6d65aefbfeacfa9888cd2cd arm/build: Warn on=
 orphan section placement
> > > > date:   8 months ago
> > > > config: arm-randconfig-r024-20210501 (attached as .config)
> > > > compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> > > > reproduce (this is a W=3D1 build):
> > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/mast=
er/sbin/make.cross -O ~/bin/make.cross
> > > >         chmod +x ~/bin/make.cross
> > > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git/commit/?id=3D5a17850e251a55bba6d65aefbfeacfa9888cd2cd
> > > >         git remote add linus https://git.kernel.org/pub/scm/linux/k=
ernel/git/torvalds/linux.git
> > > >         git fetch --no-tags linus master
> > > >         git checkout 5a17850e251a55bba6d65aefbfeacfa9888cd2cd
> > > >         # save the attached .config to linux build tree
> > > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 mak=
e.cross W=3D1 ARCH=3Darm
> > > >
> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > >
> > > > All warnings (new ones prefixed by >>):
> > > >
> > > > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_=
of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section =
`__cpuidle_method_of_table'
> > > > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_=
of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section =
`__cpuidle_method_of_table'
> > > > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_=
of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section =
`__cpuidle_method_of_table'
> > >
> > > Filed: https://github.com/ClangBuiltLinux/linux/issues/1372 (though
> > > this isn't specific to clang).
-- =

Thanks,
~Nick Desaulniers
--===============7119217439968858546==--

