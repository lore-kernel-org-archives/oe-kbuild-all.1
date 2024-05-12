Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57427F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 01:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715477376; cv=none; b=ibBVIHTwC28345DO2OLt2fS0vHNelOB7jHt58HfLgQqOcwk2EMBPeezK8tJZZX+QAur8WL8Zy/r+MSErQcsG8WTusr6Jbx0CTmDUoqkzuPHDfutXVElf64ME0vo99d+qMadFwaxSc4nf9qwsH4Ar4EIldc2rW3yd5a3lv5f+jP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715477376; c=relaxed/simple;
	bh=d7Ae51fkOwm0CfWcRs1PgmE28zfx4zWu0LDR4l8Ct3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fAGP2Ic17D27tCaShAAQWwjJ5DSX8Hv6JDzlJBHfinCmiBw2VDW5MA8LpSPE2fD01nqgDEWEHlLgqHPhvTL/Vt9S4opHTscj+aee1zSgAkHbB/Y88zwZSZ/H8rwjmxg+s5kHz2aLGFRis6gom1z2kchs0whTzm6yOiJfkkQUcNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWCrfob9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWCrfob9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715477373; x=1747013373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d7Ae51fkOwm0CfWcRs1PgmE28zfx4zWu0LDR4l8Ct3o=;
  b=XWCrfob9ueV+FzhC8Vs3XqvnF1AjE26uINyQFZNUIpzohnX0wSXeIRy/
   doswkLmYc30SJK/PI0WS58rNhSlPFAmxSwlC3iOLOYQe9xc5Jf/4jV44G
   TagZkQDznPURJ+RGK+4o2RUIvR22xLgPUoclIZnDdC4IjpUF5Sq1PfzHE
   0ACElThLVsHh5RSqPIVUx2LwrfRCZEqburVboerTz2O4cNTE5la4EpIPj
   Lb+EokaJ2zXwuM2IpU6vEnhXy07ZeLgPQLSR0BG3PqRS8tWVurbmtsQiL
   BNqdig02ECzGuxV/J2z+bomuZ7nt7iKsWRMNp9f7UBLrE5MkGmj2g/bAA
   w==;
X-CSE-ConnectionGUID: mHQ5LbWwRpOb2Kb76rAh3Q==
X-CSE-MsgGUID: OmYl/Nt0ROWJW9ndnLSqqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11304717"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="11304717"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 18:29:33 -0700
X-CSE-ConnectionGUID: 7IHZ7gn6Q4Wx8DZUn9A3lg==
X-CSE-MsgGUID: 5SRPlzkORFm+EkxR3uZZ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="34532758"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 May 2024 18:29:31 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5y1p-00081v-2c;
	Sun, 12 May 2024 01:29:29 +0000
Date: Sun, 12 May 2024 09:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 8/9] kernel/sched/deadline.c:1543:6:
 sparse: sparse: symbol 'dl_server_freeze' was not declared. Should it be
 static?
Message-ID: <202405120932.H7VBwEt2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   a9b51c2494133c012e34a050191e3954b5109747
commit: 16d0ae5e68d0f8b9e3749021fd3599d88b72fc6c [8/9] CHROMIUM: sched/dlserver: Freeze dlserver on system suspend.
config: x86_64-randconfig-121-20240512 (https://download.01.org/0day-ci/archive/20240512/202405120932.H7VBwEt2-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405120932.H7VBwEt2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405120932.H7VBwEt2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/deadline.c:2171:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2171:42: sparse:     expected struct sched_dl_entity *b
   kernel/sched/deadline.c:2171:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1238:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1238:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1238:23: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/deadline.c:1543:6: sparse: sparse: symbol 'dl_server_freeze' was not declared. Should it be static?
>> kernel/sched/deadline.c:1552:6: sparse: sparse: symbol 'dl_server_thaw' was not declared. Should it be static?
   kernel/sched/deadline.c:1656:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1656:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1656:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2906:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2906:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2906:22: sparse:    struct task_struct *
   kernel/sched/deadline.c:1140:29: sparse: sparse: context imbalance in 'dl_task_timer' - different lock contexts for basic block
   kernel/sched/deadline.c:1394:36: sparse: sparse: dereference of noderef expression
   kernel/sched/deadline.c: note: in included file:
   kernel/sched/sched.h:1605:9: sparse: sparse: context imbalance in 'inactive_task_timer' - unexpected unlock
   kernel/sched/sched.h:2076:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2076:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2076:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2076:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2076:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2076:25: sparse:    struct task_struct *

vim +/dl_server_freeze +1543 kernel/sched/deadline.c

  1542	
> 1543	void dl_server_freeze(struct sched_dl_entity *dl_se)
  1544	{
  1545		if (dl_se->dl_server_active) {
  1546			update_rq_clock(dl_se->rq);
  1547			__dl_server_stop(dl_se);
  1548		}
  1549		dl_se->dl_server_frozen = 1;
  1550	}
  1551	
> 1552	void dl_server_thaw(struct sched_dl_entity *dl_se)
  1553	{
  1554		if (dl_se->dl_server_active) {
  1555			update_rq_clock(dl_se->rq);
  1556			__dl_server_start(dl_se);
  1557		}
  1558		dl_se->dl_server_frozen = 0;
  1559	}
  1560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
