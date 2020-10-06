Content-Type: multipart/mixed; boundary="===============4988526095355411167=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH bpf-next V1 5/6] bpf: Add MTU check for TC-BPF packets after egress hook
Date: Wed, 07 Oct 2020 04:09:29 +0800
Message-ID: <202010070454.BOMR9UZ5-lkp@intel.com>
In-Reply-To: <160200019184.719143.17780588544420986957.stgit@firesoul>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4988526095355411167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jesper,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Jesper-Dangaard-Brouer/bpf=
-New-approach-for-BPF-MTU-handling-and-enforcement/20201007-000903
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
config: s390-randconfig-r026-20201006 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 112766=
2c6dc2a276839c75a42238b11a3ad00f32)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/2065cee7d6b74c8f1dabae4e4=
e15999a841e3349
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jesper-Dangaard-Brouer/bpf-New-app=
roach-for-BPF-MTU-handling-and-enforcement/20201007-000903
        git checkout 2065cee7d6b74c8f1dabae4e4e15999a841e3349
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
                     ^
   In file included from net/core/dev.c:89:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
                     ^
   In file included from net/core/dev.c:89:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
                     ^
   In file included from net/core/dev.c:89:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
           __fswab32(x))
                     ^
   In file included from net/core/dev.c:89:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:72:
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
   net/core/dev.c:4068:7: warning: unused variable 'mtu_check' [-Wunused-va=
riable]
           bool mtu_check =3D false;
                ^
>> net/core/dev.c:4176:1: warning: unused label 'drop' [-Wunused-label]
   drop:
   ^~~~~
   net/core/dev.c:4949:1: warning: unused function 'sch_handle_ingress' [-W=
unused-function]
   sch_handle_ingress(struct sk_buff *skb, struct packet_type **pt_prev, in=
t *ret,
   ^
   net/core/dev.c:5094:19: warning: unused function 'nf_ingress' [-Wunused-=
function]
   static inline int nf_ingress(struct sk_buff *skb, struct packet_type **p=
t_prev,
                     ^
   In file included from net/core/dev.c:71:
   In file included from include/linux/uaccess.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:10:
   In file included from include/linux/list.h:9:
   In file included from include/linux/kernel.h:12:
   In file included from include/linux/bitops.h:29:
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
                           "oi     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
                           "ni     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
                           "oi     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
                           "ni     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
                           "oi     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
                           "ni     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
                           "oi     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
                           "ni     %0,%b1\n"
                           ^
   24 warnings and 14 errors generated.
--
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
                     ^
   In file included from net/core/dev.c:89:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
                     ^
   In file included from net/core/dev.c:89:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
                     ^
   In file included from net/core/dev.c:89:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
           __fswab32(x))
                     ^
   In file included from net/core/dev.c:89:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:72:
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
>> net/core/dev.c:4176:1: warning: unused label 'drop' [-Wunused-label]
   drop:
   ^~~~~
   net/core/dev.c:4068:7: warning: unused variable 'mtu_check' [-Wunused-va=
riable]
           bool mtu_check =3D false;
                ^
   net/core/dev.c:4949:1: warning: unused function 'sch_handle_ingress' [-W=
unused-function]
   sch_handle_ingress(struct sk_buff *skb, struct packet_type **pt_prev, in=
t *ret,
   ^
   net/core/dev.c:5094:19: warning: unused function 'nf_ingress' [-Wunused-=
function]
   static inline int nf_ingress(struct sk_buff *skb, struct packet_type **p=
t_prev,
                     ^
   In file included from net/core/dev.c:71:
   In file included from include/linux/uaccess.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:10:
   In file included from include/linux/list.h:9:
   In file included from include/linux/kernel.h:12:
   In file included from include/linux/bitops.h:29:
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
                           "oi     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
                           "ni     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
                           "oi     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
                           "ni     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
                           "oi     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
                           "ni     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
                           "oi     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
                           "ni     %0,%b1\n"
                           ^
   24 warnings and 14 errors generated.

vim +/drop +4176 net/core/dev.c

  4037	=

  4038	/**
  4039	 *	__dev_queue_xmit - transmit a buffer
  4040	 *	@skb: buffer to transmit
  4041	 *	@sb_dev: suboordinate device used for L2 forwarding offload
  4042	 *
  4043	 *	Queue a buffer for transmission to a network device. The caller m=
ust
  4044	 *	have set the device and priority and built the buffer before call=
ing
  4045	 *	this function. The function can be called from an interrupt.
  4046	 *
  4047	 *	A negative errno code is returned on a failure. A success does not
  4048	 *	guarantee the frame will be transmitted as it may be dropped due
  4049	 *	to congestion or traffic shaping.
  4050	 *
  4051	 * -----------------------------------------------------------------=
------------------
  4052	 *      I notice this method can also return errors from the queue d=
isciplines,
  4053	 *      including NET_XMIT_DROP, which is a positive value.  So, err=
ors can also
  4054	 *      be positive.
  4055	 *
  4056	 *      Regardless of the return value, the skb is consumed, so it i=
s currently
  4057	 *      difficult to retry a send to this method.  (You can bump the=
 ref count
  4058	 *      before sending to hold a reference for retry if you are care=
ful.)
  4059	 *
  4060	 *      When calling this method, interrupts MUST be enabled.  This =
is because
  4061	 *      the BH enable code must have IRQs enabled so that it will no=
t deadlock.
  4062	 *          --BLG
  4063	 */
  4064	static int __dev_queue_xmit(struct sk_buff *skb, struct net_device *=
sb_dev)
  4065	{
  4066		struct net_device *dev =3D skb->dev;
  4067		struct netdev_queue *txq;
  4068		bool mtu_check =3D false;
  4069		bool again =3D false;
  4070		struct Qdisc *q;
  4071		int rc =3D -ENOMEM;
  4072	=

  4073		skb_reset_mac_header(skb);
  4074	=

  4075		if (unlikely(skb_shinfo(skb)->tx_flags & SKBTX_SCHED_TSTAMP))
  4076			__skb_tstamp_tx(skb, NULL, skb->sk, SCM_TSTAMP_SCHED);
  4077	=

  4078		/* Disable soft irqs for various locks below. Also
  4079		 * stops preemption for RCU.
  4080		 */
  4081		rcu_read_lock_bh();
  4082	=

  4083		skb_update_prio(skb);
  4084	=

  4085		qdisc_pkt_len_init(skb);
  4086	#ifdef CONFIG_NET_CLS_ACT
  4087		mtu_check =3D skb_is_redirected(skb);
  4088		skb->tc_at_ingress =3D 0;
  4089	# ifdef CONFIG_NET_EGRESS
  4090		if (static_branch_unlikely(&egress_needed_key)) {
  4091			unsigned int len_orig =3D skb->len;
  4092	=

  4093			skb =3D sch_handle_egress(skb, &rc, dev);
  4094			if (!skb)
  4095				goto out;
  4096			/* BPF-prog ran and could have changed packet size beyond MTU */
  4097			if (rc =3D=3D NET_XMIT_SUCCESS && skb->len > len_orig)
  4098				mtu_check =3D true;
  4099		}
  4100	# endif
  4101		/* MTU-check only happens on "last" net_device in a redirect sequen=
ce
  4102		 * (e.g. above sch_handle_egress can steal SKB and skb_do_redirect =
it
  4103		 * either ingress or egress to another device).
  4104		 */
  4105		if (mtu_check && !is_skb_forwardable(dev, skb)) {
  4106			rc =3D -EMSGSIZE;
  4107			goto drop;
  4108		}
  4109	#endif
  4110		/* If device/qdisc don't need skb->dst, release it right now while
  4111		 * its hot in this cpu cache.
  4112		 */
  4113		if (dev->priv_flags & IFF_XMIT_DST_RELEASE)
  4114			skb_dst_drop(skb);
  4115		else
  4116			skb_dst_force(skb);
  4117	=

  4118		txq =3D netdev_core_pick_tx(dev, skb, sb_dev);
  4119		q =3D rcu_dereference_bh(txq->qdisc);
  4120	=

  4121		trace_net_dev_queue(skb);
  4122		if (q->enqueue) {
  4123			rc =3D __dev_xmit_skb(skb, q, dev, txq);
  4124			goto out;
  4125		}
  4126	=

  4127		/* The device has no queue. Common case for software devices:
  4128		 * loopback, all the sorts of tunnels...
  4129	=

  4130		 * Really, it is unlikely that netif_tx_lock protection is necessary
  4131		 * here.  (f.e. loopback and IP tunnels are clean ignoring statisti=
cs
  4132		 * counters.)
  4133		 * However, it is possible, that they rely on protection
  4134		 * made by us here.
  4135	=

  4136		 * Check this and shot the lock. It is not prone from deadlocks.
  4137		 *Either shot noqueue qdisc, it is even simpler 8)
  4138		 */
  4139		if (dev->flags & IFF_UP) {
  4140			int cpu =3D smp_processor_id(); /* ok because BHs are off */
  4141	=

  4142			if (txq->xmit_lock_owner !=3D cpu) {
  4143				if (dev_xmit_recursion())
  4144					goto recursion_alert;
  4145	=

  4146				skb =3D validate_xmit_skb(skb, dev, &again);
  4147				if (!skb)
  4148					goto out;
  4149	=

  4150				HARD_TX_LOCK(dev, txq, cpu);
  4151	=

  4152				if (!netif_xmit_stopped(txq)) {
  4153					dev_xmit_recursion_inc();
  4154					skb =3D dev_hard_start_xmit(skb, dev, txq, &rc);
  4155					dev_xmit_recursion_dec();
  4156					if (dev_xmit_complete(rc)) {
  4157						HARD_TX_UNLOCK(dev, txq);
  4158						goto out;
  4159					}
  4160				}
  4161				HARD_TX_UNLOCK(dev, txq);
  4162				net_crit_ratelimited("Virtual device %s asks to queue packet!\n",
  4163						     dev->name);
  4164			} else {
  4165				/* Recursion is detected! It is possible,
  4166				 * unfortunately
  4167				 */
  4168	recursion_alert:
  4169				net_crit_ratelimited("Dead loop on virtual device %s, fix it urge=
ntly!\n",
  4170						     dev->name);
  4171			}
  4172		}
  4173	=

  4174		rc =3D -ENETDOWN;
  4175		rcu_read_unlock_bh();
> 4176	drop:
  4177		atomic_long_inc(&dev->tx_dropped);
  4178		kfree_skb_list(skb);
  4179		return rc;
  4180	out:
  4181		rcu_read_unlock_bh();
  4182		return rc;
  4183	}
  4184	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4988526095355411167==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4988526095355411167==--

