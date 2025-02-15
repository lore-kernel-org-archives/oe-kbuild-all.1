Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF38F4ED
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 01:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739583888; cv=none; b=fygWbgCFBlXudMWvcxNNG1ogfKIPptBrG9t2MITpciwVcgbvNZ/t0Uu13a9rVg5mKh+kp47zbb2o8ln6j/mEibH4FiJjb08SM0IDp4EmV4+4FADXZYFBBaREN7dRJeqMyD4qK0gbtFpqTF9J3V7PGDL3XYnvePHLp8PC2lRDDtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739583888; c=relaxed/simple;
	bh=LGVmRsvNN5dnTxcfp3I6162/yGtrpcfE0Zhe6G0owyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UwdpZL4tinWciIaObWvwmbXh1/bwHfQJfN/IcKr9hRBTczPXMGXrxAfqt81RMA/qXUTSC+n24k4Us9i+4CYAY0spfkISWIm82qoEWbW9sxri23cZsjeI+XQC6Z7BLW6Rymh/E6aBESUpKYo4hBlbA3VvfhSvV2L1tAEXr1HU6p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dygg95IJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dygg95IJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739583885; x=1771119885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LGVmRsvNN5dnTxcfp3I6162/yGtrpcfE0Zhe6G0owyI=;
  b=Dygg95IJ603oNThLhslJqYHjKZOPCZ6bQxiwxaDCOo0KvQUBQetB0Swh
   ItqoEjuwB3LzKqtRjcGwCkhf9fE2idSe/NrpZGC/4zOkxe37XktdF+DKX
   Hd3hWHShzbiTP96c3/4puvQiipRc5DvisWd3bocNU+q4F++tushjB8aif
   xXyflLKM5EDs+UUZW7TzapFteRfoqjD2hFmpuQzpG+2A0DYrijMUKhrsQ
   gr0ngchbimLsInRthru85OM1g9vkKCuzik9+9C6JmXGl8oHDwAcXQIpHb
   KD0BxOE73NUsxzbcmUpvCAdG1gKxifG8On5FRRlOvMrwT/k4JGDluHpM3
   w==;
X-CSE-ConnectionGUID: s6vHMPzGTdKuGgt9wk2nmA==
X-CSE-MsgGUID: YSJK5PKsSaO+jm7uC0qf5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="62814349"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="62814349"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 17:44:44 -0800
X-CSE-ConnectionGUID: bl+dIbuhQ0OdrAoONL0hFw==
X-CSE-MsgGUID: y51TpvsJQBCpGyyaI1PP1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="113801369"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Feb 2025 17:44:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj7EW-001APF-2X;
	Sat, 15 Feb 2025 01:44:40 +0000
Date: Sat, 15 Feb 2025 09:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1926/1926] mm/share_pool.c:1468:7: warning:
 variable 'is_hugepage' set but not used
Message-ID: <202502150929.DA6B0wcU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   56197cf035ddc0d25f6d27169455448133fd75dd
commit: eaafc4a2a3fd023a99c44286895074dd5712706f [1926/1926] mm/sharepool: Implement mg_sp_unshare_kva
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250215/202502150929.DA6B0wcU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150929.DA6B0wcU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150929.DA6B0wcU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/share_pool.c:1468:7: warning: variable 'is_hugepage' set but not used [-Wunused-but-set-variable]
    1468 |         bool is_hugepage = true;
         |              ^
   mm/share_pool.c:73:12: warning: unused variable 'system_group_count' [-Wunused-variable]
      73 | static int system_group_count;
         |            ^~~~~~~~~~~~~~~~~~
   mm/share_pool.c:76:19: warning: unused variable 'sp_group_idr' [-Wunused-variable]
      76 | static DEFINE_IDR(sp_group_idr);
         |                   ^~~~~~~~~~~~
   include/linux/idr.h:56:37: note: expanded from macro 'DEFINE_IDR'
      56 | #define DEFINE_IDR(name)        struct idr name = IDR_INIT(name)
         |                                            ^~~~
   mm/share_pool.c:223:20: warning: unused function 'sp_add_group_master' [-Wunused-function]
     223 | static inline void sp_add_group_master(struct sp_group_master *master)
         |                    ^~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:230:20: warning: unused function 'sp_del_group_master' [-Wunused-function]
     230 | static inline void sp_del_group_master(struct sp_group_master *master)
         |                    ^~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:237:13: warning: unused function 'meminfo_init' [-Wunused-function]
     237 | static void meminfo_init(struct sp_meminfo *meminfo)
         |             ^~~~~~~~~~~~
   mm/share_pool.c:274:20: warning: unused function 'meminfo_alloc_sum_byKB' [-Wunused-function]
     274 | static inline long meminfo_alloc_sum_byKB(struct sp_meminfo *meminfo)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:279:20: warning: unused function 'meminfo_k2u_size' [-Wunused-function]
     279 | static inline long meminfo_k2u_size(struct sp_meminfo *meminfo)
         |                    ^~~~~~~~~~~~~~~~
   mm/share_pool.c:284:25: warning: unused function 'meminfo_total_size' [-Wunused-function]
     284 | static inline long long meminfo_total_size(struct sp_meminfo *meminfo)
         |                         ^~~~~~~~~~~~~~~~~~
   mm/share_pool.c:380:13: warning: unused function 'sp_mapping_detach' [-Wunused-function]
     380 | static void sp_mapping_detach(struct sp_group *spg, struct sp_mapping *spm)
         |             ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:438:12: warning: unused function 'sp_group_setup_mapping_normal' [-Wunused-function]
     438 | static int sp_group_setup_mapping_normal(struct mm_struct *mm, struct sp_group *spg)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:485:13: warning: unused function 'update_mem_usage_alloc' [-Wunused-function]
     485 | static void update_mem_usage_alloc(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:497:13: warning: unused function 'update_mem_usage_k2u' [-Wunused-function]
     497 | static void update_mem_usage_k2u(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:582:22: warning: unused function 'spa_size' [-Wunused-function]
     582 | static unsigned long spa_size(struct sp_area *spa)
         |                      ^~~~~~~~
   mm/share_pool.c:587:21: warning: unused function 'spa_file' [-Wunused-function]
     587 | static struct file *spa_file(struct sp_area *spa)
         |                     ^~~~~~~~
   mm/share_pool.c:791:24: warning: unused function 'sp_area_alloc' [-Wunused-function]
     791 | static struct sp_area *sp_area_alloc(unsigned long size, unsigned long flags,
         |                        ^~~~~~~~~~~~~
   mm/share_pool.c:944:24: warning: unused function 'sp_area_get' [-Wunused-function]
     944 | static struct sp_area *sp_area_get(struct sp_group *spg,
         |                        ^~~~~~~~~~~
   mm/share_pool.c:1005:13: warning: unused function 'sp_area_put_locked' [-Wunused-function]
    1005 | static void sp_area_put_locked(struct sp_area *spa)
         |             ^~~~~~~~~~~~~~~~~~
   18 warnings generated.


vim +/is_hugepage +1468 mm/share_pool.c

  1460	
  1461	/* No possible concurrent protection, take care when use */
  1462	static int sp_unshare_kva(unsigned long kva, unsigned long size)
  1463	{
  1464		unsigned long addr, kva_aligned;
  1465		struct page *page;
  1466		unsigned long size_aligned;
  1467		unsigned long step;
> 1468		bool is_hugepage = true;
  1469		int ret;
  1470	
  1471		ret = is_vmap_hugepage(kva);
  1472		if (ret > 0) {
  1473			kva_aligned = ALIGN_DOWN(kva, PMD_SIZE);
  1474			size_aligned = ALIGN(kva + size, PMD_SIZE) - kva_aligned;
  1475			step = PMD_SIZE;
  1476		} else if (ret == 0) {
  1477			kva_aligned = ALIGN_DOWN(kva, PAGE_SIZE);
  1478			size_aligned = ALIGN(kva + size, PAGE_SIZE) - kva_aligned;
  1479			step = PAGE_SIZE;
  1480			is_hugepage = false;
  1481		} else {
  1482			pr_err_ratelimited("check vmap hugepage failed %d\n", ret);
  1483			return -EINVAL;
  1484		}
  1485	
  1486		if (kva_aligned + size_aligned < kva_aligned) {
  1487			pr_err_ratelimited("overflow happened in unshare kva\n");
  1488			return -EINVAL;
  1489		}
  1490	
  1491		for (addr = kva_aligned; addr < (kva_aligned + size_aligned); addr += step) {
  1492			page = vmalloc_to_page((void *)addr);
  1493			if (page)
  1494				put_page(page);
  1495			else
  1496				WARN(1, "vmalloc %pK to page/hugepage failed\n",
  1497				       (void *)addr);
  1498		}
  1499	
  1500		vunmap((void *)kva_aligned);
  1501	
  1502		return 0;
  1503	}
  1504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
