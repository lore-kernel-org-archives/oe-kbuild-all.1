Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9ED14A0A8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 01:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722475334; cv=none; b=mAqyAygGgaUAHFnYmAZxuNcjykFNIkazjKWcGRBv6rAkc22fjUZPdpJ/vnvFSYTLvIOq/v7Rmw/Dpk3f5ykMKea8ovjhWxGu+7L9rGZ5EYKT63xP10TLs/c8ePVgLNjaOe2YyRdJqSOdQUqYyKES/QBwkIB0GWhhXj7CJMvdM2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722475334; c=relaxed/simple;
	bh=91otprKNiplidOQ598ye+mitxE8ZXJdhKedBTP3fW5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nhsioqH1DWY5J8ShGMvXL6JOiy/yVRgfXzE+jXNF/aOF4MEqgNDxkeKOt/s+0DBOQ+UylN7jT1UuhvzjtiqOk+wbovkWMngeMjJ/vxF73YwglVBa44jzX8fhLRuPYP1yp+pb7pSt01AS1rsSEhSapXYvJVP2IK+d1+yczwrvChA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNn1N3E/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNn1N3E/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722475332; x=1754011332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=91otprKNiplidOQ598ye+mitxE8ZXJdhKedBTP3fW5g=;
  b=PNn1N3E/vL6wghPBdWRVBDANkELwqGW10lIi8l8Iv0ffb7wSjTBzoJwD
   +16jAfxpYQv9Z5/UqN6Ysytm4MqUGj9Tj535nrEN0YRPa9MiwSoWYDZOX
   9XtuZlv1CMKjmjGty5E442YbB5c+sFP4yHvhf9ic4UPZnZnsEM5E/GWOp
   Sz9ypSpOeMW6c45Otk6ZGBeBqSnIdHgqs9kB2N3BMjNYVrc9dvj9cUuvL
   4Wo2+ZLwI9KOyQ428BDYBWsRNDZvrMUQJ/gLHWhP9CzLo3OLWP/G8GswI
   Njk6Z+ppJZva72tFVVcthfIm44dONjA9sgy3AHKwYeAvAkvXuXFe8vxiB
   A==;
X-CSE-ConnectionGUID: nfe0qSvCQKuq1LiBrfWtnw==
X-CSE-MsgGUID: YN5WpfTtSpecUM/MQAIJzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20281110"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="20281110"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 18:22:11 -0700
X-CSE-ConnectionGUID: t7xDPzXtR5+nBz1SQfR8Ig==
X-CSE-MsgGUID: 4wgtUAsLQIyVoqvGaLVvlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="92395645"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Jul 2024 18:22:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZKW8-000v4C-0j;
	Thu, 01 Aug 2024 01:22:08 +0000
Date: Thu, 1 Aug 2024 09:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 11017/11695] kernel/sched/isolation.c:134:46:
 error: use of undeclared identifier 'setup_max_cpus'
Message-ID: <202408010948.5PQBFc4s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e0427893d95be3be1bb71e10dfb53b6f732e8e42
commit: 54bee36be952f18f6a9e8303822459e89daaa336 [11017/11695] sched/isolation: Fix boot crash when maxcpus < first housekeeping CPU
config: x86_64-buildonly-randconfig-002-20240801 (https://download.01.org/0day-ci/archive/20240801/202408010948.5PQBFc4s-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408010948.5PQBFc4s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408010948.5PQBFc4s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:105:
>> kernel/sched/isolation.c:134:46: error: use of undeclared identifier 'setup_max_cpus'
     134 |         if (first_cpu >= nr_cpu_ids || first_cpu >= setup_max_cpus) {
         |                                                     ^
   1 error generated.


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
