Content-Type: multipart/mixed; boundary="===============4136830476550721018=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH RFC bpf-next 3/7] net: sched: add bpf_link API for bpf classifier
Date: Sat, 29 May 2021 07:18:03 +0800
Message-ID: <202105290717.a5SFwGc6-lkp@intel.com>
In-Reply-To: <20210528195946.2375109-4-memxor@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4136830476550721018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kumar,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Kumar-Kartikeya-Dwivedi/Ad=
d-bpf_link-based-TC-BPF-API/20210529-040147
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
config: s390-randconfig-r025-20210528 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 6505c6=
30407c5feec818f0bb1c284f9eeebf2071)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/7f3d2ad7de9869028e50b1749=
a8144ccb75a76b8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kumar-Kartikeya-Dwivedi/Add-bpf_li=
nk-based-TC-BPF-API/20210529-040147
        git checkout 7f3d2ad7de9869028e50b1749a8144ccb75a76b8
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from net/sched/cls_bpf.c:14:
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
   In file included from net/sched/cls_bpf.c:14:
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
   In file included from net/sched/cls_bpf.c:14:
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
>> net/sched/cls_bpf.c:921:13: error: no member named 'net' in 'struct tcf_=
exts'
           prog->exts.net =3D net;
           ~~~~~~~~~~ ^
   12 warnings and 1 error generated.


vim +921 net/sched/cls_bpf.c

   873	=

   874	static int cls_bpf_link_change(struct net *net, struct tcf_proto *tp,
   875				       struct bpf_prog *filter, void **arg,
   876				       u32 handle, u32 gen_flags)
   877	{
   878		struct cls_bpf_head *head =3D rtnl_dereference(tp->root);
   879		struct cls_bpf_prog *oldprog =3D *arg, *prog;
   880		struct bpf_link_primer primer;
   881		struct cls_bpf_link *link;
   882		int ret;
   883	=

   884		if (gen_flags & ~CLS_BPF_SUPPORTED_GEN_FLAGS)
   885			return -EINVAL;
   886	=

   887		if (oldprog)
   888			return -EEXIST;
   889	=

   890		prog =3D kzalloc(sizeof(*prog), GFP_KERNEL);
   891		if (!prog)
   892			return -ENOMEM;
   893	=

   894		link =3D kzalloc(sizeof(*link), GFP_KERNEL);
   895		if (!link) {
   896			ret =3D -ENOMEM;
   897			goto err_prog;
   898		}
   899	=

   900		bpf_link_init(&link->link, BPF_LINK_TYPE_TC, &cls_bpf_link_ops,
   901			      filter);
   902	=

   903		ret =3D bpf_link_prime(&link->link, &primer);
   904		if (ret < 0)
   905			goto err_link;
   906	=

   907		/* We don't init exts to save on memory, but we still need to store=
 the
   908		 * net_ns pointer, as during delete whether the deletion work will =
be
   909		 * queued or executed inline depends on the refcount of net_ns. In
   910		 * __cls_bpf_delete the reference is taken to keep the action IDR a=
live
   911		 * (which we don't require), but its maybe_get_net also allows us to
   912		 * detect whether we are being invoked in netns destruction path or=
 not.
   913		 * In the former case deletion will have to be done synchronously.
   914		 *
   915		 * Leaving it NULL would prevent us from doing deletion work
   916		 * asynchronously, so set it here.
   917		 *
   918		 * On the tcf_classify side, exts->actions are not touched for
   919		 * exts_integrated progs, so we should be good.
   920		 */
 > 921		prog->exts.net =3D net;
   922	=

   923		ret =3D __cls_bpf_alloc_idr(head, handle, prog, oldprog);
   924		if (ret < 0)
   925			goto err_primer;
   926	=

   927		prog->exts_integrated =3D true;
   928		prog->bpf_link =3D link;
   929		prog->filter =3D filter;
   930		prog->tp =3D tp;
   931		link->prog =3D prog;
   932	=

   933		prog->bpf_name =3D cls_bpf_link_name(filter->aux->id, filter->aux->=
name);
   934		if (!prog->bpf_name) {
   935			ret =3D -ENOMEM;
   936			goto err_idr;
   937		}
   938	=

   939		ret =3D __cls_bpf_change(head, tp, prog, oldprog, NULL);
   940		if (ret < 0)
   941			goto err_name;
   942	=

   943		bpf_prog_inc(filter);
   944	=

   945		if (filter->dst_needed)
   946			tcf_block_netif_keep_dst(tp->chain->block);
   947	=

   948		return bpf_link_settle(&primer);
   949	=

   950	err_name:
   951		kfree(prog->bpf_name);
   952	err_idr:
   953		idr_remove(&head->handle_idr, prog->handle);
   954	err_primer:
   955		bpf_link_cleanup(&primer);
   956	err_link:
   957		kfree(link);
   958	err_prog:
   959		kfree(prog);
   960		return ret;
   961	}
   962	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4136830476550721018==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4136830476550721018==--

