Content-Type: multipart/mixed; boundary="===============3549850180266578730=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/gpio/gpio-dwapb.c:678:12: warning: stack frame size of 2064 bytes in function 'dwapb_gpio_probe'
Date: Mon, 03 May 2021 16:39:13 -0700
Message-ID: <CAKwvOd=2vLrjzDnqeqA39BX-Wd+dn+UKPhRvzCjYR0js44y6BQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmg80badHYBv1T4PKgEpgWSBtU0YewfLLS1X3QWCA_FyA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3549850180266578730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 3, 2021 at 1:49 PM Nick Desaulniers <ndesaulniers@google.com>=
 wrote:
>
> On Mon, May 3, 2021 at 1:40 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, May 3, 2021 at 1:54 AM kernel test robot <lkp@intel.com> wrot=
e:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> > > head:   27787ba3fa4904422b3928b898d1bd3d74d98bea
> > > commit: 60593df667e087b009ee0fc20d92e9c4c096a9b5 gpio: dwapb: fix NUL=
L pointer dereference at dwapb_gpio_suspend()
> > > date:   5 months ago
> > > config: powerpc64-randconfig-r026-20210430 (attached as .config)
> > > compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project =
8f5a2a5836cc8e4c1def2bdeb022e7b496623439)
> > > reproduce (this is a W=3D1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install powerpc64 cross compiling tool for clang build
> > >         # apt-get install binutils-powerpc64-linux-gnu
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git/commit/?id=3D60593df667e087b009ee0fc20d92e9c4c096a9b5
> > >         git remote add linus https://git.kernel.org/pub/scm/linux/ker=
nel/git/torvalds/linux.git
> > >         git fetch --no-tags linus master
> > >         git checkout 60593df667e087b009ee0fc20d92e9c4c096a9b5
> > >         # save the attached .config to linux build tree
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cros=
s W=3D1 ARCH=3Dpowerpc64
> > >
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> drivers/gpio/gpio-dwapb.c:678:12: warning: stack frame size of 206=
4 bytes in function 'dwapb_gpio_probe' [-Wframe-larger-than=3D]
> > >    static int dwapb_gpio_probe(struct platform_device *pdev)
> > >               ^
> > >    1 warning generated.
> >
> > Another Clang bug?
>
> We have a KI with ASAN's requirements on additional stack usage for
> shadow stacks not being considered when making decisions whether or
> not to inline. Looks like KASAN isn't enabled by this randconfig;
> UBSAN is.  I don't know if UBSAN has similar additional stack usage to
> KASAN.
>
> I can reproduce this warning on mainline with:
> $ wget https://groups.google.com/group/clang-built-linux/attach/983d2ad77=
c1d/.config.gz\?part\=3D0.1
> -O - | gunzip > .config
> $ ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64le-linux-gnu- make CC=3Dclang -=
j72
> drivers/gpio/gpio-dwapb.o
>
> If I enable CONFIG_DEBUG_INFO, then rebuild, I have a utility for
> helping track these down from parsing the DWARF debug info.
> Unfortunately, it depends on pyelftools which doesn't know any ppc64
> relocations; let me see if I can implement that real quick, which
> should help debug this further.

https://github.com/eliben/pyelftools/pull/360
-- =

Thanks,
~Nick Desaulniers
--===============3549850180266578730==--

