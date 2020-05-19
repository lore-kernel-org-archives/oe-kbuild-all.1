Content-Type: multipart/mixed; boundary="===============6240092947867483714=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [tip:x86/mm 1/23] arch/x86/mm/init.c:75:6: warning: no previous prototype for function 'x86_has_pat_wp'
Date: Tue, 19 May 2020 23:49:13 +0000
Message-ID: <831EE4E5E37DCC428EB295A351E6624952648ACF@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <CAKwvOdk+JwddxLaXc9S7SMMTye8bDaGEckcs7zu5tEMD0G3Yog@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6240092947867483714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: Re: [tip:x86/mm 1/23] arch/x86/mm/init.c:75:6: warning: no previ=
ous
> prototype for function 'x86_has_pat_wp'
> =

> Masahiro and Philip,
> We're seeing a bunch of -Wmissing-prototypes warnings from 0day bot
> suddenly today.  Did something change on the Kbuild or 0day bot side?
Hi Nick, W=3D1 was added to make. This leads to extra warnings.

> =

> On Tue, May 19, 2020 at 2:25 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Tue, May 19, 2020 at 10:55:05PM +0200, Borislav Petkov wrote:
> > > On Wed, May 20, 2020 at 01:51:25AM +0800, kbuild test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git=
 x86/mm
> > > > head:   bd1de2a7aace4d1d312fb1be264b8fafdb706208
> > > > commit: 1f6f655e01adebf5bd5e6c3da2e843c104ded051 [1/23] x86/mm: Add
> a x86_has_pat_wp() helper
> > > > config: x86_64-randconfig-r012-20200519 (attached as .config)
> > > > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project
> 135b877874fae96b4372c8a3fbfaa8ff44ff86e3)
> > > > reproduce:
> > > >         wget https://raw.githubusercontent.com/intel/lkp-
> tests/master/sbin/make.cross -O ~/bin/make.cross
> > > >         chmod +x ~/bin/make.cross
> > > >         # install x86_64 cross compiling tool for clang build
> > > >         # apt-get install binutils-x86-64-linux-gnu
> > > >         git checkout 1f6f655e01adebf5bd5e6c3da2e843c104ded051
> > > >         # save the attached .config to linux build tree
> > > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang
> make.cross ARCH=3Dx86_64
> > > >
> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kbuild test robot <lkp@intel.com>
> > > >
> > > > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > > >
> > > > >> arch/x86/mm/init.c:75:6: warning: no previous prototype for func=
tion
> 'x86_has_pat_wp' [-Wmissing-prototypes]
> > > > bool x86_has_pat_wp(void)
> > > > ^
> > >
> > > Triggers with gcc too:
> > >
> > > make W=3D1 arch/x86/mm/init.o
> > >
> > > ...
> > >
> > > arch/x86/mm/init.c:81:6: warning: no previous prototype for =E2=80=98=
x86_has_pat_wp=E2=80=99
> [-Wmissing-prototypes]
> > >    81 | bool x86_has_pat_wp(void)
> > >       |      ^~~~~~~~~~~~~~
> > >
> > >
> > > -Wmissing-prototypes is default off, though, dunno why clang 11 has it
> > > on.
> >
> > It doesn't: https://godbolt.org/z/rU5_5H
> >
> > I assume this is caused by some sort of internal change to the 0day
> > infrastructure (testing W=3D1?)
> >
> > I cannot see this without adding W=3D1 to make at the listed commit with
> > the provided config.
> >
> > Cheers,
> > Nathan
> >
> > > Anyway, something for Benni to fix. CCed and leaving the rest for him=
 as
> > > reference.
> > >
> > > > arch/x86/mm/init.c:75:1: note: declare 'static' if the function is =
not intended
> to be used outside of this translation unit
> > > > bool x86_has_pat_wp(void)
> > > > ^
> > > > static
> > > > arch/x86/mm/init.c:866:13: warning: no previous prototype for funct=
ion
> 'mem_encrypt_free_decrypted_mem' [-Wmissing-prototypes]
> > > > void __weak mem_encrypt_free_decrypted_mem(void) { }
> > > > ^
> > > > arch/x86/mm/init.c:866:1: note: declare 'static' if the function is=
 not intended
> to be used outside of this translation unit
> > > > void __weak mem_encrypt_free_decrypted_mem(void) { }
> > > > ^
> > > > static
> > > > 2 warnings generated.
> > > >
> > > > vim +/x86_has_pat_wp +75 arch/x86/mm/init.c
> > > >
> > > >     73
> > > >     74      /* Check that the write-protect PAT entry is set for wr=
ite-protect */
> > > >   > 75      bool x86_has_pat_wp(void)
> > > >     76      {
> > > >     77              return __pte2cachemode_tbl[_PAGE_CACHE_MODE_WP]=
 =3D=3D
> _PAGE_CACHE_MODE_WP;
> > > >     78      }
> > > >     79
> > > >
> > > > ---
> > > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> > >
> > >
> > >
> > > --
> > > Regards/Gruss,
> > >     Boris.
> > >
> > > https://people.kernel.org/tglx/notes-about-netiquette
> > >
> >
> > --
> > You received this message because you are subscribed to the Google Grou=
ps
> "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send =
an email
> to clang-built-linux+unsubscribe(a)googlegroups.com.
> > To view this discussion on the web visit
> https://groups.google.com/d/msgid/clang-built-
> linux/20200519212541.GA3580016%40ubuntu-s3-xlarge-x86.
> =

> =

> =

> --
> Thanks,
> ~Nick Desaulniers

--===============6240092947867483714==--

