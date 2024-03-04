Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32254B666
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 03:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709523667; cv=none; b=lGIlY+AR12IZHPYXMEJEjyw7fflzCQkL/wmgdMxwVCbhqehIlNAT3Fgbt2ahWNeYY1emj9ZJopJYUGgkqwCyxPYbBc+9DumAipDWxPgU0viIVLleXHCO7FotAhpf/XcRAxg58LDsY7cRPfct82YqSp08pZ7f9B0zgmnJLvcCiS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709523667; c=relaxed/simple;
	bh=JQUIaY+u34JAMtwoKKjgBXXBWdiPXu5XTFet6LS1FqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oPGWXkuh2W0M3Hc6qcUz5ogurNqWODlg6JFYAHz9iS2cCH0KaabltnGoELmoQWSHEkfGeOjIEDMv8EeAFkLZkUNpjxAjwRTZAcLhYprVLWOgcGwh1dVnao6C8HLwInYp2GRBzCc5R7dzR1gdExCB7gOCXxEYvaZoO6LVRXsNe3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArUgEgUM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArUgEgUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709523665; x=1741059665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JQUIaY+u34JAMtwoKKjgBXXBWdiPXu5XTFet6LS1FqQ=;
  b=ArUgEgUM30GHLe7u5AWx2HilId/HN2uLJOrfJ3Eb9g+xWrE+/6ZpDjI5
   uxU/DINgSyBPhNp130wHKIDq1HCM8fhPsmiQy6PMRd9VzeYrlKiwXGrjE
   AmW59pPtnWIk+OsI+PKOygu49AIpquM+MWFjj5C//NjdMDhUfrDI3+uAa
   6BU1XDSL+rR78F7Rriyg+ctF6uokbwoly2IiIY4+1KsRpbjD3Tuv0Op8Z
   ZSae/yZzsn4TOH7ikIl+chNz4YQbdyWqblkN4CJQhu9UVGK+dcC5eQmfJ
   biMRpA3+2W3pmBOjJHnAiY12Y6MI+eel9rwNZtf9dp5HH3CVGc7DyQ4g5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14575500"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="14575500"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 19:41:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="39695301"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Mar 2024 19:41:04 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgzCG-0002Jx-24;
	Mon, 04 Mar 2024 03:41:00 +0000
Date: Mon, 4 Mar 2024 11:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xia Fukun <xiafukun@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2180/3769] kernel/sched/fair.c:8988:1: sparse:
 sparse: symbol 'qos_smt_expell_switch' was not declared. Should it be
 static?
Message-ID: <202403041146.O9ZSxlLC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   fbcd4a3032a53350f6d182c9daeaa4c46e65d964
commit: a62d532da0b51fe39f726c4c08f3debc8b3bc5d7 [2180/3769] sched/fair: Add cmdline nosmtexpell
config: arm64-randconfig-r111-20240227 (https://download.01.org/0day-ci/archive/20240304/202403041146.O9ZSxlLC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240304/202403041146.O9ZSxlLC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403041146.O9ZSxlLC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:151:14: sparse: sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it be static?
   kernel/sched/fair.c:152:14: sparse: sparse: symbol 'sysctl_offline_wait_interval' was not declared. Should it be static?
   kernel/sched/fair.c:1284:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1284:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1284:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:13325:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13325:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13325:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6038:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6038:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:6038:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6780:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6780:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6780:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8163:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8163:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8163:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8478:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8478:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8478:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8590:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8590:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8590:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8936:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8936:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8936:22: sparse:    struct task_struct *
>> kernel/sched/fair.c:8988:1: sparse: sparse: symbol 'qos_smt_expell_switch' was not declared. Should it be static?
   kernel/sched/fair.c:9122:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *sibling_p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9122:51: sparse:     expected struct task_struct *sibling_p
   kernel/sched/fair.c:9122:51: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9127:30: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9127:30: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:9127:30: sparse:    struct task_struct *
   kernel/sched/fair.c:9205:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9454:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:10525:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:11162:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:11162:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:11162:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12603:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12603:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12603:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12260:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12260:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:12260:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12699:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12699:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12699:9: sparse:     got struct sched_domain [noderef] __rcu *parent
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
   kernel/sched/sched.h:2182:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2346:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2346:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2346:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2346:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2346:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2346:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2182:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2182:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct *

vim +/qos_smt_expell_switch +8988 kernel/sched/fair.c

  8986	
  8987	#ifdef CONFIG_QOS_SCHED_SMT_EXPELLER
> 8988	DEFINE_STATIC_KEY_TRUE(qos_smt_expell_switch);
  8989	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
