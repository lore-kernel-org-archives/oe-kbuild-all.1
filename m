Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B73A225D7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 08:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736323420; cv=none; b=MsmLeT6JN3uVHg8n6lfzbbuhOnqWr9WIggSyH2374gU5qusoDbsM05F3CkjXP/Mno4ABz/R03/0HbtjuEATd4lnCGutbefuMZo8LUlUh6MAJs0pJvPO3udVETvIEXQYs16Sh3g3EsGwFwbALB/vP5XYFn2Yy5Ln+VFU9duewRpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736323420; c=relaxed/simple;
	bh=vPukbiue6U+raw7ml3jkwdQfta1JT3bFkHUW1BBix5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RzW2nEda7CjCdL5RkC3W6WHV6ZCKb5Mi8y/BoTWmi8jraDBfyJcRswsBDTXv47f5cc3OHSfpyIyrWp9emWc+ciJgB54EHD9dB85m9zCDR1o0hM6v7JSNSGjLe2OzRKj+oKvsk4X50ec0knV/Er8NmzbiWFZgvBPB93vAN9sJldw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0rxze8Z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0rxze8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736323419; x=1767859419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vPukbiue6U+raw7ml3jkwdQfta1JT3bFkHUW1BBix5I=;
  b=P0rxze8ZbgefrFhXCqsA2VCbJwgciN0WbptadtNl4H4u6SBBcUAz5dPy
   Nyq6VZpKrh5J+6bN2PSJQh5dPvbRZgKlIQqoSoPvZgRuj7DMraYcvIBNy
   JA19YIp33kTNgeicdsg9b44M4LOZo47BZovCU+fVNPJDOMGyczomT0qHT
   A5EqCqZ6OQJ8u/n1Q4Wdx++b0P/QdTSav8g8/Dwg+KoIVz233dwSClR6J
   Mquo6WGNo68jpPMeKhw/14sT/x3Cdsha6FTrAI6K7KbGT5fKvl3uREBVL
   TdnvlBkKnlRSG3DHqAR0n2t0MXG6cm+Rcfw55BMdGF/+uuRDLxUHMZmCN
   g==;
X-CSE-ConnectionGUID: Azc9L1c0Rw2d732YImpjHA==
X-CSE-MsgGUID: KIgE0AfbS0CZlyv6lk5c+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36419837"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="36419837"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 00:03:39 -0800
X-CSE-ConnectionGUID: MSAv8kZbT+6NhjAT/xfQdA==
X-CSE-MsgGUID: TK06aonYR8mTVUaE1pEgwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108117948"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jan 2025 00:03:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVR2M-000FmS-2a;
	Wed, 08 Jan 2025 08:03:34 +0000
Date: Wed, 8 Jan 2025 16:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1788/1788] drivers/cpufreq/cppc_cpufreq.c:852:26:
 error: invalid use of undefined type 'struct fb_ctr_pair'
Message-ID: <202501081558.g5cb5wQS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   31b452f6f79028714fdf063d4e4f6b9d5cb87751
commit: 12f136b2134d4ded731c3ef23ac08c85b9c0b1fa [1788/1788] cpufreq: CPPC: Keep the target core awake when reading its cpufreq rate
config: arm64-randconfig-001-20250108 (https://download.01.org/0day-ci/archive/20250108/202501081558.g5cb5wQS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081558.g5cb5wQS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081558.g5cb5wQS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/cpufreq/cppc_cpufreq.c: In function 'cppc_get_perf_ctrs_pair':
>> drivers/cpufreq/cppc_cpufreq.c:852:26: error: invalid use of undefined type 'struct fb_ctr_pair'
     852 |         int cpu = fb_ctrs->cpu;
         |                          ^~
   drivers/cpufreq/cppc_cpufreq.c:855:47: error: invalid use of undefined type 'struct fb_ctr_pair'
     855 |         ret = cppc_get_perf_ctrs(cpu, &fb_ctrs->fb_ctrs_t0);
         |                                               ^~
   drivers/cpufreq/cppc_cpufreq.c:861:48: error: invalid use of undefined type 'struct fb_ctr_pair'
     861 |         return cppc_get_perf_ctrs(cpu, &fb_ctrs->fb_ctrs_t1);
         |                                                ^~
   drivers/cpufreq/cppc_cpufreq.c: In function 'cppc_cpufreq_get_rate':
>> drivers/cpufreq/cppc_cpufreq.c:866:16: error: variable 'fb_ctrs' has initializer but incomplete type
     866 |         struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
         |                ^~~~~~~~~~~
>> drivers/cpufreq/cppc_cpufreq.c:866:41: error: 'struct fb_ctr_pair' has no member named 'cpu'
     866 |         struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
         |                                         ^~~
>> drivers/cpufreq/cppc_cpufreq.c:866:47: warning: excess elements in struct initializer
     866 |         struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
         |                                               ^~~
   drivers/cpufreq/cppc_cpufreq.c:866:47: note: (near initialization for 'fb_ctrs')
>> drivers/cpufreq/cppc_cpufreq.c:866:28: error: storage size of 'fb_ctrs' isn't known
     866 |         struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
         |                            ^~~~~~~
>> drivers/cpufreq/cppc_cpufreq.c:866:28: warning: unused variable 'fb_ctrs' [-Wunused-variable]


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
   864	static unsigned int cppc_cpufreq_get_rate(unsigned int cpu)
   865	{
 > 866		struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
   867		struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
   868		struct cppc_cpudata *cpu_data = policy->driver_data;
   869		u64 delivered_perf;
   870		int ret;
   871	
   872		cpufreq_cpu_put(policy);
   873	
   874		if (cpu_has_amu_feat(cpu))
   875			ret = smp_call_on_cpu(cpu, cppc_get_perf_ctrs_pair,
   876					      &fb_ctrs, false);
   877		else
   878			ret = cppc_get_perf_ctrs_pair(&fb_ctrs);
   879	
   880		if (ret)
   881			return 0;
   882	
   883		delivered_perf = cppc_perf_from_fbctrs(cpu_data,
   884						      &fb_ctrs.fb_ctrs_t0,
   885						      &fb_ctrs.fb_ctrs_t1);
   886	
   887		return cppc_cpufreq_perf_to_khz(cpu_data, delivered_perf);
   888	}
   889	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
