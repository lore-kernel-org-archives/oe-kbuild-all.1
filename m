Content-Type: multipart/mixed; boundary="===============4640820248327519173=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
Date: Thu, 06 May 2021 12:09:46 -0700
Message-ID: <CAKwvOd=0_KbumyVLS2dn2DiKes50oG3te4Cd4aTAxnc5moERuw@mail.gmail.com>
In-Reply-To: <CAKwvOdnQ+hiGxfsG5VeJO4qGqfRPvf=Mp7TRgjKzZnTspZjntA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4640820248327519173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+ folks from commit 449e056c76cc ("ARM: cpuidle: Add a cpuidle ops
structure to be used for DT")

On Thu, May 6, 2021 at 12:05 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Apr 30, 2021 at 5:11 PM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Kees,
> >
> > FYI, the error/warning still remains.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   65ec0a7d24913b146cd1500d759b8c340319d55e
> > commit: 5a17850e251a55bba6d65aefbfeacfa9888cd2cd arm/build: Warn on orp=
han section placement
> > date:   8 months ago
> > config: arm-randconfig-r024-20210501 (attached as .config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/commit/?id=3D5a17850e251a55bba6d65aefbfeacfa9888cd2cd
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kerne=
l/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 5a17850e251a55bba6d65aefbfeacfa9888cd2cd
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss W=3D1 ARCH=3Darm
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_t=
able' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__c=
puidle_method_of_table'
> > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_t=
able' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__c=
puidle_method_of_table'
> > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_t=
able' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__c=
puidle_method_of_table'
>
> Filed: https://github.com/ClangBuiltLinux/linux/issues/1372 (though
> this isn't specific to clang).
> --
> Thanks,
> ~Nick Desaulniers



-- =

Thanks,
~Nick Desaulniers
--===============4640820248327519173==--

