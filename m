Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE243AD5A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 16:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364102; cv=none; b=CXWXmy9lB7IapGu51BTSjzFyBroRIRkZBKjLl74X6LuOmaOKmVYXjKNITqKYolMM4IgKt9Ce0xmFEuuZLnBkgmDwEK3Mhpj03XKz4GgMPDASOjwMhbBhXTLVHB2f0ChREpcXalHm9NyDd6VnlN2EJ1zTI/0FK8gTrMoFrvSuCxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364102; c=relaxed/simple;
	bh=3vpDXIkoIRGs9DKDGews/RdCQh2OkBeBAsrgvspXYQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UFrxtl402Oviavw6UNZFDDNJ/e9SJZXjXq6LV34YMGlMarHPcfhuWWG3+QJEZZGRikWKp0pBiGSeFSR3NkSB5nesCD6UrZacNtynQVdl0+ZEBOPn3LAXwNs3qJnH1taD1gk6LpknY1tORyh2EzcaHJ6A8uDahrVKjExLJwt88DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0gZgt2D; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0gZgt2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748364101; x=1779900101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3vpDXIkoIRGs9DKDGews/RdCQh2OkBeBAsrgvspXYQg=;
  b=Q0gZgt2D8KeHtzeaEf8bRc1/2dOMui0oNyRscsUYaVL5vzmNhyX6V3T9
   LI0qxuTRLPzijWmZbVrNFzomXumA6CUNv2t9F1xbs4Dc83+1mDFiCRD1w
   oz7IYvmv6e5/n1Z0KQHYVpWY112qONYA2BcOG1LsOzyEU8z/BYjZDLDRK
   b/h1meOXMsTMIbmyHepE+L9eaFY7FHouu7gmoDpDyRl96n/pPSgg1bBar
   EBZDp5TYNmyNIKQUABW8FdsxybA0Rw7zwX9TOxVc4obvSyATkFHLcncUV
   sxwWlOCI9YTyB2dvs4rPAnu1vDoJ3Hc0PS4ptgGnQAv8FDSuT3Pz2Gr9X
   Q==;
X-CSE-ConnectionGUID: aUBpjp+SRVmIIdQRJIKRZw==
X-CSE-MsgGUID: AOaM7gLBTdWm5xjn5P3x0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50061668"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="50061668"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 09:41:39 -0700
X-CSE-ConnectionGUID: UQ8Q2wRGS220fdP4kdt35w==
X-CSE-MsgGUID: QIDX5pb1ReOWUXuAX5Jrrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="143338810"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 May 2025 09:41:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJxMs-000TM6-2c;
	Tue, 27 May 2025 16:41:34 +0000
Date: Wed, 28 May 2025 00:41:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2304/2304] mm/page_cache_limit.c:94:5: warning:
 no previous prototype for 'cache_limit_mbytes_sysctl_handler'
Message-ID: <202505280023.4g7q598y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   35c5792a71f249ce79eba3cbb546d1ece7c4f3ee
commit: 7d1031b36ebd6c273d9aad316fd9e3e2daa01a85 [2304/2304] mm: support pagecache limit
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250528/202505280023.4g7q598y-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280023.4g7q598y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280023.4g7q598y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/page_cache_limit.c:61:5: warning: no previous prototype for 'cache_reclaim_enable_handler' [-Wmissing-prototypes]
      61 | int cache_reclaim_enable_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_cache_limit.c:77:5: warning: no previous prototype for 'cache_reclaim_sysctl_handler' [-Wmissing-prototypes]
      77 | int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/page_cache_limit.c:94:5: warning: no previous prototype for 'cache_limit_mbytes_sysctl_handler' [-Wmissing-prototypes]
      94 | int cache_limit_mbytes_sysctl_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cache_limit_mbytes_sysctl_handler +94 mm/page_cache_limit.c

    60	
  > 61	int cache_reclaim_enable_handler(struct ctl_table *table, int write,
    62				void *buffer, size_t *length, loff_t *ppos)
    63	{
    64		int ret;
    65	
    66		ret = proc_dointvec_minmax(table, write, buffer, length, ppos);
    67		if (ret || !write)
    68			return ret;
    69	
    70		if (should_periodical_reclaim())
    71			schedule_delayed_work(&shepherd, round_jiffies_relative(
    72				(unsigned long)vm_cache_reclaim_s * HZ));
    73	
    74		return 0;
    75	}
    76	
    77	int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
    78			void *buffer, size_t *length, loff_t *ppos)
    79	{
    80		int ret;
    81	
    82		ret = proc_dointvec_minmax(table, write, buffer, length, ppos);
    83		if (ret || !write)
    84			return ret;
    85	
    86		if (should_periodical_reclaim())
    87			mod_delayed_work(system_unbound_wq, &shepherd,
    88					round_jiffies_relative(
    89					(unsigned long)vm_cache_reclaim_s * HZ));
    90	
    91		return ret;
    92	}
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
