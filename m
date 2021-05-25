Content-Type: multipart/mixed; boundary="===============7968089860448849043=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] kcov: add __no_sanitize_coverage to fix noinstr for all architectures
Date: Wed, 26 May 2021 06:22:59 +0800
Message-ID: <202105260629.X6n5yc4D-lkp@intel.com>
In-Reply-To: <20210525175819.699786-1-elver@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7968089860448849043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Marco,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on kees/for-next/pstore linus/master v5.13-rc3 nex=
t-20210525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marco-Elver/kcov-add-__no_=
sanitize_coverage-to-fix-noinstr-for-all-architectures/20210526-020046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
dd860052c99b1e088352bdd4fb7aef46f8d2ef47
config: s390-randconfig-r002-20210525 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 99155e=
913e9bad5f7f8a247f8bb3a3ff3da74af1)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/d898fa12bc72a46da1b9466bb=
7f8369949b714a9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Marco-Elver/kcov-add-__no_sanitize=
_coverage-to-fix-noinstr-for-all-architectures/20210526-020046
        git checkout d898fa12bc72a46da1b9466bb7f8369949b714a9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from mac=
ro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from arch/s390/kernel/traps.c:29:
   In file included from include/linux/entry-common.h:6:
   In file included from include/linux/tracehook.h:50:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:25:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from arch/s390/kernel/traps.c:29:
   In file included from include/linux/entry-common.h:6:
   In file included from include/linux/tracehook.h:50:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:25:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from arch/s390/kernel/traps.c:29:
   include/linux/entry-common.h:450:18: warning: unknown sanitizer 'coverag=
e' ignored [-Wunknown-sanitizers]
   irqentry_state_t noinstr irqentry_enter(struct pt_regs *regs);
                    ^
   include/linux/compiler_types.h:213:35: note: expanded from macro 'noinst=
r'
           __no_kcsan __no_sanitize_address __no_sanitize_coverage
                                            ^
   include/linux/compiler-clang.h:49:59: note: expanded from macro '__no_sa=
nitize_coverage'
   #define __no_sanitize_coverage __attribute__((no_sanitize("coverage")))
                                                             ^
   In file included from arch/s390/kernel/traps.c:29:
   include/linux/entry-common.h:476:6: warning: unknown sanitizer 'coverage=
' ignored [-Wunknown-sanitizers]
   void noinstr irqentry_exit(struct pt_regs *regs, irqentry_state_t state);
        ^
   include/linux/compiler_types.h:213:35: note: expanded from macro 'noinst=
r'
           __no_kcsan __no_sanitize_address __no_sanitize_coverage
                                            ^
   include/linux/compiler-clang.h:49:59: note: expanded from macro '__no_sa=
nitize_coverage'
   #define __no_sanitize_coverage __attribute__((no_sanitize("coverage")))
                                                             ^
   In file included from arch/s390/kernel/traps.c:29:
   include/linux/entry-common.h:484:18: warning: unknown sanitizer 'coverag=
e' ignored [-Wunknown-sanitizers]
   irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs);
                    ^
   include/linux/compiler_types.h:213:35: note: expanded from macro 'noinst=
r'
           __no_kcsan __no_sanitize_address __no_sanitize_coverage
                                            ^
   include/linux/compiler-clang.h:49:59: note: expanded from macro '__no_sa=
nitize_coverage'
   #define __no_sanitize_coverage __attribute__((no_sanitize("coverage")))
                                                             ^
   In file included from arch/s390/kernel/traps.c:29:
   include/linux/entry-common.h:495:6: warning: unknown sanitizer 'coverage=
' ignored [-Wunknown-sanitizers]
   void noinstr irqentry_nmi_exit(struct pt_regs *regs, irqentry_state_t ir=
q_state);
        ^
   include/linux/compiler_types.h:213:35: note: expanded from macro 'noinst=
r'
           __no_kcsan __no_sanitize_address __no_sanitize_coverage
                                            ^
   include/linux/compiler-clang.h:49:59: note: expanded from macro '__no_sa=
nitize_coverage'
   #define __no_sanitize_coverage __attribute__((no_sanitize("coverage")))
                                                             ^
>> arch/s390/kernel/traps.c:299:6: warning: unknown sanitizer 'coverage' ig=
nored [-Wunknown-sanitizers]
   void noinstr __do_pgm_check(struct pt_regs *regs)
        ^
   include/linux/compiler_types.h:213:35: note: expanded from macro 'noinst=
r'
           __no_kcsan __no_sanitize_address __no_sanitize_coverage
                                            ^
   include/linux/compiler-clang.h:49:59: note: expanded from macro '__no_sa=
nitize_coverage'
   #define __no_sanitize_coverage __attribute__((no_sanitize("coverage")))
                                                             ^
   17 warnings generated.
--
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from mac=
ro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from arch/s390/kernel/syscall.c:34:
   In file included from include/linux/entry-common.h:6:
   In file included from include/linux/tracehook.h:50:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:25:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from arch/s390/kernel/syscall.c:34:
   In file included from include/linux/entry-common.h:6:
   In file included from include/linux/tracehook.h:50:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:25:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from arch/s390/kernel/syscall.c:34:
   include/linux/entry-common.h:450:18: warning: unknown sanitizer 'coverag=
e' ignored [-Wunknown-sanitizers]
   irqentry_state_t noinstr irqentry_enter(struct pt_regs *regs);
                    ^
   include/linux/compiler_types.h:213:35: note: expanded from macro 'noinst=
r'
           __no_kcsan __no_sanitize_address __no_sanitize_coverage
                                            ^
   include/linux/compiler-clang.h:49:59: note: expanded from macro '__no_sa=
nitize_coverage'
   #define __no_sanitize_coverage __attribute__((no_sanitize("coverage")))
                                                             ^
   In file included from arch/s390/kernel/syscall.c:34:
   include/linux/entry-common.h:476:6: warning: unknown sanitizer 'coverage=
' ignored [-Wunknown-sanitizers]
   void noinstr irqentry_exit(struct pt_regs *regs, irqentry_state_t state);
        ^
   include/linux/compiler_types.h:213:35: note: expanded from macro 'noinst=
r'
           __no_kcsan __no_sanitize_address __no_sanitize_coverage
                                            ^
   include/linux/compiler-clang.h:49:59: note: expanded from macro '__no_sa=
nitize_coverage'
   #define __no_sanitize_coverage __attribute__((no_sanitize("coverage")))
                                                             ^
   In file included from arch/s390/kernel/syscall.c:34:
   include/linux/entry-common.h:484:18: warning: unknown sanitizer 'coverag=
e' ignored [-Wunknown-sanitizers]
   irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs);
                    ^
   include/linux/compiler_types.h:213:35: note: expanded from macro 'noinst=
r'
           __no_kcsan __no_sanitize_address __no_sanitize_coverage
                                            ^
   include/linux/compiler-clang.h:49:59: note: expanded from macro '__no_sa=
nitize_coverage'
   #define __no_sanitize_coverage __attribute__((no_sanitize("coverage")))
                                                             ^
   In file included from arch/s390/kernel/syscall.c:34:
   include/linux/entry-common.h:495:6: warning: unknown sanitizer 'coverage=
' ignored [-Wunknown-sanitizers]
   void noinstr irqentry_nmi_exit(struct pt_regs *regs, irqentry_state_t ir=
q_state);
        ^
   include/linux/compiler_types.h:213:35: note: expanded from macro 'noinst=
r'
           __no_kcsan __no_sanitize_address __no_sanitize_coverage
                                            ^
   include/linux/compiler-clang.h:49:59: note: expanded from macro '__no_sa=
nitize_coverage'
   #define __no_sanitize_coverage __attribute__((no_sanitize("coverage")))
                                                             ^
>> arch/s390/kernel/syscall.c:143:6: warning: unknown sanitizer 'coverage' =
ignored [-Wunknown-sanitizers]
   void noinstr __do_syscall(struct pt_regs *regs, int per_trap)
        ^
   include/linux/compiler_types.h:213:35: note: expanded from macro 'noinst=
r'
           __no_kcsan __no_sanitize_address __no_sanitize_coverage
                                            ^
   include/linux/compiler-clang.h:49:59: note: expanded from macro '__no_sa=
nitize_coverage'
   #define __no_sanitize_coverage __attribute__((no_sanitize("coverage")))
                                                             ^
   17 warnings generated.
--
   In file included from arch/s390/kernel/nmi.c:33:
   In file included from include/linux/kvm_host.h:33:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:36:
   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from mac=
ro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from arch/s390/kernel/nmi.c:33:
   In file included from include/linux/kvm_host.h:33:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:36:
   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from arch/s390/kernel/nmi.c:33:
   In file included from include/linux/kvm_host.h:33:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:36:
   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> arch/s390/kernel/nmi.c:182:6: warning: unknown sanitizer 'coverage' igno=
red [-Wunknown-sanitizers]
   void noinstr s390_handle_mcck(void)
        ^
   include/linux/compiler_types.h:213:35: note: expanded from macro 'noinst=
r'
           __no_kcsan __no_sanitize_address __no_sanitize_coverage
                                            ^
   include/linux/compiler-clang.h:49:59: note: expanded from macro '__no_sa=
nitize_coverage'
   #define __no_sanitize_coverage __attribute__((no_sanitize("coverage")))
                                                             ^
   13 warnings generated.
..


vim +/coverage +299 arch/s390/kernel/traps.c

6f8daa2953ecd1 Heiko Carstens 2021-04-07  298  =

56e62a73702836 Sven Schnelle  2020-11-21 @299  void noinstr __do_pgm_check(=
struct pt_regs *regs)
56e62a73702836 Sven Schnelle  2020-11-21  300  {
56e62a73702836 Sven Schnelle  2020-11-21  301  	unsigned long last_break =
=3D S390_lowcore.breaking_event_addr;
56e62a73702836 Sven Schnelle  2020-11-21  302  	unsigned int trapnr, syscal=
l_redirect =3D 0;
56e62a73702836 Sven Schnelle  2020-11-21  303  	irqentry_state_t state;
56e62a73702836 Sven Schnelle  2020-11-21  304  =

bae1cd368c45d1 Sven Schnelle  2021-04-29  305  	add_random_kstack_offset();
56e62a73702836 Sven Schnelle  2020-11-21  306  	regs->int_code =3D *(u32 *)=
&S390_lowcore.pgm_ilc;
56e62a73702836 Sven Schnelle  2020-11-21  307  	regs->int_parm_long =3D S39=
0_lowcore.trans_exc_code;
56e62a73702836 Sven Schnelle  2020-11-21  308  =

56e62a73702836 Sven Schnelle  2020-11-21  309  	state =3D irqentry_enter(re=
gs);
56e62a73702836 Sven Schnelle  2020-11-21  310  =

56e62a73702836 Sven Schnelle  2020-11-21  311  	if (user_mode(regs)) {
56e62a73702836 Sven Schnelle  2020-11-21  312  		update_timer_sys();
56e62a73702836 Sven Schnelle  2020-11-21  313  		if (last_break < 4096)
56e62a73702836 Sven Schnelle  2020-11-21  314  			last_break =3D 1;
56e62a73702836 Sven Schnelle  2020-11-21  315  		current->thread.last_break=
 =3D last_break;
56e62a73702836 Sven Schnelle  2020-11-21  316  		regs->args[0] =3D last_bre=
ak;
56e62a73702836 Sven Schnelle  2020-11-21  317  	}
56e62a73702836 Sven Schnelle  2020-11-21  318  =

56e62a73702836 Sven Schnelle  2020-11-21  319  	if (S390_lowcore.pgm_code &=
 0x0200) {
56e62a73702836 Sven Schnelle  2020-11-21  320  		/* transaction abort */
56e62a73702836 Sven Schnelle  2020-11-21  321  		memcpy(&current->thread.tr=
ap_tdb, &S390_lowcore.pgm_tdb, 256);
56e62a73702836 Sven Schnelle  2020-11-21  322  	}
56e62a73702836 Sven Schnelle  2020-11-21  323  =

56e62a73702836 Sven Schnelle  2020-11-21  324  	if (S390_lowcore.pgm_code &=
 PGM_INT_CODE_PER) {
56e62a73702836 Sven Schnelle  2020-11-21  325  		if (user_mode(regs)) {
56e62a73702836 Sven Schnelle  2020-11-21  326  			struct per_event *ev =3D =
&current->thread.per_event;
56e62a73702836 Sven Schnelle  2020-11-21  327  =

56e62a73702836 Sven Schnelle  2020-11-21  328  			set_thread_flag(TIF_PER_T=
RAP);
56e62a73702836 Sven Schnelle  2020-11-21  329  			ev->address =3D S390_lowc=
ore.per_address;
56e62a73702836 Sven Schnelle  2020-11-21  330  			ev->cause =3D *(u16 *)&S3=
90_lowcore.per_code;
56e62a73702836 Sven Schnelle  2020-11-21  331  			ev->paid =3D S390_lowcore=
.per_access_id;
56e62a73702836 Sven Schnelle  2020-11-21  332  		} else {
56e62a73702836 Sven Schnelle  2020-11-21  333  			/* PER event in kernel is=
 kprobes */
56e62a73702836 Sven Schnelle  2020-11-21  334  			__arch_local_irq_ssm(regs=
->psw.mask & ~PSW_MASK_PER);
56e62a73702836 Sven Schnelle  2020-11-21  335  			do_per_trap(regs);
56e62a73702836 Sven Schnelle  2020-11-21  336  			goto out;
56e62a73702836 Sven Schnelle  2020-11-21  337  		}
56e62a73702836 Sven Schnelle  2020-11-21  338  	}
56e62a73702836 Sven Schnelle  2020-11-21  339  =

56e62a73702836 Sven Schnelle  2020-11-21  340  	if (!irqs_disabled_flags(re=
gs->psw.mask))
56e62a73702836 Sven Schnelle  2020-11-21  341  		trace_hardirqs_on();
56e62a73702836 Sven Schnelle  2020-11-21  342  	__arch_local_irq_ssm(regs->=
psw.mask & ~PSW_MASK_PER);
56e62a73702836 Sven Schnelle  2020-11-21  343  =

56e62a73702836 Sven Schnelle  2020-11-21  344  	trapnr =3D regs->int_code &=
 PGM_INT_CODE_MASK;
56e62a73702836 Sven Schnelle  2020-11-21  345  	if (trapnr)
56e62a73702836 Sven Schnelle  2020-11-21  346  		pgm_check_table[trapnr](re=
gs);
56e62a73702836 Sven Schnelle  2020-11-21  347  	syscall_redirect =3D user_m=
ode(regs) && test_pt_regs_flag(regs, PIF_SYSCALL);
56e62a73702836 Sven Schnelle  2020-11-21  348  out:
56e62a73702836 Sven Schnelle  2020-11-21  349  	local_irq_disable();
56e62a73702836 Sven Schnelle  2020-11-21  350  	irqentry_exit(regs, state);
56e62a73702836 Sven Schnelle  2020-11-21  351  =

56e62a73702836 Sven Schnelle  2020-11-21  352  	if (syscall_redirect) {
56e62a73702836 Sven Schnelle  2020-11-21  353  		enter_from_user_mode(regs);
56e62a73702836 Sven Schnelle  2020-11-21  354  		local_irq_enable();
56e62a73702836 Sven Schnelle  2020-11-21  355  		regs->orig_gpr2 =3D regs->=
gprs[2];
56e62a73702836 Sven Schnelle  2020-11-21  356  		do_syscall(regs);
56e62a73702836 Sven Schnelle  2020-11-21  357  		exit_to_user_mode();
56e62a73702836 Sven Schnelle  2020-11-21  358  	}
56e62a73702836 Sven Schnelle  2020-11-21  359  }
6f8daa2953ecd1 Heiko Carstens 2021-04-07  360  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7968089860448849043==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
UZqxeef1FrBr0eSUjpdramNxrIn2nhdEAXO4xBM8hAZZeNij3jkFAzuFsffryUwcFuZtEGBtMqFh
4JkfsbILIsxzDwdPh0MQhUGuHPdxsu3hnFNzQsNkuz94iU6H+sSef7tXH3Ny+s05C+NUp3WMhEEQ
K9vFvHTo7frdxm9ZGcQhhvS6d9kFkA+u0J5YmEaLKaSJFp5fi45c7xrdEdYCyzvzN/IBfTnLUGMc
g0c9Vlsg2z+j0gCIh0Yl0RXz0YVLGAt6uJdPjWeLla7pszg+463T8wiHqNvvhUcxVLEwxc4CSd3x
WEYp2ikOvLTpsaR3ZeKrq4bSaENxLtoW+2g0ocagaYSMC84by8p8cHLIKcvZfHtZPH19eQJF7ffH
l78+308Kir0alUdCLnZUXI0Mf5sjaekvmYfjQ3dHfwliZfUdcgJCzx7kXTyy83TStV7Kedp3B2Vf
5L+4By8eNhHWfbVLFQgaBLXGU1iK5siC8eXCWCBLdZs+o92xVZ9at8p7O/hxnULYKKS+IDrh5q6s
ep005HcEhEx10nFyR2lFjqhPPZnwmN93/TP9ctTx9WSF0DWlfhEtkh46HnPNTPhUDbuOVgLeuxJe
mOqW3Vpls69c1UJVIIe2hcMoQ3wv4vDiMfFko2j2JzKgUflTzu/YVK16pmk9U+ZQ7ErciYJo8KH6
JYmMAuIO2QDh16F3tRaZXaFepWKnVwV2J0di3Xl/Z7LX1FQRzHz4y1l9XO2qXWflO5eJG3x4qAW/
xsZyWuTGGJ5B0rGjDY3BqY2eETGYnV3f4ZK4GFIiFrfdr3Vpr2Q3muvTulx8ObOhag/sRh2RgMPU
QxrgyJP5oiYzhaGZYhT/9fGBHzvxMli6NOfPI1aJK2qVVgxqhNqZdN3vjVKJCNrY6BDYkY9R84td
1dzWuJ8DDhc33K7UkWJxU8Ovi17aojtqEYg4jeQFzI6LToTloKxvq4t2dCBSEIevrjwvMNUo1fOE
7jh07VBTxcxvoSHtVBEKVGetuQUVGqFcgB+g0Hr+h4rs6qE0K3LYoxE2BdR0Q92pbrk49QR6fVPW
euKQmzDqNaiXSv/2Lm9Y15sVPdXVHe3aGp8loiSXIecmL06GmgcxcqPMNd7e57shN8vD7ur2Bj33
klVteQQvprkmBnpTmO6LObEqTULbnTozRx7uiM8pR5ZCjybQE5XZewQadECPIiR62YO+cGN+NVRy
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
--===============7968089860448849043==--

