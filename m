Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4589225A2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 23:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I74nJmhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698796389; x=1730332389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nwhou+JHdGFmauDrW6bRTCXcXpf0oQn0xqEx4ftHcJI=;
  b=I74nJmhevlwUR0/jkQPpAeAWPGlzPwl6c10mKNS90mOiz8W3zJEmDgqb
   s7ZYYOp8rMkMP2eekoRCPTgonEL1I5EOSLwPXlsSHlzGbeZMwFQueBU0P
   74n/Y/zGkcbRmLuXfuGgf/wd19EoRLxTIdupmWXoQiFs4CFm17LROKK0a
   B/aAqhl2A2YFa8dPeqmXpFSKUjTUCLvcaPX6sN/3t5Kvv9et3wv+6Cl1e
   9AKacZvgeWPGYtVwW01GPnN9mrbkfZdNdHnuV4wsCDBhvT9TRA0ENLF69
   Qpvp1TpIjoAZp16oJ9ZswH1TjVwkOQrdg0VqAviiQNEY1Gy6fJCF/fwde
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="367745013"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="367745013"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 16:53:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="710593883"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="710593883"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 31 Oct 2023 16:53:03 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxyXd-0000T5-0L;
	Tue, 31 Oct 2023 23:53:01 +0000
Date: Wed, 1 Nov 2023 07:52:25 +0800
From: kernel test robot <lkp@intel.com>
To: Zeng Heng <zengheng4@huawei.com>, broonie@kernel.org,
	joey.gouly@arm.com, will@kernel.org, amit.kachhap@arm.com,
	rafael@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
	mark.rutland@arm.com, maz@kernel.org, viresh.kumar@linaro.org,
	sumitg@nvidia.com, yang@os.amperecomputing.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	wangxiongfeng2@huawei.com, xiexiuqi@huawei.com
Subject: Re: [PATCH 2/3] cpufreq: CPPC: Keep the target core awake when
 reading its cpufreq rate
Message-ID: <202311010726.MjF49sPn-lkp@intel.com>
References: <20231025093847.3740104-3-zengheng4@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025093847.3740104-3-zengheng4@huawei.com>

Hi Zeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/acpi-bus arm64/for-next/core linus/master v6.6 next-20231031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zeng-Heng/arm64-cpufeature-Export-cpu_has_amu_feat/20231025-173559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20231025093847.3740104-3-zengheng4%40huawei.com
patch subject: [PATCH 2/3] cpufreq: CPPC: Keep the target core awake when reading its cpufreq rate
config: arm64-randconfig-003-20231101 (https://download.01.org/0day-ci/archive/20231101/202311010726.MjF49sPn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311010726.MjF49sPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311010726.MjF49sPn-lkp@intel.com/

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
