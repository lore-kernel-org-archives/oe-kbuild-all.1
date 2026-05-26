Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B877B366542
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 17:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815261; cv=none; b=dgHUVCrDZUdkX4MIV6/3YPcZvNXL9R6Sahhv4lCpS+lkqDDPOTHr6JLcRp6Mn5OC6xXf9NLU6/vns6jKPh1hhlLjHpnMRV52+I14z+YAEvvxukQYKjCqu68ae4S604DWejMmx0nkhhfDvlNLI//+2IHBH/9QYqME1MgLC80dWSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815261; c=relaxed/simple;
	bh=vivJwwKqb+6PZc4rrZ0x8qVCxw2nRbFd5r6ur1r34FQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VLhnR8kJwaGPfBttnV2aPnz5xmAlo7JzcoLtBBie3XvxXSHFt3DrjG+R0aj4IgRL3cms10ABwiZG10/llI8KcLK39HE5d0ta2+mK77QZh1jfO412ESMYwhMYi6uX0Lp1XdvOuUPlazphwRo9FjOZJ5oF8doSZCP/0oybxOjYExM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLvT8JLp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLvT8JLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779815260; x=1811351260;
  h=date:from:to:cc:subject:message-id;
  bh=vivJwwKqb+6PZc4rrZ0x8qVCxw2nRbFd5r6ur1r34FQ=;
  b=iLvT8JLpNYR4mLF2zNhSbqH8bl2B3j6KU5O1LhfklqMVzS4qTnBBL9p5
   CaA1axnh0Uvmfeoh/ddJh5KRXR+KHb6jyzdIzLZXXWr0akS5SgwT9ANSh
   0LW+fLXvDT5HE41Vc/nj4DNYHoTNLDiPFb0/XJX8wlTmM7Rs0vshshaA8
   dbPmQVnJiMZJcjEH8stzjr9tXmJrdEp31UvXSW4KVDpgPS1C0HaPchJwI
   KF81AvXtSrVUDBQACAgE0DrKHOXYuisn/JN9gB77U84Ya8rFnKGA37rBk
   eWKGP5mg2dtgNvbywhpdRMfwx5+ObGZp1S6+FrLgHLZXsBhR4UqTL4Son
   g==;
X-CSE-ConnectionGUID: OVIwPC4ZQ5CBy3AbXFytfw==
X-CSE-MsgGUID: RMuhEIU7QP2sGv3FOvgCiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="92107665"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="92107665"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:07:40 -0700
X-CSE-ConnectionGUID: tzolif5MS0+shJvlfJUb3Q==
X-CSE-MsgGUID: Q+kfDIBGRNK+nMObKKIYdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="280105682"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 May 2026 10:07:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRvFc-00000000CSL-1t8F;
	Tue, 26 May 2026 17:07:32 +0000
Date: Tue, 26 May 2026 19:06:52 +0200
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/cpufreq/intel_pstate.c:2945:23: error: 'struct
 cpufreq_policy_data' has no member named 'update_limits'
Message-ID: <202605261938.kPlFDCKE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Viresh-Kumar/cpufreq-Avoid-redundant-target-calls-for-unchanged-limits/20260521-194713
head:   6721940d0119159636e6b2da0c43eb5cff826857
commit: 74b0d552acf45e33ce12c19ee815e52029b0b0a8 cpufreq: Avoid redundant target() calls for unchanged limits
date:   5 days ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260526/202605261938.kPlFDCKE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261938.kPlFDCKE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261938.kPlFDCKE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cpufreq/intel_pstate.c: In function 'intel_pstate_adjust_policy_max':
>> drivers/cpufreq/intel_pstate.c:2945:23: error: 'struct cpufreq_policy_data' has no member named 'update_limits'
    2945 |                 policy->update_limits = true;
         |                       ^~


vim +2945 drivers/cpufreq/intel_pstate.c

  2935	
  2936	static void intel_pstate_adjust_policy_max(struct cpudata *cpu,
  2937						   struct cpufreq_policy_data *policy)
  2938	{
  2939		if (!hwp_active &&
  2940		    cpu->pstate.max_pstate_physical > cpu->pstate.max_pstate &&
  2941		    policy->max < policy->cpuinfo.max_freq &&
  2942		    policy->max > cpu->pstate.max_freq) {
  2943			pr_debug("policy->max > max non turbo frequency\n");
  2944			policy->max = policy->cpuinfo.max_freq;
> 2945			policy->update_limits = true;
  2946		}
  2947	}
  2948	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
