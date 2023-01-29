Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9452ABD25
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 06:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674973432; x=1706509432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IrGxYuBDNvnI+H4QQ1vxPciQ4UOVawfjyxaH61VVu3o=;
  b=SozuXTfy9qJMtFrPX/iVCezW6+Wz2Ef7c/FrE/L66aVCgV+g7ezzg6Wg
   NEspJza2F54jQtHh2kYnWvCkT50B1Qkevhc0mB2N4VF6lhq7rUbmAMT/u
   +BleZzo860LyimCfIGegNHOSTwbA2j4KZfUyG7qWFU+WnCy5wUzUped3F
   pG2MLwRgDiA/T5abpaOjXBe17t0ZecVzgiwPhsT1JEGL3L6HHj585xmRA
   dTTR9TRo01bHPj0tJayhLSqlIlnRoI8GGwfubPusLB45IxLtWk8QelzuJ
   tmCUezxwj4VUaljx+zbz0YvTXFWUDDmDav8rj5lTczxZMdi7UWutF1Lcu
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="389748404"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="389748404"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 22:23:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="909117908"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="909117908"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jan 2023 22:23:49 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM16S-0002WY-2n;
	Sun, 29 Jan 2023 06:23:48 +0000
Date: Sun, 29 Jan 2023 14:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.3-next 41/235]
 include/linux/slab.h:584:16: warning: argument 1 value
 '18446744073709551615' exceeds maximum object size 9223372036854775807
Message-ID: <202301291422.8FPWcXIA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.3-next
head:   e1ff6e29c348f48dfcdb7f879d52a823c859a65d
commit: 0096f1573f9419e2d0156389c9bd0cb721d674da [41/235] Kbuild: consolidate warning flags in scripts/Makefile.extrawarn
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230129/202301291422.8FPWcXIA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?id=0096f1573f9419e2d0156389c9bd0cb721d674da
        git remote add arnd-playground https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git
        git fetch --no-tags arnd-playground randconfig-6.3-next
        git checkout 0096f1573f9419e2d0156389c9bd0cb721d674da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from lib/assoc_array.c:11:
   In function 'kmalloc',
       inlined from 'assoc_array_gc' at lib/assoc_array.c:1493:11:
>> include/linux/slab.h:584:16: warning: argument 1 value '18446744073709551615' exceeds maximum object size 9223372036854775807 [-Walloc-size-larger-than=]
     584 |         return __kmalloc(size, flags);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h: In function 'assoc_array_gc':
   include/linux/slab.h:463:7: note: in a call to allocation function '__kmalloc' declared here
     463 | void *__kmalloc(size_t size, gfp_t flags) __assume_kmalloc_alignment __alloc_size(1);
         |       ^~~~~~~~~
--
   In file included from net/wireless/nl80211.c:14:
   In function 'kmalloc',
       inlined from 'kzalloc' at include/linux/slab.h:720:9,
       inlined from 'nl80211_set_cqm_rssi.isra' at net/wireless/nl80211.c:12673:16:
>> include/linux/slab.h:584:16: warning: argument 1 value '18446744073709551615' exceeds maximum object size 9223372036854775807 [-Walloc-size-larger-than=]
     584 |         return __kmalloc(size, flags);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h: In function 'nl80211_set_cqm_rssi.isra':
   include/linux/slab.h:463:7: note: in a call to allocation function '__kmalloc' declared here
     463 | void *__kmalloc(size_t size, gfp_t flags) __assume_kmalloc_alignment __alloc_size(1);
         |       ^~~~~~~~~
--
   In file included from include/linux/resource_ext.h:11,
                    from include/linux/pci.h:40,
                    from drivers/iommu/intel/dmar.c:19:
   In function 'kmalloc',
       inlined from 'kzalloc' at include/linux/slab.h:720:9,
       inlined from 'dmar_alloc_pci_notify_info' at drivers/iommu/intel/dmar.c:147:10:
>> include/linux/slab.h:584:16: warning: argument 1 value '18446744073709551615' exceeds maximum object size 9223372036854775807 [-Walloc-size-larger-than=]
     584 |         return __kmalloc(size, flags);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h: In function 'dmar_alloc_pci_notify_info':
   include/linux/slab.h:463:7: note: in a call to allocation function '__kmalloc' declared here
     463 | void *__kmalloc(size_t size, gfp_t flags) __assume_kmalloc_alignment __alloc_size(1);
         |       ^~~~~~~~~


vim +/18446744073709551615 +584 include/linux/slab.h

ca257195511d53 Jesper Dangaard Brouer 2016-03-15  498  
c37495d6254c23 Kees Cook              2021-11-05  499  void *__kmalloc_node(size_t size, gfp_t flags, int node) __assume_kmalloc_alignment
c37495d6254c23 Kees Cook              2021-11-05  500  							 __alloc_size(1);
72d67229f522e3 Kees Cook              2021-11-05  501  void *kmem_cache_alloc_node(struct kmem_cache *s, gfp_t flags, int node) __assume_slab_alignment
72d67229f522e3 Kees Cook              2021-11-05  502  									 __malloc;
f1b6eb6e6be149 Christoph Lameter      2013-09-04  503  
26a40990ba052e Hyeonggon Yoo          2022-08-17  504  void *kmalloc_trace(struct kmem_cache *s, gfp_t flags, size_t size)
26a40990ba052e Hyeonggon Yoo          2022-08-17  505  		    __assume_kmalloc_alignment __alloc_size(3);
f1b6eb6e6be149 Christoph Lameter      2013-09-04  506  
26a40990ba052e Hyeonggon Yoo          2022-08-17  507  void *kmalloc_node_trace(struct kmem_cache *s, gfp_t gfpflags,
26a40990ba052e Hyeonggon Yoo          2022-08-17  508  			 int node, size_t size) __assume_kmalloc_alignment
c37495d6254c23 Kees Cook              2021-11-05  509  						__alloc_size(4);
e4c98d68959e51 Hyeonggon Yoo          2022-08-17  510  void *kmalloc_large(size_t size, gfp_t flags) __assume_page_alignment
c37495d6254c23 Kees Cook              2021-11-05  511  					      __alloc_size(1);
a0c3b940023eef Hyeonggon Yoo          2022-08-17  512  
a0c3b940023eef Hyeonggon Yoo          2022-08-17  513  void *kmalloc_large_node(size_t size, gfp_t flags, int node) __assume_page_alignment
a0c3b940023eef Hyeonggon Yoo          2022-08-17  514  							     __alloc_size(1);
a0c3b940023eef Hyeonggon Yoo          2022-08-17  515  
f1b6eb6e6be149 Christoph Lameter      2013-09-04  516  /**
838de63b101147 Vlastimil Babka        2022-11-10  517   * kmalloc - allocate kernel memory
f1b6eb6e6be149 Christoph Lameter      2013-09-04  518   * @size: how many bytes of memory are required.
838de63b101147 Vlastimil Babka        2022-11-10  519   * @flags: describe the allocation context
f1b6eb6e6be149 Christoph Lameter      2013-09-04  520   *
f1b6eb6e6be149 Christoph Lameter      2013-09-04  521   * kmalloc is the normal method of allocating memory
f1b6eb6e6be149 Christoph Lameter      2013-09-04  522   * for objects smaller than page size in the kernel.
7e3528c3660a2e Randy Dunlap           2013-11-22  523   *
59bb47985c1db2 Vlastimil Babka        2019-10-06  524   * The allocated object address is aligned to at least ARCH_KMALLOC_MINALIGN
59bb47985c1db2 Vlastimil Babka        2019-10-06  525   * bytes. For @size of power of two bytes, the alignment is also guaranteed
59bb47985c1db2 Vlastimil Babka        2019-10-06  526   * to be at least to the size.
59bb47985c1db2 Vlastimil Babka        2019-10-06  527   *
01598ba6b1a863 Mike Rapoport          2018-11-11  528   * The @flags argument may be one of the GFP flags defined at
01598ba6b1a863 Mike Rapoport          2018-11-11  529   * include/linux/gfp.h and described at
01598ba6b1a863 Mike Rapoport          2018-11-11  530   * :ref:`Documentation/core-api/mm-api.rst <mm-api-gfp-flags>`
7e3528c3660a2e Randy Dunlap           2013-11-22  531   *
01598ba6b1a863 Mike Rapoport          2018-11-11  532   * The recommended usage of the @flags is described at
2370ae4b1d5aa7 Mauro Carvalho Chehab  2020-04-10  533   * :ref:`Documentation/core-api/memory-allocation.rst <memory_allocation>`
7e3528c3660a2e Randy Dunlap           2013-11-22  534   *
01598ba6b1a863 Mike Rapoport          2018-11-11  535   * Below is a brief outline of the most useful GFP flags
7e3528c3660a2e Randy Dunlap           2013-11-22  536   *
01598ba6b1a863 Mike Rapoport          2018-11-11  537   * %GFP_KERNEL
01598ba6b1a863 Mike Rapoport          2018-11-11  538   *	Allocate normal kernel ram. May sleep.
7e3528c3660a2e Randy Dunlap           2013-11-22  539   *
01598ba6b1a863 Mike Rapoport          2018-11-11  540   * %GFP_NOWAIT
01598ba6b1a863 Mike Rapoport          2018-11-11  541   *	Allocation will not sleep.
7e3528c3660a2e Randy Dunlap           2013-11-22  542   *
01598ba6b1a863 Mike Rapoport          2018-11-11  543   * %GFP_ATOMIC
01598ba6b1a863 Mike Rapoport          2018-11-11  544   *	Allocation will not sleep.  May use emergency pools.
7e3528c3660a2e Randy Dunlap           2013-11-22  545   *
7e3528c3660a2e Randy Dunlap           2013-11-22  546   * Also it is possible to set different flags by OR'ing
7e3528c3660a2e Randy Dunlap           2013-11-22  547   * in one or more of the following additional @flags:
7e3528c3660a2e Randy Dunlap           2013-11-22  548   *
838de63b101147 Vlastimil Babka        2022-11-10  549   * %__GFP_ZERO
838de63b101147 Vlastimil Babka        2022-11-10  550   *	Zero the allocated memory before returning. Also see kzalloc().
838de63b101147 Vlastimil Babka        2022-11-10  551   *
01598ba6b1a863 Mike Rapoport          2018-11-11  552   * %__GFP_HIGH
01598ba6b1a863 Mike Rapoport          2018-11-11  553   *	This allocation has high priority and may use emergency pools.
7e3528c3660a2e Randy Dunlap           2013-11-22  554   *
01598ba6b1a863 Mike Rapoport          2018-11-11  555   * %__GFP_NOFAIL
01598ba6b1a863 Mike Rapoport          2018-11-11  556   *	Indicate that this allocation is in no way allowed to fail
7e3528c3660a2e Randy Dunlap           2013-11-22  557   *	(think twice before using).
7e3528c3660a2e Randy Dunlap           2013-11-22  558   *
01598ba6b1a863 Mike Rapoport          2018-11-11  559   * %__GFP_NORETRY
01598ba6b1a863 Mike Rapoport          2018-11-11  560   *	If memory is not immediately available,
7e3528c3660a2e Randy Dunlap           2013-11-22  561   *	then give up at once.
7e3528c3660a2e Randy Dunlap           2013-11-22  562   *
01598ba6b1a863 Mike Rapoport          2018-11-11  563   * %__GFP_NOWARN
01598ba6b1a863 Mike Rapoport          2018-11-11  564   *	If allocation fails, don't issue any warnings.
7e3528c3660a2e Randy Dunlap           2013-11-22  565   *
01598ba6b1a863 Mike Rapoport          2018-11-11  566   * %__GFP_RETRY_MAYFAIL
01598ba6b1a863 Mike Rapoport          2018-11-11  567   *	Try really hard to succeed the allocation but fail
dcda9b04713c3f Michal Hocko           2017-07-12  568   *	eventually.
f1b6eb6e6be149 Christoph Lameter      2013-09-04  569   */
3bf019334fbbb5 Kees Cook              2022-11-17  570  #ifndef CONFIG_SLOB
c37495d6254c23 Kees Cook              2021-11-05  571  static __always_inline __alloc_size(1) void *kmalloc(size_t size, gfp_t flags)
f1b6eb6e6be149 Christoph Lameter      2013-09-04  572  {
6fa57d78aa7f21 Kees Cook              2022-11-17  573  	if (__builtin_constant_p(size) && size) {
cc252eae85e095 Vlastimil Babka        2018-10-26  574  		unsigned int index;
3bf019334fbbb5 Kees Cook              2022-11-17  575  
f1b6eb6e6be149 Christoph Lameter      2013-09-04  576  		if (size > KMALLOC_MAX_CACHE_SIZE)
f1b6eb6e6be149 Christoph Lameter      2013-09-04  577  			return kmalloc_large(size, flags);
f1b6eb6e6be149 Christoph Lameter      2013-09-04  578  
cc252eae85e095 Vlastimil Babka        2018-10-26  579  		index = kmalloc_index(size);
26a40990ba052e Hyeonggon Yoo          2022-08-17  580  		return kmalloc_trace(
cc252eae85e095 Vlastimil Babka        2018-10-26  581  				kmalloc_caches[kmalloc_type(flags)][index],
f1b6eb6e6be149 Christoph Lameter      2013-09-04  582  				flags, size);
f1b6eb6e6be149 Christoph Lameter      2013-09-04  583  	}
f1b6eb6e6be149 Christoph Lameter      2013-09-04 @584  	return __kmalloc(size, flags);
f1b6eb6e6be149 Christoph Lameter      2013-09-04  585  }
3bf019334fbbb5 Kees Cook              2022-11-17  586  #else
3bf019334fbbb5 Kees Cook              2022-11-17  587  static __always_inline __alloc_size(1) void *kmalloc(size_t size, gfp_t flags)
3bf019334fbbb5 Kees Cook              2022-11-17  588  {
3bf019334fbbb5 Kees Cook              2022-11-17  589  	if (__builtin_constant_p(size) && size > KMALLOC_MAX_CACHE_SIZE)
3bf019334fbbb5 Kees Cook              2022-11-17  590  		return kmalloc_large(size, flags);
3bf019334fbbb5 Kees Cook              2022-11-17  591  
3bf019334fbbb5 Kees Cook              2022-11-17  592  	return __kmalloc(size, flags);
3bf019334fbbb5 Kees Cook              2022-11-17  593  }
3bf019334fbbb5 Kees Cook              2022-11-17  594  #endif
ce6a50263d4dde Christoph Lameter      2013-01-10  595  
bf37d791022ecf Hyeonggon Yoo          2022-08-17  596  #ifndef CONFIG_SLOB
c37495d6254c23 Kees Cook              2021-11-05  597  static __always_inline __alloc_size(1) void *kmalloc_node(size_t size, gfp_t flags, int node)
f1b6eb6e6be149 Christoph Lameter      2013-09-04  598  {
6fa57d78aa7f21 Kees Cook              2022-11-17  599  	if (__builtin_constant_p(size) && size) {
bf37d791022ecf Hyeonggon Yoo          2022-08-17  600  		unsigned int index;
f1b6eb6e6be149 Christoph Lameter      2013-09-04  601  
bf37d791022ecf Hyeonggon Yoo          2022-08-17  602  		if (size > KMALLOC_MAX_CACHE_SIZE)
bf37d791022ecf Hyeonggon Yoo          2022-08-17  603  			return kmalloc_large_node(size, flags, node);
bf37d791022ecf Hyeonggon Yoo          2022-08-17  604  
bf37d791022ecf Hyeonggon Yoo          2022-08-17  605  		index = kmalloc_index(size);
26a40990ba052e Hyeonggon Yoo          2022-08-17  606  		return kmalloc_node_trace(
bf37d791022ecf Hyeonggon Yoo          2022-08-17  607  				kmalloc_caches[kmalloc_type(flags)][index],
f1b6eb6e6be149 Christoph Lameter      2013-09-04  608  				flags, node, size);
f1b6eb6e6be149 Christoph Lameter      2013-09-04  609  	}
f1b6eb6e6be149 Christoph Lameter      2013-09-04  610  	return __kmalloc_node(size, flags, node);
f1b6eb6e6be149 Christoph Lameter      2013-09-04  611  }
bf37d791022ecf Hyeonggon Yoo          2022-08-17  612  #else
bf37d791022ecf Hyeonggon Yoo          2022-08-17  613  static __always_inline __alloc_size(1) void *kmalloc_node(size_t size, gfp_t flags, int node)
bf37d791022ecf Hyeonggon Yoo          2022-08-17  614  {
bf37d791022ecf Hyeonggon Yoo          2022-08-17  615  	if (__builtin_constant_p(size) && size > KMALLOC_MAX_CACHE_SIZE)
bf37d791022ecf Hyeonggon Yoo          2022-08-17  616  		return kmalloc_large_node(size, flags, node);
bf37d791022ecf Hyeonggon Yoo          2022-08-17  617  
bf37d791022ecf Hyeonggon Yoo          2022-08-17  618  	return __kmalloc_node(size, flags, node);
bf37d791022ecf Hyeonggon Yoo          2022-08-17  619  }
bf37d791022ecf Hyeonggon Yoo          2022-08-17  620  #endif
f1b6eb6e6be149 Christoph Lameter      2013-09-04  621  
e7efa615ccf783 Michael Opdenacker     2013-06-25  622  /**
e7efa615ccf783 Michael Opdenacker     2013-06-25  623   * kmalloc_array - allocate memory for an array.
e7efa615ccf783 Michael Opdenacker     2013-06-25  624   * @n: number of elements.
e7efa615ccf783 Michael Opdenacker     2013-06-25  625   * @size: element size.
e7efa615ccf783 Michael Opdenacker     2013-06-25  626   * @flags: the type of memory to allocate (see kmalloc).
800590f523bf3b Paul Drynoff           2006-06-23  627   */
c37495d6254c23 Kees Cook              2021-11-05  628  static inline __alloc_size(1, 2) void *kmalloc_array(size_t n, size_t size, gfp_t flags)
^1da177e4c3f41 Linus Torvalds         2005-04-16  629  {
49b7f8983aa785 Kees Cook              2018-05-08  630  	size_t bytes;
49b7f8983aa785 Kees Cook              2018-05-08  631  
49b7f8983aa785 Kees Cook              2018-05-08  632  	if (unlikely(check_mul_overflow(n, size, &bytes)))
6193a2ff180920 Paul Mundt             2007-07-15  633  		return NULL;
91c6a05f72a996 Alexey Dobriyan        2016-07-26  634  	if (__builtin_constant_p(n) && __builtin_constant_p(size))
49b7f8983aa785 Kees Cook              2018-05-08  635  		return kmalloc(bytes, flags);
49b7f8983aa785 Kees Cook              2018-05-08  636  	return __kmalloc(bytes, flags);
a8203725dfded5 Xi Wang                2012-03-05  637  }
a8203725dfded5 Xi Wang                2012-03-05  638  
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  639  /**
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  640   * krealloc_array - reallocate memory for an array.
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  641   * @p: pointer to the memory chunk to reallocate
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  642   * @new_n: new number of elements to alloc
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  643   * @new_size: new size of a single member of the array
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  644   * @flags: the type of memory to allocate (see kmalloc)
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  645   */
9ed9cac1850a2a Kees Cook              2022-09-23  646  static inline __realloc_size(2, 3) void * __must_check krealloc_array(void *p,
c37495d6254c23 Kees Cook              2021-11-05  647  								      size_t new_n,
c37495d6254c23 Kees Cook              2021-11-05  648  								      size_t new_size,
72d67229f522e3 Kees Cook              2021-11-05  649  								      gfp_t flags)
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  650  {
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  651  	size_t bytes;
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  652  
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  653  	if (unlikely(check_mul_overflow(new_n, new_size, &bytes)))
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  654  		return NULL;
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  655  
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  656  	return krealloc(p, bytes, flags);
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  657  }
f0dbd2bd1c22c6 Bartosz Golaszewski    2020-12-14  658  
a8203725dfded5 Xi Wang                2012-03-05  659  /**
a8203725dfded5 Xi Wang                2012-03-05  660   * kcalloc - allocate memory for an array. The memory is set to zero.
a8203725dfded5 Xi Wang                2012-03-05  661   * @n: number of elements.
a8203725dfded5 Xi Wang                2012-03-05  662   * @size: element size.
a8203725dfded5 Xi Wang                2012-03-05  663   * @flags: the type of memory to allocate (see kmalloc).
a8203725dfded5 Xi Wang                2012-03-05  664   */
c37495d6254c23 Kees Cook              2021-11-05  665  static inline __alloc_size(1, 2) void *kcalloc(size_t n, size_t size, gfp_t flags)
a8203725dfded5 Xi Wang                2012-03-05  666  {
a8203725dfded5 Xi Wang                2012-03-05  667  	return kmalloc_array(n, size, flags | __GFP_ZERO);
^1da177e4c3f41 Linus Torvalds         2005-04-16  668  }
^1da177e4c3f41 Linus Torvalds         2005-04-16  669  
c45248db04f8e3 Hyeonggon Yoo          2022-08-17  670  void *__kmalloc_node_track_caller(size_t size, gfp_t flags, int node,
c45248db04f8e3 Hyeonggon Yoo          2022-08-17  671  				  unsigned long caller) __alloc_size(1);
c45248db04f8e3 Hyeonggon Yoo          2022-08-17  672  #define kmalloc_node_track_caller(size, flags, node) \
c45248db04f8e3 Hyeonggon Yoo          2022-08-17  673  	__kmalloc_node_track_caller(size, flags, node, \
c45248db04f8e3 Hyeonggon Yoo          2022-08-17  674  				    _RET_IP_)
c45248db04f8e3 Hyeonggon Yoo          2022-08-17  675  
1d2c8eea698514 Christoph Hellwig      2006-10-04  676  /*
1d2c8eea698514 Christoph Hellwig      2006-10-04  677   * kmalloc_track_caller is a special version of kmalloc that records the
1d2c8eea698514 Christoph Hellwig      2006-10-04  678   * calling function of the routine calling it for slab leak tracking instead
1d2c8eea698514 Christoph Hellwig      2006-10-04  679   * of just the calling function (confusing, eh?).
1d2c8eea698514 Christoph Hellwig      2006-10-04  680   * It's useful when the call to kmalloc comes from a widely-used standard
1d2c8eea698514 Christoph Hellwig      2006-10-04  681   * allocator where we care about the real place the memory allocation
1d2c8eea698514 Christoph Hellwig      2006-10-04  682   * request comes from.
1d2c8eea698514 Christoph Hellwig      2006-10-04  683   */
1d2c8eea698514 Christoph Hellwig      2006-10-04  684  #define kmalloc_track_caller(size, flags) \
c45248db04f8e3 Hyeonggon Yoo          2022-08-17  685  	__kmalloc_node_track_caller(size, flags, \
c45248db04f8e3 Hyeonggon Yoo          2022-08-17  686  				    NUMA_NO_NODE, _RET_IP_)
^1da177e4c3f41 Linus Torvalds         2005-04-16  687  
c37495d6254c23 Kees Cook              2021-11-05  688  static inline __alloc_size(1, 2) void *kmalloc_array_node(size_t n, size_t size, gfp_t flags,
5799b255c491d8 Johannes Thumshirn     2017-11-15  689  							  int node)
5799b255c491d8 Johannes Thumshirn     2017-11-15  690  {
49b7f8983aa785 Kees Cook              2018-05-08  691  	size_t bytes;
49b7f8983aa785 Kees Cook              2018-05-08  692  
49b7f8983aa785 Kees Cook              2018-05-08  693  	if (unlikely(check_mul_overflow(n, size, &bytes)))
5799b255c491d8 Johannes Thumshirn     2017-11-15  694  		return NULL;
5799b255c491d8 Johannes Thumshirn     2017-11-15  695  	if (__builtin_constant_p(n) && __builtin_constant_p(size))
49b7f8983aa785 Kees Cook              2018-05-08  696  		return kmalloc_node(bytes, flags, node);
49b7f8983aa785 Kees Cook              2018-05-08  697  	return __kmalloc_node(bytes, flags, node);
5799b255c491d8 Johannes Thumshirn     2017-11-15  698  }
5799b255c491d8 Johannes Thumshirn     2017-11-15  699  
c37495d6254c23 Kees Cook              2021-11-05  700  static inline __alloc_size(1, 2) void *kcalloc_node(size_t n, size_t size, gfp_t flags, int node)
5799b255c491d8 Johannes Thumshirn     2017-11-15  701  {
5799b255c491d8 Johannes Thumshirn     2017-11-15  702  	return kmalloc_array_node(n, size, flags | __GFP_ZERO, node);
5799b255c491d8 Johannes Thumshirn     2017-11-15  703  }
5799b255c491d8 Johannes Thumshirn     2017-11-15  704  
81cda6626178cd Christoph Lameter      2007-07-17  705  /*
81cda6626178cd Christoph Lameter      2007-07-17  706   * Shortcuts
81cda6626178cd Christoph Lameter      2007-07-17  707   */
81cda6626178cd Christoph Lameter      2007-07-17  708  static inline void *kmem_cache_zalloc(struct kmem_cache *k, gfp_t flags)
81cda6626178cd Christoph Lameter      2007-07-17  709  {
81cda6626178cd Christoph Lameter      2007-07-17  710  	return kmem_cache_alloc(k, flags | __GFP_ZERO);
81cda6626178cd Christoph Lameter      2007-07-17  711  }
81cda6626178cd Christoph Lameter      2007-07-17  712  
81cda6626178cd Christoph Lameter      2007-07-17  713  /**
81cda6626178cd Christoph Lameter      2007-07-17  714   * kzalloc - allocate memory. The memory is set to zero.
81cda6626178cd Christoph Lameter      2007-07-17  715   * @size: how many bytes of memory are required.
81cda6626178cd Christoph Lameter      2007-07-17  716   * @flags: the type of memory to allocate (see kmalloc).
81cda6626178cd Christoph Lameter      2007-07-17  717   */
c37495d6254c23 Kees Cook              2021-11-05  718  static inline __alloc_size(1) void *kzalloc(size_t size, gfp_t flags)
81cda6626178cd Christoph Lameter      2007-07-17  719  {
81cda6626178cd Christoph Lameter      2007-07-17 @720  	return kmalloc(size, flags | __GFP_ZERO);
81cda6626178cd Christoph Lameter      2007-07-17  721  }
81cda6626178cd Christoph Lameter      2007-07-17  722  

:::::: The code at line 584 was first introduced by commit
:::::: f1b6eb6e6be149b40ebb013f5bfe2ac86b6f1c1b mm/sl[aou]b: Move kmallocXXX functions to common code

:::::: TO: Christoph Lameter <cl@linux.com>
:::::: CC: Pekka Enberg <penberg@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
