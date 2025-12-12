Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D51280A52
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765550586; cv=none; b=fnpuBxJUkNCMRU/f3pcUxNq0z/iHIYbzK44hcQed0NjEIw1+ombgSaM+4uf/f1pCc/LKndVq1LeoOwYix9VAeoAyXebj/MI+I2bXK4ReGWBkf8SgDQ7I/OR9zxL9eYRhcLvGlvFA5aFnX24cOxSUIYLZswJhdUA7TjxTfETW8eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765550586; c=relaxed/simple;
	bh=Uw/IR3l1V8UhSrTQlx8MbuXlzatHiynuvXf88SdXkWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QKnR3QivpDWCBlLWBdZCV10P3GaunK2yv0dB2GaFr20FyM0hEJqP5ctbEDe7D+RJb3c3/vg8l2SeOBdnuXfhl2XePSVPdbgv3jY3+rNGS6yMmdVHfev8viJR4828VP300ej+7VUJQwHKV3jtI9ukQKFK1cEyAOM5V4sb+u7+AHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dCgzAUZm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dCgzAUZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765550585; x=1797086585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uw/IR3l1V8UhSrTQlx8MbuXlzatHiynuvXf88SdXkWo=;
  b=dCgzAUZmuW55XhYoo57un7cd/dv7UNP0mmjtt6NRLFjlS8lutFU9dRbb
   cDLe4iD60LzLwPHj1EPwAguf9L769b4itpGMQrn73xBRD/fZNmvj2aH3V
   QIpYqKjDg5eBFYMgnSn/daa6UJhxx3Vjw8ssykdmGB1+PSdAsjCVEJT8Z
   G8iEcjumjZ655tnJa2D3EwWGHjaF55AI6CJthubNRl7avrH5meI9Dr2u1
   Al2MUZok359I/Q7HSHxdX/ywBME7FNGhfv9jODZB3o1plJRBS2EZJDJgG
   WJk1SmAbkjnznUW0X+6drKaqN1L6ZkF18pxPEaQ50qFrgJB/tPnyouoV3
   w==;
X-CSE-ConnectionGUID: ppfLvaJHRwmi3rwd7jSmDg==
X-CSE-MsgGUID: W84DhyQ0Swiihe5iSPMT2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78667593"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78667593"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 06:43:03 -0800
X-CSE-ConnectionGUID: jwxAoZa0Rd+c/7K4ZpmcIg==
X-CSE-MsgGUID: 6ovbgn8fSMqQW7HlZNaoeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197169725"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2025 06:43:01 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU4ME-000000006Aj-2Mr7;
	Fri, 12 Dec 2025 14:42:58 +0000
Date: Fri, 12 Dec 2025 22:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] drivers/cpufreq/cppc_cpufreq.c:852:19:
 error: incomplete definition of type 'struct fb_ctr_pair'
Message-ID: <202512122204.MoIXLFAZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zeng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 12f136b2134d4ded731c3ef23ac08c85b9c0b1fa [3541/3541] cpufreq: CPPC: Keep the target core awake when reading its cpufreq rate
config: arm64-randconfig-002-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122204.MoIXLFAZ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512122204.MoIXLFAZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512122204.MoIXLFAZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cpufreq/cppc_cpufreq.c:28:
   In file included from include/acpi/cppc_acpi.h:13:
   In file included from include/linux/acpi.h:37:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/cpufreq/cppc_cpufreq.c:852:19: error: incomplete definition of type 'struct fb_ctr_pair'
     852 |         int cpu = fb_ctrs->cpu;
         |                   ~~~~~~~^
   drivers/cpufreq/cppc_cpufreq.c:851:9: note: forward declaration of 'struct fb_ctr_pair'
     851 |         struct fb_ctr_pair *fb_ctrs = val;
         |                ^
   drivers/cpufreq/cppc_cpufreq.c:855:40: error: incomplete definition of type 'struct fb_ctr_pair'
     855 |         ret = cppc_get_perf_ctrs(cpu, &fb_ctrs->fb_ctrs_t0);
         |                                        ~~~~~~~^
   drivers/cpufreq/cppc_cpufreq.c:851:9: note: forward declaration of 'struct fb_ctr_pair'
     851 |         struct fb_ctr_pair *fb_ctrs = val;
         |                ^
   drivers/cpufreq/cppc_cpufreq.c:861:41: error: incomplete definition of type 'struct fb_ctr_pair'
     861 |         return cppc_get_perf_ctrs(cpu, &fb_ctrs->fb_ctrs_t1);
         |                                         ~~~~~~~^
   drivers/cpufreq/cppc_cpufreq.c:851:9: note: forward declaration of 'struct fb_ctr_pair'
     851 |         struct fb_ctr_pair *fb_ctrs = val;
         |                ^
   drivers/cpufreq/cppc_cpufreq.c:866:21: error: variable has incomplete type 'struct fb_ctr_pair'
     866 |         struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
         |                            ^
   drivers/cpufreq/cppc_cpufreq.c:866:9: note: forward declaration of 'struct fb_ctr_pair'
     866 |         struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
         |                ^
   1 warning and 4 errors generated.


vim +852 drivers/cpufreq/cppc_cpufreq.c

   848	
   849	static int cppc_get_perf_ctrs_pair(void *val)
   850	{
   851		struct fb_ctr_pair *fb_ctrs = val;
 > 852		int cpu = fb_ctrs->cpu;
   853		int ret;
   854	
   855		ret = cppc_get_perf_ctrs(cpu, &fb_ctrs->fb_ctrs_t0);
   856		if (ret)
   857			return ret;
   858	
   859		udelay(2); /* 2usec delay between sampling */
   860	
   861		return cppc_get_perf_ctrs(cpu, &fb_ctrs->fb_ctrs_t1);
   862	}
   863	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
