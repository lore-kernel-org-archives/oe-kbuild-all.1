Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CF74F1E6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705669147; cv=none; b=tG0MSFWcB6VdpvloAqV/evn9pJk2IbxufYSi5XZrEcGne2UEg200tYdRkdbyaknACjhlJ23YwWq8Pd5t+/+vglI2+uyznQdXzOA3D0VwLSrddwb09pxOUao1ekTWxzOHAtyGSGTEyGzGfFD8CTPAnqi2Y2R0E1pKnPqGFDjhZrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705669147; c=relaxed/simple;
	bh=9rD3fXjq3dzvJQ3+CBpvcDmmCGof3L2NwxvSEqvRd8U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M/5es+XaGnu/3NV855S8JYWPgBHFZntTAQ7cBrmoSA3PB1Pi+ux4PxuGSoPWZ0e0UCJ8ogT6lnH9kxxqYOLPy6fNOINbQzbNJhU1SbKlRQXWyxZhNYBhDpwy9ZYSv7LrpQBwmTOTiLNqCehKFa6CbMT/YwxALBJ7Xb/5gDsLeZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWsy03c3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWsy03c3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705669146; x=1737205146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9rD3fXjq3dzvJQ3+CBpvcDmmCGof3L2NwxvSEqvRd8U=;
  b=gWsy03c35WGt5UXF3TLyuz6N99pKDGDYF0vXnfjaupepqNmokSepAD9f
   D5h/SbmoSTaHh73Iw4ZHAEGl5ea0t98nAAV0LoKQmlQlhKXPRQnn54Rck
   HN2IxiDUjVWVBbh1klv2qawHsfg8Z8mZjzE/+EaBJOTfO2EsGxHl3cf7h
   NANRscuhsXGS2nM3k18199j1+iXdgtfwtOvXj/dlQZXgmT0fFGK3GwfwH
   ZmzUVN6e50LP7/BT3wDI5rnYZFv1XfKpOVVvl27N6km+qMqkZujLKvPLT
   Pl93jyaLO0JR+fEWJQ4Du/FGAy2hckSvhEL7yhMS2EpCqXsyyIwwdkAnl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7439993"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7439993"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 04:59:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="785067922"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="785067922"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Jan 2024 04:59:01 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQoSY-00043m-1x;
	Fri, 19 Jan 2024 12:58:58 +0000
Date: Fri, 19 Jan 2024 20:58:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1360/2445] mm/share_pool.c:1468:7: warning:
 variable 'is_hugepage' set but not used
Message-ID: <202401192029.BVlaRTDd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8d727c541fb1354691d382ff487a8c37162c75c2
commit: eaafc4a2a3fd023a99c44286895074dd5712706f [1360/2445] mm/sharepool: Implement mg_sp_unshare_kva
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240119/202401192029.BVlaRTDd-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401192029.BVlaRTDd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401192029.BVlaRTDd-lkp@intel.com/

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
