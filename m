Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039861D433F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 22:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729980391; cv=none; b=pzyOYntWl2IZYEXqg2txtLAkR4hdBNe1vqo+GGCMIcCgfiyDVoVYItqLy6vHBYl2LGL0Qap2Co/1E9+nWgkdHqHcaXOkDAMftNiQru0DoPbKbMdhf0XWZVZ0/GylIlQ4f/WD3b+r4lsuIfFJSr6j4gmWopzBZ7e9yybit45O0I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729980391; c=relaxed/simple;
	bh=wKzEuxNHY7t7577GxAlampdfmwLf2mc6oTtPfoGpAwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g2m7uAAt6OSssc+ZrVhAgv5VV60FOtH7yAqIhIwhZxGGgmwNToZCKt/bz8JxZcSJ+w++HHDFiC+NSCG81AIxh0NlpQMnY74YMk94ai7pDk6f8+nK7mMnS6tPnhiyycWD6rl/VvbY5b8UFHNMAJJ3eh+TdKeskAoVDA73C2oB1fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iaxxToEF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iaxxToEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729980389; x=1761516389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wKzEuxNHY7t7577GxAlampdfmwLf2mc6oTtPfoGpAwg=;
  b=iaxxToEFRqFgb+4jep1QoF4u4w0oW2sro1Ti0W6jPMBx33NHgAjz6buu
   qlm8yeyyGExlKyhCuR/tQHwgqBLl4egjpKDpKWX7idgsEgcZx1/p9rSfc
   pG8z0ONyR5VGe0vY7y+27RODH8C0y1fKz9bog6TR0A69wnY4tuoOdUCD2
   2Qcy7LVTVgzMu+aUk3KwTlWu5FWfTyo6E+vl9hBwVJLcu2npm+uGG2sku
   upvIYZV3zyQMOWyVdDPIDuu+cyKI2AX/1yyRCkjINIUstGVk32l7H7ads
   CPLXZighT6jJfSKzL92wgXd7OTFhA2nUUEXgr8PKKe9FGlJEMHCMbeAGP
   A==;
X-CSE-ConnectionGUID: KwJPjjUtRnuVJz35fIaTgQ==
X-CSE-MsgGUID: StSVLWeUQ+mxkegYRNdC4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="47111520"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="47111520"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 15:06:26 -0700
X-CSE-ConnectionGUID: iQwPpdwNTHa81xKyLFHJEA==
X-CSE-MsgGUID: H44oO6gmRI6T/cjT4izP+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="81287759"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Oct 2024 15:06:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4ovO-000a5E-2S;
	Sat, 26 Oct 2024 22:06:22 +0000
Date: Sun, 27 Oct 2024 06:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1359/15331] mm/share_pool.c:1226:21: error:
 implicit declaration of function 'huge_ptep_get'
Message-ID: <202410270650.btnHpujZ-lkp@intel.com>
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
head:   9d0af12b79bee784902822ddeec2e1a8cfc18524
commit: 549b1f40b56511536196f7522ffa4d7b3da42337 [1359/15331] mm/sharepool: Implement mg_sp_make_share_u2k()
config: arm64-randconfig-003-20241027 (https://download.01.org/0day-ci/archive/20241027/202410270650.btnHpujZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270650.btnHpujZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270650.btnHpujZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c: In function 'sp_hugetlb_entry':
>> mm/share_pool.c:1226:21: error: implicit declaration of function 'huge_ptep_get' [-Wimplicit-function-declaration]
    1226 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
>> mm/share_pool.c:1226:21: error: invalid initializer
   mm/share_pool.c: At top level:
   mm/share_pool.c:1005:13: warning: 'sp_area_put_locked' defined but not used [-Wunused-function]
    1005 | static void sp_area_put_locked(struct sp_area *spa)
         |             ^~~~~~~~~~~~~~~~~~
   mm/share_pool.c:944:24: warning: 'sp_area_get' defined but not used [-Wunused-function]
     944 | static struct sp_area *sp_area_get(struct sp_group *spg,
         |                        ^~~~~~~~~~~
   mm/share_pool.c:791:24: warning: 'sp_area_alloc' defined but not used [-Wunused-function]
     791 | static struct sp_area *sp_area_alloc(unsigned long size, unsigned long flags,
         |                        ^~~~~~~~~~~~~
   mm/share_pool.c:587:21: warning: 'spa_file' defined but not used [-Wunused-function]
     587 | static struct file *spa_file(struct sp_area *spa)
         |                     ^~~~~~~~
   mm/share_pool.c:582:22: warning: 'spa_size' defined but not used [-Wunused-function]
     582 | static unsigned long spa_size(struct sp_area *spa)
         |                      ^~~~~~~~
   mm/share_pool.c:497:13: warning: 'update_mem_usage_k2u' defined but not used [-Wunused-function]
     497 | static void update_mem_usage_k2u(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:485:13: warning: 'update_mem_usage_alloc' defined but not used [-Wunused-function]
     485 | static void update_mem_usage_alloc(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:438:12: warning: 'sp_group_setup_mapping_normal' defined but not used [-Wunused-function]
     438 | static int sp_group_setup_mapping_normal(struct mm_struct *mm, struct sp_group *spg)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:380:13: warning: 'sp_mapping_detach' defined but not used [-Wunused-function]
     380 | static void sp_mapping_detach(struct sp_group *spg, struct sp_mapping *spm)
         |             ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:237:13: warning: 'meminfo_init' defined but not used [-Wunused-function]
     237 | static void meminfo_init(struct sp_meminfo *meminfo)
         |             ^~~~~~~~~~~~
   In file included from mm/share_pool.c:26:
   mm/share_pool.c:76:19: warning: 'sp_group_idr' defined but not used [-Wunused-variable]
      76 | static DEFINE_IDR(sp_group_idr);
         |                   ^~~~~~~~~~~~
   include/linux/idr.h:56:44: note: in definition of macro 'DEFINE_IDR'
      56 | #define DEFINE_IDR(name)        struct idr name = IDR_INIT(name)
         |                                            ^~~~
   mm/share_pool.c:73:12: warning: 'system_group_count' defined but not used [-Wunused-variable]
      73 | static int system_group_count;
         |            ^~~~~~~~~~~~~~~~~~


vim +/huge_ptep_get +1226 mm/share_pool.c

  1221	
  1222	static int sp_hugetlb_entry(pte_t *ptep, unsigned long hmask,
  1223				    unsigned long addr, unsigned long next,
  1224				    struct mm_walk *walk)
  1225	{
> 1226		pte_t pte = huge_ptep_get(ptep);
  1227		struct page *page = pte_page(pte);
  1228		struct sp_walk_data *sp_walk_data;
  1229	
  1230		if (unlikely(!pte_present(pte))) {
  1231			pr_debug("the page of addr %lx unexpectedly not in RAM\n", (unsigned long)addr);
  1232			return -EFAULT;
  1233		}
  1234	
  1235		sp_walk_data = walk->private;
  1236		get_page(page);
  1237		sp_walk_data->pages[sp_walk_data->page_count++] = page;
  1238		return 0;
  1239	}
  1240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
