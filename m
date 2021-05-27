Content-Type: multipart/mixed; boundary="===============6417057004987920002=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [robh:for-kernelci 3/7] drivers/of/of_reserved_mem.c:51:13: warning: no previous prototype for function 'fdt_reserved_mem_save_node'
Date: Fri, 28 May 2021 02:23:03 +0800
Message-ID: <202105280200.9bIPo9wq-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6417057004987920002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
kernelci
head:   3fea28f97b265227ad52b5949512f005981b801c
commit: 212db1c162ef8b68c0bdb9e7bb861abd762c6d48 [3/7] of: Move reserved me=
mory private function declarations
config: s390-randconfig-r033-20210527 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 6505c6=
30407c5feec818f0bb1c284f9eeebf2071)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/co=
mmit/?id=3D212db1c162ef8b68c0bdb9e7bb861abd762c6d48
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git=
/robh/linux.git
        git fetch --no-tags robh for-kernelci
        git checkout 212db1c162ef8b68c0bdb9e7bb861abd762c6d48
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/of/of_reserved_mem.c:23:
   In file included from include/linux/memblock.h:14:
   In file included from arch/s390/include/asm/dma.h:5:
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
   In file included from drivers/of/of_reserved_mem.c:23:
   In file included from include/linux/memblock.h:14:
   In file included from arch/s390/include/asm/dma.h:5:
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
   In file included from drivers/of/of_reserved_mem.c:23:
   In file included from include/linux/memblock.h:14:
   In file included from arch/s390/include/asm/dma.h:5:
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
>> drivers/of/of_reserved_mem.c:51:13: warning: no previous prototype for f=
unction 'fdt_reserved_mem_save_node' [-Wmissing-prototypes]
   void __init fdt_reserved_mem_save_node(unsigned long node, const char *u=
name,
               ^
   drivers/of/of_reserved_mem.c:51:1: note: declare 'static' if the functio=
n is not intended to be used outside of this translation unit
   void __init fdt_reserved_mem_save_node(unsigned long node, const char *u=
name,
   ^
   static =

>> drivers/of/of_reserved_mem.c:246:13: warning: no previous prototype for =
function 'fdt_init_reserved_mem' [-Wmissing-prototypes]
   void __init fdt_init_reserved_mem(void)
               ^
   drivers/of/of_reserved_mem.c:246:1: note: declare 'static' if the functi=
on is not intended to be used outside of this translation unit
   void __init fdt_init_reserved_mem(void)
   ^
   static =

   14 warnings generated.


vim +/fdt_reserved_mem_save_node +51 drivers/of/of_reserved_mem.c

3f0c8206644836 Marek Szyprowski   2014-02-28   47  =

ad1ce1ab061e7d Lee Jones          2021-03-18   48  /*
c8813f7ec01c67 chenqiwu           2020-05-11   49   * fdt_reserved_mem_save=
_node() - save fdt node for second pass initialization
3f0c8206644836 Marek Szyprowski   2014-02-28   50   */
3f0c8206644836 Marek Szyprowski   2014-02-28  @51  void __init fdt_reserved=
_mem_save_node(unsigned long node, const char *uname,
3f0c8206644836 Marek Szyprowski   2014-02-28   52  				      phys_addr_t ba=
se, phys_addr_t size)
3f0c8206644836 Marek Szyprowski   2014-02-28   53  {
3f0c8206644836 Marek Szyprowski   2014-02-28   54  	struct reserved_mem *rm=
em =3D &reserved_mem[reserved_mem_count];
3f0c8206644836 Marek Szyprowski   2014-02-28   55  =

3f0c8206644836 Marek Szyprowski   2014-02-28   56  	if (reserved_mem_count =
=3D=3D ARRAY_SIZE(reserved_mem)) {
418370ff2231b7 Danny Lin          2020-06-03   57  		pr_err("not enough spa=
ce for all defined regions.\n");
3f0c8206644836 Marek Szyprowski   2014-02-28   58  		return;
3f0c8206644836 Marek Szyprowski   2014-02-28   59  	}
3f0c8206644836 Marek Szyprowski   2014-02-28   60  =

3f0c8206644836 Marek Szyprowski   2014-02-28   61  	rmem->fdt_node =3D node;
3f0c8206644836 Marek Szyprowski   2014-02-28   62  	rmem->name =3D uname;
3f0c8206644836 Marek Szyprowski   2014-02-28   63  	rmem->base =3D base;
3f0c8206644836 Marek Szyprowski   2014-02-28   64  	rmem->size =3D size;
3f0c8206644836 Marek Szyprowski   2014-02-28   65  =

3f0c8206644836 Marek Szyprowski   2014-02-28   66  	reserved_mem_count++;
3f0c8206644836 Marek Szyprowski   2014-02-28   67  	return;
3f0c8206644836 Marek Szyprowski   2014-02-28   68  }
3f0c8206644836 Marek Szyprowski   2014-02-28   69  =

ad1ce1ab061e7d Lee Jones          2021-03-18   70  /*
c8813f7ec01c67 chenqiwu           2020-05-11   71   * __reserved_mem_alloc_=
size() - allocate reserved memory described by
6f1188b4ac7577 Yue Hu             2020-07-30   72   *	'size', 'alignment'  =
and 'alloc-ranges' properties.
3f0c8206644836 Marek Szyprowski   2014-02-28   73   */
3f0c8206644836 Marek Szyprowski   2014-02-28   74  static int __init __rese=
rved_mem_alloc_size(unsigned long node,
3f0c8206644836 Marek Szyprowski   2014-02-28   75  	const char *uname, phys=
_addr_t *res_base, phys_addr_t *res_size)
3f0c8206644836 Marek Szyprowski   2014-02-28   76  {
3f0c8206644836 Marek Szyprowski   2014-02-28   77  	int t_len =3D (dt_root_=
addr_cells + dt_root_size_cells) * sizeof(__be32);
3f0c8206644836 Marek Szyprowski   2014-02-28   78  	phys_addr_t start =3D 0=
, end =3D 0;
3f0c8206644836 Marek Szyprowski   2014-02-28   79  	phys_addr_t base =3D 0,=
 align =3D 0, size;
9d0c4dfedd96ee Rob Herring        2014-04-01   80  	int len;
9d0c4dfedd96ee Rob Herring        2014-04-01   81  	const __be32 *prop;
6f1188b4ac7577 Yue Hu             2020-07-30   82  	bool nomap;
3f0c8206644836 Marek Szyprowski   2014-02-28   83  	int ret;
3f0c8206644836 Marek Szyprowski   2014-02-28   84  =

3f0c8206644836 Marek Szyprowski   2014-02-28   85  	prop =3D of_get_flat_dt=
_prop(node, "size", &len);
3f0c8206644836 Marek Szyprowski   2014-02-28   86  	if (!prop)
3f0c8206644836 Marek Szyprowski   2014-02-28   87  		return -EINVAL;
3f0c8206644836 Marek Szyprowski   2014-02-28   88  =

3f0c8206644836 Marek Szyprowski   2014-02-28   89  	if (len !=3D dt_root_si=
ze_cells * sizeof(__be32)) {
606ad42aa3b1fe Rob Herring        2016-06-15   90  		pr_err("invalid size p=
roperty in '%s' node.\n", uname);
3f0c8206644836 Marek Szyprowski   2014-02-28   91  		return -EINVAL;
3f0c8206644836 Marek Szyprowski   2014-02-28   92  	}
3f0c8206644836 Marek Szyprowski   2014-02-28   93  	size =3D dt_mem_next_ce=
ll(dt_root_size_cells, &prop);
3f0c8206644836 Marek Szyprowski   2014-02-28   94  =

3f0c8206644836 Marek Szyprowski   2014-02-28   95  	prop =3D of_get_flat_dt=
_prop(node, "alignment", &len);
3f0c8206644836 Marek Szyprowski   2014-02-28   96  	if (prop) {
3f0c8206644836 Marek Szyprowski   2014-02-28   97  		if (len !=3D dt_root_a=
ddr_cells * sizeof(__be32)) {
606ad42aa3b1fe Rob Herring        2016-06-15   98  			pr_err("invalid align=
ment property in '%s' node.\n",
3f0c8206644836 Marek Szyprowski   2014-02-28   99  				uname);
3f0c8206644836 Marek Szyprowski   2014-02-28  100  			return -EINVAL;
3f0c8206644836 Marek Szyprowski   2014-02-28  101  		}
3f0c8206644836 Marek Szyprowski   2014-02-28  102  		align =3D dt_mem_next_=
cell(dt_root_addr_cells, &prop);
3f0c8206644836 Marek Szyprowski   2014-02-28  103  	}
3f0c8206644836 Marek Szyprowski   2014-02-28  104  =

6f1188b4ac7577 Yue Hu             2020-07-30  105  	nomap =3D of_get_flat_d=
t_prop(node, "no-map", NULL) !=3D NULL;
6f1188b4ac7577 Yue Hu             2020-07-30  106  =

1cc8e3458b5110 Jason Liu          2015-11-10  107  	/* Need adjust the alig=
nment to satisfy the CMA requirement */
7d482813bb3518 Jaewon             2016-05-25  108  	if (IS_ENABLED(CONFIG_C=
MA)
7d482813bb3518 Jaewon             2016-05-25  109  	    && of_flat_dt_is_co=
mpatible(node, "shared-dma-pool")
7d482813bb3518 Jaewon             2016-05-25  110  	    && of_get_flat_dt_p=
rop(node, "reusable", NULL)
6f1188b4ac7577 Yue Hu             2020-07-30  111  	    && !nomap) {
aaaab56dba9af4 Stephen Rothwell   2016-05-31  112  		unsigned long order =
=3D
aaaab56dba9af4 Stephen Rothwell   2016-05-31  113  			max_t(unsigned long, =
MAX_ORDER - 1, pageblock_order);
aaaab56dba9af4 Stephen Rothwell   2016-05-31  114  =

aaaab56dba9af4 Stephen Rothwell   2016-05-31  115  		align =3D max(align, (=
phys_addr_t)PAGE_SIZE << order);
aaaab56dba9af4 Stephen Rothwell   2016-05-31  116  	}
1cc8e3458b5110 Jason Liu          2015-11-10  117  =

3f0c8206644836 Marek Szyprowski   2014-02-28  118  	prop =3D of_get_flat_dt=
_prop(node, "alloc-ranges", &len);
3f0c8206644836 Marek Szyprowski   2014-02-28  119  	if (prop) {
3f0c8206644836 Marek Szyprowski   2014-02-28  120  =

3f0c8206644836 Marek Szyprowski   2014-02-28  121  		if (len % t_len !=3D 0=
) {
606ad42aa3b1fe Rob Herring        2016-06-15  122  			pr_err("invalid alloc=
-ranges property in '%s', skipping node.\n",
3f0c8206644836 Marek Szyprowski   2014-02-28  123  			       uname);
3f0c8206644836 Marek Szyprowski   2014-02-28  124  			return -EINVAL;
3f0c8206644836 Marek Szyprowski   2014-02-28  125  		}
3f0c8206644836 Marek Szyprowski   2014-02-28  126  =

3f0c8206644836 Marek Szyprowski   2014-02-28  127  		base =3D 0;
3f0c8206644836 Marek Szyprowski   2014-02-28  128  =

3f0c8206644836 Marek Szyprowski   2014-02-28  129  		while (len > 0) {
3f0c8206644836 Marek Szyprowski   2014-02-28  130  			start =3D dt_mem_next=
_cell(dt_root_addr_cells, &prop);
3f0c8206644836 Marek Szyprowski   2014-02-28  131  			end =3D start + dt_me=
m_next_cell(dt_root_size_cells,
3f0c8206644836 Marek Szyprowski   2014-02-28  132  						       &prop);
3f0c8206644836 Marek Szyprowski   2014-02-28  133  =

3f0c8206644836 Marek Szyprowski   2014-02-28  134  			ret =3D early_init_dt=
_alloc_reserved_memory_arch(size,
3f0c8206644836 Marek Szyprowski   2014-02-28  135  					align, start, end, =
nomap, &base);
3f0c8206644836 Marek Szyprowski   2014-02-28  136  			if (ret =3D=3D 0) {
606ad42aa3b1fe Rob Herring        2016-06-15  137  				pr_debug("allocated =
memory for '%s' node: base %pa, size %ld MiB\n",
3f0c8206644836 Marek Szyprowski   2014-02-28  138  					uname, &base,
3f0c8206644836 Marek Szyprowski   2014-02-28  139  					(unsigned long)size=
 / SZ_1M);
3f0c8206644836 Marek Szyprowski   2014-02-28  140  				break;
3f0c8206644836 Marek Szyprowski   2014-02-28  141  			}
3f0c8206644836 Marek Szyprowski   2014-02-28  142  			len -=3D t_len;
3f0c8206644836 Marek Szyprowski   2014-02-28  143  		}
3f0c8206644836 Marek Szyprowski   2014-02-28  144  =

3f0c8206644836 Marek Szyprowski   2014-02-28  145  	} else {
3f0c8206644836 Marek Szyprowski   2014-02-28  146  		ret =3D early_init_dt_=
alloc_reserved_memory_arch(size, align,
3f0c8206644836 Marek Szyprowski   2014-02-28  147  							0, 0, nomap, &bas=
e);
3f0c8206644836 Marek Szyprowski   2014-02-28  148  		if (ret =3D=3D 0)
606ad42aa3b1fe Rob Herring        2016-06-15  149  			pr_debug("allocated m=
emory for '%s' node: base %pa, size %ld MiB\n",
3f0c8206644836 Marek Szyprowski   2014-02-28  150  				uname, &base, (unsig=
ned long)size / SZ_1M);
3f0c8206644836 Marek Szyprowski   2014-02-28  151  	}
3f0c8206644836 Marek Szyprowski   2014-02-28  152  =

3f0c8206644836 Marek Szyprowski   2014-02-28  153  	if (base =3D=3D 0) {
606ad42aa3b1fe Rob Herring        2016-06-15  154  		pr_info("failed to all=
ocate memory for node '%s'\n", uname);
3f0c8206644836 Marek Szyprowski   2014-02-28  155  		return -ENOMEM;
3f0c8206644836 Marek Szyprowski   2014-02-28  156  	}
3f0c8206644836 Marek Szyprowski   2014-02-28  157  =

3f0c8206644836 Marek Szyprowski   2014-02-28  158  	*res_base =3D base;
3f0c8206644836 Marek Szyprowski   2014-02-28  159  	*res_size =3D size;
3f0c8206644836 Marek Szyprowski   2014-02-28  160  =

3f0c8206644836 Marek Szyprowski   2014-02-28  161  	return 0;
3f0c8206644836 Marek Szyprowski   2014-02-28  162  }
3f0c8206644836 Marek Szyprowski   2014-02-28  163  =

f618c4703a1467 Marek Szyprowski   2014-02-28  164  static const struct of_d=
evice_id __rmem_of_table_sentinel
33def8498fdde1 Joe Perches        2020-10-21  165  	__used __section("__res=
ervedmem_of_table_end");
f618c4703a1467 Marek Szyprowski   2014-02-28  166  =

ad1ce1ab061e7d Lee Jones          2021-03-18  167  /*
c8813f7ec01c67 chenqiwu           2020-05-11  168   * __reserved_mem_init_n=
ode() - call region specific reserved memory init code
f618c4703a1467 Marek Szyprowski   2014-02-28  169   */
f618c4703a1467 Marek Szyprowski   2014-02-28  170  static int __init __rese=
rved_mem_init_node(struct reserved_mem *rmem)
f618c4703a1467 Marek Szyprowski   2014-02-28  171  {
f618c4703a1467 Marek Szyprowski   2014-02-28  172  	extern const struct of_=
device_id __reservedmem_of_table[];
f618c4703a1467 Marek Szyprowski   2014-02-28  173  	const struct of_device_=
id *i;
d0b8ed47e83a22 pierre Kuo         2019-02-19  174  	int ret =3D -ENOENT;
f618c4703a1467 Marek Szyprowski   2014-02-28  175  =

f618c4703a1467 Marek Szyprowski   2014-02-28  176  	for (i =3D __reservedme=
m_of_table; i < &__rmem_of_table_sentinel; i++) {
df3ed932394488 Rob Herring        2017-05-11  177  		reservedmem_of_init_fn=
 initfn =3D i->data;
f618c4703a1467 Marek Szyprowski   2014-02-28  178  		const char *compat =3D=
 i->compatible;
f618c4703a1467 Marek Szyprowski   2014-02-28  179  =

f618c4703a1467 Marek Szyprowski   2014-02-28  180  		if (!of_flat_dt_is_com=
patible(rmem->fdt_node, compat))
f618c4703a1467 Marek Szyprowski   2014-02-28  181  			continue;
f618c4703a1467 Marek Szyprowski   2014-02-28  182  =

d0b8ed47e83a22 pierre Kuo         2019-02-19  183  		ret =3D initfn(rmem);
d0b8ed47e83a22 pierre Kuo         2019-02-19  184  		if (ret =3D=3D 0) {
606ad42aa3b1fe Rob Herring        2016-06-15  185  			pr_info("initialized =
node %s, compatible id %s\n",
f618c4703a1467 Marek Szyprowski   2014-02-28  186  				rmem->name, compat);
d0b8ed47e83a22 pierre Kuo         2019-02-19  187  			break;
f618c4703a1467 Marek Szyprowski   2014-02-28  188  		}
f618c4703a1467 Marek Szyprowski   2014-02-28  189  	}
d0b8ed47e83a22 pierre Kuo         2019-02-19  190  	return ret;
f618c4703a1467 Marek Szyprowski   2014-02-28  191  }
f618c4703a1467 Marek Szyprowski   2014-02-28  192  =

ae1add247bf8c2 Mitchel Humpherys  2015-09-15  193  static int __init __rmem=
_cmp(const void *a, const void *b)
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  194  {
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  195  	const struct reserved_m=
em *ra =3D a, *rb =3D b;
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  196  =

9eb8cd2b0780bc Michael Ellerman   2015-11-18  197  	if (ra->base < rb->base)
9eb8cd2b0780bc Michael Ellerman   2015-11-18  198  		return -1;
9eb8cd2b0780bc Michael Ellerman   2015-11-18  199  =

9eb8cd2b0780bc Michael Ellerman   2015-11-18  200  	if (ra->base > rb->base)
9eb8cd2b0780bc Michael Ellerman   2015-11-18  201  		return 1;
9eb8cd2b0780bc Michael Ellerman   2015-11-18  202  =

ca05f33316559a Vincent Whitchurch 2020-10-21  203  	/*
ca05f33316559a Vincent Whitchurch 2020-10-21  204  	 * Put the dynamic allo=
cations (address =3D=3D 0, size =3D=3D 0) before static
ca05f33316559a Vincent Whitchurch 2020-10-21  205  	 * allocations at addre=
ss 0x0 so that overlap detection works
ca05f33316559a Vincent Whitchurch 2020-10-21  206  	 * correctly.
ca05f33316559a Vincent Whitchurch 2020-10-21  207  	 */
ca05f33316559a Vincent Whitchurch 2020-10-21  208  	if (ra->size < rb->size)
ca05f33316559a Vincent Whitchurch 2020-10-21  209  		return -1;
ca05f33316559a Vincent Whitchurch 2020-10-21  210  	if (ra->size > rb->size)
ca05f33316559a Vincent Whitchurch 2020-10-21  211  		return 1;
ca05f33316559a Vincent Whitchurch 2020-10-21  212  =

9eb8cd2b0780bc Michael Ellerman   2015-11-18  213  	return 0;
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  214  }
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  215  =

ae1add247bf8c2 Mitchel Humpherys  2015-09-15  216  static void __init __rme=
m_check_for_overlap(void)
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  217  {
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  218  	int i;
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  219  =

ae1add247bf8c2 Mitchel Humpherys  2015-09-15  220  	if (reserved_mem_count =
< 2)
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  221  		return;
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  222  =

ae1add247bf8c2 Mitchel Humpherys  2015-09-15  223  	sort(reserved_mem, rese=
rved_mem_count, sizeof(reserved_mem[0]),
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  224  	     __rmem_cmp, NULL);
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  225  	for (i =3D 0; i < reser=
ved_mem_count - 1; i++) {
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  226  		struct reserved_mem *t=
his, *next;
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  227  =

ae1add247bf8c2 Mitchel Humpherys  2015-09-15  228  		this =3D &reserved_mem=
[i];
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  229  		next =3D &reserved_mem=
[i + 1];
ca05f33316559a Vincent Whitchurch 2020-10-21  230  =

ae1add247bf8c2 Mitchel Humpherys  2015-09-15  231  		if (this->base + this-=
>size > next->base) {
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  232  			phys_addr_t this_end,=
 next_end;
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  233  =

ae1add247bf8c2 Mitchel Humpherys  2015-09-15  234  			this_end =3D this->ba=
se + this->size;
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  235  			next_end =3D next->ba=
se + next->size;
606ad42aa3b1fe Rob Herring        2016-06-15  236  			pr_err("OVERLAP DETEC=
TED!\n%s (%pa--%pa) overlaps with %s (%pa--%pa)\n",
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  237  			       this->name, &t=
his->base, &this_end,
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  238  			       next->name, &n=
ext->base, &next_end);
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  239  		}
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  240  	}
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  241  }
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  242  =

3f0c8206644836 Marek Szyprowski   2014-02-28  243  /**
c8813f7ec01c67 chenqiwu           2020-05-11  244   * fdt_init_reserved_mem=
() - allocate and init all saved reserved memory regions
3f0c8206644836 Marek Szyprowski   2014-02-28  245   */
3f0c8206644836 Marek Szyprowski   2014-02-28 @246  void __init fdt_init_res=
erved_mem(void)
3f0c8206644836 Marek Szyprowski   2014-02-28  247  {
3f0c8206644836 Marek Szyprowski   2014-02-28  248  	int i;
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  249  =

ae1add247bf8c2 Mitchel Humpherys  2015-09-15  250  	/* check for overlappin=
g reserved regions */
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  251  	__rmem_check_for_overla=
p();
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  252  =

3f0c8206644836 Marek Szyprowski   2014-02-28  253  	for (i =3D 0; i < reser=
ved_mem_count; i++) {
3f0c8206644836 Marek Szyprowski   2014-02-28  254  		struct reserved_mem *r=
mem =3D &reserved_mem[i];
3f0c8206644836 Marek Szyprowski   2014-02-28  255  		unsigned long node =3D=
 rmem->fdt_node;
9dcfee01930e6c Marek Szyprowski   2014-07-14  256  		int len;
9dcfee01930e6c Marek Szyprowski   2014-07-14  257  		const __be32 *prop;
3f0c8206644836 Marek Szyprowski   2014-02-28  258  		int err =3D 0;
6f1188b4ac7577 Yue Hu             2020-07-30  259  		bool nomap;
3f0c8206644836 Marek Szyprowski   2014-02-28  260  =

d0b8ed47e83a22 pierre Kuo         2019-02-19  261  		nomap =3D of_get_flat_=
dt_prop(node, "no-map", NULL) !=3D NULL;
9dcfee01930e6c Marek Szyprowski   2014-07-14  262  		prop =3D of_get_flat_d=
t_prop(node, "phandle", &len);
9dcfee01930e6c Marek Szyprowski   2014-07-14  263  		if (!prop)
9dcfee01930e6c Marek Szyprowski   2014-07-14  264  			prop =3D of_get_flat_=
dt_prop(node, "linux,phandle", &len);
9dcfee01930e6c Marek Szyprowski   2014-07-14  265  		if (prop)
9dcfee01930e6c Marek Szyprowski   2014-07-14  266  			rmem->phandle =3D of_=
read_number(prop, len/4);
9dcfee01930e6c Marek Szyprowski   2014-07-14  267  =

3f0c8206644836 Marek Szyprowski   2014-02-28  268  		if (rmem->size =3D=3D =
0)
3f0c8206644836 Marek Szyprowski   2014-02-28  269  			err =3D __reserved_me=
m_alloc_size(node, rmem->name,
3f0c8206644836 Marek Szyprowski   2014-02-28  270  						 &rmem->base, &rme=
m->size);
d0b8ed47e83a22 pierre Kuo         2019-02-19  271  		if (err =3D=3D 0) {
d0b8ed47e83a22 pierre Kuo         2019-02-19  272  			err =3D __reserved_me=
m_init_node(rmem);
d0b8ed47e83a22 pierre Kuo         2019-02-19  273  			if (err !=3D 0 && err=
 !=3D -ENOENT) {
d0b8ed47e83a22 pierre Kuo         2019-02-19  274  				pr_info("node %s com=
patible matching fail\n",
d0b8ed47e83a22 pierre Kuo         2019-02-19  275  					rmem->name);
d0b8ed47e83a22 pierre Kuo         2019-02-19  276  				memblock_free(rmem->=
base, rmem->size);
d0b8ed47e83a22 pierre Kuo         2019-02-19  277  				if (nomap)
d0b8ed47e83a22 pierre Kuo         2019-02-19  278  					memblock_add(rmem->=
base, rmem->size);
d0b8ed47e83a22 pierre Kuo         2019-02-19  279  			}
d0b8ed47e83a22 pierre Kuo         2019-02-19  280  		}
3f0c8206644836 Marek Szyprowski   2014-02-28  281  	}
3f0c8206644836 Marek Szyprowski   2014-02-28  282  }
9dcfee01930e6c Marek Szyprowski   2014-07-14  283  =


:::::: The code at line 51 was first introduced by commit
:::::: 3f0c8206644836e4f10a6b9fc47cda6a9a372f9b drivers: of: add initializa=
tion code for dynamic reserved memory

:::::: TO: Marek Szyprowski <m.szyprowski@samsung.com>
:::::: CC: Grant Likely <grant.likely@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6417057004987920002==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICBner2AAAy5jb25maWcAnDzbcuO2ku/nK1TJS/KQjC6+yLvlB4gERYxIgkOAuvgFpZHlifZ4
JJckz0n267cB8AKQID21qYnLQjeARqPvaPnXf/06QO/X0/ft9bDbvr7+M/i2P+7P2+v+efByeN3/
98Cng4TyAfYJ/xOQo8Px/e9Pl8nDcHD752jy5/CP8248WOzPx/3rwDsdXw7f3mH64XT816//8mgS
kLnwPLHEGSM0ERyv+eMvu9ft8dvgx/58AbyBXOXP4eC3b4frf336BD+/H87n0/nT6+uP7+LtfPqf
/e46uLsd3u7uJsOb4f3u9mW/301H05fh16+j3Xh68/Kw3++/voyH96Pffyl3ndfbPg4NUggTXoSS
+eM/1aD8WOGOJkP4r4QhJifMk7xGh6ESdzy5HY7L8ciXqLPAr1FhyI1qAEzaQlgbsVjMKacGfTZA
0JynOXfCSRKRBNcgkn0RK5ot6pFZTiKfkxgLjmYRFoxmxlI8zDCCcyQBhR+AwuRUuMpfB3MlGK+D
y/76/lZfLkkIFzhZCpTBuUhM+ONkDOglbTROCWzDMeODw2VwPF3lChUjqIeikhO//FLPMwEC5Zw6
JqujCIYiLqcWgyFaYrHAWYIjMX8iaX02EzIDyNgNip5i5Iasn7pm0C7AjRuQJ5IvGWYMS2mpTm3Q
bZ63CVfU9yHIM/TB10/9s2k/+MZxGe6TFUAfByiPuBIW467K4ZAynqAYP/7y2/F03P9uyAHbsCVJ
PSc9K8S9UHzJcY6dcC+jjIkYxzTbCMQ58kInXs5wRGaOM6krQxlsgnKwf0ALCGVUKgTo1uDy/vXy
z+W6/14rxBwnOCOeUj0vNAVQjvg0RiSxxxiJXUgiJDiTu29qaLl4zIjE7AS09mEpyhgu5vw62B+f
B6eXxhGaaykrsaxP3QB7oKMLvMQJZyVL+OE7GHUXV8InkcIs6hPPFPiESgjxI/cNKrATEpJ5KEDM
FJEZs3GK07WoKYkB+cRxymF5ZSurRcvxJY3yhKNs49y6wHLISznfozC95ImX5p/49vLvwRXIGWyB
tMt1e70Mtrvd6f14PRy/1Vxakgxmp7lAnlqDmG7KARQJ4mRpnWHGfKCDeqCBEtFJJiP1qvCh0kOf
MOkTfFNEfoJ8Q+OAOsJoBFTRxNxZcSLz8gFriwYHrgmAmaeAjwKvQWJc9DONbE5vDIHbYmqNQlYd
oNZQ7mPXOM+Q1wDIhRkHnZDeLaaJDUkwBqeE594sIoybrLTPb3uxGUnGlmaQhf7FKYJkEYKbbsi9
4jHb/bV/fn/dnwcv++31/by/qOGCAge0imqkmWN5mkI8wESSx0jMEARGniWDRahBEj4aT43heUbz
lJn0g9n13MRrZMG8EPt9CCnxmeP2C2jmKzfdnBSANDzhzDUvBTuvTFWlrdSTmxQQx2I+XhKvw7do
DJjaVLLWMXAW9MFjwtzurSJilrsZKV0m2HVQdddxQ+wtUgo3Jc0kp5llJRTzVVylNnEuD4Y/YLA9
WDUP8Y67ynCENo7tZ9FCsk95/MyIBNRnFMPCjOaZh41oIPPLgK1e3e+JdQDYGecAzI5xzDm0sUUj
oDFBT4z7rtNRKq28/N0SG0/QFBwSecIioJm6eprFoETYdUMNbAa/GA4b3C43vK6KRXLij+6aOGAo
PZxylV5JY1XDtQU1KVQLOGiJwfwT0ILMWHyOeQwmUNQBQEM0CoBjuSBECfh0y7dSRtZOb12pI8jq
whnmW0yeIYhjgtzet4IGOaSYTghOacccRuYJigLXRSt6zYxOxTuBFbSzEGydYy4ilqARKnI44tyF
6S8JHKrgp2GiYOEZyjJi3stComxi1h4RVphWjSqGST1thQpp0HOHyiGsENiPMjyQ+J+JLU8gMgro
5N7Ci211ZviLAw0OiX3fzBeUsEvtEVV8WUqJHIRdxTIGsqnh2VNvNLwpg66iIJHuzy+n8/ftcbcf
4B/7I8QtCDyhJyMXCA3rGMS5l7K8rh0rf/qT29QcWMZ6Fx0iNlShlKcon+m9LdsCaRWCO8gWbhmO
kCuDkWtZshpRNxqagbBlc1xetmEHJEy6VRnOiAwUm8b2kiY8RJkPMZdLGliYB0EE94pgG8VKBG7J
XgpOLmNISFY4QS6pBKcdkMiKSZTRU56OmXdj1ysqjYqNQO4J4n/hm+m+3HwmRTLxCTICO5nqgCcs
AySDO5BVLnSM2IKViVK4wpCtOAD6ituDlbYKdSwQE6P6JDNRpZz1GKRJhMq9RYwshUs9AvkxyRYu
ObMjvhw4O8PGRmzyMDQ+qYCBxrB3AP67oszQv7kuKEUg4GDDbi1djuAwqUzXSwVNz6fd/nI5nQfX
f950XmEErObUWNH59DAcigAjnmcmkRbGw4cYYjR8+ABn9NEio4c7E6MOeMv5LvdaTXXMwN7IHeCU
sya9UHfsUkJve6i5FTy3E2D5ubQAzmUVgryLPuhDL1TeQQ981DcZGNgD7WRkMdnNxwLoqmkVoNta
EO5uZsSsvCqjbGhJbJR7kkxlFo93N5UYUZ5GubIy7WCcgwZHdO6uOYRPwDaXZAFgfDs0V4ORScf9
6FXcyzzCMnUtb40Nz6o+CjC7RmipREimghqY5tlcWvNNA6NyF9VSqkqY0JllpyBQpbJw3ZViSFch
jYuzzNNnSpStifffT+d/moVrbf5UWQzCLLD4coMG+TW45RZjtBZpuGESCDLBHm/uKksILkE7hhp9
hbJE+BtI2cDEl7DqCBaFurj4ibrKaF98YtSapXkHKQvyxJPhPxjd0bg2WZCmU6DOkNaQeVLYbNkD
8nN3/cymQZHlv39/g7G3t9P5qqtbxdIZYqHw8zh1rmRNq/OfVekNlofz9X37evjf8uXIyAooxx5k
n6r8laOIPKnikpjn7heFtHFPXmxwAKVp5IMoqZjYMUwtiy49oAg3KaQ6gcuB6or+0ljfptGq7C9d
KYLaQZ3ElIYGN3RdZ//6ct1froZ3VJPzZEUSWW+KAt5Ypp5ivd9sz7u/Dtf9TirIH8/7N8CGiHVw
epObGcvrK/V04cCyBPZYGbdAVGuq/2eQBQGhIbYTRw6c8WCdDato7uIsDgLiERks55CeQY4mKxae
LGw2tFQG57KKxkkiZmyFWm8+zdBGj2aYuwF6VICQBY2EWsFLdRM4yyBtJ8ln7BXXbaIlMWmMKGLV
iiGliwYQwlBZUeBkntOctdkLrkXVyYsnOoclDiCOI8GmLKy0ERjmxWtIAyizPFZZJ66Sfp7lHm/g
TcZg6YDdcIkigNw4oX6TOfIRMqZ+8XLXZG2G55ClSnmVFrC4TVC/JqdkoujKBuV817hMQ4s1pQ1y
8d2Sxx6omSnXOYMA7xbCHjrEldmOEyzrvx+gQKyuf2tdkJYZwVCAwWqlay+cN0kttEBfjkqkGhjF
PP182gHzad72dCrRJ6kn9DtR+STrQCoS0Z/CpZFv4LsYz7AnEXpAMvCwEo3WlIjT8inHXKT3MaUL
Q+mYS3eAn1iVimVJ6CfWAb3tUP9ERhXSrIX5HDvuUB+eBvI9JuObBhSUq4xNsEcC820DQHkEhkva
Q7CtSpIbs+XTIF6DEoP5Uk+PdpSicOTWEgYodJU0USqOqB1UeGfVLQs9j4juLqjSY8MjRzLtngEA
giKfGc/wUlwYmbMczpb4kxYANexsIVpNaLNmos2WvLfeN94lJM/N07rG6hnV8cVCGx8aBI2XhA4U
V5LVEjkOdp+XIXO2WptVh05Qc7oWig4cHfh62SZtmnoJXfqMChkXNaPismZQFMhAhMvKmI40PLr8
4+v2sn8e/FsXyN7Op5fDq/XUWe0isYuyDhZlnbms4fSsZF2HbPaRqRVJnDWgD2KecilZQJH1YzMk
UNVTJkt/jyMjvdaq5kquCyVUz5IR+PncynRmspLkCltRg9EsGTXYrnt7QO9lY062kQt9jCFmYQ/S
B2v83AJ2I0InCkPLpmE10fLkA2I0Qj85BU4/QTVS/TDmwFWNUL18Vhg/Ae6kucbopNhC6WahQutj
oYHQT85HLGwg9bJwlRGO+3moUX4G3km2gdJJtY3TzUeN18dIE+MDkj5iZROrxcs8+VBDKluMOJXB
exavjIBAGjM9WTtzM4zKVgysfwdQkdQBqz2MfjuCc0ACrTCU+cd/73fv1+3X171qIR2opxEzcZ2R
JIi5DCBartwFUvvVAJVDmo+cUeA1XrcLZOZlxNmnU8Dly7sdLmS4s4TRdSqzwhRvj9tv++/OdLoq
JRlevC4+rcFdmGFlDVrCDxmENOtTLYxmnIhj5WtUkUq04QFiXMxzY7holKv6dxo3oAkosYpSpsk+
G9IV2bSWgYPTpXWwCKK1lCviVQH1xrVAgRb7BWrrHDMZk9jxYDGkhc1r9iiZktgINNWTVYalpllZ
REzmGWrGpDKHF83HSXkJyPchg2zWkBfMEInyqVVdeQzqJ+c83gwfquJifwLhggItK7SxKltOtFg/
Q7tYEmGUeMgLzSi+0X4To3anigFTHQPWbLhNjNjjvXFtdtZTrf2UUup+uX+a5e62lCemH2sd1ACL
cZbZWbRuTK2oU3UWNS5Tl4W+8rokiTOZ60kz1O6/Ao3Svc7H/f75MrieBn9tf+wHOlIOGFgTaUKe
HXFwyrHO6ZAVAnebFqMRCHcX0epHe13A3f847ICe8+GH9QCuayme2RjY+FC0lDJrUKnEzKxXlW8c
coZEsNERth58i6GihuZuCwEUgb3M3SOlFmBp3D3V72geVsCUu6qykvSYNU7f1VhbwtQ9BiB0MrFl
jUP2NHFJKOO561VegrCH4uZihC47l0oz0g1DjLjVRTEDrlG/eEGK6qZG49RPIe35snjVv0NHT5QL
EWdj+cMl2rWQuSXP05D65cuAsTB12QULRb9965dqjwx2p+P1fHqVjZPPTc2R+AGHn6Ph0BYL2dbe
ahGtAHVrqn32tWxvcLcwKThEeRmVjeVqmZYB8veXw7fjanveK8q9E/zCqgcbSzNWtm7CgFqyPZpG
qGO0nGDJWYyZ7Vnrd6Ae4nQgdfoK7D28SvC+SXxtE7ux9NvRFtL73V6D67u7GC9X5lk85OPEa1iq
ctTFkhLk4IsJcjLn8/14hFtXV7dbf0h69ezplstKZvHx+e10OFrPdMqiJL7q3XC/pZoTq6Uu/zlc
d399qAVsBf8I90KOrS6p/iWqkGAdCe1J6qAChty9dannocy3eRuD63Q30gJq442zONofu+35efD1
fHj+ZvadbCAuMmox6qOg4+YIaC8Nm4PcsjvFGGUhmSHHOSBzIr7dJ1gMCc4IiEr3HNmtr7+jQXP+
OBk2wUWcnK0FXwuVIxq5X7kEhGE4mVtfGatg2GpPqpfNY1kUMwvPJcwLY7NpqhyOVWuS5+NlaVOz
7dvhmdAB01LRkiaDB7f3a8dGKRPrdQfXbu+mPVyTU8H0jl2Ts7WCTZyq0UFz/bZ62BVh1YBWyV/d
KKnb/kIcpbZHqzCAPTxOA3dzLASbiY9k4dz9tRO1eEAg+4eoWn+loOR1cDh//4+0uK8nsC3nmsnB
CtJ8+S2Cmr/VkIp+fVjIyMNlkoqqTYzG7XqWeofTZ3QtaoCrUMm8hxqz/BKZ8yaaJyo3KppVl1Ui
b2SwkAysOmCNUeNCZMzuZ2TpjEEKMF42+sD0uMwBirlCZ7iui4vFF8rEIpffoSye78tV9NQUO6HV
V7Dkm1POqXqxdoOXeQQf0AyiCk7MwnaG51ZVQH8WZOy1xlhEYivIL8fNh9tiLI7NDpVyUbMEJo0O
C1Gm5SswRUWCAuU/yzcju5TfVjEl4rP3y+BZJTaWzsV0zbE7q4hD0tn2Yq5WcTRhdrOf82sBPjd4
RwPzd1nL4/YlwmAAUQK3XophEKMs2rhBCzr7bA0Ub/bWmCwZWE0SMGZdAJVPg6CKS7gBqyClATRa
2ruC8GYRMh4iU5TZna7FgEDr6fT+4a4NGI2nN+3RhEL6XT0bJcsYu6I9a1xHiYfLznXhyL8d364h
5aOufBj0O97YnEhDMBlmfxonQdzob1FD9+u18RxDPPYwGbOboTEGUhtRloP1lZwlntVWAhoQGVqB
Up89TIdjZPb6ExaNH4bDSXNkbHX3MZwwmkGiBrDbW1crX4kxC0f39865avuHoTvHCGPvbnI7dvGP
je6mRhAkBRTOCSlqOqm/DFPulSGzrLUSa9VgVVQEnAFp6zviFZZOiQTzA+zK3GQdV0B8YwUE3liK
WCvmwxhsZexqYdMQgfjY1QpaQ2/NXYrhCM+R5/oaVAGP0fpueu+a+TDx1u6e1gphvb7pxSA+F9OH
MMVs3U0BxpCe3pgGtcGJKgyf3Y+GollR16OdBb4aKhBj4Ed50fyjvxW8/3t7GZDj5Xp+/66+HXH5
C9z38+B63h4vcvfB6+G4HzyDWh/e5K+m+v8/ZrdFPiJsIt2VO7gykcD/uUrXsgUFyTAstfrZwNOu
vrhcO/ZCQ+FnXiyWi+Znwe06p5JjFHnym2Me6RN00SxvoBlKkECuSfILirbOLVOUEM/p+yzLqhsP
PUaKkXb6LIHyxduUK9eEKhTM7U4h/Vn10rI5fgQv0YBEdD7X5VfdFYsxHowmDzeD3yAI3K/g/9/b
VEGIilfEtOHliKChWTGqhhPKNuYZevfRlBzf3q+dfCGJ9Qc61EcwEj5rjgWB9MARtqMLDdMvPAuI
nxy3qlFixDOyXug4TtGVX/bnV9kCfZBfPXrZ7sy8tphEIQ7XyVhjxxIiUoZylzFpoDEPApRErB9H
w/FNP87m8f5uaqN8phtNhTWKl85BnYsarG8VshtnWeDNjELi79R4g8YeOBDIwMO52jU0gmr1syo8
ekSGAARFkJBAHuPyJsV0msuWbMkfI9yoB8V0msbTu+HaDUU+u5/e3HUB76f39z2whz6YnQU44Fbk
b8EzkIVRz3we40jEa/4BWPBJF/U5FSlZeyRzw2f5eDQcTXqA446zy6KqbE0jXjKdjKYdSJupx2M0
urFCqzbGfOT8JpCNyDlLm+FmG4HYfxnAgdHwbJ2INy3H7sJxu0AXZqcY+OhhOLnpht2Ou4iQGQ0E
Jh8QEKI4ZSHpPgvG/COWQMwWoQ7d0rBCjztQ1p78S1FdBAT5Z8JZ/gENc0p90kFDSHyI0brWDzcw
CD9v7tYuS22iQvQMUt+xi6wL4IUbxu7Y5v5u1EXCPE+eXLGPxaUFD8ajcYcu4wh1mD5s5ksmQNlU
sZoOzeSrjdCjMxBtjEbT4chp+S1Ej926vy5lYcVsNLrp3AxHgWy0JKn7e3oWLpuP7yau4qWFpT50
XGa8vssjSA47rC9J8Jp0MDZe3I/GblCKk7j4kzZuZYMMJOC366HrTwuYiOr3zP4ybAu+IknXRpwI
FE8mkOPzjj+aYZGtvMQHJK18PoXsvttjrWJwBh3KE3ujyf100kmu/J3wsf3NQxei/GKW/PNInSsx
bwz524dH1ni3P4l3/zELPWf0aaJkseCsi25GIozcMZiNxn7C6zA++j/Grq27bRxJ/xWfMw+7+9Db
vJN66AeKpCQmhIQQlEznRceTeCY+646zsXu2598vCgBJXApUP3Taqq8AFHEtAFWFKPZ0UTaQnX7D
YWHUu1Cwc78rq8bZHWKsY5Gl3pE+UJalQY6fquiMn5shiyKPM6rOtzv1nktyo/5PB6L0mtt5tp9Y
Ov4FEcEepsX5lO5sRa1RYE/axFJoBMk8VQaKVB2WKxhBI5gZhIB2+sHYRJnHjE6ParWht/nD0KFE
NiUOHKF2MabBK6h02VM/e5pOe5jD48+v4goDfCxh76hbCtoTgSDAv/aJlsXB94sft2jkBQlXLWWR
m3HXbjndm6wv79006jxkLR3HiGUmotL21WrCkm6p7hUiqXsq81zoZ6v19yVprAAMinI9sjQtEHqX
IMSGnMPgY4ggO1IEoX5OgDXjfIaAnRDIfeq3x5+PX97hDnw+w54Goe7vczE8zXmX7hppuSftM5nO
OTFoh873Gm1uAs65AGAIW+Mhac7HdtwUVzqYhoPyoFOQ0Y7YiUtpuJKCizzn9JU9/Xx+fHHve9V+
Wdx8VOKASN4IvH7/pYjSgGcg0onDPvcQSibmal1smOAY9NGhn8t+AN3X7qAaNNWTp6vqnMde/M1+
Cy0OczLUiG6LKfCDbhCqaKzdGS6JBtmbE6uq40g95JVUYday3LxftzF7ufYz+k9dBaOaST4M5R4q
0F/VihGYHJE1DNpbWjskK0zb8lz3YEYehilXhHxSCd6bnUBdT1A2CWfnZjLczpDPkO4n9pW3xQDj
HVB+tt0Bexo5CTht6bFxZKE71l076vmWBbz9HfxXM4pL+XbfVnxK6JGRYLNgs5ZihpFmdxLN3d2Y
W6xyjjxTYUOhB6Mjp7GEWIZN1+kLiSAzAjGINCp7OFa8GT9e91r/4zvwurMimn4+EUyTPJ67zpzf
D5dK3fMj3wpnp9YN9bJGqGBpmro702T8nd+WYBT9FKdnmaTpStNRapy/gmsrWM24bdJS0l5lnDfU
RPMeiRU1E2VgNRGfAr+FnBm3ZRJjVlALhxQRLwYMOVcTV9XQm+bdCza29MBnAew6iNKO91bj23i1
4bZqHFBqiXZfc9yLAI2yHrBGrvh/1Fd5FCtHJIHo5uZ5oqQauxbF6NnxKJRP8NeqN2PL6Jg4qr2R
vuWUY2M6Yej48Xw5DagXBnBd+HeCZ+j44HwO39PF8WcaJX7E2tHbqNx/SK3kV+glXyytTNNSFtmP
cZR7AhRxKMQ33qziI46PUD94GaIosFmmZicwSxi3NSLNaYdGcoOgIEMp9rvax70//ni6+zZpq64K
NaW6xom17i9Iig6lC6k0DQN+SX8PcApPdFuco3B3w23fRCkXcsZGAl88uwfLMHSiCXsCn8mA5Djt
0NXC1cHnrZoaY/2ZDXakJgODIKDSXM3Rc0E5ci8F9f4IvV/cT0GofWNahWEnnOGweyMARYi9i5kV
OY9Tg5M/Xt6ff7w8/cm/DeSovj2jIXvEGO63cmPFM+265rj3XIfJEgSrRyoJSzGcdN1QJXGAGzFM
PLQqN2mCzfQmx5/Oh19pe+SzeOcCfbM3iXVj8jtSkG6saFejXWa1Ys2slI2j590C4GDKoG7uLuXL
P19/Pr9/+/3N6DFcE92fDH+xiUirHUYs9f2plfFc2LxvBVu3pW8oq+g7Lhynf3t9e8dtvs0+1LVh
GuMz34xn2AnojI6x3RYlqfMUO01WYBHqpzliqSkCm8L0Y3Kg0LYdE5N0FIdskUW8tHVb8v58tuVi
LUvTDRZUT6FZHJh5cdomG03apS3tjDnJuvVaJhIRf+vu72CWKJvg7j9/523z8u+7p9///vT169PX
u18V1y98x/yF98v/MjtRBTMhjF57OEDoW2EybN8LWjDrStSC1WIDrwfw7vEWY9mtALoyqXxsCO1q
M7MTSMrsTHi/nwv3Ng4ZGmsGlhuz32bHZb4efOd7CA79KsfA49fHH++Yv4ModDaDNGQZyhO7Nma8
L5H/6f2bnDpU5lqL6gZP3gFqdUW7Say2A2MsqKsbLDBreBsWGKalV5MOESjGToON62H+w/YpABIp
mRndB2jCKFWqL1xHJY9v0AbVMhU57ouQSu7ZzZzUPt46hAFgbMX/be8HoPHpdms8ECSI54Fntese
TLLjOyQ/c+rwFv3ejDaraIYXm6KZZtRAhCObXdeMTqWqcb0oU5zWkTy4dh12dwOw2MS3WzMfIFqn
8kA+gZPJ0aO8cpyOZeS5UgC4P1UfwbDCIwmrwoLPmkFkFyuPtjypyGg6zgFtBE87D/88zo0Unx+O
nwi97j/hGyHRTUht9ERNBXCVaBBs0cOAn/58fX/98vqiurCxdoqPpC1X5TxlD12TRWNgNpIY9U5d
AdEX4GhhYA98qBHhod6fOqvLzYbkWs7oOcZB94zlPww1Vl5uMN0z7W1SLAT55RlMODW/Y54BaLRL
ltR8R4L/9NqdHgeq2KXmQtlUAOLpR+HdLxFO8KPYdBslTpA4v0YR1+Z9wdQInIVQb6i9/nSVq4Fy
EV+//I8NNMIv/I4eHuApIjDgOzYDvNwFoQNE07KhJBQO699feR083fHFhC9PX5/BD4KvWSLXt//W
FxK3sFl2W2OePEYUcJ3f81gSyK7t8oPavEQg1VPAX3gREtCOTkQcKVk2dialpCpZnEfGTDEjI43M
sMIWAxgdZZEpHtD5fjWKWVCYuzMHNSZdG8UEYryl8PO1iWEMU/1WYqYPZDdiOfYfiwBTPCf8VDXd
acBSLh7DzFa2pDce765vj293P56/f3n/+YLpJD6WuXF5vsaCoggizAjfyx7U03BagNrTztJIpyRt
/8l8N0t2D5fZDiohd7LG3ngmXS+hRXWeBhJUUo55HCybaRl94ffHHz+4li1qz1EFRbo8Gcdp0V6s
w+l8VYo0nJTN1h8Etb4vqVWZ190A/wvCwClhHlmIAmxx9h5tW6CH7r62Cu1O+7a6OJW0LTKm+2XK
1ihJmdYR73an7dkR0l3PbfyE2bFN7VzpZuOCeF/VmzixhZhXeqMJSH3dqbjHZlgNrGHnjZegPv35
g8/GboOXNU3TorBLklTrbTaJHKndA8GHvnZqSnZB7KxtgaMRTxaNULS/lsUZSuytaAHngSUnrXZF
6jT3QNsqKlR31DYHVq3JYbSrb9Rm334+HUvno7Z1HqQRZhI3wWGhx2dfqJHdNLPZqUNMnWI/lMfP
12HAg84IDrk19cnV0SJPM1suaKE8S90BLAyUfHlJu6Iic1IJoMhw1Xvh2HiC4kuO+y4JYm9f43AW
JHZ/mC3iltHktu8cPGC13bdDMdodS4Q4AXds/amjCWkkpB/8C6ivqzgyhUIKnxVzRyizWvhsHma4
td3UknG4Cb3jSA5he8UhVRwXhdv8tGUnhh19yxmtB2PzWP8y5Av0MOr2OmWtR/t934hg/V7p+ZZN
Ra00I5Jb86RKcx9Oq2X4y/89qzOLZcMzc6mtvnBaOWmNviA1i5LC0O90LLzHtncLh70PXhC2t0wQ
1Gch8urfwV4e/2U6mPIs1V7r0KAHTTMDMxxrZzJ8YZD6gMISX4dE4EVwmEd7pcGMmpua2WUeEaIY
Bwqv0KbFnAlhp/kmR+xPHF+toE8oV4GLZajWOpAXXnnz4pa8RRMkvtRFE+ZrnUx1pllrP92LyAAy
XLBLxPY6GupR42wW8fSfYTCjc3RDFW30JVEH+Rxx7tQDTSg8ZYzKJzW2GxJKJkk67bStYt+IB/aI
DC+/HEhIfg3FzgTgFt7KwSgbImZ2D67gkr4WqUtnO9wT9Pvk2iiiW+uxFRVZZLFQRZAIi7Yt4Zzx
AfH9gmOSPdwqcR0zyEI3SVkNxSZJSxep7qNAV5MmOvT6LMDp5kAxEGycGAwRlpRt8Xcq5VdxVE9E
ymOpyCuFbT9F+agrEBZg7upt8FB/8oP1cD3TuuRNBF0KrQrwccJUJ51BH14aPUzR2gXXlJwrXGj/
s5hwrc5gilANZapxrYfNySeMJy/4162kBhVXd+uZ6OY2fclPNKcLdEOcpSFGr5IwizqPcGGS5vmK
dHUDr8acFG+WZphIszaOIpvYWzGbtaJ5B0rCFBm3Atgg5QEQpUhdApDHKQqkvjLSYhNgkgO0KbD+
qnNkI5IrI9s4ybFMxQ4jCrH6mHrivjzvG7nWJCHW6fenrt617LCSRz+kQYy2Rz/wGQ+/fJ5YzhUL
gwCzN58/XO4y0VqrN5tN6nkf9pgOWVjIGRy1MjMi/4mf10tr7PglUd3WWdck0gb68Z2r25jJtArm
UedxqO2GNHpiuqUZCLalXhgIOPFieQKQ+oAMLw0g7GjW4Ig9xYW6E7MGbKIEj21SD7w+8AlU50lQ
71yTAxWJA1nkKznJb+aaY9V3GMIAIXMVEP9IVuVZhDswzjxje92Vx+m2Z52X0QZ/snNiGEaK1EbF
/ylbeOauP/lRys4uWLMsQj4ZYsxgPU8upbwGK6w+5CnOivxt+vFaki2WdpeHfHODBTzVOYpot8dT
p3GeemK2KZ496ik1ocqFUH2anbRLw8J0B5iBKEABrs+VmKQcwF1uFCyOmMsjlvTQHrIwXh9T7VBg
i8AEf6iSyBWWT5x9GOEBjiDufbnHjcsVh1hSkOEkAWTeUIDtHGzDnutgnWuDyyygtWoWak2KdHAA
ojD15JpEEa7uGTzJ2hAQHBky5CSAiCT8pMMQEwmgaK29gSELMvR7BBaurQiCIytwkTa5J9OYK7xr
dS9ZYqQKIDyTnHawfLMsviFsliXokiCgdH3gCB5UoTTl3mByVzQOcLmHKkMdEWecsigu0GZvjrso
3JLK1l9mhj7nk0/sAnwK07XHuYORLEb7NVldLTmMlMGp2IgnmJrAqQVeMKoGazBacIEWXKAFY63F
qWgv4XRso6XBaRQjGp4AEmwuEQAiLa2KPMbmAACSCPmS41DJs86W2W91TxzVwIfq2gcAR461Ggfy
IkDWhSOtSI51JXETtdE+mZpxKWc+YhmM6ypllGGGpQYHJi28DUh3DZbrlpbXnmXond2sKTB6jR/c
bNstuVa7HUW+oj0yeu6vLWUo2sdphOlKHMhQ9Z0DRZAhPantKUuTAJ1IWtZlBVdRVntolAZZhnRE
WA9zZB5XAHbIqLHExtWevgakxuWKteigmx65pATYyZXGEgW+9YEj2LIt52ZsZgAkSRI8tyIr0JmJ
UF4ta6s4JVmeJQNSX3Rs+KqKFPcpTdiHMChKZKCxgdZ1leERJilLgmR1ReUsaZyJUFJO8nNVbwLP
O9Q6T3SDZ6xpE65K8bnLwgD9BHpPQKddzZ9tB7YeFpDx3dlam3AcX4M5EP95K+tqrUsqc3NkP0Qa
rsogE3bD9xMJtjhzIAo9QAbHw0jvIKxKcrKCbLA+JbBtvEGkY8PA0HHECMlwbZErFWFU1MWNEwuW
Gzf+BpBjG3n+1QXebO2xxG3JdAZsdeL0GJ2RhypHZt3hQKoUGbADoWGAagoCWVtqBQNSDZzumd4B
uXGSwFnSEA8tMrFc2jIrMszIaeYYwgjfS1yGIkJvCieG+yLO83jvfhUARVhjmQK0CdeONARHVOO5
bpBxIujIUJR0mGdspyKNo+NrxLB+TCC5MjQag8aTRflhh0rBkeawQwUQt09IvkK1MwKcSYJ8pxuC
HzIXa0jT75sjhIFQN3fXuunKhythvwU2s7WHmMh6cOyJBv6B4smCoW9NG+CJY3oda3+6cAkber3H
36vC+HdwFCXCjt/KWT4mTctqLWsnSwSfRcRh8DG4KkcDRyC/IMsRNT1P7CuCNuTcOa/RTyAYLKJ5
S3NZLPvl8rscqkN9Qrsr2/K+wVhrvljHtsYP/mm9HntbpKpa8TgOmnpCTeIUKb9qRVQNLeUyDhw2
fCQubJ779S24tmIlAOAc3QtvgX/88f0LmGi7XsUqKdnVln8KULS73OVOFOgszkNstpxAy2YA3oQU
RokRrmaJZOUQFXngeAvpLCIuJ7ifWF7vC3joqhqNzs05ePWkm8D0LBb0epPmIbnHXCBEzmDWPVo1
I2j2GR4gBHxxsUVI1IK4rtUNrieifkUL2aizZssVRkPwSGUzQ+pmlyFFZLFDC3V1AGj7cmjACUAc
IpsQnBsbV98aEZN9gnxxWwQPjTL0qgbAQ5txTUFU21Io11/Fs2JVbNJ4KZZpa0c5tcIu+QBhyjpX
K0/E5eDFeR5wAI5PLIuwZQ1AYcJZkVNtRPbggO1UCDRxFR4EGDFFiJndJ6cbabdHwk1yhJ0LLLBp
CrDQC+yYYoHN++mZXiS4qqYYio0n6t+MR9heZ0Z1rX4hFo4oQxZn/hkHYPTMU4DTAeRSUvNZuH9T
s+zKJR2HsXHmhb4Zzl5RaLVL+VjEtGqRdrYr1YnOdbSgVumQoidhAv1Y6Jq5IMn7Y5PImspxxhX0
Nsmz0e/RKXhI6glrKtCPDwXvpdhWWsAqSqK0kR3I85efr08vT1/ef75+f/7ydieNlNsprDgWeVuw
+CNDCdQJBzXZtP71Eg2pLdcAoBlRQq0rQ8A7Gm8SXzuBXUtROBl25GxnQ8uOlGiAHsqyMEiN1U5a
ceMhoVXgSKtMxOx7oaOhOGY4Cp2ZCD6Bfxlq+q/hqbkJ13LEtt8zXGTO0q5sz1fl3ISRJ9naIjuz
IKscx/g8jm4nlak7OrgmrDzXqN6n7OARPe2+C6M8RjPtSJzG/sl4qOK02ODW+wL/REbvEnAZi9Rp
qe5UHY7lvsRsUYTmNDtZuETTUk4HDNc3Me2yJO90A3xRDyS1Di0mqrcL8F2ps5wImrOacGqCHq4r
cPJGcKgrvUgxIH0IkDRYVZSEmNj1mpjWRUBW8EGx1bMJUcZGaBoPwvXkkeivsckpG7Sx0CZKB0Jd
3NlVytLbqygL1lVCqYWRMLjyBRmduFd3OZMU+kH/Yj81Eb0OvgvHrh0b3u1P3WC8d70wQBSwswwo
x86Ge+/CAxtqsZ9e5eIq3r7QQ3YYkKknWlAW5BgGm7nCnFlNEHZ6q59f1mm8KdC8pz2fi1ibpwXB
tmMa6vW5MniU4xWeAfTj2xn4JVDdfTWLSf3D+pPYqK2mtrdqJpKhNWpv2wwk1E9+DSQyfTYtDFfY
tJ5fHtM49dg4WmwFerG9MNkuMgsid3eriSXLJY09X9OybhOjLsoGTxblYYnnwFfMLMZXRI2Ja2/5
uqSCJfKUAXbLmBZksqSevq2UpJsyghJ5i0lqAOuicJ4sz3BZMDtoD1ta4NG3DC6xF10VR1xdJhuv
OEXm2fSZXJsbY1Pw5OhAWzahvrw36xOPtnnGsSLKUEydn1jBzQ08L/BsOVRs0BmFVDTklY5jNE1C
XBZaFOnGh+BLF6Gf8k2ELl2wGw/RyQv8gZPUM949bwNoDLtixBdLujt/bqxLWw298HnsZkcSXDfm
O8GzwUW4Jxi5LxndNn3/AAFYjIeJIAgOmsLc2GuAvb3XIK7U4d/eD0mBWinoLOr0AUHIBW9iFhFa
BmgbA8Tw5mcpKfIMVWlYt+cKP966i1qKfCB7KMIAvSo0eIooQbuxgPIjnjfYI4RZvD65aLtzFIsM
CykT4yMVrXhtC4+LJbbyNzq0YAv/gvT2/t5Gk/XlDduxW6jlM+4yyf0yqoebgWUWwH5Hpa/subS6
Gg8Sd60eBruHeGTVqeYa/EJs++uxmQGD3lepRp8/VCDZhCAfyRk+XPAs2en4gAPl8eGEI4eypyhC
+C7k47ZGsZHgaVrpK4J9LCEuIKpseopWr4FDO6aHGmtiENl41Lm6dqcTVQ91L0wydknbu8RhNGhg
gmOR7Ee1ZpJ83IDAO8lWLbZGG5IGojNWvOHBGfOEBo2XPArXdsM6mW8qOys09oRv6/4iwneypmsq
9xlZ8vT1+XHa7L7/+4f18LQUsCTizdAbMpbHsjvtr8NFk9bKCWKjD1A/Fyw3i7kvIUDCbT5W9zdl
myLK+CpSOLDqYs/RVZzqmRJe2rqBsXKx8+I/wFGlEw2iwhl8fXpNuufvf/x596re+/6bmc8l6TTd
aaGZx1kaHZq24U2rd3IJl/XFjk8oAXn0QNqjUA+Oe/1lZ5EnaUgETsfWm5oC23UlO8DTn9eK/4Wd
Fku2++Pk7DyHXHA/Xut6WlxWp2rs+uST8KcztFS5xLymL0+Pb08gi2iib4/vIqDYkwhD9tUtpH/6
3z+e3t7vSnl834yUD1nSHHm31ONEeYXTR818cSCI6lT/7h/PL+9P8K7v4xuvHrgGgL/f7/5jJ4C7
/2fsyp4Tx7n9v0L1w70zVT13wAYCD/0gbAMavMWWE5gXF53QaWoSSJFkZvr766+O5EXLEf29dJrz
O1qs9Ug6y4ua+H/t6QZuQ9zjWXTlolp6xqbT05GhJOi8ZzNV/7ZHIFo9tDI1h4zMLyFxnOGjkOUr
Y6T0U01qIDhGSj/WJJeZez8Uhdf/mKiupSC9mLGOxHc00d5KOqqHubpoUdh0AmTyq96UJGl/ejg+
P+8vP2wlCJkZbHFeFw+efDwez3wReTiDh5PPg9fL+eHw9gZe9cA/3svxX+P5SWbC7qxbfJMjJDdj
VM7q8PlMNy9sgIhMx6MJdqWsMHhIyqTMffwKW+JB6fvqKaKlTnxVj7+nxr5HkPrFd743JDTw/MWV
769CMvLH7u/nkpqmr99T/TkyPnLvpkxy/NpGsgjBacGWtcXWDJn/rquls7qw7BjN8VMSMp00mtWt
4zqVvd9V1CyMyvJ9AEwCr3yO5MAeEHt8PNsiG8zNVHcgogEg0fyk1JnD6l9yLNgMNavq0MnULpyT
UXsIiW7KoRa8sxnN8WzKqzy9sbPjXXCDP/mouNU24iqMT0pkTDeI2TrGnM8no7GdK5BVnZqOfDPU
H6sa4N6bOYIstgxzwysCxuBuToBHVn3u8q3veRY5Idu5Jx6AlXEL02GvzRZkEtyM9KNos25svcnM
9C2hShvoRDmcrhRjDw1Bnk3wQT5yxM5QObD74x73xz42rfw5Sp7oGscacHU8kXDuz+YLK8/NbIaM
3XU584aaHzyj6ZTmPL7wte3vw8vh9D4AR+1Wu1Z5OOVn6xGyvEto5l/pQTv7fiv9XbI8nDkPX1zh
tQ6tAayiNxNvrbn9vp6D1BkJi8H7x4mLam22vXKHAUmh4Pj2cODywOlwhmgDh+dXJanZwjf+0Ori
ZOJpZpGNEGFL/iXEq8xp2Mz5Vk5xl9/5ibtWq1U5mk61HK0UivADGJHe5N9siVlDjTNWlfZHouDj
7f38cvzPYcDuZItacr/gB2/3uao+q2JcvhlBWD37oNnhMw/XMDG5NK0VqwjV8MJA5zPVcFIDIzK5
mbpSCtCRMimpFhVaw5g33DoqC9jU2RoCRbWFdCZPtYAzsJHvqNYtGxkeXVV0G3hD9B1VZ5po97A6
NnZiyTbmCSflNfTGPvFLNBiPy5k6IzWUbL2R6v3SHhma1puCLgPeg462Eph3BXNUpynRkTIaG0Hc
9Wz5lulQY1Q/eDYT5p/Da/ctTWUqMh+6lPS0+euNJqiGpMJE2XzkOwZ1wfck5Cqp611/OCqw93Vt
dCajcMRbduxoO4Ev+HeP1VUQW6PE4sXO5+c3cF/+ePj78Hx+HZwO/wy+Xc6nd54SWRTt86LgWV32
r99BPxAJahQWdtgNwml9oNV+R1PIgr687F8Og68f375BhAklQZP3coFuvGgykW6xf/jr+fj0/X3w
P4M4CM1YsN26zTF5O9Rc1ypX4ByJx0surI49NtSkYwElpTfzV0v00V0wsDt/Mry903OkMZ173tYm
+vrRFcgszLwx7lEa4LvVyuNHaYILzcBxJSoLwCQp/el8uVI9UjafNhmONlrYZ6CvtzNfdZUFtIwl
XH7W/d4FmxjCzJvt2lWt59iw0Jtg63vPor0V9mTTokBHdM9vLXIbZEl9H0chXhmnpVbPQkJ44x1i
mQtIdxnUg63mOtpTPZvQwRhi73MGzxyrQZzPJhO0SUy9WqV1IahaQfBaX3Uw1jLpPueUMu8m3vAm
zjFsEU5Hwxu8UFIE2yDF3DsqeTdd2KwCP5nrbfp1mHRXsMH59HZ+Pgwej2+vz/t2kbOXh7BKkp0d
+1Uj879xlaTll9kQx4vsvvziTZRV+ielt3zWats3WJlVqR3jeU1D+xvWhtczGvZuIVkRpSuGWYZw
NiP6eAW5o4yKP38pvb8eHiAeLCSwrhuBn4xZpAYIE7SgUKNcdKRa9U4qqLkmXQtSVUTqs5b4xije
0NT88mANCgaOzwjWlP/aWWmyClfsBTAhAYnVyEQihdipDdouL6Ky1Im8jVdZWkg7RWUnban84x3l
RkkpW0arKryYZY6wrgD/uYlcH7+KkgVVI/QK4rJIzDJWcVbQrMItaoHhjt6ROETj11CwAdoJ5Q4z
280OM4AD5J7ELMv1it3R6L7MUs0eCuq2K1qDS4VKIdKDQWIG4Q+yKIweY/c0XRNrCG2iFCKM4LFT
gSEODL+yghiFJiHN7jKDlq2oPTNaKvzI1Uf6lq6PAyAXVbKIo5yEHj6CgGc1Hw+RpPfrKIpLI5nW
AAlZ0SDhIwC3hpEsMSucDZSQnXibM1u2iOTIdyWDWCpltmRmuiSDBxfnyE6qmNF2zCn0lFGdkBUs
2ugkvkGCIS4f8kr3KURkDuYRI/EuxSQJAUOo7cAYDA2x3+NwWKbTS2uhKHTPyJYpoK5ljIuK8GSZ
SqtzPXFMdsImPcO9eQiegvKTpxMuCR+oG0fRJZdDKzXkmyCCV0QI+W3WpmQRwQTaBuNDl+9EkfUR
vIQ8RkN6i4GXUGuVA9UzUlJMGhMZQozyP7Id5KqmVenXJhGjd5i1i4CyvIzM5YKt+ZqT6LQKtug6
L32dfE9pkpnr25amibHa/BkVmVn9lubeeP7chXxfNpdY6e6gXlcLlB5UJYOQ4OKX2dQkzo2h297p
IXJEH0dVk3V6FRsIAQtzGat/D9arLAupFrPCzNRM1NkZNfwYb1Uu6mwd0DqmjHHRL0q5HKDtIMBx
VUEkQa1m+HbPaKDNhpZmW3Ao4ZPK9+PDX1g8ii51lZZkGYFb+EqPYWflsoagtNciQXZ5MrpMwCXF
Dwv5Qyziae3Ptui3FJM5/szWc0QQ1WkDOgdIQ6XRvVgKlV2S/5JHUYxWtxuRjYhtg6+bqocsAS8K
WKFTLsxBXPgAAspHXahCzoE1t0iIHQNVnBA28nT3lpKe+kNvMseWIonzc7zhr0DSwbcQ/mQmPyRI
pr6H68r3DJMrDIFDEVmCxXA4Go90T8gCieIRuDF0+agSPMKED7sI71HP6Bg4G48x4ly7cWmpw5FJ
lSGazBwaqnHUFRBCEhau9icDGVW9b9CJdkXeEidC6z1JdBciHYpajfSoj2Q4tdonn03Um/uWqN0Y
tMTZ1B6donkmzkEN8NQ3v601AeRyhb4BCVTe7rhyNG94GmIw8sblUH//lDVAg9cICLWNk0M/9Gao
43LZFMyfzM3m7c0Q9KxYQEBD2ZUXi4PJfKTbY8n8ELMQjAN1YdnipsVGN3sm/zpTKU4A9HRwXzdF
newKmJb+aBn7o7n9LQ1kRKs1VszBt/Nl8PX5ePrrl9GvA75TDorVQuA8zQcEW8JEgsEvvXz0q7Xm
LkCIdFyiAu6MliKbIt5qgewFEUwZrQ8UcYp3DDvDyl4WduzOyQyLFG5M1OHejeOmV2TfaNZf+dBV
4o90FQR59f68f/sudBvY+fLw/eoGVrDxBL/wluhsIuwSu25ll+PTkyYiyMryDXSlKcGp5NoIEath
Gd921xlzoOuIC9+LiLhw5Hil4UFeORAScIGdsp09uRsGh9cijaf1dCUGgGik4+s7KH2+Dd5lS/UD
PT28S61M0Oj8dnwa/AIN+r6/PB3ef8XbU+pwQ1Rc1+cJrWgHyA+16m2KgcF9Yepqmyq0dsGuSnqT
kSCIwIMT5fIxdlwPwY9QqzZv0UwdYQW5ayGp15oQ5RWp57ZCjgOts17mglzKz486mmnn+yameVKu
wgQTx8J74fyfg0pTQnDvSAYf748pwrabcuoUs2XP421tpJDRNdvA2WFuVKDjE68ca8i5TlYODz49
D/4NUH9DWbehateUDSMuiXPU/OiGJGIJIinKZZ3LFF0nBmbMalLu0qBmVuvwn6Bea61unL6olrae
tshmSWN9LHDWOsnuojrN+BFmZ2H2+ANqGcVLKLy0EL4e6d70VHoTExztII0vMHu6OYAa39Y1UbUN
aQm3Nn19IKSKfukUjsc3syGyHzUIdnpOoP0DSs17KP7Tw65WmrjdsLREyu28+NkF9R4a5CIT3TLR
yfKUxUWTstScEEhUBhxrsE+f+po1382lAD6R8csYlQWTAxTcOCsan1Wpi2AlbHSWOiEHy5ZVlGoR
agEIQW+8A/q7AggZ6VBMBYzLIUFWYtJf1cTytAItA5BGqlWQYC0q9XgMpGQ5Vf2M3C05jfLBUtVs
l0cjHTH40kxwqp8i6MZCoYMJX8pRpcACVZovmFas+C0+WQuF3dC5RFthzFoNlSyiFQmw7anhWYB1
gT5rGoSmeYWbQMh6GEGqFTKf5XDfGbVmY3hDCQeN8DX2RQ14cHo7f3sfrH+8Hi6/3Q2ehNGIekXW
Kd9dZ+3LWxXRboHemvJ1Iwq19pMUpzuRDpYikFg36Z9gh/fFG45nV9j4IUblHBqsCS0De4A04CJL
Q4sIa7VFbJcjk05L4sw9D+IbVWNKIXtjpG0EgJuiKhyOaC89xwy1EFXxKVanmar41ZET/0ad5w2d
JHnMW5Vm3nAITYB8jGTJA8+fAse1OnesU99k1Rn5bJjpGmEqcOWr+elfVyrv6OVomuAqXz3LcPaz
LxD5XCu+1FzTKKnw7+HIdDzEbzpbFubNHMpqCgfqj1TF7b4V5AlOvkHJesTzFkgS3yPYYtcwLOOJ
qvjXjgXY02g28mp7NAJGaaFHn27nIQxW6g03gQUF0y1YaWYWkOTBFBvc4e3IW1jklCOsJp5mtaBj
dhECSJCyW2A0DZHG42hMFuCW89p04LOT2MsXp4ZkhI12jricCvccFXpObVsM7rxvfSTvcvKzlYte
MZ9rmGbexO4OTrRHIxDrklj0jfyrbfLImoV1B8N7qcgqRtXnR2WXsJd8Qa2jLdFVvDW0yVR/hCwZ
4UdPPLotFoVRbV8wPQ9i9P30vsxpGmfiZUhe1zyfH/4alOePC+bwWFyt6B7ABYVL3Qv1c+JNCS4B
tIEtXm4gTmKdUzYdy4hurUYTVmqXkNB4kWlrSGdxmawr5LPaY/ZCjVXeZGNs31Im1WyKJak3jZaa
q4fT4XJ8GAhwkO+fDuLmZVDa8tHPWJVTvCipFVZyUpZszbt+hSlUZcu6lYrbIeHPhygtCO47ujS8
O7yc3w9gmWd3aRHBYy/vQNVhQ0erg9YyujXKs7OSRby+vD0huedJqcwN8bNOS5MiLhRWzXu9AwGC
iXZyfF8/rR7K/AGFt3ta2E+UZRYMfil/vL0fXgbZaRB8P77+OniDe+JvvBND3eKZvDyfnzi5PAfa
LWermIzAUp/4ct4/PpxfXAlRXAYR3ea/Ly+Hw9vDno+h2/OF3roy+RmrvDL8v2TrysDCBBgJw/JB
fHw/SHTxcXyGO8aukaxujymL1Ccb+Mm7INA9BehotSiilRDqv4z7Kv33hYu63n7sn3kzOtsZxdVR
EvAVzRoi2+Pz8fSvK08M7VQQ/qvBpSxswhXBsohukSUg2rKgv/uN/n1/OJ+ae0r7MV0y18uSzMcz
ZUNr6PrLY0NUfGFbgO+r22xPt9xZ95AZbdlkyVkKNp7OL4UXgfmNT6xiy2Qy0eX1BgDtCMdNes/B
u5j/63uacU2SFdpNM0UzSZkiN/AfYLekE2jIdEJ5T1mwZlGgk/m2u8ozPYAE0FmWYSEhRJKoWFql
t9uZnglc5Lu8KSRRLSOsSdPGJOKLz/HxCfUKDcyspKMx/oYP8JJs7DVV5HreXx7tcXmXUEh2I92z
d9yuYazp74NHmnJXLjXJCIiuWwPAZIgDFiz0fML7QCfANfuSGaW1TskVkniQVsOGiVo1HrgVEruP
LUKjximVkIpbYWpoa1xzBOSkPjXhNaOaowYrsTJycxJs6oVDwbaIyogpy7DVdfl6xyWVr29izerr
1NwE1hzu66UQhZVmHWrwIkjqDfgh5tPN01NCCtCqTYPISKQiJYlVFVeAoJdosp0lt5CrNg5EJbbg
8ratCjYiOFe+JbU3S5N6XdLAzKIDodJoEwJXFkRxxuAGNTTv2poe0ttRSQ26vYbWS6+lFCzsDjlc
vp0vL/sTnx4v59Px/XzBbuWusXVCE1FvacuFdskEv+VEWpYioA+univYNlVKWY2+mJDT4+V8fFSe
XNKwyKhyDm0I9YKmIVjC5YELW5bOVO0z36evR3jv/Pz9n+Y/f58e5f8+ucvrnlzUKdVWvE0WEkWC
AcdDGiHli1Zi/OzWJo1YSEZpYHE/eL/sH46nJ3vWl0xTlec/4VjF4LqYD1O0L3oeXnKNrfbAIaxJ
lCMCJ3FpuGhcKWdGvJ0e7V7DnWU3jEu+36ARl+QrJVPePFpKc3tuUldMU+ru6CVqY9LBiRqmvC+C
UbV/kbbvS1rmK/wCb1lij5PinoOf4Le9ebfwpf36fPiXy6aYvmS1rUm4upl7eDkNXo7GQ3yvBQaH
aANQ9zSguvY2qtONAKqei+EXbBeGSFjG1AjQygnyOKa7CRTeivj/0yjQrr+rVPcFBz+LKuebj6pg
wHfc+rYiYahus/1VAd+2+W6Qs0pz3p/pIg/8FgdV/JlTlyyk0sqRnynk0qzLOySmIWF8SJdwo1+i
bgajLYhW6kRvKfUCrlJqzecUvEaCe/8N1YW9hC9LoDm20ziQ4ni2fDMsdrkZCYwDd3z7RRUhlmX3
BN0/CksSOpEE0momtXkQO4/bKmPYjSP421uW41pbsQWt1qW1ZQVWSdgdX3YHTq92WhY9DYw7+Ok9
YHWoexTEWEh8T/iCuOQSTnaPziYlFewKuN6TwrTlTSQ+6GrF+TmCkSDLd91t2v7hu6pDkkYwShBn
gQ3ACMOaZlkGJFhHeucLkp3E4lhD/OdVQXBNgZbLkqAtjmzxB7RtTEuGzrPmW6XM8nb4eDyDX7hD
P8taAQiuldROFoSNri4iaKBbx2KDmBN4x8+4/KEqVsu7qjWNwyJS9Iw2UZGqRVmHh3W1ili8QAck
KcBmivCFka5IyqgsW13i4E8/wltBzP52ZdbDayNMeKm8gRWbqipE/Ed7P/jl0/HtDM6jfxt9UmFw
4iYaZexrmpoadoNGgdZZVL9hGjJTXzQMxHMiE2dlZqh3BJ1FVxQ2MPxZy2DChXeDCdduN5gwDSuD
xdl00+mV78A8fmksc3/qyHju7JO57+qT+XjuqqYa5BYQWmYw1OqZs/Yjz6FZbHJhL4zAI1SB8FJH
ZqktgD3hqrjvSujqwhaf4BWZ4uQbnDx3le4wotBYflbDkVHFTUZndYHQKrMWoGNXZIkjmHbLwQ+0
jGK2Qz0Dl+CqIsOy5+IaYfRnJewKGsdXy1iRKNaP5B1SRKgFYIvzw2BMVGWNDkgrymyyaBBpW2Ug
XNbcUFVPC4CKLZX3Zn76DTLVJLgh1GkGMVfpn8LaET1lapKnfH84PHxcju8/bCXDTbRTtgL41bmD
beWBdvuLipLvy7yHgK3ggqQa/LeoOBS22fV3plKqbBCkbTm5DtdcnI2kVbS6kUZBBaInqJ6V4laJ
FTTQRJqWBT89NiC68a7JHRdbSBFGKa9cJdTU8l0tfLISbdu3mLS93cphybMAHW60TJMZ1q8yV0fI
kgttICbLY696oiYgHUDKhI+CdRTnqhyNwqATvf7y6fe3r8fT7x9vh8vL+fHwm/RApigg0oTItorg
GqMG/+1Nb4LOIqY22zwm9h2kqhLHZfLl0/P+9AjvrZ/hn8fzP6fPP/Yve/5r//h6PH1+23878AyP
j5+Pp/fDEwzNz19fv32So3VzuJwOz4Pv+8vj4QRn6X7UKgZ/g+Pp+H7cPx//swe0H9JBICQqkKT5
Yavgs5MyWz0c5QLTUvU4yUm8ZflxK81STTRWIN7fbe7oMDRYoQg3H5/RYggqevjoWUqyLvmCpWvs
Ky6S0DZqYXcTd69K5pLRNRxM6Kw7fVx+vL6Dz7/LYXC+NO7tlL4QzPybVtrzt0b2bHqk6ZT0RJu1
3AQ0X6tTwQDsJGtNQ1Yh2qyFpnTR0VDGToa2Ku6sCXFVfpPnNvdGdazQ5hBkCcLK9x2+stj5NnRn
An7wLWWMdUOzRHKtliNvllSxBaRVjBPtknLxV51LDSD+YN5b2k+t2JpvJ1aGhqqkJHZGFPKo+PH1
+fjw21+HH4MHMV6fwGvND/VWpu1HXNdJgv9f2ZEst7HjfsXHOcykLG8vb6p8YHdTUse9uRdJ9qXL
cTSOKrGdsuQ3mfn6AcBeQBKtZA5JWQCaOwGQWBj5y0aHfoN0GC2F/gH4WOE6LCPLmahbxqk/hMB1
V/rs8nL25/WQC/vwdfty2D0+YFZ0/UK9xPyb/94dvp6o/f71cUeo6OHw4O3OMEyF9i5CKSSx/2QJ
yoE6Oy3y5G52fnopfK/0Iq5mE6G7fe/0bSx5VA9jslTA61Z9NwNy4UEptvc7EYTSorKzsjnI2t8h
obDsNbfrdbCkXAvV5ceqK0wTbeCmroRyQCtalxP2m354MWq/bo7MEUYxDUO3xAi6fuS8UQKddLqc
pRNT07ccujP90cp8ZAJcdk/b/cGfsTI8P/NHhMBSfRvk0dM1Bom60Wf+TBm4P6tQTz07jXgARL/y
RQnBlrrDO6MLASbQxbCcyXQoDWeZRrMryU+h3ypLNfO5A+zByysJbPu1DuBzgcEIsBoUiyD3Zd+6
MOWaNbT78dWyow8b3x9sgLV1LHQ7SPK161fozJNKNRzpfNYYKjykeMFBDCuFgTL0lfCZY2q1kfNe
dsnM0B9HXRZWqOMw5hdC1fU6d0eiSwQ35FMW9i5oHYmasKP2vOpedKc1yI8X/kJJ7v0VDbCltG7v
q9pP8laC+v/6fJK9P3/evhlnxV5J9/hYVsVtWJSiXaLvYxksnAAZjllaoYwWRtrIhJF4PyI84Cd6
b0ijL0Nx52GxAlDH564+/H33+Q0zk769vh92L4K4SuJA3CgI7ziWHxnl04g4sx6Pfm5IZNSgXbAS
vCVlEU7PHNJFE93sGSooXeiQNztGcqwvR3SQsaujqnK8sRMcdWlJ+3uCHufV5CY7wbB7nKcOEd8m
7NHCz9vjhZy3UjECq/tFVaqjYPcM6PtbSMciEppTbSKZ/ovK6N0l8qOKBa1gxEoq94jFAT69UEIb
kAbOzWW+acMsw7Qlx9vixu8xFGYj2oTaP/IgMsQXIeUWppi8LmwXG/alqu7SVOPNFt2FYeSiiCya
IOloqiaYJKuLVKbZXJ7+2YYab5fiEM3PxvbM7vduwuojZklbIRbLcCn6sqUv/+hjW0es4YfbtwP6
ocLpY0+5M/a7p5eHw/vb9uTx6/bx2+7liUc8o8GKXyaWVtiDj6+sUNoOrzd1qXhfJacVDX9Eqrz7
ZW3AaTEjQ1X/BgXtAfwLm2UTlXqFN4t4Z0sEbiEMP/arN3v+xiD2xQVxhr2CeczqeT8LyaQ4wnhO
5T9chv59VlcD2DkaI2fYkupd8+ZxFsF/JQxAENtH+7yMxMt4TMan26xJAyto0dwB8zSpZCBFe36Y
FptwuSAnhlJbSnsIew6ktAWywrOAwlf1wzaum9b+6vzM+cnv1204bEYd3H20GQ3DyIlQOhJVrqd1
NqSAcRS5U3jlaI6hZNMBMM+BHQfDUYt/Kb0cYA5ZnLDE9MspGwnhK9AhURF3ksciFB+ddOH3KGdB
Z0K11YFG86Tm7B00V7EIUEaFCklFleFiKZv7tn+bzIK0m4nHWDs0uVcW0rLuCGJlT1MHVmKa8xFZ
L2E/uM1rK2CooQcNwk8ezF6nY4/bxT339GUIGF9/Ows2EJBoUVvlSZ7ypIocipYe+zVqhoMaOY7c
tFb0oCeXlBtVlurO+L1x2VblYQx8YaVbIhhReH9vcmz0PcNkKNwxKqNWGERCaaQdHKUgUQXZT7hA
Ra6DOBVFZVu3VxcBN/AhBvqUqBL9G5d0PHA+xrbNc/RcROImGwxhjPGv47xOArvY0MsZgoY3YJTK
zbFhrla2/3p4/36gJxV3T+/4Us2zufl/eNs+gJz47/af7OyBlh6MU4ci0dSKriazU8YUenyF1xSY
Kko8DHMqVtJ/pgqKZcOITaREdQynIIkXGT4lef3RHhdVTIfyV4ukdd5XNIFwruEsLGBoqxtMvUE2
GrYdkjywf0nCILlva2X5iMflLR5JpAiLtLCjQuHHnMdy5JRgeAHqQWktc1j6/eZcRZWwZRe6xiDJ
fB4pwXUev6EgSisqbp5ntf9wK0E//uTblUDjY7fOQqdRW6uEjRzaabOFaJr2FJFxm2cz5CHdE8W2
HbBXEwn64233cvhG2cC+PG/3T75NO+yS2oO2nYDOkgyWmT8mKW6bWNfXF8NEdbqsV8JAARp3kKNC
rssyUynP0YNLsoV/oC0FeWXlY51s+3DRs/u+/cdh99wpduZ9w0cD50+5jhuBasMbCMmnr4SWtWtV
ZiaBBXOsLuMCxhzdyUUHsVKriAxBQMMX9xLgoLFBhTDv4ho3DQL1mlTZNK5SVfOs1i6GmtfmWWL7
kVIphoHOm8x8QpygPT+T7thXKWiy6KOsCncqTClrrW6QW3UJ1NhDB7856FaIbrc0o+3n96cntJ/G
L/vD2/uznQmKspCjgs+T6TDgYLvVGQ729enPGXfeHenMA9giF+36eNS5sAkqleEz5HGN/FZxYx3h
+NAb4roUk6Z2VnNDE2C8K7/b4UgjzAcSp3gDFyromrqM7RTqBhzFq2n7uSFpMli64RKHc7L0zsuU
bp3scUCPB3dsYHKa1IWNQslBOIPsBWwfXTj2ukXHUp34uwL9Oz1FoLP3D+VyHkFecnAoxkcBRH8C
Uy6S9TLTqXJAdSu1X7hy7BJWl68z0bGdkEUe48MI/Hw51tOa053TgjKPVK28cCB3pRvi9cYtmEOG
iLI6alLGLcxvN6ccfW5WTDUBFvQCGz83eq7TpR5L6Q2kvWCTrfPyZqqCMmyINU/hUUsrGj9gwqay
5/aa8aIqaYKeWFpAhCc3cUdt6VZyqtME+K8/Bj1mWpCQ40xTOQpmFS5RsyekzujNFNHlylkYq7Qt
FjXxWmcMVqkPISOm7QQ3oMrA7wyVDsfaxfRkWg1w9zUFCJNzz/QeNQIMxZw71NTVG1VxbzIH4T86
3rFsg/Uv2Q0WVx4qdFk+cjc4F5mz9NAJKkP02vd4k9tzYPflrXC2AfqT/PXH/u8nyevjt/cfRjIv
H16e9jZ/y2A7g4KQ54Wc44/hMf6m0VZKP7w2Re25YZn+Il2jjFg20O8aDgh8CRiZPaCGj2dnw+fo
OQfndpUyssLOXjpJ0rVwsIesb0FHAk0pyhdcohwfHuP2CfrMl3fKg8/kgrWFnHSRBtgZtDis39yj
f5hQtjuvODA3WhdO0JG5kkRXjlEM/m3/Y/eC7h3Qm+f3w/bnFv7YHh4/fPjAU8nm/VsCCzphuKeX
osTMmEIklEHgUxRURAbMeirTDRFgdyc3YVm3aVPrjfYEAst0Y29tmXy9Nhjgn/manDUdgnJd6dT7
jFrobGSERbrwAHiTWF3PLl0wedZUHfbKxRrGSiGXHcmfx0jo2tvQXXgVxSCcElXCEUs3fWln7krp
qCeHXNV5itpworWn33fTTfcBPM+pPaM1LBR0cXU1iIFqnIzpi84qnFsFMVZZRaaetYrrYVeN597/
Y7X3RZqxBc5IIsXttQ+nGaGPRhgdrtDttMnwvRbY2+Y+V5DERguY4MLfjNr65eHwcIL66iMaH3ji
YjMTsa8DFRKwWvgNoEDAWNaEjOLRkgoI+hmGeMa2v+vRZtqVhyUMRFbDgWrIUAFLVGKRHdcImd+B
M/vjNTloYFWoEn+BMQJ56SAGdF72uY1DeU+n7UHQnM3sir3YaAurbysp9K5PZmR13Z0UkD3m+FyS
3iGdCKF1S5BkiVHWat0nfmCsCKBZeGc9kJblhWm25Wm/Yqf949gFnE+XMk10lylkFnNnLwjIdh3X
S7xyc5WpDp2SxgwEofW4FpFg5CBNClLCiSbzlN85eo24F3nYcVMsW1RUWWhLDrpDC5r5nHdQrzD+
AumdfHCg12/qLhGMNywFnD9S2DLlrdxar7wOIEWR+oH4o1JOGeeO3kREmvIVxBXJr7X9zqmJ7+ho
PEa0R+8BYZPabNLXCbQqk84e6snlfoKG3eBUwq8h6+3+gLwbdazw9a/t28PTlsXRYLaKsXiTvKLL
dOGC7S1uYF26PhFHq8wVaj27xAvIHMMXPpmLNekakPTVgYLd7Ko4qRIV2BBzCnf0C6cMHgzjzvFN
mLMXhbszBJwNANxNVmFdMSC9xDBhi+CddW10Ncf/C6Ekb9rKmm2Cp3FGeckdsEAZxSvbVBf0MpTU
gElmHqDpyuXV3OTlZADkFi9Pdhjl5upC1DwGKmrvUm/wkkJokumhuXk3Ro7K7X5dViGfMYLeALjm
uRoIOrgPcCDobqk3qE1jv91KQGPKm+4GhrPPp+LmiaJEnbJ2r/GcwZD9gQkXR8wuSA4K0Po2ADm0
TBW/SCHqeVymoCppd8Sc4HAoArZcErm7HY7CJkuJtL9NISLKeJWICOaV4WqaXRJu6TvUrh2QmaRI
m1z79gACmw0VTPb0ciI3kNjbXzoVoBSNRBFtnKMe5Z5eOJKx9PwPkv0vHXdIAQA=
--===============6417057004987920002==--

