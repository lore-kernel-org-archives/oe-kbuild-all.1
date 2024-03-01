Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E2E38F9A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 02:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709258690; cv=none; b=a4pUt8T9yL9rXRShjDefMVgPH7tgKUAD/AT7QkZvFApVNcLSymU+elibqjvWHnwX1iULtk1v7Haro/gcViXQ/+Rc8Y13ttV80hpOFlV+yQB6xqPTnmpX5JwEa0wSssIGanDCd4geWPq4nxVFpr21lRqYuFO6J4DeoAy8GLHlBcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709258690; c=relaxed/simple;
	bh=BQW7uOo/OtDCWEbRrBlHTIoIsS26SSPnOdr7H7w5Umg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XHa5gRmIZlYhB5OQlNfkpf4xJsJj7AtsYy7a1pbVjmHvWqCP5P8+ifNLdTO7s6xOUtFawZvIAY/qShjYVZ4f6kCh86J+AfSd5T9EVg5oPuF6sixkbSK/B3E5YUz0m4JlSJ1jGwCE9WPQGnKeGoonsyW7hShEfscUDJJGCXM1tS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjfCVkGL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjfCVkGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709258688; x=1740794688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BQW7uOo/OtDCWEbRrBlHTIoIsS26SSPnOdr7H7w5Umg=;
  b=UjfCVkGLtL5lNAlbtzfmOeGfIuSaRam6BUvpbPLkxvBErIvepdiTpukA
   1tnYVloYD8z8kmh5KtadCEdPkQRvxFWtEKgHZozQqmnZqfKPWBsoGJ8me
   b7sa4X/0rQEJFmfiF17Hb+gJSV1t78EIX8c09VVcB5szqGLq/KnazBZoz
   AXStgNL9EMHnNOGvJl4iViBYP2ZJj8/4MwIJeczrX4eMeZlKrYylfyGS9
   qaqUHAkVdnkF+cLk9+ch2lW21tB4P4flqGKdDSJIKh6Z6N2ud0+Mab2PE
   YB2WPVuot9J0RlPqcJPT2iFERtmTwuXFt5hIsk1hQSns56AMXD1tuuCcD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14346670"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14346670"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 18:04:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12720009"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Feb 2024 18:04:45 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfsFx-000DSt-23;
	Fri, 01 Mar 2024 02:04:23 +0000
Date: Fri, 1 Mar 2024 10:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenyu Huang <huangwenyu5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1659/3684] kernel/sched/fair.c:143:14: sparse:
 sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it
 be static?
Message-ID: <202403010944.pTLLvuMJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3016126ef302b602feaa8a7b99e4f85987536d65
commit: a3c9f2da0a35df4e41751556be4308f57bdaf3d6 [1659/3684] sched: Introduce handle priority reversion mechanism
config: arm64-randconfig-r111-20240227 (https://download.01.org/0day-ci/archive/20240301/202403010944.pTLLvuMJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240301/202403010944.pTLLvuMJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010944.pTLLvuMJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/fair.c:143:14: sparse: sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it be static?
>> kernel/sched/fair.c:144:14: sparse: sparse: symbol 'sysctl_offline_wait_interval' was not declared. Should it be static?
   kernel/sched/fair.c:1236:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1236:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1236:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12477:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12477:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12477:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5766:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5766:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5766:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6508:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6508:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6508:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7809:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7809:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7809:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8014:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8014:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8014:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8113:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8113:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8113:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8333:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8333:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8333:22: sparse:    struct task_struct *
   kernel/sched/fair.c:8687:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8687:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8687:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9680:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9680:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9680:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10317:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10317:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10317:22: sparse:    struct task_struct *
   kernel/sched/fair.c:11749:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11749:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11749:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11406:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11406:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11406:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11845:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11845:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11845:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
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

vim +/sysctl_overload_detect_period +143 kernel/sched/fair.c

   139	
   140	static DEFINE_PER_CPU_SHARED_ALIGNED(struct list_head, qos_throttled_cfs_rq);
   141	static DEFINE_PER_CPU_SHARED_ALIGNED(struct hrtimer, qos_overload_timer);
   142	static DEFINE_PER_CPU(int, qos_cpu_overload);
 > 143	unsigned int sysctl_overload_detect_period = 5000;  /* in ms */
 > 144	unsigned int sysctl_offline_wait_interval = 100;  /* in ms */
   145	static int one_thousand = 1000;
   146	static int hundred_thousand = 100000;
   147	static int unthrottle_qos_cfs_rqs(int cpu);
   148	#endif
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
