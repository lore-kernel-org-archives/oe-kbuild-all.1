Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C8E6CDB6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 21:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709500808; cv=none; b=WmmrnfL2xT+F2sEdVfpApf1jtq3Dce1h2oEQu4uWBJwliXELYX9/EpILdRJRU2b4RTtotxWnvS97CXSGKwe0uhrcajuO9u9vf/57YOCds6aR7iGj43I1eBigLlpA6zBWZhD95raTQ9dXctf2IUNLUGRThJrMMaBW4twdM82xNJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709500808; c=relaxed/simple;
	bh=6bCDrFrw9IHXfqpeecw/kX8uLOXnCNx0fPGUQ7kKHP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nTYITSoZ9NzuLOB56yotL2Gzz6UghXDs3RnQKMuzCo4lmIusCmVYlFuXpLUmv5pUjUfp+EbDS9FF+ggq71Cp/fAdCrEbV4hNfS8kiF4FU/JJP7gTvZQ/dqM4fT7Ck/+iXm9M5DCIUKWtZ/HpnDFrrtM7JaBPR/c8g0wdXTcNNE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ij/kLJxH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ij/kLJxH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709500806; x=1741036806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6bCDrFrw9IHXfqpeecw/kX8uLOXnCNx0fPGUQ7kKHP8=;
  b=Ij/kLJxHDr3E1Kq0CNJ2bZ3YfGPy9jarO0RnZ9Msh+mariM+LdFQXqtW
   0KekbPQB7/5YYiXgEBgKGdsuajTlAv70E7rC53GSNa0sMFfJwZTxSlKSq
   MGKhV5fKSV99fjtOHcUiW5xOVYdRc9A9KlR5QzwinaYJ8y3akSH6NOu2m
   onVPXv5nW3h5nZ1KuHNHcdER0ofHNrQ5u6evUqCm34R6sLTvbwoE3DiIh
   +mclgfZruJmvb8moP9Q6PLranU85Zv2ov8BaQHODgc9r9EfOg09PgZwaW
   1046e8R6SkrdxFonrrlGcBtg73Ecx0ay/dHZQkiIdade1Ish9Ai09Nzp2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="21438319"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="21438319"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 13:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="46292798"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Mar 2024 13:20:02 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgtFY-00027M-09;
	Sun, 03 Mar 2024 21:20:00 +0000
Date: Mon, 4 Mar 2024 05:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Luis Claudio R. Goncalves" <lclaudio@uudg.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (VMware)" <rostedt@goodmis.org>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [cip:linux-4.19.y-cip-rt-rebase 6311/29558] mm/zswap.c:995:30:
 warning: 'zswap_dstmem_lock' defined but not used
Message-ID: <202403040541.1welhCaJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Luis,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   dce1701e767e33da39db64fe691cd4783ec7dbbf
commit: 80f3230e0d571c7450ab13b885c8e4273ddb1d86 [6311/29558] mm/zswap: Do not disable preemption in zswap_frontswap_store()
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240304/202403040541.1welhCaJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040541.1welhCaJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040541.1welhCaJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   In file included from include/linux/kernel.h:10,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from mm/zswap.c:25:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:31:26: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:328:23: note: in definition of macro '__compiletime_assert'
     328 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:348:9: note: in expansion of macro '_compiletime_assert'
     348 |         _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_assert'
      45 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:69:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      69 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:31:9: note: in expansion of macro 'BUILD_BUG_ON'
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/memremap.h:7,
                    from include/linux/mm.h:27,
                    from include/linux/highmem.h:8,
                    from mm/zswap.c:27:
   include/linux/mm.h: In function 'pgtable_init':
   arch/um/include/asm/pgtable.h:35:33: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      35 | #define pgtable_cache_init() do ; while (0)
         |                                 ^
   include/linux/mm.h:1919:9: note: in expansion of macro 'pgtable_cache_init'
    1919 |         pgtable_cache_init();
         |         ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/uaccess.h:14,
                    from include/linux/highmem.h:9:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:36: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from mm/zswap.c:30:
   mm/zswap.c: At top level:
>> mm/zswap.c:995:30: warning: 'zswap_dstmem_lock' defined but not used [-Wunused-const-variable=]
     995 | static DEFINE_LOCAL_IRQ_LOCK(zswap_dstmem_lock);
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~


vim +/zswap_dstmem_lock +995 mm/zswap.c

   993	
   994	/* protect zswap_dstmem from concurrency */
 > 995	static DEFINE_LOCAL_IRQ_LOCK(zswap_dstmem_lock);
   996	/*********************************
   997	* frontswap hooks
   998	**********************************/
   999	/* attempts to compress and store an single page */
  1000	static int zswap_frontswap_store(unsigned type, pgoff_t offset,
  1001					struct page *page)
  1002	{
  1003		struct zswap_tree *tree = zswap_trees[type];
  1004		struct zswap_entry *entry, *dupentry;
  1005		struct crypto_comp *tfm;
  1006		int ret;
  1007		unsigned int hlen, dlen = PAGE_SIZE;
  1008		unsigned long handle, value;
  1009		char *buf;
  1010		u8 *src, *dst;
  1011		struct zswap_header zhdr = { .swpentry = swp_entry(type, offset) };
  1012	
  1013		/* THP isn't supported */
  1014		if (PageTransHuge(page)) {
  1015			ret = -EINVAL;
  1016			goto reject;
  1017		}
  1018	
  1019		if (!zswap_enabled || !tree) {
  1020			ret = -ENODEV;
  1021			goto reject;
  1022		}
  1023	
  1024		/* reclaim space if needed */
  1025		if (zswap_is_full()) {
  1026			zswap_pool_limit_hit++;
  1027			if (zswap_shrink()) {
  1028				zswap_reject_reclaim_fail++;
  1029				ret = -ENOMEM;
  1030				goto reject;
  1031			}
  1032	
  1033			/* A second zswap_is_full() check after
  1034			 * zswap_shrink() to make sure it's now
  1035			 * under the max_pool_percent
  1036			 */
  1037			if (zswap_is_full()) {
  1038				ret = -ENOMEM;
  1039				goto reject;
  1040			}
  1041		}
  1042	
  1043		/* allocate entry */
  1044		entry = zswap_entry_cache_alloc(GFP_KERNEL);
  1045		if (!entry) {
  1046			zswap_reject_kmemcache_fail++;
  1047			ret = -ENOMEM;
  1048			goto reject;
  1049		}
  1050	
  1051		if (zswap_same_filled_pages_enabled) {
  1052			src = kmap_atomic(page);
  1053			if (zswap_is_page_same_filled(src, &value)) {
  1054				kunmap_atomic(src);
  1055				entry->offset = offset;
  1056				entry->length = 0;
  1057				entry->value = value;
  1058				atomic_inc(&zswap_same_filled_pages);
  1059				goto insert_entry;
  1060			}
  1061			kunmap_atomic(src);
  1062		}
  1063	
  1064		/* if entry is successfully added, it keeps the reference */
  1065		entry->pool = zswap_pool_current_get();
  1066		if (!entry->pool) {
  1067			ret = -EINVAL;
  1068			goto freepage;
  1069		}
  1070	
  1071		/* compress */
  1072		dst = get_locked_var(zswap_dstmem_lock, zswap_dstmem);
  1073		tfm = *this_cpu_ptr(entry->pool->tfm);
  1074		src = kmap_atomic(page);
  1075		ret = crypto_comp_compress(tfm, src, PAGE_SIZE, dst, &dlen);
  1076		kunmap_atomic(src);
  1077		if (ret) {
  1078			ret = -EINVAL;
  1079			goto put_dstmem;
  1080		}
  1081	
  1082		/* store */
  1083		hlen = zpool_evictable(entry->pool->zpool) ? sizeof(zhdr) : 0;
  1084		ret = zpool_malloc(entry->pool->zpool, hlen + dlen,
  1085				   __GFP_NORETRY | __GFP_NOWARN | __GFP_KSWAPD_RECLAIM,
  1086				   &handle);
  1087		if (ret == -ENOSPC) {
  1088			zswap_reject_compress_poor++;
  1089			goto put_dstmem;
  1090		}
  1091		if (ret) {
  1092			zswap_reject_alloc_fail++;
  1093			goto put_dstmem;
  1094		}
  1095		buf = zpool_map_handle(entry->pool->zpool, handle, ZPOOL_MM_RW);
  1096		memcpy(buf, &zhdr, hlen);
  1097		memcpy(buf + hlen, dst, dlen);
  1098		zpool_unmap_handle(entry->pool->zpool, handle);
  1099		put_locked_var(zswap_dstmem_lock, zswap_dstmem);
  1100	
  1101		/* populate entry */
  1102		entry->offset = offset;
  1103		entry->handle = handle;
  1104		entry->length = dlen;
  1105	
  1106	insert_entry:
  1107		/* map */
  1108		spin_lock(&tree->lock);
  1109		do {
  1110			ret = zswap_rb_insert(&tree->rbroot, entry, &dupentry);
  1111			if (ret == -EEXIST) {
  1112				zswap_duplicate_entry++;
  1113				/* remove from rbtree */
  1114				zswap_rb_erase(&tree->rbroot, dupentry);
  1115				zswap_entry_put(tree, dupentry);
  1116			}
  1117		} while (ret == -EEXIST);
  1118		spin_unlock(&tree->lock);
  1119	
  1120		/* update stats */
  1121		atomic_inc(&zswap_stored_pages);
  1122		zswap_update_total_size();
  1123	
  1124		return 0;
  1125	
  1126	put_dstmem:
  1127		put_locked_var(zswap_dstmem_lock, zswap_dstmem);
  1128		zswap_pool_put(entry->pool);
  1129	freepage:
  1130		zswap_entry_cache_free(entry);
  1131	reject:
  1132		return ret;
  1133	}
  1134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
