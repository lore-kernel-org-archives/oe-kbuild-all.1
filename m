Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CCB19ABD4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 21:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733781368; cv=none; b=Ywo3Odv3CLO/Uqmk9A5Aji0tIl870yBzYtSRx/HdraBeTQyhcekX8eGPf86HUPRJ4LI6+c1sxqftHjwswh4rt0o2S5K4WcCvpm2qKn1lQFakkt33tLSEtOV/f+gb3W8MYn0PY3FzkFlDz/DB3ltCMRFjw2j8mQdIpkXdvaErRXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733781368; c=relaxed/simple;
	bh=E5rbCpt7w1dxx5wB/0bDHVpZtA2bbWvBSlTwnge9mjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NQtzzTtb7mC3S2LzsyLpqibT+of4fDL0EhDdxZojb1gmWH7tOZp1ofkzzwVYCT57eYCkiIgtxzhjr8gnIc/BcjAdf4G/7wU5/PAtyejofOJZjqkZ6J9lkB7DdVK6dMkRzLxq6p4KRXCixwHNZaeRIHQuoyCZr2EsJImfIuTPNeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEkGuUw8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEkGuUw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733781366; x=1765317366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E5rbCpt7w1dxx5wB/0bDHVpZtA2bbWvBSlTwnge9mjg=;
  b=lEkGuUw8r/RYifBrF9icgGSVd++Iafcffibg47trUO0ciI8ZoWzHEkG+
   i1fQp/8vmrwK3kjogE+UrWuSsT7nGKrpJoWShx2NpuRkp1ptrcp7Qivcz
   3Y1Bcm3BLicwO3WhT3P1vYf/udYO+9pUbu21Z83o3zeuR72VN35Fp1WJG
   63YmJgej4GupcdN+ik97PkKObqsqynsJMnrs16rl1eNznDlh0JP9QaqMD
   GTrquzv5Kcq7FuQK0So3q9sq7uF1zZqLvLUdqv5+bBSgGRsIVJCwVI7XI
   mEw+Mo3QxY4xuiApXBGtkcgq5Wo0qAoSP3qE29a3tzsnkh9w2xrf963Vw
   A==;
X-CSE-ConnectionGUID: dtdFenISRbq7Ah8JBu31sQ==
X-CSE-MsgGUID: r5zD4g70Qd2VOcYYF3cF1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="45503280"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="45503280"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 13:56:06 -0800
X-CSE-ConnectionGUID: /XCnsRU3THmz+/YF1sogEw==
X-CSE-MsgGUID: /SaRsAPSSu690SAXNzrdmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95010630"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Dec 2024 13:56:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKljV-0004qZ-2o;
	Mon, 09 Dec 2024 21:56:01 +0000
Date: Tue, 10 Dec 2024 05:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613] kernel/sched/isolation.c:134:46:
 error: use of undeclared identifier 'setup_max_cpus'
Message-ID: <202412100528.PZ0hrNzD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   db988390007bce595dba0dfd782c610578e26d2d
commit: 54bee36be952f18f6a9e8303822459e89daaa336 [1613/1613] sched/isolation: Fix boot crash when maxcpus < first housekeeping CPU
config: x86_64-buildonly-randconfig-002-20241210 (https://download.01.org/0day-ci/archive/20241210/202412100528.PZ0hrNzD-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100528.PZ0hrNzD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100528.PZ0hrNzD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:24:
   In file included from include/linux/cpuset.h:17:
   In file included from include/linux/mm.h:2242:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/sched/build_utility.c:105:
>> kernel/sched/isolation.c:134:46: error: use of undeclared identifier 'setup_max_cpus'
     134 |         if (first_cpu >= nr_cpu_ids || first_cpu >= setup_max_cpus) {
         |                                                     ^
   1 warning and 1 error generated.


vim +/setup_max_cpus +134 kernel/sched/isolation.c

   108	
   109	static int __init housekeeping_setup(char *str, unsigned long flags)
   110	{
   111		cpumask_var_t non_housekeeping_mask, housekeeping_staging;
   112		unsigned int first_cpu;
   113		int err = 0;
   114	
   115		if ((flags & HK_FLAG_TICK) && !(housekeeping.flags & HK_FLAG_TICK)) {
   116			if (!IS_ENABLED(CONFIG_NO_HZ_FULL)) {
   117				pr_warn("Housekeeping: nohz unsupported."
   118					" Build with CONFIG_NO_HZ_FULL\n");
   119				return 0;
   120			}
   121		}
   122	
   123		alloc_bootmem_cpumask_var(&non_housekeeping_mask);
   124		if (cpulist_parse(str, non_housekeeping_mask) < 0) {
   125			pr_warn("Housekeeping: nohz_full= or isolcpus= incorrect CPU range\n");
   126			goto free_non_housekeeping_mask;
   127		}
   128	
   129		alloc_bootmem_cpumask_var(&housekeeping_staging);
   130		cpumask_andnot(housekeeping_staging,
   131			       cpu_possible_mask, non_housekeeping_mask);
   132	
   133		first_cpu = cpumask_first_and(cpu_present_mask, housekeeping_staging);
 > 134		if (first_cpu >= nr_cpu_ids || first_cpu >= setup_max_cpus) {
   135			__cpumask_set_cpu(smp_processor_id(), housekeeping_staging);
   136			__cpumask_clear_cpu(smp_processor_id(), non_housekeeping_mask);
   137			if (!housekeeping.flags) {
   138				pr_warn("Housekeeping: must include one present CPU, "
   139					"using boot CPU:%d\n", smp_processor_id());
   140			}
   141		}
   142	
   143		if (cpumask_empty(non_housekeeping_mask))
   144			goto free_housekeeping_staging;
   145	
   146		if (!housekeeping.flags) {
   147			/* First setup call ("nohz_full=" or "isolcpus=") */
   148			enum hk_type type;
   149	
   150			for_each_set_bit(type, &flags, HK_TYPE_MAX)
   151				housekeeping_setup_type(type, housekeeping_staging);
   152		} else {
   153			/* Second setup call ("nohz_full=" after "isolcpus=" or the reverse) */
   154			enum hk_type type;
   155			unsigned long iter_flags = flags & housekeeping.flags;
   156	
   157			for_each_set_bit(type, &iter_flags, HK_TYPE_MAX) {
   158				if (!cpumask_equal(housekeeping_staging,
   159						   housekeeping.cpumasks[type])) {
   160					pr_warn("Housekeeping: nohz_full= must match isolcpus=\n");
   161					goto free_housekeeping_staging;
   162				}
   163			}
   164	
   165			iter_flags = flags & ~housekeeping.flags;
   166	
   167			for_each_set_bit(type, &iter_flags, HK_TYPE_MAX)
   168				housekeeping_setup_type(type, housekeeping_staging);
   169		}
   170	
   171		if ((flags & HK_FLAG_TICK) && !(housekeeping.flags & HK_FLAG_TICK))
   172			tick_nohz_full_setup(non_housekeeping_mask);
   173	
   174		housekeeping.flags |= flags;
   175		err = 1;
   176	
   177	free_housekeeping_staging:
   178		free_bootmem_cpumask_var(housekeeping_staging);
   179	free_non_housekeeping_mask:
   180		free_bootmem_cpumask_var(non_housekeeping_mask);
   181	
   182		return err;
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
