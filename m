Content-Type: multipart/mixed; boundary="===============3515960971620825061=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [robh:for-kernelci 3/7] drivers/of/of_reserved_mem.c:51:13: warning: no previous prototype for 'fdt_reserved_mem_save_node'
Date: Fri, 28 May 2021 01:59:16 +0800
Message-ID: <202105280104.Q4X63zp9-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3515960971620825061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
kernelci
head:   3fea28f97b265227ad52b5949512f005981b801c
commit: 212db1c162ef8b68c0bdb9e7bb861abd762c6d48 [3/7] of: Move reserved me=
mory private function declarations
config: parisc-randconfig-r036-20210527 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/co=
mmit/?id=3D212db1c162ef8b68c0bdb9e7bb861abd762c6d48
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git=
/robh/linux.git
        git fetch --no-tags robh for-kernelci
        git checkout 212db1c162ef8b68c0bdb9e7bb861abd762c6d48
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dparisc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/of/of_reserved_mem.c:51:13: warning: no previous prototype for '=
fdt_reserved_mem_save_node' [-Wmissing-prototypes]
      51 | void __init fdt_reserved_mem_save_node(unsigned long node, const=
 char *uname,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/of/of_reserved_mem.c:246:13: warning: no previous prototype for =
'fdt_init_reserved_mem' [-Wmissing-prototypes]
     246 | void __init fdt_init_reserved_mem(void)
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/fdt_reserved_mem_save_node +51 drivers/of/of_reserved_mem.c

3f0c8206644836e Marek Szyprowski   2014-02-28   47  =

ad1ce1ab061e7d1 Lee Jones          2021-03-18   48  /*
c8813f7ec01c676 chenqiwu           2020-05-11   49   * fdt_reserved_mem_sav=
e_node() - save fdt node for second pass initialization
3f0c8206644836e Marek Szyprowski   2014-02-28   50   */
3f0c8206644836e Marek Szyprowski   2014-02-28  @51  void __init fdt_reserve=
d_mem_save_node(unsigned long node, const char *uname,
3f0c8206644836e Marek Szyprowski   2014-02-28   52  				      phys_addr_t b=
ase, phys_addr_t size)
3f0c8206644836e Marek Szyprowski   2014-02-28   53  {
3f0c8206644836e Marek Szyprowski   2014-02-28   54  	struct reserved_mem *r=
mem =3D &reserved_mem[reserved_mem_count];
3f0c8206644836e Marek Szyprowski   2014-02-28   55  =

3f0c8206644836e Marek Szyprowski   2014-02-28   56  	if (reserved_mem_count=
 =3D=3D ARRAY_SIZE(reserved_mem)) {
418370ff2231b7d Danny Lin          2020-06-03   57  		pr_err("not enough sp=
ace for all defined regions.\n");
3f0c8206644836e Marek Szyprowski   2014-02-28   58  		return;
3f0c8206644836e Marek Szyprowski   2014-02-28   59  	}
3f0c8206644836e Marek Szyprowski   2014-02-28   60  =

3f0c8206644836e Marek Szyprowski   2014-02-28   61  	rmem->fdt_node =3D nod=
e;
3f0c8206644836e Marek Szyprowski   2014-02-28   62  	rmem->name =3D uname;
3f0c8206644836e Marek Szyprowski   2014-02-28   63  	rmem->base =3D base;
3f0c8206644836e Marek Szyprowski   2014-02-28   64  	rmem->size =3D size;
3f0c8206644836e Marek Szyprowski   2014-02-28   65  =

3f0c8206644836e Marek Szyprowski   2014-02-28   66  	reserved_mem_count++;
3f0c8206644836e Marek Szyprowski   2014-02-28   67  	return;
3f0c8206644836e Marek Szyprowski   2014-02-28   68  }
3f0c8206644836e Marek Szyprowski   2014-02-28   69  =

ad1ce1ab061e7d1 Lee Jones          2021-03-18   70  /*
c8813f7ec01c676 chenqiwu           2020-05-11   71   * __reserved_mem_alloc=
_size() - allocate reserved memory described by
6f1188b4ac7577c Yue Hu             2020-07-30   72   *	'size', 'alignment' =
 and 'alloc-ranges' properties.
3f0c8206644836e Marek Szyprowski   2014-02-28   73   */
3f0c8206644836e Marek Szyprowski   2014-02-28   74  static int __init __res=
erved_mem_alloc_size(unsigned long node,
3f0c8206644836e Marek Szyprowski   2014-02-28   75  	const char *uname, phy=
s_addr_t *res_base, phys_addr_t *res_size)
3f0c8206644836e Marek Szyprowski   2014-02-28   76  {
3f0c8206644836e Marek Szyprowski   2014-02-28   77  	int t_len =3D (dt_root=
_addr_cells + dt_root_size_cells) * sizeof(__be32);
3f0c8206644836e Marek Szyprowski   2014-02-28   78  	phys_addr_t start =3D =
0, end =3D 0;
3f0c8206644836e Marek Szyprowski   2014-02-28   79  	phys_addr_t base =3D 0=
, align =3D 0, size;
9d0c4dfedd96ee5 Rob Herring        2014-04-01   80  	int len;
9d0c4dfedd96ee5 Rob Herring        2014-04-01   81  	const __be32 *prop;
6f1188b4ac7577c Yue Hu             2020-07-30   82  	bool nomap;
3f0c8206644836e Marek Szyprowski   2014-02-28   83  	int ret;
3f0c8206644836e Marek Szyprowski   2014-02-28   84  =

3f0c8206644836e Marek Szyprowski   2014-02-28   85  	prop =3D of_get_flat_d=
t_prop(node, "size", &len);
3f0c8206644836e Marek Szyprowski   2014-02-28   86  	if (!prop)
3f0c8206644836e Marek Szyprowski   2014-02-28   87  		return -EINVAL;
3f0c8206644836e Marek Szyprowski   2014-02-28   88  =

3f0c8206644836e Marek Szyprowski   2014-02-28   89  	if (len !=3D dt_root_s=
ize_cells * sizeof(__be32)) {
606ad42aa3b1fe8 Rob Herring        2016-06-15   90  		pr_err("invalid size =
property in '%s' node.\n", uname);
3f0c8206644836e Marek Szyprowski   2014-02-28   91  		return -EINVAL;
3f0c8206644836e Marek Szyprowski   2014-02-28   92  	}
3f0c8206644836e Marek Szyprowski   2014-02-28   93  	size =3D dt_mem_next_c=
ell(dt_root_size_cells, &prop);
3f0c8206644836e Marek Szyprowski   2014-02-28   94  =

3f0c8206644836e Marek Szyprowski   2014-02-28   95  	prop =3D of_get_flat_d=
t_prop(node, "alignment", &len);
3f0c8206644836e Marek Szyprowski   2014-02-28   96  	if (prop) {
3f0c8206644836e Marek Szyprowski   2014-02-28   97  		if (len !=3D dt_root_=
addr_cells * sizeof(__be32)) {
606ad42aa3b1fe8 Rob Herring        2016-06-15   98  			pr_err("invalid alig=
nment property in '%s' node.\n",
3f0c8206644836e Marek Szyprowski   2014-02-28   99  				uname);
3f0c8206644836e Marek Szyprowski   2014-02-28  100  			return -EINVAL;
3f0c8206644836e Marek Szyprowski   2014-02-28  101  		}
3f0c8206644836e Marek Szyprowski   2014-02-28  102  		align =3D dt_mem_next=
_cell(dt_root_addr_cells, &prop);
3f0c8206644836e Marek Szyprowski   2014-02-28  103  	}
3f0c8206644836e Marek Szyprowski   2014-02-28  104  =

6f1188b4ac7577c Yue Hu             2020-07-30  105  	nomap =3D of_get_flat_=
dt_prop(node, "no-map", NULL) !=3D NULL;
6f1188b4ac7577c Yue Hu             2020-07-30  106  =

1cc8e3458b51102 Jason Liu          2015-11-10  107  	/* Need adjust the ali=
gnment to satisfy the CMA requirement */
7d482813bb3518c Jaewon             2016-05-25  108  	if (IS_ENABLED(CONFIG_=
CMA)
7d482813bb3518c Jaewon             2016-05-25  109  	    && of_flat_dt_is_c=
ompatible(node, "shared-dma-pool")
7d482813bb3518c Jaewon             2016-05-25  110  	    && of_get_flat_dt_=
prop(node, "reusable", NULL)
6f1188b4ac7577c Yue Hu             2020-07-30  111  	    && !nomap) {
aaaab56dba9af4f Stephen Rothwell   2016-05-31  112  		unsigned long order =
=3D
aaaab56dba9af4f Stephen Rothwell   2016-05-31  113  			max_t(unsigned long,=
 MAX_ORDER - 1, pageblock_order);
aaaab56dba9af4f Stephen Rothwell   2016-05-31  114  =

aaaab56dba9af4f Stephen Rothwell   2016-05-31  115  		align =3D max(align, =
(phys_addr_t)PAGE_SIZE << order);
aaaab56dba9af4f Stephen Rothwell   2016-05-31  116  	}
1cc8e3458b51102 Jason Liu          2015-11-10  117  =

3f0c8206644836e Marek Szyprowski   2014-02-28  118  	prop =3D of_get_flat_d=
t_prop(node, "alloc-ranges", &len);
3f0c8206644836e Marek Szyprowski   2014-02-28  119  	if (prop) {
3f0c8206644836e Marek Szyprowski   2014-02-28  120  =

3f0c8206644836e Marek Szyprowski   2014-02-28  121  		if (len % t_len !=3D =
0) {
606ad42aa3b1fe8 Rob Herring        2016-06-15  122  			pr_err("invalid allo=
c-ranges property in '%s', skipping node.\n",
3f0c8206644836e Marek Szyprowski   2014-02-28  123  			       uname);
3f0c8206644836e Marek Szyprowski   2014-02-28  124  			return -EINVAL;
3f0c8206644836e Marek Szyprowski   2014-02-28  125  		}
3f0c8206644836e Marek Szyprowski   2014-02-28  126  =

3f0c8206644836e Marek Szyprowski   2014-02-28  127  		base =3D 0;
3f0c8206644836e Marek Szyprowski   2014-02-28  128  =

3f0c8206644836e Marek Szyprowski   2014-02-28  129  		while (len > 0) {
3f0c8206644836e Marek Szyprowski   2014-02-28  130  			start =3D dt_mem_nex=
t_cell(dt_root_addr_cells, &prop);
3f0c8206644836e Marek Szyprowski   2014-02-28  131  			end =3D start + dt_m=
em_next_cell(dt_root_size_cells,
3f0c8206644836e Marek Szyprowski   2014-02-28  132  						       &prop);
3f0c8206644836e Marek Szyprowski   2014-02-28  133  =

3f0c8206644836e Marek Szyprowski   2014-02-28  134  			ret =3D early_init_d=
t_alloc_reserved_memory_arch(size,
3f0c8206644836e Marek Szyprowski   2014-02-28  135  					align, start, end,=
 nomap, &base);
3f0c8206644836e Marek Szyprowski   2014-02-28  136  			if (ret =3D=3D 0) {
606ad42aa3b1fe8 Rob Herring        2016-06-15  137  				pr_debug("allocated=
 memory for '%s' node: base %pa, size %ld MiB\n",
3f0c8206644836e Marek Szyprowski   2014-02-28  138  					uname, &base,
3f0c8206644836e Marek Szyprowski   2014-02-28  139  					(unsigned long)siz=
e / SZ_1M);
3f0c8206644836e Marek Szyprowski   2014-02-28  140  				break;
3f0c8206644836e Marek Szyprowski   2014-02-28  141  			}
3f0c8206644836e Marek Szyprowski   2014-02-28  142  			len -=3D t_len;
3f0c8206644836e Marek Szyprowski   2014-02-28  143  		}
3f0c8206644836e Marek Szyprowski   2014-02-28  144  =

3f0c8206644836e Marek Szyprowski   2014-02-28  145  	} else {
3f0c8206644836e Marek Szyprowski   2014-02-28  146  		ret =3D early_init_dt=
_alloc_reserved_memory_arch(size, align,
3f0c8206644836e Marek Szyprowski   2014-02-28  147  							0, 0, nomap, &ba=
se);
3f0c8206644836e Marek Szyprowski   2014-02-28  148  		if (ret =3D=3D 0)
606ad42aa3b1fe8 Rob Herring        2016-06-15  149  			pr_debug("allocated =
memory for '%s' node: base %pa, size %ld MiB\n",
3f0c8206644836e Marek Szyprowski   2014-02-28  150  				uname, &base, (unsi=
gned long)size / SZ_1M);
3f0c8206644836e Marek Szyprowski   2014-02-28  151  	}
3f0c8206644836e Marek Szyprowski   2014-02-28  152  =

3f0c8206644836e Marek Szyprowski   2014-02-28  153  	if (base =3D=3D 0) {
606ad42aa3b1fe8 Rob Herring        2016-06-15  154  		pr_info("failed to al=
locate memory for node '%s'\n", uname);
3f0c8206644836e Marek Szyprowski   2014-02-28  155  		return -ENOMEM;
3f0c8206644836e Marek Szyprowski   2014-02-28  156  	}
3f0c8206644836e Marek Szyprowski   2014-02-28  157  =

3f0c8206644836e Marek Szyprowski   2014-02-28  158  	*res_base =3D base;
3f0c8206644836e Marek Szyprowski   2014-02-28  159  	*res_size =3D size;
3f0c8206644836e Marek Szyprowski   2014-02-28  160  =

3f0c8206644836e Marek Szyprowski   2014-02-28  161  	return 0;
3f0c8206644836e Marek Szyprowski   2014-02-28  162  }
3f0c8206644836e Marek Szyprowski   2014-02-28  163  =

f618c4703a14672 Marek Szyprowski   2014-02-28  164  static const struct of_=
device_id __rmem_of_table_sentinel
33def8498fdde18 Joe Perches        2020-10-21  165  	__used __section("__re=
servedmem_of_table_end");
f618c4703a14672 Marek Szyprowski   2014-02-28  166  =

ad1ce1ab061e7d1 Lee Jones          2021-03-18  167  /*
c8813f7ec01c676 chenqiwu           2020-05-11  168   * __reserved_mem_init_=
node() - call region specific reserved memory init code
f618c4703a14672 Marek Szyprowski   2014-02-28  169   */
f618c4703a14672 Marek Szyprowski   2014-02-28  170  static int __init __res=
erved_mem_init_node(struct reserved_mem *rmem)
f618c4703a14672 Marek Szyprowski   2014-02-28  171  {
f618c4703a14672 Marek Szyprowski   2014-02-28  172  	extern const struct of=
_device_id __reservedmem_of_table[];
f618c4703a14672 Marek Szyprowski   2014-02-28  173  	const struct of_device=
_id *i;
d0b8ed47e83a225 pierre Kuo         2019-02-19  174  	int ret =3D -ENOENT;
f618c4703a14672 Marek Szyprowski   2014-02-28  175  =

f618c4703a14672 Marek Szyprowski   2014-02-28  176  	for (i =3D __reservedm=
em_of_table; i < &__rmem_of_table_sentinel; i++) {
df3ed932394488e Rob Herring        2017-05-11  177  		reservedmem_of_init_f=
n initfn =3D i->data;
f618c4703a14672 Marek Szyprowski   2014-02-28  178  		const char *compat =
=3D i->compatible;
f618c4703a14672 Marek Szyprowski   2014-02-28  179  =

f618c4703a14672 Marek Szyprowski   2014-02-28  180  		if (!of_flat_dt_is_co=
mpatible(rmem->fdt_node, compat))
f618c4703a14672 Marek Szyprowski   2014-02-28  181  			continue;
f618c4703a14672 Marek Szyprowski   2014-02-28  182  =

d0b8ed47e83a225 pierre Kuo         2019-02-19  183  		ret =3D initfn(rmem);
d0b8ed47e83a225 pierre Kuo         2019-02-19  184  		if (ret =3D=3D 0) {
606ad42aa3b1fe8 Rob Herring        2016-06-15  185  			pr_info("initialized=
 node %s, compatible id %s\n",
f618c4703a14672 Marek Szyprowski   2014-02-28  186  				rmem->name, compat);
d0b8ed47e83a225 pierre Kuo         2019-02-19  187  			break;
f618c4703a14672 Marek Szyprowski   2014-02-28  188  		}
f618c4703a14672 Marek Szyprowski   2014-02-28  189  	}
d0b8ed47e83a225 pierre Kuo         2019-02-19  190  	return ret;
f618c4703a14672 Marek Szyprowski   2014-02-28  191  }
f618c4703a14672 Marek Szyprowski   2014-02-28  192  =

ae1add247bf8c22 Mitchel Humpherys  2015-09-15  193  static int __init __rme=
m_cmp(const void *a, const void *b)
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  194  {
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  195  	const struct reserved_=
mem *ra =3D a, *rb =3D b;
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  196  =

9eb8cd2b0780bca Michael Ellerman   2015-11-18  197  	if (ra->base < rb->bas=
e)
9eb8cd2b0780bca Michael Ellerman   2015-11-18  198  		return -1;
9eb8cd2b0780bca Michael Ellerman   2015-11-18  199  =

9eb8cd2b0780bca Michael Ellerman   2015-11-18  200  	if (ra->base > rb->bas=
e)
9eb8cd2b0780bca Michael Ellerman   2015-11-18  201  		return 1;
9eb8cd2b0780bca Michael Ellerman   2015-11-18  202  =

ca05f33316559a0 Vincent Whitchurch 2020-10-21  203  	/*
ca05f33316559a0 Vincent Whitchurch 2020-10-21  204  	 * Put the dynamic all=
ocations (address =3D=3D 0, size =3D=3D 0) before static
ca05f33316559a0 Vincent Whitchurch 2020-10-21  205  	 * allocations at addr=
ess 0x0 so that overlap detection works
ca05f33316559a0 Vincent Whitchurch 2020-10-21  206  	 * correctly.
ca05f33316559a0 Vincent Whitchurch 2020-10-21  207  	 */
ca05f33316559a0 Vincent Whitchurch 2020-10-21  208  	if (ra->size < rb->siz=
e)
ca05f33316559a0 Vincent Whitchurch 2020-10-21  209  		return -1;
ca05f33316559a0 Vincent Whitchurch 2020-10-21  210  	if (ra->size > rb->siz=
e)
ca05f33316559a0 Vincent Whitchurch 2020-10-21  211  		return 1;
ca05f33316559a0 Vincent Whitchurch 2020-10-21  212  =

9eb8cd2b0780bca Michael Ellerman   2015-11-18  213  	return 0;
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  214  }
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  215  =

ae1add247bf8c22 Mitchel Humpherys  2015-09-15  216  static void __init __rm=
em_check_for_overlap(void)
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  217  {
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  218  	int i;
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  219  =

ae1add247bf8c22 Mitchel Humpherys  2015-09-15  220  	if (reserved_mem_count=
 < 2)
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  221  		return;
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  222  =

ae1add247bf8c22 Mitchel Humpherys  2015-09-15  223  	sort(reserved_mem, res=
erved_mem_count, sizeof(reserved_mem[0]),
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  224  	     __rmem_cmp, NULL);
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  225  	for (i =3D 0; i < rese=
rved_mem_count - 1; i++) {
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  226  		struct reserved_mem *=
this, *next;
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  227  =

ae1add247bf8c22 Mitchel Humpherys  2015-09-15  228  		this =3D &reserved_me=
m[i];
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  229  		next =3D &reserved_me=
m[i + 1];
ca05f33316559a0 Vincent Whitchurch 2020-10-21  230  =

ae1add247bf8c22 Mitchel Humpherys  2015-09-15  231  		if (this->base + this=
->size > next->base) {
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  232  			phys_addr_t this_end=
, next_end;
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  233  =

ae1add247bf8c22 Mitchel Humpherys  2015-09-15  234  			this_end =3D this->b=
ase + this->size;
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  235  			next_end =3D next->b=
ase + next->size;
606ad42aa3b1fe8 Rob Herring        2016-06-15  236  			pr_err("OVERLAP DETE=
CTED!\n%s (%pa--%pa) overlaps with %s (%pa--%pa)\n",
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  237  			       this->name, &=
this->base, &this_end,
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  238  			       next->name, &=
next->base, &next_end);
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  239  		}
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  240  	}
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  241  }
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  242  =

3f0c8206644836e Marek Szyprowski   2014-02-28  243  /**
c8813f7ec01c676 chenqiwu           2020-05-11  244   * fdt_init_reserved_me=
m() - allocate and init all saved reserved memory regions
3f0c8206644836e Marek Szyprowski   2014-02-28  245   */
3f0c8206644836e Marek Szyprowski   2014-02-28 @246  void __init fdt_init_re=
served_mem(void)
3f0c8206644836e Marek Szyprowski   2014-02-28  247  {
3f0c8206644836e Marek Szyprowski   2014-02-28  248  	int i;
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  249  =

ae1add247bf8c22 Mitchel Humpherys  2015-09-15  250  	/* check for overlappi=
ng reserved regions */
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  251  	__rmem_check_for_overl=
ap();
ae1add247bf8c22 Mitchel Humpherys  2015-09-15  252  =

3f0c8206644836e Marek Szyprowski   2014-02-28  253  	for (i =3D 0; i < rese=
rved_mem_count; i++) {
3f0c8206644836e Marek Szyprowski   2014-02-28  254  		struct reserved_mem *=
rmem =3D &reserved_mem[i];
3f0c8206644836e Marek Szyprowski   2014-02-28  255  		unsigned long node =
=3D rmem->fdt_node;
9dcfee01930e6cc Marek Szyprowski   2014-07-14  256  		int len;
9dcfee01930e6cc Marek Szyprowski   2014-07-14  257  		const __be32 *prop;
3f0c8206644836e Marek Szyprowski   2014-02-28  258  		int err =3D 0;
6f1188b4ac7577c Yue Hu             2020-07-30  259  		bool nomap;
3f0c8206644836e Marek Szyprowski   2014-02-28  260  =

d0b8ed47e83a225 pierre Kuo         2019-02-19  261  		nomap =3D of_get_flat=
_dt_prop(node, "no-map", NULL) !=3D NULL;
9dcfee01930e6cc Marek Szyprowski   2014-07-14  262  		prop =3D of_get_flat_=
dt_prop(node, "phandle", &len);
9dcfee01930e6cc Marek Szyprowski   2014-07-14  263  		if (!prop)
9dcfee01930e6cc Marek Szyprowski   2014-07-14  264  			prop =3D of_get_flat=
_dt_prop(node, "linux,phandle", &len);
9dcfee01930e6cc Marek Szyprowski   2014-07-14  265  		if (prop)
9dcfee01930e6cc Marek Szyprowski   2014-07-14  266  			rmem->phandle =3D of=
_read_number(prop, len/4);
9dcfee01930e6cc Marek Szyprowski   2014-07-14  267  =

3f0c8206644836e Marek Szyprowski   2014-02-28  268  		if (rmem->size =3D=3D=
 0)
3f0c8206644836e Marek Szyprowski   2014-02-28  269  			err =3D __reserved_m=
em_alloc_size(node, rmem->name,
3f0c8206644836e Marek Szyprowski   2014-02-28  270  						 &rmem->base, &rm=
em->size);
d0b8ed47e83a225 pierre Kuo         2019-02-19  271  		if (err =3D=3D 0) {
d0b8ed47e83a225 pierre Kuo         2019-02-19  272  			err =3D __reserved_m=
em_init_node(rmem);
d0b8ed47e83a225 pierre Kuo         2019-02-19  273  			if (err !=3D 0 && er=
r !=3D -ENOENT) {
d0b8ed47e83a225 pierre Kuo         2019-02-19  274  				pr_info("node %s co=
mpatible matching fail\n",
d0b8ed47e83a225 pierre Kuo         2019-02-19  275  					rmem->name);
d0b8ed47e83a225 pierre Kuo         2019-02-19  276  				memblock_free(rmem-=
>base, rmem->size);
d0b8ed47e83a225 pierre Kuo         2019-02-19  277  				if (nomap)
d0b8ed47e83a225 pierre Kuo         2019-02-19  278  					memblock_add(rmem-=
>base, rmem->size);
d0b8ed47e83a225 pierre Kuo         2019-02-19  279  			}
d0b8ed47e83a225 pierre Kuo         2019-02-19  280  		}
3f0c8206644836e Marek Szyprowski   2014-02-28  281  	}
3f0c8206644836e Marek Szyprowski   2014-02-28  282  }
9dcfee01930e6cc Marek Szyprowski   2014-07-14  283  =


:::::: The code at line 51 was first introduced by commit
:::::: 3f0c8206644836e4f10a6b9fc47cda6a9a372f9b drivers: of: add initializa=
tion code for dynamic reserved memory

:::::: TO: Marek Szyprowski <m.szyprowski@samsung.com>
:::::: CC: Grant Likely <grant.likely@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3515960971620825061==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3515960971620825061==--

