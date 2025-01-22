Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8FC2147F8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 16:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564848; cv=none; b=Ezdr/H+sBXhMqnHDNZrDzSxZ2HQSYKdW0V5vjoNmmGV1Qd8QL0zlZ1j/a2V+k7pFyndvaVhiVuZQXSTRZxurs/CHH8Ezb8h84RewwOnPR+MDUktKSSAiWQN1YPakaa5ggEJRrTLWysB4gqntI8SGZo3eUHwFj60XEh5mCoErKC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564848; c=relaxed/simple;
	bh=4JRRzRYHk0JCUgXihufFt3z7g2ZSIwzvRng9xjGUbm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FSo9Vce6dvIDqg9eMjuYAif7ueiC250EaAVufjSPML8Dyg2Twzt1mIBn1CnaJFkwUUo3Fu8LFGyl42XeRWqKutZL9iy6tpM8BlA9HrM82aww4VHrDXKU/q/FUX11uTRvhVITVzJ4vidL7ca+GhkuPupnD8bjFG25GYz1P3wCNrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOuvuNOR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOuvuNOR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737564846; x=1769100846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4JRRzRYHk0JCUgXihufFt3z7g2ZSIwzvRng9xjGUbm8=;
  b=UOuvuNORT/GJfeR8wd9L1wWUubtnag2Dmy0ifugsj/EgMGuvwLaRD9TS
   tFhb8f+KYMPupZHW1Tm07fe60jk0kEFHDOO95z3bX+a3QLKRNpe5v3xKa
   Ld5YBh6+0IwHOnmhTf9OHcSoAgJ7/Q/LCBuwPYhogqBlGeaMULIhUYBlI
   H5YGxcMY6756eLd5/43nO6b/UhMYt/O8jA0DRpFPo0HjYn2EYKZcpRh3M
   D/4FkIhECYPXA1FLNqcSNuF2Fn9U+LMcIZceFJdBM8UvLE+Z5NfKR0Jut
   LqOsCq/qvbK9z7QuVnw925tqXNuShCCEELTVyMicF//6rl8QKi37Us/cy
   w==;
X-CSE-ConnectionGUID: z222oKnLSs2jHOlxBtmBiw==
X-CSE-MsgGUID: QqTFJGShQB6qQEsay6msmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38282239"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="38282239"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:54:06 -0800
X-CSE-ConnectionGUID: SKqdANA0TLe8kHLI6CENVQ==
X-CSE-MsgGUID: MWNnFYy3QTOCJtKWky05rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="107796032"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jan 2025 08:54:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tadzO-000a8B-2M;
	Wed, 22 Jan 2025 16:54:02 +0000
Date: Thu, 23 Jan 2025 00:53:00 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk-pm:cpufreq/boost 60/60] drivers/cpufreq/cpufreq.c:1064:6:
 error: use of undeclared identifier
 'cpufreq_freq_attr_scaling_available_freqs'
Message-ID: <202501230018.N69731Av-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/boost
head:   65feaddb9dbbb3382cd06a6815aeed54e4760d26
commit: 65feaddb9dbbb3382cd06a6815aeed54e4760d26 [60/60] cpufreq: Remove cpufreq_generic_attrs
config: arm-randconfig-001-20250122 (https://download.01.org/0day-ci/archive/20250123/202501230018.N69731Av-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230018.N69731Av-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501230018.N69731Av-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cpufreq/cpufreq.c:28:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/cpufreq/cpufreq.c:1064:6: error: use of undeclared identifier 'cpufreq_freq_attr_scaling_available_freqs'
    1064 |                                 &cpufreq_freq_attr_scaling_available_freqs.attr);
         |                                  ^
>> drivers/cpufreq/cpufreq.c:1070:6: error: use of undeclared identifier 'cpufreq_freq_attr_scaling_boost_freqs'
    1070 |                                 &cpufreq_freq_attr_scaling_boost_freqs.attr);
         |                                  ^
   drivers/cpufreq/cpufreq.c:1080:21: error: use of undeclared identifier 'cpufreq_freq_attr_scaling_available_freqs'
    1080 |                 if (*drv_attr == &cpufreq_freq_attr_scaling_available_freqs ||
         |                                   ^
   drivers/cpufreq/cpufreq.c:1081:21: error: use of undeclared identifier 'cpufreq_freq_attr_scaling_boost_freqs'
    1081 |                     *drv_attr == &cpufreq_freq_attr_scaling_boost_freqs) {
         |                                   ^
   1 warning and 4 errors generated.


vim +/cpufreq_freq_attr_scaling_available_freqs +1064 drivers/cpufreq/cpufreq.c

87549141d516ae Viresh Kumar      2015-06-10  1055  
d9612a495b0bc9 Rafael J. Wysocki 2015-07-27  1056  static int cpufreq_add_dev_interface(struct cpufreq_policy *policy)
909a694e336bf3 Dave Jones        2009-07-08  1057  {
909a694e336bf3 Dave Jones        2009-07-08  1058  	struct freq_attr **drv_attr;
909a694e336bf3 Dave Jones        2009-07-08  1059  	int ret = 0;
909a694e336bf3 Dave Jones        2009-07-08  1060  
d12790180300c1 Viresh Kumar      2025-01-22  1061  	/* Attributes that need freq_table */
d12790180300c1 Viresh Kumar      2025-01-22  1062  	if (policy->freq_table) {
d12790180300c1 Viresh Kumar      2025-01-22  1063  		ret = sysfs_create_file(&policy->kobj,
d12790180300c1 Viresh Kumar      2025-01-22 @1064  				&cpufreq_freq_attr_scaling_available_freqs.attr);
d12790180300c1 Viresh Kumar      2025-01-22  1065  		if (ret)
d12790180300c1 Viresh Kumar      2025-01-22  1066  			return ret;
d12790180300c1 Viresh Kumar      2025-01-22  1067  
d12790180300c1 Viresh Kumar      2025-01-22  1068  		if (cpufreq_boost_supported()) {
d12790180300c1 Viresh Kumar      2025-01-22  1069  			ret = sysfs_create_file(&policy->kobj,
d12790180300c1 Viresh Kumar      2025-01-22 @1070  				&cpufreq_freq_attr_scaling_boost_freqs.attr);
d12790180300c1 Viresh Kumar      2025-01-22  1071  			if (ret)
d12790180300c1 Viresh Kumar      2025-01-22  1072  				return ret;
d12790180300c1 Viresh Kumar      2025-01-22  1073  		}
d12790180300c1 Viresh Kumar      2025-01-22  1074  	}
d12790180300c1 Viresh Kumar      2025-01-22  1075  
909a694e336bf3 Dave Jones        2009-07-08  1076  	/* set up files for this cpu device */
1c3d85dd4e21a4 Rafael J. Wysocki 2013-04-29  1077  	drv_attr = cpufreq_driver->attr;
f13f1184a1f4e0 Viresh Kumar      2015-01-02  1078  	while (drv_attr && *drv_attr) {
d12790180300c1 Viresh Kumar      2025-01-22  1079  		/* These are already added, skip them */
d12790180300c1 Viresh Kumar      2025-01-22  1080  		if (*drv_attr == &cpufreq_freq_attr_scaling_available_freqs ||
d12790180300c1 Viresh Kumar      2025-01-22  1081  		    *drv_attr == &cpufreq_freq_attr_scaling_boost_freqs) {
d12790180300c1 Viresh Kumar      2025-01-22  1082  			drv_attr++;
d12790180300c1 Viresh Kumar      2025-01-22  1083  			continue;
d12790180300c1 Viresh Kumar      2025-01-22  1084  		}
d12790180300c1 Viresh Kumar      2025-01-22  1085  
909a694e336bf3 Dave Jones        2009-07-08  1086  		ret = sysfs_create_file(&policy->kobj, &((*drv_attr)->attr));
909a694e336bf3 Dave Jones        2009-07-08  1087  		if (ret)
6d4e81ed89c092 Tomeu Vizoso      2014-11-24  1088  			return ret;
909a694e336bf3 Dave Jones        2009-07-08  1089  		drv_attr++;
909a694e336bf3 Dave Jones        2009-07-08  1090  	}
1c3d85dd4e21a4 Rafael J. Wysocki 2013-04-29  1091  	if (cpufreq_driver->get) {
909a694e336bf3 Dave Jones        2009-07-08  1092  		ret = sysfs_create_file(&policy->kobj, &cpuinfo_cur_freq.attr);
909a694e336bf3 Dave Jones        2009-07-08  1093  		if (ret)
6d4e81ed89c092 Tomeu Vizoso      2014-11-24  1094  			return ret;
909a694e336bf3 Dave Jones        2009-07-08  1095  	}
c034b02e213d27 Dirk Brandewie    2014-10-13  1096  
909a694e336bf3 Dave Jones        2009-07-08  1097  	ret = sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr);
909a694e336bf3 Dave Jones        2009-07-08  1098  	if (ret)
6d4e81ed89c092 Tomeu Vizoso      2014-11-24  1099  		return ret;
c034b02e213d27 Dirk Brandewie    2014-10-13  1100  
1c3d85dd4e21a4 Rafael J. Wysocki 2013-04-29  1101  	if (cpufreq_driver->bios_limit) {
e2f74f355e9e29 Thomas Renninger  2009-11-19  1102  		ret = sysfs_create_file(&policy->kobj, &bios_limit.attr);
e2f74f355e9e29 Thomas Renninger  2009-11-19  1103  		if (ret)
e18f1682bce701 Srivatsa S. Bhat  2013-07-30  1104  			return ret;
6d4e81ed89c092 Tomeu Vizoso      2014-11-24  1105  	}
e18f1682bce701 Srivatsa S. Bhat  2013-07-30  1106  
218a06a79d9a98 Jie Zhan          2023-08-22  1107  	if (cpufreq_boost_supported()) {
218a06a79d9a98 Jie Zhan          2023-08-22  1108  		ret = sysfs_create_file(&policy->kobj, &local_boost.attr);
218a06a79d9a98 Jie Zhan          2023-08-22  1109  		if (ret)
218a06a79d9a98 Jie Zhan          2023-08-22  1110  			return ret;
218a06a79d9a98 Jie Zhan          2023-08-22  1111  	}
218a06a79d9a98 Jie Zhan          2023-08-22  1112  
26619804e733bb Viresh Kumar      2016-09-12  1113  	return 0;
e18f1682bce701 Srivatsa S. Bhat  2013-07-30  1114  }
e18f1682bce701 Srivatsa S. Bhat  2013-07-30  1115  

:::::: The code at line 1064 was first introduced by commit
:::::: d12790180300c14e22e3bec415f2d1330afc15d8 cpufreq: Always create freq-table related sysfs file

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
