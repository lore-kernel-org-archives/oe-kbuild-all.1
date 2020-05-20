Content-Type: multipart/mixed; boundary="===============2420054566094810893=="
MIME-Version: 1.0
From: Ard Biesheuvel <ardb@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [efi:next 22/40] ld.lld: warning: vsprintf.c:(.discard.unreachable+0x0): has non-ABS relocation R_X86_64_PC32 against symbol ''
Date: Wed, 20 May 2020 18:14:31 +0200
Message-ID: <CAMj1kXGNmDPQRCCtRYFRa+0NW9kADnx327FzPbNge+MU+NFoVg@mail.gmail.com>
In-Reply-To: <20200520155352.GB3184088@rani.riverdale.lan>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2420054566094810893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 20 May 2020 at 17:53, Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> On Wed, May 20, 2020 at 10:28:13AM +0800, kbuild test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
> > head:   e5fbadd1179cdadeaa44d71a9ec068c5bc100524
> > commit: ce5e3f909fc0ed67e58367b9c56a54c20a51080b [22/40] efi/printf: Ad=
d 64-bit and 8-bit integer support
> > config: x86_64-defconfig (attached as .config)
> > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 13=
5b877874fae96b4372c8a3fbfaa8ff44ff86e3)
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install x86_64 cross compiling tool for clang build
> >         # apt-get install binutils-x86-64-linux-gnu
> >         git checkout ce5e3f909fc0ed67e58367b9c56a54c20a51080b
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dx86_64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> >
> > >> ld.lld: warning: vsprintf.c:(.discard.unreachable+0x0): has non-ABS =
relocation R_X86_64_PC32 against symbol ''
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
> Clang folk, is anything actually wrong here? This seems to result from
> use of unreachable() annotation, which generates these
> .discard.unreachable sections apparently to help objtool.
>

This came up before, and IIRC, it has already been fixed, only this
branch is based on v5.7-rc2.
--===============2420054566094810893==--

