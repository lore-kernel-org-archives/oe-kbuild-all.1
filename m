Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3250AD51
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 14:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742049797; cv=none; b=bZMHoDv5njmqaxxGo/PzxhEcVEf1/0CQ1wYqZOGSCEO3t0QwBzUFY/eg9k28u5IGdpjwm5R3GsS7vr0yLBfngBBx5hskcquxkvzHGCTQwdM9Tn68KfwPmHCCigWxTARmaK4fXaeXPv5JtdxYxKUKqq096f72FjJc6QUxIRHxVSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742049797; c=relaxed/simple;
	bh=OARW6bNB/7nplC1oK1a0SaiVKE4QaiBgnswkTf7GHTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkj0XsZ+FV45q7qZVH4YgneiqKBCv3NjkCja1qjpczLKuXz7v0DYtKjt3UeT5Js9yTdgkFJ16S7LYHuP4gv9zmU2DEk9i8D5pn2FJXNcg/ZW4wLMHqv06DFWQtGoV7iMEDqHU5uih6arX6f/mO7OclH2UOsUABRMbQqFJYe/jCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLBIVamX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLBIVamX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742049795; x=1773585795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OARW6bNB/7nplC1oK1a0SaiVKE4QaiBgnswkTf7GHTQ=;
  b=HLBIVamX4oDfCLQO3BjXmvfmlqNvWMnnco9qnkq3z1UWC7qhFn9Hsmjz
   uLWBZiNaTCA66fHwxoPJU667dSKN7YBl4ojQ4gJVF5plzmUtajt4U6dRH
   ZgiNsm9RNqq7CWBcPQeS4zCxYnyBlgzarGejEIUURgvNuLcOudEmcWAMB
   2Budmo2ssBGLT+WtwuJlWbrvYSJHHRsVyoW80y3PAQpaA4BkZHdzfxRSv
   L8rrSFMPcaAa6KQOMZGQKFitGVKO8GxBOHyQwKVbDN5uEKztOXGRuzoLy
   oFJIS7sMLyIQQ6TD/Z29izLZ/fokv1VoVb2NBmNbyZZpTG61rnNpPZNXJ
   Q==;
X-CSE-ConnectionGUID: Kb9a244pR3uITMEjblXgfw==
X-CSE-MsgGUID: pxqgpKQfQsKhCi9sQ7fvNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="60735214"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="60735214"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 07:41:02 -0700
X-CSE-ConnectionGUID: q5PpoE1HTvax3ytgOq60ig==
X-CSE-MsgGUID: B/mwVkjdTLKcipLIzz6YRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="121544581"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 15 Mar 2025 07:40:59 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttSh6-000BOV-2i;
	Sat, 15 Mar 2025 14:40:56 +0000
Date: Sat, 15 Mar 2025 22:39:59 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Subject: [arm-perf:for-next/perf 14/15]
 drivers/perf/arm_cspmu/nvidia_cspmu.c:192:9: error: implicit declaration of
 function 'writel'
Message-ID: <202503152245.cAG4FMfi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
head:   a28f3cbfd11fcb13f826b33a4799c2ac77e70729
commit: 6de0298a3925f1e6e313430c45ae314a93f89ef6 [14/15] perf/arm_cspmu: Generalise event filtering
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250315/202503152245.cAG4FMfi-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503152245.cAG4FMfi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503152245.cAG4FMfi-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/perf/arm_cspmu/nvidia_cspmu.c: In function 'nv_cspmu_set_ev_filter':
>> drivers/perf/arm_cspmu/nvidia_cspmu.c:192:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
     192 |         writel(filter, cspmu->base0 + offset);
         |         ^~~~~~


vim +/writel +192 drivers/perf/arm_cspmu/nvidia_cspmu.c

   185	
   186	static void nv_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
   187					   const struct perf_event *event)
   188	{
   189		u32 filter = nv_cspmu_event_filter(event);
   190		u32 offset = PMEVFILTR + (4 * event->hw.idx);
   191	
 > 192		writel(filter, cspmu->base0 + offset);
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
