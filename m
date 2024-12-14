Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ADF18BC1D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 17:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734198623; cv=none; b=ojmsebZulvVcFvZTNJZ2PmPRQ6vxG+ZVr91F7tp6PYRrTZq49AKdyYuXELPDcDSav+ANlDlJzQtHxQ0DDNyPorBUnAHFziOaRFmZmQOhPJk/ZVqZxgGz4t0H4NpRV6t+IL7mGeEwhoFvFiPzThnX8JDY/zj6u+RN6zz8SWYdc8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734198623; c=relaxed/simple;
	bh=D4VO2jyfhbDsyOHKRiP8GcMIXhy2nGsmJqk3u8/tfRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kKrrLgc41EySfRmRkPPpxnmf0iWwNyDnthJxOI/lQUxB6H5oW9mf9vTEQDLkrDoMf2xOEy9fydq1QOcJOQhDqDqZVvKtaTBE5yNK2ckaQQnz5j5ItuhL8eSRrIaSBIseMvsIjQoi5WL37+wjQ1idnBUOhIdbvFYFRwiIUaA+PrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVoob+uJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVoob+uJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734198621; x=1765734621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D4VO2jyfhbDsyOHKRiP8GcMIXhy2nGsmJqk3u8/tfRk=;
  b=SVoob+uJiPjTwQDVHAUUV+C9ylRBNe/QzGrchDhcIEkMvNEp/iGu4auG
   fCxDVKV5otItevYV6RQEhc0SkyydbzgB64YwDbI2fzXTvswrYR4ZLspTF
   MVtzIRmN3LfcGvI5UrZWO7mNn85rLJVFm0UER2HYz9axNkSxG+B8Pt7W3
   8SxIkxU1T5nAd8heBvTzOjA6LWdljKROEoVbaE46tJAb+7sL49MAM9P4t
   fUIJl0s27mJ8SHUXyujxGJphwR4WFP2vOmudGSrfohYnkuDhgsKdL4A2U
   MJT3DR/cQ3jHvAJcCu6Kfx3VJxn8WKIMgS3m+qxoaIWkTD6wIk6y0COXF
   w==;
X-CSE-ConnectionGUID: QsyQtLV+QWqlHLRxejdtjQ==
X-CSE-MsgGUID: rLae+zsqQyeWWX9LDqhdnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="22224089"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="22224089"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 09:50:21 -0800
X-CSE-ConnectionGUID: AswjQISuSvew9Puz/T2wwg==
X-CSE-MsgGUID: sRyhqB5tSeWYuB3jYVl0pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="97374762"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Dec 2024 09:50:20 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMWHR-000D7b-1j;
	Sat, 14 Dec 2024 17:50:17 +0000
Date: Sun, 15 Dec 2024 01:49:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hui Tang <tanghui20@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613] kernel/sched/fair.c:175:5: sparse:
 sparse: symbol 'sysctl_sched_util_low_pct' was not declared. Should it be
 static?
Message-ID: <202412150117.ww1cPcQk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d68dc6ee371ec5466be9b2d76bdca0b360940adc
commit: 2e1dfc02d115143587ccfee1815ad295763050f2 [1613/1613] sched: Adjust wakeup cpu range according CPU util dynamicly
config: loongarch-randconfig-r111-20241210 (https://download.01.org/0day-ci/archive/20241215/202412150117.ww1cPcQk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241215/202412150117.ww1cPcQk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150117.ww1cPcQk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/fair.c:175:5: sparse: sparse: symbol 'sysctl_sched_util_low_pct' was not declared. Should it be static?
   kernel/sched/fair.c:1256:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1256:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1256:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12740:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12740:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12740:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6633:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6633:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6633:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7964:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7964:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7964:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8258:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8258:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8258:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8367:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8367:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8367:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8941:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8941:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8941:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9934:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9934:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9934:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10571:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10571:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10571:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12012:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12012:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12012:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11669:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11669:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11669:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12108:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12108:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12108:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   kernel/sched/fair.c:6555:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2309:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *

vim +/sysctl_sched_util_low_pct +175 kernel/sched/fair.c

   168	
   169	#ifdef CONFIG_QOS_SCHED_DYNAMIC_AFFINITY
   170	/*
   171	 * Low utilization threshold for CPU
   172	 *
   173	 * (default: 85%), units: percentage of CPU utilization)
   174	 */
 > 175	int sysctl_sched_util_low_pct = 85;
   176	#endif
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
