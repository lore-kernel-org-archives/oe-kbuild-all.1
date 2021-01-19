Content-Type: multipart/mixed; boundary="===============4179037471404384179=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: ld.lld: error: arch/powerpc/built-in.a(kernel/exceptions-64e.o):(.text+0x36BA): unknown relocation (110) against symbol
Date: Tue, 19 Jan 2021 13:33:13 -0800
Message-ID: <CAKwvOd=-vBopoAXTheomsA0iadEFzLXtbPZAaFJKqYESSuEPxQ@mail.gmail.com>
In-Reply-To: <202101181440.hvKuMRGL-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4179037471404384179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

fixed by: https://github.com/llvm/llvm-project/commit/5fcb412ed0831ad763810=
f9b424149b3b353451a

On Sun, Jan 17, 2021 at 10:06 PM kernel test robot <lkp@intel.com> wrote:
>
> CC: linux-kernel(a)vger.kernel.org
> TO: Nicholas Piggin <npiggin@gmail.com>
> CC: Michael Ellerman <mpe@ellerman.id.au>
>
> Hi Nicholas,
>
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   19c329f6808995b142b3966301f217c831e7cf31
> commit: 903dd1ff453e458fc7608ee4df42a6df16d3d1a0 powerpc/64e: remove 64s =
specific interrupt soft-mask code
> date:   3 months ago
> config: powerpc64-randconfig-r005-20210118 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 95d1=
46182fdf2315e74943b93fb3bb0cbafc5d89)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc64 cross compiling tool for clang build
>         # apt-get install binutils-powerpc64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D903dd1ff453e458fc7608ee4df42a6df16d3d1a0
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 903dd1ff453e458fc7608ee4df42a6df16d3d1a0
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dpowerpc64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    ld.lld: error: arch/powerpc/built-in.a(kernel/exceptions-64e.o):(.text=
+0x22FE): unknown relocation (110) against symbol interrupt_base_book3e
>    ld.lld: error: arch/powerpc/built-in.a(kernel/exceptions-64e.o):(.text=
+0x2316): unknown relocation (110) against symbol __end_interrupts
>    ld.lld: error: arch/powerpc/built-in.a(kernel/exceptions-64e.o):(.text=
+0x248A): unknown relocation (110) against symbol interrupt_base_book3e
>    ld.lld: error: arch/powerpc/built-in.a(kernel/exceptions-64e.o):(.text=
+0x24A2): unknown relocation (110) against symbol __end_interrupts
> >> ld.lld: error: arch/powerpc/built-in.a(kernel/exceptions-64e.o):(.text=
+0x36BA): unknown relocation (110) against symbol
>    ld.lld: error: undefined symbol: .early_setup
>    >>> referenced by arch/powerpc/kernel/head_64.o:(.ref.text+0x8E)
>    >>> did you mean: early_setup
>    >>> defined in: arch/powerpc/built-in.a(kernel/setup_64.o)
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe(a)googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/202101181440.hvKuMRGL-lkp%40intel.com.



-- =

Thanks,
~Nick Desaulniers
--===============4179037471404384179==--

