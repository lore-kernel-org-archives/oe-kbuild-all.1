Content-Type: multipart/mixed; boundary="===============8840193127320501954=="
MIME-Version: 1.0
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: kbuild-all@lists.01.org
Subject: Re: arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
Date: Tue, 11 May 2021 15:07:12 +0100
Message-ID: <20210511140712.GA24463@lpieralisi>
In-Reply-To: <CAKwvOd=0_KbumyVLS2dn2DiKes50oG3te4Cd4aTAxnc5moERuw@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8840193127320501954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 12:09:46PM -0700, Nick Desaulniers wrote:
> + folks from commit 449e056c76cc ("ARM: cpuidle: Add a cpuidle ops
> structure to be used for DT")

Hi Nick,

I thought this patch was meant to be merged upstream to fix it:

https://lore.kernel.org/linux-arm-kernel/20201230155506.1085689-1-arnd(a)ke=
rnel.org

I can add a review tag to it but I don't think that's necessary, just
let me know please.

Thanks,
Lorenzo

> On Thu, May 6, 2021 at 12:05 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Fri, Apr 30, 2021 at 5:11 PM kernel test robot <lkp@intel.com> wro=
te:
> > >
> > > Hi Kees,
> > >
> > > FYI, the error/warning still remains.
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> > > head:   65ec0a7d24913b146cd1500d759b8c340319d55e
> > > commit: 5a17850e251a55bba6d65aefbfeacfa9888cd2cd arm/build: Warn on o=
rphan section placement
> > > date:   8 months ago
> > > config: arm-randconfig-r024-20210501 (attached as .config)
> > > compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> > > reproduce (this is a W=3D1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git/commit/?id=3D5a17850e251a55bba6d65aefbfeacfa9888cd2cd
> > >         git remote add linus https://git.kernel.org/pub/scm/linux/ker=
nel/git/torvalds/linux.git
> > >         git fetch --no-tags linus master
> > >         git checkout 5a17850e251a55bba6d65aefbfeacfa9888cd2cd
> > >         # save the attached .config to linux build tree
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.=
cross W=3D1 ARCH=3Darm
> > >
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of=
_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `_=
_cpuidle_method_of_table'
> > > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of=
_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `_=
_cpuidle_method_of_table'
> > > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of=
_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `_=
_cpuidle_method_of_table'
> >
> > Filed: https://github.com/ClangBuiltLinux/linux/issues/1372 (though
> > this isn't specific to clang).
> > --
> > Thanks,
> > ~Nick Desaulniers
> =

> =

> =

> -- =

> Thanks,
> ~Nick Desaulniers
--===============8840193127320501954==--

