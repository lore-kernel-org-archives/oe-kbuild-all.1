Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99FB1A2C27
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 10:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737283229; cv=none; b=RIomiw68o/BN6jjiZoFmNnDP7dwhxxmswGrW+JEB8sQOQH6MWd7N31VSf3z4joTBJBUsQ6Rq2nK9o1UFLZRCfml0joPMfj8ugdUih8nIBdeHm0h2f7PK52BErJAG0adRDeMVRaUjZosPHXothtPdEslaKTYUCTzpCLzO+2tQdzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737283229; c=relaxed/simple;
	bh=gAh2Ayib7USQVydLAvnox9CGBOn3A8Po3sNvvbRtUZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ineAFP/38q12XvNfc4g3CWYlVhCeQrY4hX78rmeB0m5bl1QmORRDN++Fz2aFfWfMxnuFei++mecmxDxDkj4VKGfYlkC+3fb2zPOHXNLDlZt4tJ3Ez0I24O6Zawuwel//rp+wCOIRncd4ih0b2wwEwuGqGcbn88YbBj6J05ezwnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfmiBQgK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfmiBQgK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737283228; x=1768819228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gAh2Ayib7USQVydLAvnox9CGBOn3A8Po3sNvvbRtUZo=;
  b=NfmiBQgK0vYS00w2hyZk3GgcMKXW8Ef+KiC3JeNOzUah04WEKgKK9pWA
   SRAmzor1p+oXa2jXB6z1pCQ9LnADAmkpz3uw9GJ6ylZpEAtv+TDGcexwc
   +5eOXqXwKm9c4/P9lZUKxq0Zzd9edkvNGjZyqx7ZGVJRNl1ep+8gCQaac
   5k+I7016B4cGpVbU0vXlS1+l20kTym4OdvZouU1KJKN/bbpv7DTuIuEK7
   EaSY5aQ/UcaG5IzyiSggdet5nF9nVKhkU+Ud1wi+hwNkg3fQSI1KbUqt9
   mVM571zVayH0qJZx3OyO9PlHn2uohSP38hw2Du6u6Fnc1I3zS7PQdaJYh
   g==;
X-CSE-ConnectionGUID: VD/R4LYHQh6xPA7COlkxYA==
X-CSE-MsgGUID: 6M7XXKY7Qn2/EpQalNQmqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="40470038"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="40470038"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 02:40:27 -0800
X-CSE-ConnectionGUID: wD3+6hpgRWmPyRKBQP+5Xw==
X-CSE-MsgGUID: sCZklsMcQc6bvuO8qqjkaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106055405"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Jan 2025 02:40:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZSj9-000VN9-29;
	Sun, 19 Jan 2025 10:40:23 +0000
Date: Sun, 19 Jan 2025 18:39:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: drivers/cpufreq/s3c64xx-cpufreq.c:55:22: warning: variable
 'old_freq' set but not used
Message-ID: <202501191803.CtfT7b2o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fda5e3f284002ea55dac1c98c1498d6dd684046e
commit: 81746019b9fbb9fbf7c522dcbeefb572ac0f9458 cpufreq: Drop CONFIG_ARM and CONFIG_ARM64 dependency on Arm drivers
date:   5 months ago
config: sh-randconfig-m031-20230725 (https://download.01.org/0day-ci/archive/20250119/202501191803.CtfT7b2o-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191803.CtfT7b2o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191803.CtfT7b2o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cpufreq/s3c64xx-cpufreq.c: In function 's3c64xx_cpufreq_set_target':
>> drivers/cpufreq/s3c64xx-cpufreq.c:55:22: warning: variable 'old_freq' set but not used [-Wunused-but-set-variable]
      55 |         unsigned int old_freq, new_freq;
         |                      ^~~~~~~~
>> drivers/cpufreq/s3c64xx-cpufreq.c:54:30: warning: variable 'dvfs' set but not used [-Wunused-but-set-variable]
      54 |         struct s3c64xx_dvfs *dvfs;
         |                              ^~~~


vim +/old_freq +55 drivers/cpufreq/s3c64xx-cpufreq.c

b3748ddd80569e arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown   2009-06-15  50  
b3748ddd80569e arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown   2009-06-15  51  static int s3c64xx_cpufreq_set_target(struct cpufreq_policy *policy,
9c0ebcf78fde0f drivers/cpufreq/s3c64xx-cpufreq.c Viresh Kumar 2013-10-25  52  				      unsigned int index)
b3748ddd80569e arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown   2009-06-15  53  {
b3748ddd80569e arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown   2009-06-15 @54  	struct s3c64xx_dvfs *dvfs;
d4019f0a92ab80 drivers/cpufreq/s3c64xx-cpufreq.c Viresh Kumar 2013-08-14 @55  	unsigned int old_freq, new_freq;
d4019f0a92ab80 drivers/cpufreq/s3c64xx-cpufreq.c Viresh Kumar 2013-08-14  56  	int ret;
b3748ddd80569e arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown   2009-06-15  57  
652ed95d5fa607 drivers/cpufreq/s3c64xx-cpufreq.c Viresh Kumar 2014-01-09  58  	old_freq = clk_get_rate(policy->clk) / 1000;
d4019f0a92ab80 drivers/cpufreq/s3c64xx-cpufreq.c Viresh Kumar 2013-08-14  59  	new_freq = s3c64xx_freq_table[index].frequency;
9c0ebcf78fde0f drivers/cpufreq/s3c64xx-cpufreq.c Viresh Kumar 2013-10-25  60  	dvfs = &s3c64xx_dvfs_table[s3c64xx_freq_table[index].driver_data];
b3748ddd80569e arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown   2009-06-15  61  

:::::: The code at line 55 was first introduced by commit
:::::: d4019f0a92ab802f385cc9c8ad3ab7b5449712cb cpufreq: move freq change notifications to cpufreq core

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
