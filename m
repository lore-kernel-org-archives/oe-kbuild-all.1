Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BC0288DB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 03:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726545170; cv=none; b=FcsQuw4qkkMhZfIyXTg32BZKdz6vMh3JqKfo6R89si/NEFafC89pFwgboe2OsVW3xEP0nY5TX5eG98aGhUDUzs5CGcDO3cQg9PVbqEMQlXjYCpAaSMK15UMvM3+7zk4j/Kas1JhiD5RoXCtTVj0XjSy/Sks/PAZi+ZP+9oCr3wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726545170; c=relaxed/simple;
	bh=zujx90QDbJv1WdnVpadTHhF4McANNwX6I+TDOa6mtlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OJDcpv4qS+5wNGGh/mFmvF9LBOEgs549CTon4g5oBVKMw1te0rjWi90LWvrxgESfGNbuGPV4CpiEVQ/9XieoEoWjQ2EGYiSoUx5Al67l6RKhe9JCCQfgMShgVljaHKat2QItXcuAqVHLWO9sQFP+YlL7HtRuqmt723vqysghRD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/dneVG4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/dneVG4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726545169; x=1758081169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zujx90QDbJv1WdnVpadTHhF4McANNwX6I+TDOa6mtlA=;
  b=O/dneVG4UDcfzqfScKtkJD8tcz3sp8GQmwtmx+1b8+fDkZGgcCkvAbAW
   9LLYT+Vzy/zZmDBA1+2rxuiIV0IEIONOLS3zu1UqxEJrv04HswiKj2iHM
   QScXk7scf+DB7jJw3xC0MNNcK4XYIZ6xw+Leq+zqomWWOy1dcZWCiDzqe
   J0OEmUebLJi/79SC4vRwtyZKnvd7l8OBPKoS1zAdGnYBC78BvVlOf/J30
   jTcB5/rsvb7SVPS5wpdxiRS5l9FIp/okcHg4D8ZKENicVipIgHYC5ouEe
   4Mzl5M2b9RBVZbBn5xGuW74o7syvrnB6dQFg2yF1K6FB2znkDj6pbGeM8
   g==;
X-CSE-ConnectionGUID: oHmrEY60SS2/S2e9gpy8hw==
X-CSE-MsgGUID: 62eM63akRYq07i6egzHv+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25490177"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="25490177"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 20:52:47 -0700
X-CSE-ConnectionGUID: MOG/oijBTw2yCyxLI3ROrA==
X-CSE-MsgGUID: Wu2IQpKxRN606WB9qZOY9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="73892321"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Sep 2024 20:52:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqPGc-000AlK-27;
	Tue, 17 Sep 2024 03:52:42 +0000
Date: Tue, 17 Sep 2024 11:52:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: drivers/cpufreq/s3c64xx-cpufreq.c:55:22: error: variable 'old_freq'
 set but not used
Message-ID: <202409171104.Z7qFxsc7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a430d95c5efa2b545d26a094eb5f624e36732af0
commit: 81746019b9fbb9fbf7c522dcbeefb572ac0f9458 cpufreq: Drop CONFIG_ARM and CONFIG_ARM64 dependency on Arm drivers
date:   13 days ago
config: x86_64-sof-customedconfig-compile-test-defconfig (https://download.01.org/0day-ci/archive/20240917/202409171104.Z7qFxsc7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409171104.Z7qFxsc7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409171104.Z7qFxsc7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cpufreq/s3c64xx-cpufreq.c: In function 's3c64xx_cpufreq_set_target':
>> drivers/cpufreq/s3c64xx-cpufreq.c:55:22: error: variable 'old_freq' set but not used [-Werror=unused-but-set-variable]
      55 |         unsigned int old_freq, new_freq;
         |                      ^~~~~~~~
>> drivers/cpufreq/s3c64xx-cpufreq.c:54:30: error: variable 'dvfs' set but not used [-Werror=unused-but-set-variable]
      54 |         struct s3c64xx_dvfs *dvfs;
         |                              ^~~~
   cc1: all warnings being treated as errors


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
