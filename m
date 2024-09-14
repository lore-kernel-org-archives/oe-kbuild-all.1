Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF64B179A8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 04:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726287043; cv=none; b=Sv3IyuQ6Q8jxsKwAxTzPZbQRbnXrtJyLRgDLh3dYPK5BOVmQNRMcBE/XRimqgnkMMZMGAXhbN0sf2bCT1WqaQnlC0RFFZKM1umsFofMt3kin/m+d8aJr/lhNhhcoIzq59OpJfjGklYmC0nDfdkMRqeKmYRYe2QYGx/rR6umGphA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726287043; c=relaxed/simple;
	bh=3vYqUqhnhbBag46W+dbepFMhd52yV/XzYkIQh24vRsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VPvkjN7I3Mv3l/bOHYWORPURnXa5bF4cxiMVkxCzs06E346EyK/o1W+pbsC8wJMWJBxGN4jwzk18qBWtTnQgvCply7SPdjKxnBdiMR7WPgxLunsv9po6K6nvAHuTdz6/88RpVzL7/AHul1qtGw0UBWaggSZSRT9xIwAXUaIzG6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZwyjvJit; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwyjvJit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726287041; x=1757823041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3vYqUqhnhbBag46W+dbepFMhd52yV/XzYkIQh24vRsM=;
  b=ZwyjvJitNvaI7s6wJhGYnomWIQ5Fpd341B9OXclLPjG72nYQCNdKBpfv
   rsyF12YKXxMWdTzwKNyd+8oXPGkbAgABKT/ZTQM7t8a60hmmyG3COU84z
   TEb+7Ze+JPqtA+7D9fWsbkcGg/1KXI1RDI/niQKVVDU9Zh6SJ6oVhCscS
   8gCN58J3218yOufj+IMVrpvcANzPaEuFT+dOb2FbzhbyETw669zfbjFFn
   GIsEMv9mgR2pBgyLN/geWfcdFc2/ZYLXWM74v0g7wRYY9nFTEEnNE8l7K
   Pm6OBFvU8HVILtYeC4/tXziq0GqW6WhtcFpGL1s4+cDX8SLFyBcW6nKZf
   A==;
X-CSE-ConnectionGUID: MbFTNdBhQtWjoKIleu5qKQ==
X-CSE-MsgGUID: 2YMUjaP3QxmFHecN26HOhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="47710640"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="47710640"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 21:10:40 -0700
X-CSE-ConnectionGUID: qbxbLDiQRVWuM+9nv3GJOg==
X-CSE-MsgGUID: F3hIxVX7Q06nL1HtzySHUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="99150768"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Sep 2024 21:10:38 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spK7I-0007M2-2l;
	Sat, 14 Sep 2024 04:10:36 +0000
Date: Sat, 14 Sep 2024 12:09:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1870/13938]
 drivers/cpufreq/cppc_cpufreq.c:852:19: error: incomplete definition of type
 'struct fb_ctr_pair'
Message-ID: <202409141237.GV6bZXKN-lkp@intel.com>
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
head:   292de9750592324fa903dc314670538f50b4c19a
commit: 12f136b2134d4ded731c3ef23ac08c85b9c0b1fa [1870/13938] cpufreq: CPPC: Keep the target core awake when reading its cpufreq rate
config: arm64-randconfig-001-20240913 (https://download.01.org/0day-ci/archive/20240914/202409141237.GV6bZXKN-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141237.GV6bZXKN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141237.GV6bZXKN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpufreq/cppc_cpufreq.c:852:19: error: incomplete definition of type 'struct fb_ctr_pair'
           int cpu = fb_ctrs->cpu;
                     ~~~~~~~^
   drivers/cpufreq/cppc_cpufreq.c:851:9: note: forward declaration of 'struct fb_ctr_pair'
           struct fb_ctr_pair *fb_ctrs = val;
                  ^
   drivers/cpufreq/cppc_cpufreq.c:855:40: error: incomplete definition of type 'struct fb_ctr_pair'
           ret = cppc_get_perf_ctrs(cpu, &fb_ctrs->fb_ctrs_t0);
                                          ~~~~~~~^
   drivers/cpufreq/cppc_cpufreq.c:851:9: note: forward declaration of 'struct fb_ctr_pair'
           struct fb_ctr_pair *fb_ctrs = val;
                  ^
   drivers/cpufreq/cppc_cpufreq.c:861:41: error: incomplete definition of type 'struct fb_ctr_pair'
           return cppc_get_perf_ctrs(cpu, &fb_ctrs->fb_ctrs_t1);
                                           ~~~~~~~^
   drivers/cpufreq/cppc_cpufreq.c:851:9: note: forward declaration of 'struct fb_ctr_pair'
           struct fb_ctr_pair *fb_ctrs = val;
                  ^
>> drivers/cpufreq/cppc_cpufreq.c:866:21: error: variable has incomplete type 'struct fb_ctr_pair'
           struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
                              ^
   drivers/cpufreq/cppc_cpufreq.c:866:9: note: forward declaration of 'struct fb_ctr_pair'
           struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
                  ^
   4 errors generated.


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
