Content-Type: multipart/mixed; boundary="===============4250120598790832426=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: arch/riscv/kernel/probes/kprobes.c:90:22: error: use of undeclared identifier 'PAGE_KERNEL_READ_EXEC'
Date: Sun, 16 May 2021 12:10:01 -0700
Message-ID: <22c9edf5-1112-40e4-bd61-ad8ddf2d4732@infradead.org>
In-Reply-To: <202105070646.RiY8StjM-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4250120598790832426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/6/21 3:11 PM, kernel test robot wrote:
> Hi Jisheng,
> =

> FYI, the error/warning still remains.
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   38182162b50aa4e970e5997df0a0c4288147a153
> commit: cdd1b2bd358ffda2638fe18ff47191e84e18525f riscv: kprobes: Implemen=
t alloc_insn_page()
> date:   10 days ago
> config: riscv-randconfig-r006-20210506 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f5a=
2a5836cc8e4c1def2bdeb022e7b496623439)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Dcdd1b2bd358ffda2638fe18ff47191e84e18525f
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout cdd1b2bd358ffda2638fe18ff47191e84e18525f
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 ARCH=3Driscv =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded fro=
m macro '__le16_to_cpu'
>    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>                                                      ^
>    In file included from arch/riscv/kernel/probes/kprobes.c:3:
>    In file included from include/linux/kprobes.h:29:
>    In file included from include/linux/ftrace.h:10:
>    In file included from include/linux/trace_recursion.h:5:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:10:
>    In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:572:9: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return inl(addr);
>                   ^~~~~~~~~
>    arch/riscv/include/asm/io.h:57:76: note: expanded from macro 'inl'
>    #define inl(c)          ({ u32 __v; __io_pbr(); __v =3D readl_cpu((voi=
d*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
>                                                                          =
  ~~~~~~~~~~ ^
>    arch/riscv/include/asm/mmio.h:89:76: note: expanded from macro 'readl_=
cpu'
>    #define readl_cpu(c)            ({ u32 __r =3D le32_to_cpu((__force __=
le32)__raw_readl(c)); __r; })
>                                                                          =
               ^
>    include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded fro=
m macro '__le32_to_cpu'
>    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>                                                      ^
>    In file included from arch/riscv/kernel/probes/kprobes.c:3:
>    In file included from include/linux/kprobes.h:29:
>    In file included from include/linux/ftrace.h:10:
>    In file included from include/linux/trace_recursion.h:5:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:10:
>    In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:580:2: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            outb(value, addr);
>            ^~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:59:68: note: expanded from macro 'outb'
>    #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBA=
SE + (c))); __io_paw(); })
>                                                                  ~~~~~~~~=
~~ ^
>    arch/riscv/include/asm/mmio.h:91:52: note: expanded from macro 'writeb=
_cpu'
>    #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
>                                                              ^
>    In file included from arch/riscv/kernel/probes/kprobes.c:3:
>    In file included from include/linux/kprobes.h:29:
>    In file included from include/linux/ftrace.h:10:
>    In file included from include/linux/trace_recursion.h:5:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:10:
>    In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:588:2: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            outw(value, addr);
>            ^~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:60:68: note: expanded from macro 'outw'
>    #define outw(v,c)       ({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBA=
SE + (c))); __io_paw(); })
>                                                                  ~~~~~~~~=
~~ ^
>    arch/riscv/include/asm/mmio.h:92:76: note: expanded from macro 'writew=
_cpu'
>    #define writew_cpu(v, c)        ((void)__raw_writew((__force u16)cpu_t=
o_le16(v), (c)))
>                                                                          =
            ^
>    In file included from arch/riscv/kernel/probes/kprobes.c:3:
>    In file included from include/linux/kprobes.h:29:
>    In file included from include/linux/ftrace.h:10:
>    In file included from include/linux/trace_recursion.h:5:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:10:
>    In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:596:2: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            outl(value, addr);
>            ^~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:61:68: note: expanded from macro 'outl'
>    #define outl(v,c)       ({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBA=
SE + (c))); __io_paw(); })
>                                                                  ~~~~~~~~=
~~ ^
>    arch/riscv/include/asm/mmio.h:93:76: note: expanded from macro 'writel=
_cpu'
>    #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_t=
o_le32(v), (c)))
>                                                                          =
            ^
>    In file included from arch/riscv/kernel/probes/kprobes.c:3:
>    In file included from include/linux/kprobes.h:29:
>    In file included from include/linux/ftrace.h:10:
>    In file included from include/linux/trace_recursion.h:5:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:10:
>    In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:1005:55: warning: performing pointer arithmet=
ic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
>                                                      ~~~~~~~~~~ ^
>>> arch/riscv/kernel/probes/kprobes.c:90:22: error: use of undeclared iden=
tifier 'PAGE_KERNEL_READ_EXEC'
>                                         GFP_KERNEL, PAGE_KERNEL_READ_EXEC,
>                                                     ^
>    7 warnings and 1 error generated.
> =

> =

> vim +/PAGE_KERNEL_READ_EXEC +90 arch/riscv/kernel/probes/kprobes.c
> =

>     86	=

>     87	void *alloc_insn_page(void)
>     88	{
>     89		return  __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC=
_END,
>   > 90					     GFP_KERNEL, PAGE_KERNEL_READ_EXEC,
>     91					     VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
>     92					     __builtin_return_address(0));
>     93	}
>     94	=

> =

> ---

>>> arch/riscv/kernel/probes/kprobes.c:90:22: error: use of undeclared iden=
tifier 'PAGE_KERNEL_READ_EXEC'
>                                         GFP_KERNEL, PAGE_KERNEL_READ_EXEC,

is due to
# CONFIG_MMU is not set


-- =

~Randy

--===============4250120598790832426==--

