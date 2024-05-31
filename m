Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EF71CA89
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 18:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717181221; cv=none; b=onsMg/3cll4gzhMk6IWVeQhXwMmaoUrEwTDdAWXN274MZyOdMRvGFYxcglszwqDuP4JOEgbgljZj4hFP8LxFwVKd0CBn/D4iKOz9/0pYMd6ddmPnHNJdEHZFYfKn56JvTMPNGMQHaOjFW4kBarXpSvq3qK5T8iBmZqox0NIDU3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717181221; c=relaxed/simple;
	bh=71xvnSKWjrCVSkIb0zQLYr4sPD5Dxz2ncJMzXH6Y+gs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SrZaetzqEdiIMJzqhtCRFS39sDAlEuKYY2cnyoMimvSJPSJYdDkBaPTUfM1Q/f06O0Y3yX8jeMqkYIHKXFRboPUJM3MNpENzxUFiBQ7wnnwVFcM9ZYOUtRfUvdWb/2hkKqeBCazxQvB9Kel/2MJzSYXXVS3tNmRgeb3U/zj5Ezk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3w+CSXP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3w+CSXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717181220; x=1748717220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=71xvnSKWjrCVSkIb0zQLYr4sPD5Dxz2ncJMzXH6Y+gs=;
  b=J3w+CSXPEzLMybXD79C1GZWG7jO6M5kWEd8s62X1P4zvKDLSngddZ8DS
   A+Az/e34laLKgx0ynLM8imEIJPpGVN1U5spWNG/G/G+OUpnUt5/gEOICj
   kG/omX3LN60VOFQo20Tj7BKWTostOgtFCYha/tpu0rHEUdjfnP2VLkx9u
   UL1xORNGBpapXOwQ8t4BslXUUSxxaalitcJRs4nBmkWLHiPfuFscmpltT
   Yd+dLjWMyiqx9mtVd6/esvdSAdA4RxtCmQJHk5Dzk+Xe2k/1hLPwXRv2Y
   hJpNTOfCC6xHaQF3+wX5EsTYhPJhxUQpwLcV4MQuGkXeo2eMrUSjQXLzv
   w==;
X-CSE-ConnectionGUID: mikJcoB7Thu9qgDvWsxdjA==
X-CSE-MsgGUID: t968lfpXTpWmWD1cR2btKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="16690334"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="16690334"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 11:46:59 -0700
X-CSE-ConnectionGUID: KVJ+7rHuQ8yr8GOtiI2qiQ==
X-CSE-MsgGUID: VWw6b9EMQB+2L8DBjRTh8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="73723003"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 May 2024 11:46:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD7H0-000HfQ-0Y;
	Fri, 31 May 2024 18:46:45 +0000
Date: Sat, 1 Jun 2024 02:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liao Chen <liaochen4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2392/9806] arch/arm64/kernel/ipi_nmi.c:39:2:
 error: call to undeclared function '__printk_safe_enter'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202406010224.zmFA3hCw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   735f0ab7121a98dd501241bd147c5c95e6e0b38c
commit: 5e3e94b1477ca3f6cb47ae8137a4a99fe0ef6147 [2392/9806] arm64: Add non nmi ipi backtrace support
config: arm64-randconfig-002-20240601 (https://download.01.org/0day-ci/archive/20240601/202406010224.zmFA3hCw-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010224.zmFA3hCw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010224.zmFA3hCw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/ipi_nmi.c:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/arm64/kernel/ipi_nmi.c:39:2: error: call to undeclared function '__printk_safe_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      39 |         __printk_safe_enter();
         |         ^
>> arch/arm64/kernel/ipi_nmi.c:41:2: error: call to undeclared function '__printk_safe_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      41 |         __printk_safe_exit();
         |         ^
   1 warning and 2 errors generated.


vim +/__printk_safe_enter +39 arch/arm64/kernel/ipi_nmi.c

    35	
    36	#ifdef CONFIG_NON_NMI_IPI_BACKTRACE
    37	static void ipi_cpu_backtrace(void *info)
    38	{
  > 39		__printk_safe_enter();
    40		nmi_cpu_backtrace(get_irq_regs());
  > 41		__printk_safe_exit();
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
