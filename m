Content-Type: multipart/mixed; boundary="===============8727939868841880360=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 3972/6402] kernel/dma/pool.o: warning: objtool: __llvm_gcov_writeout()+0x14: call without frame pointer save/setup
Date: Tue, 05 May 2020 11:25:12 -0700
Message-ID: <CAKwvOdniBgjgqY_YFY+80isdturCb75zSqCdV0GLH8dT7yS4iA@mail.gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2005051117060.230747@chino.kir.corp.google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8727939868841880360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2020 at 11:19 AM 'David Rientjes' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
>
> On Tue, 5 May 2020, kbuild test robot wrote:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   dfd71d381f7e1aa118e0368774aa05f5c4a48870
> > commit: 82fef0ad811fb5976cf36ccc3d2c3bc0195dfb72 [3972/6402] x86/mm: un=
encrypted non-blocking DMA allocations use coherent pools
> > config: x86_64-randconfig-d001-20200502 (attached as .config)
> > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 45=
b7d44ecb01780e26dc8d3c30bc34e32c08dd70)
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install x86_64 cross compiling tool for clang build
> >         # apt-get install binutils-x86-64-linux-gnu
> >         git checkout 82fef0ad811fb5976cf36ccc3d2c3bc0195dfb72
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dx86_64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> kernel/dma/pool.o: warning: objtool: __llvm_gcov_writeout()+0x14: ca=
ll without frame pointer save/setup
> > >> kernel/dma/pool.o: warning: objtool: __llvm_gcov_flush()+0x0: call w=
ithout frame pointer save/setup
> > --
> > >> kernel/dma/remap.o: warning: objtool: __llvm_gcov_writeout()+0x14: c=
all without frame pointer save/setup
> > >> kernel/dma/remap.o: warning: objtool: __llvm_gcov_flush()+0x0: call =
without frame pointer save/setup
> >
>
> At commit 82fef0ad811f ("x86/mm: unencrypted non-blocking DMA allocations
> use coherent pools") there should be no new kernel/dma/remap.o warnings,
> the Kconfig is merely selecting DMA_COHERENT_POOL.  The patch series
> actually only removed code from kernel/dma/remap.c, it did not add any
> code :)
>
> Since there are tons of warnings all over the kernel when building with
> this .config (probably because of CONFIG_FRAME_POINTER) I assume this is
> unrelated to this particular series or anything that gets introduced in
> dma-mapping.git.

Yes, this is an unrelated known issue, sorry.
https://github.com/ClangBuiltLinux/linux/issues/955
(We just got clang builds turned on 0day bot, and are now being
drowned in build reports from randconfigs we hadn't previously found.
Which is both good (what I want), and bad (what I don't have time to
fix all the different reports)).

-- =

Thanks,
~Nick Desaulniers
--===============8727939868841880360==--

