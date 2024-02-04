Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BCC14284
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 08:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707037106; cv=none; b=K392qehTETEc/LKELeTtSKqTphZeS8JO32YqCI/18X0MsIOAx1ehvjtZpeFxYp50Fw4OSI9JSIAJB5q40nA4Rr9BcK6Ff1tTDlsCg+7ySMKGox/T6lhh78j1pV+fLwwSy6lvblX1k2HeecpPQtzjAvwUd2WDXb4NtFGZk4gYkTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707037106; c=relaxed/simple;
	bh=RzzbO9E9WLq9aFs5XixDCKixE6SH8YIvdApLMo2BA5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YZlS0cNoDdtEq66lCQ1ZGCVUu1TKG2i1ySHEt4n/zZQ9NZzNT+cV4QXn+tJM8auSe540CIZhpN6lrRQDDmi/xnGayTSIvvXSLqDPuyEUlpqfvvos2Madh9032uX0o6a4sshh9ifS1t3FstTHT9h1bYQNuNl2l5LJyu6KGwWcfqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqHlLKEP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqHlLKEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707037104; x=1738573104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RzzbO9E9WLq9aFs5XixDCKixE6SH8YIvdApLMo2BA5U=;
  b=PqHlLKEP+CHD7sXssa57jQEUp4PPkg8nqD/ffeRFEWai3KKjlZs3s/ya
   irLHxFlFn1RSB/+NqPaZjpOP6xjnsgacvZXgYFLAlHWqMEm/YO97z8h3K
   YjInadYGY0SXdrI22UPywQbYy/1++W8C0A+ycgLgHKO2wu5SFJilTQH9Y
   Ch9TJmEGqSJd6XYr0TtmUCE0A8Nj6fOgh2hhxBcsDrHRAd9orjGMN4Pom
   zdaehWnh0RgsiLpQf0tsfVlcwQhe9sQjYR9nc914ktgcICNYoDxAeuww9
   G9ompDU4kE/YOBLm/9DqkrfRq79OzGSDPK8Mz4U3wDnasEQlmXRhiLhlJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="535117"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="535117"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 00:58:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="462604"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 04 Feb 2024 00:58:22 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWYKA-0006BE-1v;
	Sun, 04 Feb 2024 08:58:17 +0000
Date: Sun, 4 Feb 2024 16:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1869/2940] drivers/cpufreq/cppc_cpufreq.c:852:26:
 error: invalid use of undefined type 'struct fb_ctr_pair'
Message-ID: <202402041617.THbvDKTe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0570b06ba8090c198595a26f8b1eb221e12ec70c
commit: 12f136b2134d4ded731c3ef23ac08c85b9c0b1fa [1869/2940] cpufreq: CPPC: Keep the target core awake when reading its cpufreq rate
config: arm64-randconfig-004-20240202 (https://download.01.org/0day-ci/archive/20240204/202402041617.THbvDKTe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041617.THbvDKTe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041617.THbvDKTe-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   drivers/cpufreq/cppc_cpufreq.c:866:47: warning: excess elements in struct initializer
     866 |         struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
         |                                               ^~~
   drivers/cpufreq/cppc_cpufreq.c:866:47: note: (near initialization for 'fb_ctrs')
>> drivers/cpufreq/cppc_cpufreq.c:866:28: error: storage size of 'fb_ctrs' isn't known
     866 |         struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
         |                            ^~~~~~~
   drivers/cpufreq/cppc_cpufreq.c:866:28: warning: unused variable 'fb_ctrs' [-Wunused-variable]


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
