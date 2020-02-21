Content-Type: multipart/mixed; boundary="===============0984265708522292923=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [hch-misc:dma-inline-remap.2 5/5] kernel/dma/direct.c:144: undefined reference to `arch_dma_prep_coherent'
Date: Sat, 22 Feb 2020 07:32:42 +0800
Message-ID: <202002220739.J1BO0iLw%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0984265708522292923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/hch/misc.git dma-inline-remap.2
head:   099575d1501796e13f502a8002489f150adf4f33
commit: 099575d1501796e13f502a8002489f150adf4f33 [5/5] openrisc: use the ge=
neric in-place uncached DMA allocator
config: openrisc-randconfig-a001-20200221 (attached as .config)
compiler: or1k-linux-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 099575d1501796e13f502a8002489f150adf4f33
        # save the attached .config to linux build tree
        GCC_VERSION=3D9.2.0 make.cross ARCH=3Dopenrisc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   or1k-linux-ld: kernel/dma/direct.o: in function `dma_direct_alloc_pages':
>> kernel/dma/direct.c:144: undefined reference to `arch_dma_prep_coherent'
   kernel/dma/direct.c:144:(.text+0xc34): relocation truncated to fit: R_OR=
1K_INSN_REL_26 against undefined symbol `arch_dma_prep_coherent'
>> or1k-linux-ld: kernel/dma/direct.c:185: undefined reference to `arch_dma=
_prep_coherent'
   kernel/dma/direct.c:185:(.text+0xca0): relocation truncated to fit: R_OR=
1K_INSN_REL_26 against undefined symbol `arch_dma_prep_coherent'

vim +144 kernel/dma/direct.c

b18814e767a445 kernel/dma/direct.c Christoph Hellwig     2018-11-04  120  =

b18814e767a445 kernel/dma/direct.c Christoph Hellwig     2018-11-04  121  v=
oid *dma_direct_alloc_pages(struct device *dev, size_t size,
b18814e767a445 kernel/dma/direct.c Christoph Hellwig     2018-11-04  122  	=
	dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
b18814e767a445 kernel/dma/direct.c Christoph Hellwig     2018-11-04  123  {
b18814e767a445 kernel/dma/direct.c Christoph Hellwig     2018-11-04  124  	=
struct page *page;
b18814e767a445 kernel/dma/direct.c Christoph Hellwig     2018-11-04  125  	=
void *ret;
b18814e767a445 kernel/dma/direct.c Christoph Hellwig     2018-11-04  126  =

3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  127  	=
if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  128  	=
    dma_alloc_need_uncached(dev, attrs) &&
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  129  	=
    !gfpflags_allow_blocking(gfp)) {
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  130  	=
	ret =3D dma_alloc_from_pool(PAGE_ALIGN(size), &page, gfp);
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  131  	=
	if (!ret)
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  132  	=
		return NULL;
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  133  	=
	goto done;
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  134  	}
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  135  =

4e1003aa56a7d6 kernel/dma/direct.c Christoph Hellwig     2019-10-29  136  	=
page =3D __dma_direct_alloc_pages(dev, size, gfp, attrs);
080321d3b3139b lib/dma-direct.c    Christoph Hellwig     2017-12-22  137  	=
if (!page)
080321d3b3139b lib/dma-direct.c    Christoph Hellwig     2017-12-22  138  	=
	return NULL;
b18814e767a445 kernel/dma/direct.c Christoph Hellwig     2018-11-04  139  =

cf14be0b41c659 kernel/dma/direct.c Christoph Hellwig     2019-08-06  140  	=
if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
cf14be0b41c659 kernel/dma/direct.c Christoph Hellwig     2019-08-06  141  	=
    !force_dma_unencrypted(dev)) {
d98849aff87911 kernel/dma/direct.c Christoph Hellwig     2019-06-14  142  	=
	/* remove any dirty cache lines on the kernel alias */
d98849aff87911 kernel/dma/direct.c Christoph Hellwig     2019-06-14  143  	=
	if (!PageHighMem(page))
d98849aff87911 kernel/dma/direct.c Christoph Hellwig     2019-06-14 @144  	=
		arch_dma_prep_coherent(page, size);
d98849aff87911 kernel/dma/direct.c Christoph Hellwig     2019-06-14  145  	=
	/* return the page pointer as the opaque cookie */
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  146  	=
	ret =3D page;
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  147  	=
	goto done;
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  148  	}
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  149  =

3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  150  	=
if ((IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  151  	=
     dma_alloc_need_uncached(dev, attrs)) ||
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  152  	=
    (IS_ENABLED(CONFIG_DMA_REMAP) && PageHighMem(page))) {
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  153  	=
	/* remove any dirty cache lines on the kernel alias */
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  154  	=
	arch_dma_prep_coherent(page, PAGE_ALIGN(size));
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  155  =

3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  156  	=
	/* create a coherent mapping */
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  157  	=
	ret =3D dma_common_contiguous_remap(page, PAGE_ALIGN(size),
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  158  	=
			dma_pgprot(dev, PAGE_KERNEL, attrs),
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  159  	=
			__builtin_return_address(0));
a4a71658512ac9 kernel/dma/direct.c Christoph Hellwig     2020-02-21  160  	=
	if (!ret)
a4a71658512ac9 kernel/dma/direct.c Christoph Hellwig     2020-02-21  161  	=
		goto out_free_pages;
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  162  	=
	memset(ret, 0, size);
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  163  	=
	goto done;
d98849aff87911 kernel/dma/direct.c Christoph Hellwig     2019-06-14  164  	}
d98849aff87911 kernel/dma/direct.c Christoph Hellwig     2019-06-14  165  =

704f2c20eaa566 kernel/dma/direct.c Christoph Hellwig     2018-09-22  166  	=
if (PageHighMem(page)) {
704f2c20eaa566 kernel/dma/direct.c Christoph Hellwig     2018-09-22  167  	=
	/*
704f2c20eaa566 kernel/dma/direct.c Christoph Hellwig     2018-09-22  168  	=
	 * Depending on the cma=3D arguments and per-arch setup
b1d2dc009dece4 kernel/dma/direct.c Nicolin Chen          2019-05-23  169  	=
	 * dma_alloc_contiguous could return highmem pages.
704f2c20eaa566 kernel/dma/direct.c Christoph Hellwig     2018-09-22  170  	=
	 * Without remapping there is no way to return them here,
704f2c20eaa566 kernel/dma/direct.c Christoph Hellwig     2018-09-22  171  	=
	 * so log an error and fail.
704f2c20eaa566 kernel/dma/direct.c Christoph Hellwig     2018-09-22  172  	=
	 */
704f2c20eaa566 kernel/dma/direct.c Christoph Hellwig     2018-09-22  173  	=
	dev_info(dev, "Rejecting highmem page from CMA.\n");
a4a71658512ac9 kernel/dma/direct.c Christoph Hellwig     2020-02-21  174  	=
	goto out_free_pages;
704f2c20eaa566 kernel/dma/direct.c Christoph Hellwig     2018-09-22  175  	}
704f2c20eaa566 kernel/dma/direct.c Christoph Hellwig     2018-09-22  176  =

c10f07aa27dadf lib/dma-direct.c    Christoph Hellwig     2018-03-19  177  	=
ret =3D page_address(page);
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  178  	=
if (force_dma_unencrypted(dev))
b18814e767a445 kernel/dma/direct.c Christoph Hellwig     2018-11-04  179  	=
	set_memory_decrypted((unsigned long)ret, 1 << get_order(size));
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  180  =

c10f07aa27dadf lib/dma-direct.c    Christoph Hellwig     2018-03-19  181  	=
memset(ret, 0, size);
c30700db9eaabb kernel/dma/direct.c Christoph Hellwig     2019-06-03  182  =

f329c0fbbc43ab kernel/dma/direct.c Christoph Hellwig     2020-02-21  183  	=
if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
4b85faed211ccf kernel/dma/direct.c Christoph Hellwig     2019-06-14  184  	=
    dma_alloc_need_uncached(dev, attrs)) {
c30700db9eaabb kernel/dma/direct.c Christoph Hellwig     2019-06-03 @185  	=
	arch_dma_prep_coherent(page, size);
f329c0fbbc43ab kernel/dma/direct.c Christoph Hellwig     2020-02-21  186  	=
	ret =3D arch_dma_set_uncached(ret, size);
f329c0fbbc43ab kernel/dma/direct.c Christoph Hellwig     2020-02-21  187  	=
	if (IS_ERR(ret))
f329c0fbbc43ab kernel/dma/direct.c Christoph Hellwig     2020-02-21  188  	=
		goto out_free_pages;
c30700db9eaabb kernel/dma/direct.c Christoph Hellwig     2019-06-03  189  	}
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  190  d=
one:
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  191  	=
if (force_dma_unencrypted(dev))
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  192  	=
	*dma_handle =3D __phys_to_dma(dev, page_to_phys(page));
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  193  	=
else
3acac065508f6c kernel/dma/direct.c Christoph Hellwig     2019-10-29  194  	=
	*dma_handle =3D phys_to_dma(dev, page_to_phys(page));
c10f07aa27dadf lib/dma-direct.c    Christoph Hellwig     2018-03-19  195  	=
return ret;
a4a71658512ac9 kernel/dma/direct.c Christoph Hellwig     2020-02-21  196  o=
ut_free_pages:
a4a71658512ac9 kernel/dma/direct.c Christoph Hellwig     2020-02-21  197  	=
dma_free_contiguous(dev, page, size);
a4a71658512ac9 kernel/dma/direct.c Christoph Hellwig     2020-02-21  198  	=
return NULL;
a8463d4b0e47d1 lib/dma-noop.c      Christian Borntraeger 2016-02-02  199  }
a8463d4b0e47d1 lib/dma-noop.c      Christian Borntraeger 2016-02-02  200  =


:::::: The code@line 144 was first introduced by commit
:::::: d98849aff87911013aadb730138ab728b52fc547 dma-direct: handle DMA_ATTR=
_NO_KERNEL_MAPPING in common code

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0984265708522292923==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0984265708522292923==--

