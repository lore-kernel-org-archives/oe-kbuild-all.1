Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72B22E400
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 04:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707366571; cv=none; b=eDrMNODWZvsUhv3byah/fbykYCwVrJFv1Wk5jMdd2L4QmkLfZ9+IVb6DjdCjI+DArOAIzLClDtGi1odqY0DhJBNX6ObPxHd1uieqSpSDW2UFs1EVkOT1Zq9j+WSBIAuAAVQK+ehcliB5d7H7qnYL5Okmgx8z35p+/IrnxlB07HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707366571; c=relaxed/simple;
	bh=mnm4aVNJM/nEl2/YgMYq7wg6a/UjZ4kdzJxtlv2khAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RPYsxP+Q6rM3V4lFM+lwQzhnDLyPA/WTRZfnx7g2d+pjnL6RBLNuqwmudkHk92EvBfJD35Xj5EkIwJsBo8f26GdZ+ADnmsgj+zGoLk5koONSTpx56hRRINQnPM3wQyh/OjNeN4FUMaOYrx5/o4isEZow1zP++R5lBVoBO6xdVfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LqJmy64F; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LqJmy64F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707366569; x=1738902569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mnm4aVNJM/nEl2/YgMYq7wg6a/UjZ4kdzJxtlv2khAM=;
  b=LqJmy64FY0TDyJ4oCiTuZ8LlHSlXYMfKlNh/mLQlUnn2zM2Afw+ThEh6
   5z46WqUnQOMMnOAgVfwegNJU5s+AesgNaw8Yh9nwc0fv97cN7zy9H2poC
   7qQWiXjyDzZuMhMeaqWLiML0lb+787Gg1F1gsT5RIJTB6c2hdVcQjWAAE
   EUD8j+EGi+yrUqlKAgSUS5KwydRE1NwnfNic5viBVL4OWBE0RJehFC7qu
   i/uCFwpqKHCP9Z9pIEvHWni8Cc7iBU1CmtreEhFgTthwTlBce17yBuh0v
   4eFK3+ep98/T+Q0UM79mPMsH7QG6dvTENe7PrY56a+Gn8lyQC3Yhp01pC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1297139"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1297139"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 20:29:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="6312829"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Feb 2024 20:29:26 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXw2O-0003M0-0l;
	Thu, 08 Feb 2024 04:29:24 +0000
Date: Thu, 8 Feb 2024 12:28:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1869/3156] drivers/cpufreq/cppc_cpufreq.c:852:19:
 error: incomplete definition of type 'struct fb_ctr_pair'
Message-ID: <202402081220.QZOx73Tc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6bec8f8b217f64c3611d42062200c82570f17c1f
commit: 12f136b2134d4ded731c3ef23ac08c85b9c0b1fa [1869/3156] cpufreq: CPPC: Keep the target core awake when reading its cpufreq rate
config: arm64-randconfig-001-20240208 (https://download.01.org/0day-ci/archive/20240208/202402081220.QZOx73Tc-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081220.QZOx73Tc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081220.QZOx73Tc-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> drivers/cpufreq/cppc_cpufreq.c:866:21: error: variable has incomplete type 'struct fb_ctr_pair'
     866 |         struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
         |                            ^
   drivers/cpufreq/cppc_cpufreq.c:866:9: note: forward declaration of 'struct fb_ctr_pair'
     866 |         struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
         |                ^
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
