Content-Type: multipart/mixed; boundary="===============2189415952295239234=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 3/3] kvm/eventfd: Drain events from eventfd in irqfd_wakeup()
Date: Wed, 28 Oct 2020 05:42:19 +0800
Message-ID: <202010280552.K3ls9tQi-lkp@intel.com>
In-Reply-To: <20201027135523.646811-4-dwmw2@infradead.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2189415952295239234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi David,

I love your patch! Yet something to improve:

[auto build test ERROR on vfio/next]
[also build test ERROR on vhost/linux-next linus/master kvm/linux-next v5.1=
0-rc1 next-20201027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/David-Woodhouse/Allow-in-k=
ernel-consumers-to-drain-events-from-eventfd/20201027-215658
base:   https://github.com/awilliam/linux-vfio.git next
config: s390-randconfig-r023-20201027 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project f2c25c=
70791de95d2466e09b5b58fc37f6ccd7a4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/dc45dd9af28fede8f8dd29b70=
5b90f78cf87538c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review David-Woodhouse/Allow-in-kernel-co=
nsumers-to-drain-events-from-eventfd/20201027-215658
        git checkout dc45dd9af28fede8f8dd29b705b90f78cf87538c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
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
   In file included from arch/s390/kvm/../../../virt/kvm/eventfd.c:12:
   In file included from include/linux/kvm_host.h:32:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:36:
   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
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
   In file included from arch/s390/kvm/../../../virt/kvm/eventfd.c:12:
   In file included from include/linux/kvm_host.h:32:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:36:
   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
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
   In file included from arch/s390/kvm/../../../virt/kvm/eventfd.c:12:
   In file included from include/linux/kvm_host.h:32:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:36:
   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
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
>> arch/s390/kvm/../../../virt/kvm/eventfd.c:197:23: error: incompatible po=
inter types passing 'struct eventfd_ctx **' to parameter of type 'struct ev=
entfd_ctx *'; remove & [-Werror,-Wincompatible-pointer-types]
                   eventfd_ctx_do_read(&irqfd->eventfd, &cnt);
                                       ^~~~~~~~~~~~~~~
   include/linux/eventfd.h:44:46: note: passing argument to parameter 'ctx'=
 here
   void eventfd_ctx_do_read(struct eventfd_ctx *ctx, __u64 *cnt);
                                                ^
   20 warnings and 1 error generated.

vim +197 arch/s390/kvm/../../../virt/kvm/eventfd.c

   180	=

   181	/*
   182	 * Called with wqh->lock held and interrupts disabled
   183	 */
   184	static int
   185	irqfd_wakeup(wait_queue_entry_t *wait, unsigned mode, int sync, void=
 *key)
   186	{
   187		struct kvm_kernel_irqfd *irqfd =3D
   188			container_of(wait, struct kvm_kernel_irqfd, wait);
   189		__poll_t flags =3D key_to_poll(key);
   190		struct kvm_kernel_irq_routing_entry irq;
   191		struct kvm *kvm =3D irqfd->kvm;
   192		unsigned seq;
   193		int idx;
   194	=

   195		if (flags & EPOLLIN) {
   196			u64 cnt;
 > 197			eventfd_ctx_do_read(&irqfd->eventfd, &cnt);
   198	=

   199			idx =3D srcu_read_lock(&kvm->irq_srcu);
   200			do {
   201				seq =3D read_seqcount_begin(&irqfd->irq_entry_sc);
   202				irq =3D irqfd->irq_entry;
   203			} while (read_seqcount_retry(&irqfd->irq_entry_sc, seq));
   204			/* An event has been signaled, inject an interrupt */
   205			if (kvm_arch_set_irq_inatomic(&irq, kvm,
   206						      KVM_USERSPACE_IRQ_SOURCE_ID, 1,
   207						      false) =3D=3D -EWOULDBLOCK)
   208				schedule_work(&irqfd->inject);
   209			srcu_read_unlock(&kvm->irq_srcu, idx);
   210		}
   211	=

   212		if (flags & EPOLLHUP) {
   213			/* The eventfd is closing, detach from KVM */
   214			unsigned long iflags;
   215	=

   216			spin_lock_irqsave(&kvm->irqfds.lock, iflags);
   217	=

   218			/*
   219			 * We must check if someone deactivated the irqfd before
   220			 * we could acquire the irqfds.lock since the item is
   221			 * deactivated from the KVM side before it is unhooked from
   222			 * the wait-queue.  If it is already deactivated, we can
   223			 * simply return knowing the other side will cleanup for us.
   224			 * We cannot race against the irqfd going away since the
   225			 * other side is required to acquire wqh->lock, which we hold
   226			 */
   227			if (irqfd_is_active(irqfd))
   228				irqfd_deactivate(irqfd);
   229	=

   230			spin_unlock_irqrestore(&kvm->irqfds.lock, iflags);
   231		}
   232	=

   233		return 0;
   234	}
   235	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2189415952295239234==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AL+oRd41rgEA
--===============2189415952295239234==--

