Content-Type: multipart/mixed; boundary="===============8290806683474412687=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [tip:x86/mm 1/23] arch/x86/mm/init.c:75:6: warning: no previous prototype for function 'x86_has_pat_wp'
Date: Tue, 19 May 2020 17:26:18 -0700
Message-ID: <CAKwvOdmoA5ZFCiUQ5fVf7+970Y4bxvU=kYWb49NENQzxdm7F1Q@mail.gmail.com>
In-Reply-To: <831EE4E5E37DCC428EB295A351E6624952648ACF@shsmsx102.ccr.corp.intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8290806683474412687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 4:49 PM Li, Philip <philip.li@intel.com> wrote:
>
> > Subject: Re: [tip:x86/mm 1/23] arch/x86/mm/init.c:75:6: warning: no pre=
vious
> > prototype for function 'x86_has_pat_wp'
> >
> > Masahiro and Philip,
> > We're seeing a bunch of -Wmissing-prototypes warnings from 0day bot
> > suddenly today.  Did something change on the Kbuild or 0day bot side?
> Hi Nick, W=3D1 was added to make. This leads to extra warnings.

Ah, ok.  Good to know the change is in 0day bot which rules out
changes to Kbuild and Clang.

It might be helpful to note in the email that this is a W=3D1 build,
since it's non obvious and cannot be set via config.

Generally, the kernel is not W=3D1 clean.  I realize that 0day bot can
filter old vs new.  Why -Wmissing-prototypes is a problem is that:
1. there are already many instances of it throughout the kernel;
references without forward declarations or correct includes.
2. it's easy for someone to call a function like code that already
exists in the translation unit they're touching.

So by adding another implicit call, they get warned for the whole
file.  Generally, the fix is trivial; just include the correct header.
If that leads to tangly-sphagetti-limbo/circular includes, then raw
forward declarations can be used (though it's easy for those to get
out of sync, which can lead to spooky bugs).

I think having in the top of the warning that this is a W=3D1 build will
make it more obvious.

I get that -Wmissing-prototypes can be noisy, but it's trivial to fix.
I do worry what other warnings lurk in W=3D1 though...

>
> >
> > On Tue, May 19, 2020 at 2:25 PM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > On Tue, May 19, 2020 at 10:55:05PM +0200, Borislav Petkov wrote:
> > > > On Wed, May 20, 2020 at 01:51:25AM +0800, kbuild test robot wrote:
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.g=
it x86/mm
> > > > > head:   bd1de2a7aace4d1d312fb1be264b8fafdb706208
> > > > > commit: 1f6f655e01adebf5bd5e6c3da2e843c104ded051 [1/23] x86/mm: A=
dd
> > a x86_has_pat_wp() helper
> > > > > config: x86_64-randconfig-r012-20200519 (attached as .config)
> > > > > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-proj=
ect
> > 135b877874fae96b4372c8a3fbfaa8ff44ff86e3)
> > > > > reproduce:
> > > > >         wget https://raw.githubusercontent.com/intel/lkp-
> > tests/master/sbin/make.cross -O ~/bin/make.cross
> > > > >         chmod +x ~/bin/make.cross
> > > > >         # install x86_64 cross compiling tool for clang build
> > > > >         # apt-get install binutils-x86-64-linux-gnu
> > > > >         git checkout 1f6f655e01adebf5bd5e6c3da2e843c104ded051
> > > > >         # save the attached .config to linux build tree
> > > > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang
> > make.cross ARCH=3Dx86_64
> > > > >
> > > > > If you fix the issue, kindly add following tag as appropriate
> > > > > Reported-by: kbuild test robot <lkp@intel.com>
> > > > >
> > > > > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > > > >
> > > > > >> arch/x86/mm/init.c:75:6: warning: no previous prototype for fu=
nction
> > 'x86_has_pat_wp' [-Wmissing-prototypes]
> > > > > bool x86_has_pat_wp(void)
> > > > > ^
> > > >
> > > > Triggers with gcc too:
> > > >
> > > > make W=3D1 arch/x86/mm/init.o
> > > >
> > > > ...
> > > >
> > > > arch/x86/mm/init.c:81:6: warning: no previous prototype for =E2=80=
=98x86_has_pat_wp=E2=80=99
> > [-Wmissing-prototypes]
> > > >    81 | bool x86_has_pat_wp(void)
> > > >       |      ^~~~~~~~~~~~~~
> > > >
> > > >
> > > > -Wmissing-prototypes is default off, though, dunno why clang 11 has=
 it
> > > > on.
> > >
> > > It doesn't: https://godbolt.org/z/rU5_5H
> > >
> > > I assume this is caused by some sort of internal change to the 0day
> > > infrastructure (testing W=3D1?)
> > >
> > > I cannot see this without adding W=3D1 to make at the listed commit w=
ith
> > > the provided config.
> > >
> > > Cheers,
> > > Nathan
> > >
> > > > Anyway, something for Benni to fix. CCed and leaving the rest for h=
im as
> > > > reference.
> > > >
> > > > > arch/x86/mm/init.c:75:1: note: declare 'static' if the function i=
s not intended
> > to be used outside of this translation unit
> > > > > bool x86_has_pat_wp(void)
> > > > > ^
> > > > > static
> > > > > arch/x86/mm/init.c:866:13: warning: no previous prototype for fun=
ction
> > 'mem_encrypt_free_decrypted_mem' [-Wmissing-prototypes]
> > > > > void __weak mem_encrypt_free_decrypted_mem(void) { }
> > > > > ^
> > > > > arch/x86/mm/init.c:866:1: note: declare 'static' if the function =
is not intended
> > to be used outside of this translation unit
> > > > > void __weak mem_encrypt_free_decrypted_mem(void) { }
> > > > > ^
> > > > > static
> > > > > 2 warnings generated.
> > > > >
> > > > > vim +/x86_has_pat_wp +75 arch/x86/mm/init.c
> > > > >
> > > > >     73
> > > > >     74      /* Check that the write-protect PAT entry is set for =
write-protect */
> > > > >   > 75      bool x86_has_pat_wp(void)
> > > > >     76      {
> > > > >     77              return __pte2cachemode_tbl[_PAGE_CACHE_MODE_W=
P] =3D=3D
> > _PAGE_CACHE_MODE_WP;
> > > > >     78      }
> > > > >     79
> > > > >
> > > > > ---
> > > > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > > > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> > > >
> > > >
> > > >
> > > > --
> > > > Regards/Gruss,
> > > >     Boris.
> > > >
> > > > https://people.kernel.org/tglx/notes-about-netiquette
> > > >
> > >
> > > --
> > > You received this message because you are subscribed to the Google Gr=
oups
> > "Clang Built Linux" group.
> > > To unsubscribe from this group and stop receiving emails from it, sen=
d an email
> > to clang-built-linux+unsubscribe(a)googlegroups.com.
> > > To view this discussion on the web visit
> > https://groups.google.com/d/msgid/clang-built-
> > linux/20200519212541.GA3580016%40ubuntu-s3-xlarge-x86.
> >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers



-- =

Thanks,
~Nick Desaulniers
--===============8290806683474412687==--

