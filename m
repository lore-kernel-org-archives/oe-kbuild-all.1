Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EA015AF2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 12:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwHchhtC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704977473; x=1736513473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H2iM3LPPmDK0H9ASLpc+DnrxrEP+6NtqclOXlRC6MvY=;
  b=jwHchhtCQofkOPy93gq7I6eZyNy06uf+T33X89bSM8DVzQXd/wgDqpa/
   dkOStJ+e/5ZApPWjWc2xFsd89QbBjlzQs8AD0KhOmZz8j06mAMR8ft+T4
   ZqVYBKuWBMLepj7zckXJouIfbnsm9Hl6pUfMA2i9fNXhfZrag6LoCZhtT
   2CIVDRSkhoZS1bZwU0GMfTV/bz2abfPGxFvvB9ZiHPPYMSuiBshHK9s9r
   y2aM7OQus6Xm19r6nknv4tJtnotNVjhyns8fJP7VgBWxxkU/bF6xnyQXC
   v5dryMNjd4+dG/rBXaXuHdGJ1ZiwcM64JUNkJ3ogd0CHA7wOefmHaSN/5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="395980000"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="395980000"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 04:51:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="758756341"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="758756341"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Jan 2024 04:51:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNuWa-0008Go-0t;
	Thu, 11 Jan 2024 12:51:08 +0000
Date: Thu, 11 Jan 2024 20:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1813/2336] mm/page_cache_limit.c:35:5: warning:
 no previous prototype for function 'cache_reclaim_enable_handler'
Message-ID: <202401112029.DUWDbAsb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cb3c3cb3ca9a0b06f501ef5e486aaf18220ac7a9
commit: 621647ce254f1d347ae9bc3d328c09cbb2732487 [1813/2336] mm: support periodical memory reclaim
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240111/202401112029.DUWDbAsb-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401112029.DUWDbAsb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401112029.DUWDbAsb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_cache_limit.c:35:5: warning: no previous prototype for function 'cache_reclaim_enable_handler' [-Wmissing-prototypes]
      35 | int cache_reclaim_enable_handler(struct ctl_table *table, int write,
         |     ^
   mm/page_cache_limit.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | int cache_reclaim_enable_handler(struct ctl_table *table, int write,
         | ^
         | static 
>> mm/page_cache_limit.c:51:5: warning: no previous prototype for function 'cache_reclaim_sysctl_handler' [-Wmissing-prototypes]
      51 | int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
         |     ^
   mm/page_cache_limit.c:51:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      51 | int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
         | ^
         | static 
   2 warnings generated.


vim +/cache_reclaim_enable_handler +35 mm/page_cache_limit.c

    34	
  > 35	int cache_reclaim_enable_handler(struct ctl_table *table, int write,
    36				void *buffer, size_t *length, loff_t *ppos)
    37	{
    38		int ret;
    39	
    40		ret = proc_dointvec_minmax(table, write, buffer, length, ppos);
    41		if (ret || !write)
    42			return ret;
    43	
    44		if (should_periodical_reclaim())
    45			schedule_delayed_work(&shepherd, round_jiffies_relative(
    46				(unsigned long)vm_cache_reclaim_s * HZ));
    47	
    48		return 0;
    49	}
    50	
  > 51	int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
    52			void *buffer, size_t *length, loff_t *ppos)
    53	{
    54		int ret;
    55	
    56		ret = proc_dointvec_minmax(table, write, buffer, length, ppos);
    57		if (ret || !write)
    58			return ret;
    59	
    60		if (should_periodical_reclaim())
    61			mod_delayed_work(system_unbound_wq, &shepherd,
    62					round_jiffies_relative(
    63					(unsigned long)vm_cache_reclaim_s * HZ));
    64	
    65		return ret;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
