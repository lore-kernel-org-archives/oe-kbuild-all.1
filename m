Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2328EEBD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 00:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cydRW9+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705019235; x=1736555235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JPaXpwEDXZo+kgpou/OY1IeWkw+JDGD8i3xSyNc6s8w=;
  b=cydRW9+ULF7q2MFSHF1TwH5+QR9EtnD0fHBpcV+TO35dtjuEkuVfh6cF
   xVWgf7OfNNinSx2g6EZIYhbc+YHDqyqou+UTXr56G3FMhCid1N4h24pja
   oysx2x46xvxeRVXzn4ruKkggBA8YqE1mDdYEF0rLCIJpDzXPuR9/30Ayk
   PpUA9OljUCmQYCDYjYPUPsIXWQRoW31YI10uigxhXB+guk/O2+uiAl1CX
   LgtICfdaBOdngZVc1tOr8W3L16MqeV7QA92eQL37hiZhrnnH+vyBLkOvh
   lDO7kTAK8aQPX/4dMWHhVs68FsBQ5IX+JVfsxuEf+DLOxIa42eU4ujBsx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="397919463"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="397919463"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 16:27:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="853121898"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="853121898"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 11 Jan 2024 16:27:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rO5OB-0008tT-1p;
	Fri, 12 Jan 2024 00:27:11 +0000
Date: Fri, 12 Jan 2024 08:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1814/2356] mm/page_cache_limit.c:94:5: warning:
 no previous prototype for function 'cache_limit_mbytes_sysctl_handler'
Message-ID: <202401120819.78yCuGth-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea6de9f6732d495c506f9c140b4ec17c957e1b77
commit: 7d1031b36ebd6c273d9aad316fd9e3e2daa01a85 [1814/2356] mm: support pagecache limit
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240112/202401120819.78yCuGth-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401120819.78yCuGth-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401120819.78yCuGth-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/page_cache_limit.c:61:5: warning: no previous prototype for function 'cache_reclaim_enable_handler' [-Wmissing-prototypes]
      61 | int cache_reclaim_enable_handler(struct ctl_table *table, int write,
         |     ^
   mm/page_cache_limit.c:61:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      61 | int cache_reclaim_enable_handler(struct ctl_table *table, int write,
         | ^
         | static 
   mm/page_cache_limit.c:77:5: warning: no previous prototype for function 'cache_reclaim_sysctl_handler' [-Wmissing-prototypes]
      77 | int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
         |     ^
   mm/page_cache_limit.c:77:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      77 | int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
         | ^
         | static 
>> mm/page_cache_limit.c:94:5: warning: no previous prototype for function 'cache_limit_mbytes_sysctl_handler' [-Wmissing-prototypes]
      94 | int cache_limit_mbytes_sysctl_handler(struct ctl_table *table, int write,
         |     ^
   mm/page_cache_limit.c:94:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      94 | int cache_limit_mbytes_sysctl_handler(struct ctl_table *table, int write,
         | ^
         | static 
   3 warnings generated.


vim +/cache_limit_mbytes_sysctl_handler +94 mm/page_cache_limit.c

    93	
  > 94	int cache_limit_mbytes_sysctl_handler(struct ctl_table *table, int write,
    95			void __user *buffer, size_t *length, loff_t *ppos)
    96	{
    97		int ret;
    98		unsigned long vm_cache_limit_mbytes_max;
    99		unsigned long origin_mbytes = vm_cache_limit_mbytes;
   100		int nr_retries = MAX_RECLAIM_RETRIES;
   101	
   102		vm_cache_limit_mbytes_max = totalram_pages() >> (20 - PAGE_SHIFT);
   103		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   104		if (ret || !write)
   105			return ret;
   106	
   107		if (vm_cache_limit_mbytes > vm_cache_limit_mbytes_max) {
   108			vm_cache_limit_mbytes = origin_mbytes;
   109			return -EINVAL;
   110		}
   111	
   112		if (write) {
   113			while (should_reclaim_page_cache() && page_cache_over_limit() &&
   114					nr_retries--) {
   115				if (signal_pending(current))
   116					return -EINTR;
   117	
   118				shrink_memory(node_reclaim_num(), false);
   119			}
   120		}
   121	
   122		return 0;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
