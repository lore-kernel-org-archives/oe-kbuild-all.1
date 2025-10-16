Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB58627464F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 20:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760647972; cv=none; b=gyN48lkKHRsXkcQDjVUkZ879WypZkloPU2qxLYfMS3V0N9Lv7ZV0WGTx4AoHrCCnFjJ0gf56w0oUr9gJfMXztLAanSwltbuVGx4Lo5Sq+ZVQ+YI7jowyCn5fRJ70uNRYLeekxoT2uh0lAu/CRtDj2tE1HOJIVWFObCKjfcmMBiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760647972; c=relaxed/simple;
	bh=gdygreD3zftwFxVsI5CkoUvLVPMVUwINdpvuYT3D5fk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sXbdUDtdWZkz2EhxzIE51Ylp48gnjrjfl06lMpqgTR3CzdF9KQSKovQTk59J+t7Wyf3rZQ/RvKMGHcTplVb9xU+JJGWO6ZdzqKfYiz0O70fOkuFrWpjbnGuRpUVx1QhN9vRbVf9aklQrjBWjt4J1WZ3xYhqcnsa5ZAhqlhoC0uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2KHVdYr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2KHVdYr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760647971; x=1792183971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gdygreD3zftwFxVsI5CkoUvLVPMVUwINdpvuYT3D5fk=;
  b=L2KHVdYrfHU83s+rQ4bmQqmZM9F60+YCJpj66qEwbXRnFxMxmQkSO3nB
   qFpVuDj4zsxNcQH+iqQFGtrIxqNYGPToZgs2Wir2l2qnp+FMAOsLfgD3G
   tceErTUarFWugeVpLdnkGvCpE4nfS/+qJ8gMzrZOEPINTTyiYi7OmV2BL
   gjUHVTvppn87OK+/Khkzi55XP5Hbm5XofbTrXn9v1xougZ3ejTn9QhAfC
   Y3GAUDa/RndjC0A7EYth1X+swvARi2u5cLRr0Gafw+Uwaz23zoTkZuU4I
   3aUIYqnU6U+zymebHea4Ih9+Fqgxe5DWG+IRX5WLxgge6nXtigMa0SVIh
   w==;
X-CSE-ConnectionGUID: /F/VNW3SQiSIS0XUt3gChA==
X-CSE-MsgGUID: oFnXAq8jSpKNzETg7NDsNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62764612"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62764612"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 13:52:50 -0700
X-CSE-ConnectionGUID: UXiysblpRIiRR3IXtDn4Vg==
X-CSE-MsgGUID: Ii6alLC2RiK7qCVUoh/htw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="186819944"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2025 13:52:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Uxq-0005EZ-18;
	Thu, 16 Oct 2025 20:52:46 +0000
Date: Fri, 17 Oct 2025 04:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2976/2976] mm/share_pool.c:1226:14: error: call
 to undeclared function 'huge_ptep_get'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202510170439.APHP7d94-lkp@intel.com>
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
head:   65461ffb14372269f333f0e18867775c14741e76
commit: 549b1f40b56511536196f7522ffa4d7b3da42337 [2976/2976] mm/sharepool: Implement mg_sp_make_share_u2k()
config: arm64-randconfig-004-20251017 (https://download.01.org/0day-ci/archive/20251017/202510170439.APHP7d94-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170439.APHP7d94-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170439.APHP7d94-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/share_pool.c:21:
   In file included from include/linux/share_pool.h:5:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/share_pool.c:1226:14: error: call to undeclared function 'huge_ptep_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1226 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^
>> mm/share_pool.c:1226:8: error: initializing 'pte_t' with an expression of incompatible type 'int'
    1226 |         pte_t pte = huge_ptep_get(ptep);
         |               ^     ~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


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
