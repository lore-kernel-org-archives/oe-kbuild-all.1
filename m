Content-Type: multipart/mixed; boundary="===============8671432735211028630=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: clang-12: error: assembler command failed with exit code 1 (use -v to see invocation)
Date: Mon, 12 Oct 2020 12:21:03 -0700
Message-ID: <CAKwvOd=jm7x2+yFtqUmSWXXcuGjqyGR1cbf40tMJPCkunv0Uzg@mail.gmail.com>
In-Reply-To: <202010110430.aoU5Kjsn-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8671432735211028630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I don't think the bisection was quite right, but possibly an
interesting case in compatibility between clang and GNU binutils.
Looks like clang is generating operands that are too large to be
encoded.

On Sat, Oct 10, 2020 at 1:49 PM kernel test robot <lkp@intel.com> wrote:
>
> CC: linux-kernel(a)vger.kernel.org
> TO: Marc Zyngier <maz@kernel.org>
> CC: Benjamin Tissoires <benjamin.tissoires@gmail.com>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   6f2f486d57c4d562cdf4932320b66fbb878ab1c4
> commit: 35556bed836f8dc07ac55f69c8d17dce3e7f0e25 HID: core: Sanitize even=
t code and type when mapping input
> date:   6 weeks ago
> config: s390-randconfig-r023-20201011 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 9b5b=
3050237db3642ed7ab1bdb3ffa2202511b99)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D35556bed836f8dc07ac55f69c8d17dce3e7f0e25
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 35556bed836f8dc07ac55f69c8d17dce3e7f0e25
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Ds390
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    include/asm-generic/io.h:490:45: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
>                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from m=
acro '__le32_to_cpu'
>    #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
>                                                              ^
>    include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
>            ___constant_swab32(x) :                 \
>                               ^
>    include/uapi/linux/swab.h:20:12: note: expanded from macro '___constan=
t_swab32'
>            (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
>                      ^
>    In file included from drivers/hid/hid-input.c:21:
>    In file included from include/linux/hid-debug.h:14:
>    In file included from include/linux/kfifo.h:42:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/s390/include/asm/io.h:72:
>    include/asm-generic/io.h:490:45: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
>                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from m=
acro '__le32_to_cpu'
>    #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
>                                                              ^
>    include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
>            ___constant_swab32(x) :                 \
>                               ^
>    include/uapi/linux/swab.h:21:12: note: expanded from macro '___constan=
t_swab32'
>            (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
>                      ^
>    In file included from drivers/hid/hid-input.c:21:
>    In file included from include/linux/hid-debug.h:14:
>    In file included from include/linux/kfifo.h:42:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/s390/include/asm/io.h:72:
>    include/asm-generic/io.h:490:45: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
>                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from m=
acro '__le32_to_cpu'
>    #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
>                                                              ^
>    include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
>            ___constant_swab32(x) :                 \
>                               ^
>    include/uapi/linux/swab.h:22:12: note: expanded from macro '___constan=
t_swab32'
>            (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
>                      ^
>    In file included from drivers/hid/hid-input.c:21:
>    In file included from include/linux/hid-debug.h:14:
>    In file included from include/linux/kfifo.h:42:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/s390/include/asm/io.h:72:
>    include/asm-generic/io.h:490:45: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
>                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from m=
acro '__le32_to_cpu'
>    #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
>                                                              ^
>    include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
>            __fswab32(x))
>                      ^
>    In file included from drivers/hid/hid-input.c:21:
>    In file included from include/linux/hid-debug.h:14:
>    In file included from include/linux/kfifo.h:42:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/s390/include/asm/io.h:72:
>    include/asm-generic/io.h:501:33: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writeb(value, PCI_IOBASE + addr);
>                                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:511:46: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writew(cpu_to_le16(value), PCI_IOBASE + addr);
>                                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:521:46: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writel(cpu_to_le32(value), PCI_IOBASE + addr);
>                                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:609:20: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            readsb(PCI_IOBASE + addr, buffer, count);
>                   ~~~~~~~~~~ ^
>    include/asm-generic/io.h:617:20: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            readsw(PCI_IOBASE + addr, buffer, count);
>                   ~~~~~~~~~~ ^
>    include/asm-generic/io.h:625:20: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            readsl(PCI_IOBASE + addr, buffer, count);
>                   ~~~~~~~~~~ ^
>    include/asm-generic/io.h:634:21: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            writesb(PCI_IOBASE + addr, buffer, count);
>                    ~~~~~~~~~~ ^
>    include/asm-generic/io.h:643:21: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            writesw(PCI_IOBASE + addr, buffer, count);
>                    ~~~~~~~~~~ ^
>    include/asm-generic/io.h:652:21: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            writesl(PCI_IOBASE + addr, buffer, count);
>                    ~~~~~~~~~~ ^
>    20 warnings generated.
>    /tmp/hid-input-85a7dd.s: Assembler messages:
>    /tmp/hid-input-85a7dd.s:177577: Error: operand out of range (-65572 no=
t between 4294901760 and 65534)
>    /tmp/hid-input-85a7dd.s:177606: Error: operand out of range (-65584 no=
t between 4294901760 and 65534)
>    /tmp/hid-input-85a7dd.s:177635: Error: operand out of range (-65560 no=
t between 4294901760 and 65534)
>    /tmp/hid-input-85a7dd.s:177665: Error: operand out of range (-65576 no=
t between 4294901760 and 65534)
>    /tmp/hid-input-85a7dd.s:177695: Error: operand out of range (-65554 no=
t between 4294901760 and 65534)
>    /tmp/hid-input-85a7dd.s:177725: Error: operand out of range (-65570 no=
t between 4294901760 and 65534)
> >> clang-12: error: assembler command failed with exit code 1 (use -v to =
see invocation)
> --
>    include/asm-generic/io.h:490:45: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
>                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from m=
acro '__le32_to_cpu'
>    #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
>                                                              ^
>    include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
>            ___constant_swab32(x) :                 \
>                               ^
>    include/uapi/linux/swab.h:20:12: note: expanded from macro '___constan=
t_swab32'
>            (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
>                      ^
>    In file included from drivers/hid/hid-input.c:21:
>    In file included from include/linux/hid-debug.h:14:
>    In file included from include/linux/kfifo.h:42:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/s390/include/asm/io.h:72:
>    include/asm-generic/io.h:490:45: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
>                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from m=
acro '__le32_to_cpu'
>    #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
>                                                              ^
>    include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
>            ___constant_swab32(x) :                 \
>                               ^
>    include/uapi/linux/swab.h:21:12: note: expanded from macro '___constan=
t_swab32'
>            (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
>                      ^
>    In file included from drivers/hid/hid-input.c:21:
>    In file included from include/linux/hid-debug.h:14:
>    In file included from include/linux/kfifo.h:42:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/s390/include/asm/io.h:72:
>    include/asm-generic/io.h:490:45: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
>                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from m=
acro '__le32_to_cpu'
>    #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
>                                                              ^
>    include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
>            ___constant_swab32(x) :                 \
>                               ^
>    include/uapi/linux/swab.h:22:12: note: expanded from macro '___constan=
t_swab32'
>            (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
>                      ^
>    In file included from drivers/hid/hid-input.c:21:
>    In file included from include/linux/hid-debug.h:14:
>    In file included from include/linux/kfifo.h:42:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/s390/include/asm/io.h:72:
>    include/asm-generic/io.h:490:45: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
>                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from m=
acro '__le32_to_cpu'
>    #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
>                                                              ^
>    include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
>            __fswab32(x))
>                      ^
>    In file included from drivers/hid/hid-input.c:21:
>    In file included from include/linux/hid-debug.h:14:
>    In file included from include/linux/kfifo.h:42:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/s390/include/asm/io.h:72:
>    include/asm-generic/io.h:501:33: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writeb(value, PCI_IOBASE + addr);
>                                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:511:46: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writew(cpu_to_le16(value), PCI_IOBASE + addr);
>                                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:521:46: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writel(cpu_to_le32(value), PCI_IOBASE + addr);
>                                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:609:20: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            readsb(PCI_IOBASE + addr, buffer, count);
>                   ~~~~~~~~~~ ^
>    include/asm-generic/io.h:617:20: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            readsw(PCI_IOBASE + addr, buffer, count);
>                   ~~~~~~~~~~ ^
>    include/asm-generic/io.h:625:20: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            readsl(PCI_IOBASE + addr, buffer, count);
>                   ~~~~~~~~~~ ^
>    include/asm-generic/io.h:634:21: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            writesb(PCI_IOBASE + addr, buffer, count);
>                    ~~~~~~~~~~ ^
>    include/asm-generic/io.h:643:21: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            writesw(PCI_IOBASE + addr, buffer, count);
>                    ~~~~~~~~~~ ^
>    include/asm-generic/io.h:652:21: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            writesl(PCI_IOBASE + addr, buffer, count);
>                    ~~~~~~~~~~ ^
>    20 warnings generated.
>    /tmp/hid-input-0ec629.s: Assembler messages:
>    /tmp/hid-input-0ec629.s:177577: Error: operand out of range (-65572 no=
t between 4294901760 and 65534)
>    /tmp/hid-input-0ec629.s:177606: Error: operand out of range (-65584 no=
t between 4294901760 and 65534)
>    /tmp/hid-input-0ec629.s:177635: Error: operand out of range (-65560 no=
t between 4294901760 and 65534)
>    /tmp/hid-input-0ec629.s:177665: Error: operand out of range (-65576 no=
t between 4294901760 and 65534)
>    /tmp/hid-input-0ec629.s:177695: Error: operand out of range (-65554 no=
t between 4294901760 and 65534)
>    /tmp/hid-input-0ec629.s:177725: Error: operand out of range (-65570 no=
t between 4294901760 and 65534)
> >> clang-12: error: assembler command failed with exit code 1 (use -v to =
see invocation)
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
d/clang-built-linux/202010110430.aoU5Kjsn-lkp%40intel.com.



-- =

Thanks,
~Nick Desaulniers
--===============8671432735211028630==--

